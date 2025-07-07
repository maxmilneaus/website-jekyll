module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      # Collect all tags from notes
      tags = Set.new
      site.collections['notes'].docs.each do |note|
        if note.data['tags']
          note.data['tags'].each { |tag| tags.add(tag) }
        end
      end

      # Generate a page for each tag
      tags.each do |tag|
        site.pages << TagPage.new(site, site.source, tag)
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      @dir = "tags/#{tag.downcase.gsub(/[^a-z0-9\-_]/, '-')}"
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      
      self.data['tag'] = tag
      self.data['title'] = tag
      self.data['layout'] = 'tag'
    end
  end
end