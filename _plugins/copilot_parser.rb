require 'json'
require 'digest'

module Jekyll
  class CopilotParser
    attr_reader :data, :document_mappings, :embeddings
    
    def initialize(site)
      @site = site
      @data = nil
      @document_mappings = {}
      @embeddings = {}
      @copilot_file = find_copilot_file
    end
    
    def parse
      return false unless @copilot_file && File.exist?(@copilot_file)
      
      puts "Parsing Co-Pilot embeddings from: #{File.basename(@copilot_file)}"
      
      begin
        # Parse JSON in chunks to handle large file
        parse_copilot_data
        build_document_mappings
        extract_embeddings
        
        puts "Successfully parsed #{@document_mappings.size} documents"
        true
      rescue => e
        puts "Error parsing Co-Pilot data: #{e.message}"
        false
      end
    end
    
    def get_similar_documents(document_id, limit = 5)
      return [] unless @embeddings[document_id]
      
      similarities = calculate_similarities(document_id)
      similarities.sort_by { |_, score| -score }
                  .first(limit)
                  .map { |id, score| { id: id, score: score } }
    end
    
    private
    
    def find_copilot_file
      vault_path = File.expand_path('../../.obsidian', @site.source)
      copilot_files = Dir.glob(File.join(vault_path, 'copilot-index-*.json'))
      
      if copilot_files.empty?
        puts "Warning: No Co-Pilot embeddings file found in #{vault_path}"
        return nil
      end
      
      # Use the most recent file if multiple exist
      copilot_files.max_by { |f| File.mtime(f) }
    end
    
    def parse_copilot_data
      File.open(@copilot_file, 'r') do |file|
        content = file.read
        @data = JSON.parse(content)
      end
    end
    
    def build_document_mappings
      return unless @data['internalDocumentIDStore']
      
      internal_ids = @data['internalDocumentIDStore']['internalIdToId'] || []
      
      internal_ids.each_with_index do |doc_id, index|
        # Map internal index to document ID
        @document_mappings[index] = doc_id
        
        # Try to find corresponding Jekyll note
        jekyll_note = find_jekyll_note_by_id(doc_id)
        if jekyll_note
          @document_mappings[doc_id] = {
            index: index,
            path: jekyll_note.path,
            url: jekyll_note.url,
            title: jekyll_note.data['title'] || jekyll_note.basename
          }
        end
      end
    end
    
    def find_jekyll_note_by_id(doc_id)
      # Search through Jekyll notes to find matching document
      @site.collections['notes'].docs.find do |note|
        # Try matching by content hash or file path
        note_content = File.read(note.path) rescue ""
        content_hash = Digest::MD5.hexdigest(note_content)
        
        # Multiple matching strategies
        content_hash == doc_id ||
        File.basename(note.path, '.*').gsub(/[^a-zA-Z0-9]/, '') == doc_id ||
        note.path.include?(doc_id)
      end
    end
    
    def extract_embeddings
      # Look for vector data in various possible locations
      vector_stores = [@data['vectorStore'], @data['vectors'], @data['embeddings']].compact
      
      return if vector_stores.empty?
      
      vector_store = vector_stores.first
      
      # Extract embeddings based on Co-Pilot structure
      if vector_store.is_a?(Hash)
        vector_store.each do |key, value|
          if value.is_a?(Array) && value.first.is_a?(Numeric)
            # This looks like an embedding vector
            doc_id = @document_mappings[key] || key
            @embeddings[doc_id] = value
          end
        end
      elsif vector_store.is_a?(Array)
        # Embeddings stored as array indexed by document order
        vector_store.each_with_index do |embedding, index|
          if embedding.is_a?(Array)
            doc_id = @document_mappings[index]
            @embeddings[doc_id] = embedding if doc_id
          end
        end
      end
    end
    
    def calculate_similarities(target_doc_id)
      target_embedding = @embeddings[target_doc_id]
      return {} unless target_embedding
      
      similarities = {}
      
      @embeddings.each do |doc_id, embedding|
        next if doc_id == target_doc_id
        
        similarity = cosine_similarity(target_embedding, embedding)
        similarities[doc_id] = similarity if similarity > 0.3 # Threshold
      end
      
      similarities
    end
    
    def cosine_similarity(vec_a, vec_b)
      return 0.0 if vec_a.empty? || vec_b.empty? || vec_a.size != vec_b.size
      
      dot_product = vec_a.zip(vec_b).map { |a, b| a * b }.sum
      magnitude_a = Math.sqrt(vec_a.map { |a| a * a }.sum)
      magnitude_b = Math.sqrt(vec_b.map { |b| b * b }.sum)
      
      return 0.0 if magnitude_a == 0.0 || magnitude_b == 0.0
      
      dot_product / (magnitude_a * magnitude_b)
    end
  end
end