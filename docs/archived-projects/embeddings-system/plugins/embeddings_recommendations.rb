require_relative 'copilot_parser'

module Jekyll
  class EmbeddingsRecommendations < Generator
    safe true
    priority :low

    def generate(site)
      return unless should_generate?(site)
      
      # Initialize Co-Pilot parser
      parser = CopilotParser.new(site)
      
      unless parser.parse
        puts "Embeddings recommendations disabled: Could not parse Co-Pilot data"
        return
      end
      
      puts "Generating embeddings-based recommendations..."
      
      # Process notes collection
      process_notes(site, parser)
      
      # Cache similarity data for performance
      cache_similarities(site, parser) if should_cache?(site)
    end
    
    private
    
    def should_generate?(site)
      config = site.config['embeddings_recommendations'] || {}
      config.fetch('enabled', true)
    end
    
    def should_cache?(site)
      config = site.config['embeddings_recommendations'] || {}
      config.fetch('cache_similarities', true)
    end
    
    def process_notes(site, parser)
      return unless site.collections['notes']
      
      config = site.config['embeddings_recommendations'] || {}
      max_recommendations = config.fetch('max_recommendations', 5)
      similarity_threshold = config.fetch('similarity_threshold', 0.5)
      
      site.collections['notes'].docs.each do |note|
        # Skip if manually disabled
        next if note.data['exclude_from_recommendations']
        
        # Get document ID for this note
        doc_id = find_document_id(note, parser)
        next unless doc_id
        
        # Calculate similar documents
        similar_docs = parser.get_similar_documents(doc_id, max_recommendations + 1)
        
        # Filter and format recommendations
        recommendations = build_recommendations(similar_docs, site, parser, similarity_threshold)
        
        # Add to note data
        note.data['similar_notes'] = recommendations
        note.data['has_recommendations'] = !recommendations.empty?
        
        if recommendations.any?
          puts "  → #{note.data['title']}: #{recommendations.size} recommendations"
        end
      end
    end
    
    def find_document_id(note, parser)
      # Try various methods to match Jekyll note with Co-Pilot document
      
      # Method 1: Direct path matching
      relative_path = note.path.sub(note.site.source + '/', '')
      doc_id = parser.document_mappings.find { |id, data| 
        data.is_a?(Hash) && data[:path] == relative_path 
      }&.first
      
      return doc_id if doc_id
      
      # Method 2: Content-based matching
      content_hash = Digest::MD5.hexdigest(File.read(note.path))
      doc_id = parser.document_mappings.keys.find { |id| id == content_hash }
      
      return doc_id if doc_id
      
      # Method 3: Filename-based matching
      basename = File.basename(note.path, '.*')
      doc_id = parser.document_mappings.keys.find { |id| 
        id.include?(basename) || basename.include?(id)
      }
      
      doc_id
    end
    
    def build_recommendations(similar_docs, site, parser, threshold)
      recommendations = []
      
      similar_docs.each do |similarity_data|
        doc_id = similarity_data[:id]
        score = similarity_data[:score]
        
        # Skip if below threshold
        next if score < threshold
        
        # Find corresponding Jekyll note
        jekyll_note = find_jekyll_note_by_doc_id(doc_id, site, parser)
        next unless jekyll_note
        
        recommendations << {
          'title' => jekyll_note.data['title'] || File.basename(jekyll_note.path, '.*'),
          'url' => jekyll_note.url,
          'similarity_score' => score.round(3),
          'tags' => jekyll_note.data['tags'] || [],
          'date' => jekyll_note.data['last_modified_at'] || jekyll_note.data['date']
        }
      end
      
      recommendations
    end
    
    def find_jekyll_note_by_doc_id(doc_id, site, parser)
      # Use parser's document mapping if available
      doc_data = parser.document_mappings[doc_id]
      if doc_data.is_a?(Hash) && doc_data[:path]
        return site.collections['notes'].docs.find { |note| 
          note.path.include?(doc_data[:path]) 
        }
      end
      
      # Fallback: search through all notes
      site.collections['notes'].docs.find do |note|
        content_hash = Digest::MD5.hexdigest(File.read(note.path))
        content_hash == doc_id ||
        File.basename(note.path, '.*').include?(doc_id) ||
        doc_id.include?(File.basename(note.path, '.*'))
      end
    end
    
    def cache_similarities(site, parser)
      cache_dir = File.join(site.source, '.jekyll-cache', 'embeddings')
      FileUtils.mkdir_p(cache_dir)
      
      cache_file = File.join(cache_dir, 'similarities.json')
      
      # Create cache data
      cache_data = {
        'generated_at' => Time.now.iso8601,
        'document_count' => parser.document_mappings.size,
        'embeddings_count' => parser.embeddings.size,
        'version' => '1.0'
      }
      
      File.write(cache_file, JSON.pretty_generate(cache_data))
      puts "Cached embeddings data to #{cache_file}"
    end
  end
end