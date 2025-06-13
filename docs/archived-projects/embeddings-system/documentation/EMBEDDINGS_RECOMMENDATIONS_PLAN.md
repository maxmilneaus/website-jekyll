# Embeddings-Based Recommendations System
*Building "You might also enjoy" using Obsidian Co-Pilot embeddings*

**Last updated:** June 13, 2025  
**Status:** Planning Phase  
**Goal:** Implement semantic similarity recommendations like Steph Ango's site

---

## Project Overview

### What We're Building
A Jekyll plugin that reads Obsidian Co-Pilot embeddings data to generate semantic similarity recommendations, displaying them as "You might also enjoy" sections on note pages.

### Data Source Analysis
**Co-Pilot Embeddings File:** `aVault/.obsidian/copilot-index-[hash].json`

**Structure Discovered:**
```json
{
  "internalDocumentIDStore": {
    "internalIdToId": ["hash1", "hash2", ...]
  },
  "vectorStore": {
    // Vector embeddings data (large arrays of floats)
  },
  "documentStore": {
    // Document metadata and content mappings
  }
}
```

**Key Insights:**
- File size: ~25MB (massive embeddings dataset)
- Contains document ID mappings
- Stores vector embeddings for semantic similarity
- Maps to actual document content and paths

---

## Implementation Plan

### Phase 1: Data Access & Parsing
**Goal:** Extract usable data from Co-Pilot embeddings

**Tasks:**
1. **Parse JSON Structure** - Build Ruby parser for Co-Pilot format
2. **Document Mapping** - Map internal IDs to actual note file paths
3. **Vector Extraction** - Extract embedding vectors for each document
4. **Validation** - Ensure data integrity and completeness

**Technical Approach:**
```ruby
class CopilotEmbeddingsParser
  def initialize(copilot_file_path)
    @data = JSON.parse(File.read(copilot_file_path))
  end
  
  def get_document_embeddings
    # Extract and map document vectors
  end
  
  def map_ids_to_files
    # Map internal IDs to Jekyll note paths
  end
end
```

### Phase 2: Similarity Calculation Engine
**Goal:** Calculate semantic similarity between documents

**Similarity Algorithm:**
- **Cosine Similarity:** Most common for embeddings
- **Threshold:** Set minimum similarity score (e.g., 0.7)
- **Top-N:** Return best N recommendations (e.g., 5-9 items)

**Mathematical Formula:**
```
cosine_similarity(A, B) = (A · B) / (||A|| × ||B||)
```

**Performance Considerations:**
- **Caching:** Pre-calculate similarity matrices
- **Lazy Loading:** Calculate on-demand for performance
- **Indexing:** Build similarity index for faster lookups

### Phase 3: Jekyll Integration
**Goal:** Seamless integration with existing Jekyll workflow

**Plugin Architecture:**
```ruby
module Jekyll
  class SimilarityRecommendations < Generator
    def generate(site)
      # Load embeddings data
      # Calculate similarities
      # Inject recommendations into page data
    end
  end
end
```

**Page Integration:**
```liquid
{% if page.similar_notes %}
  <div class="you-might-enjoy">
    <h3>You might also enjoy</h3>
    <ul>
      {% for note in page.similar_notes %}
        <li><a href="{{ note.url }}">{{ note.title }}</a></li>
      {% endfor %}
    </ul>
  </div>
{% endif %}
```

### Phase 4: UI Component Design
**Goal:** Match Steph Ango's aesthetic and UX patterns

**Design Requirements:**
- **Typography:** Follow systematic design patterns
- **Spacing:** Use established `--space-*` variables
- **Colors:** Integrate with existing palette
- **Interaction:** Subtle hover states

**Component Structure:**
```scss
.you-might-enjoy {
  margin: var(--space-xl) 0;
  
  h3 {
    font-size: 1.35rem;
    font-weight: var(--font-weight-medium);
    color: var(--color-warm-gray);
    margin-bottom: var(--space-md);
  }
  
  ul {
    list-style: none;
    padding: 0;
    
    li {
      margin: var(--space-sm) 0;
      
      a {
        color: var(--color-stone);
        text-decoration: underline;
        
        &:hover {
          color: var(--color-accent-hover);
        }
      }
    }
  }
}
```

---

## Technical Specifications

### File Processing Pipeline
1. **Embeddings Extraction:** Parse Co-Pilot JSON → Extract vectors
2. **Document Mapping:** Internal IDs → Jekyll file paths  
3. **Similarity Matrix:** Calculate all-to-all similarities
4. **Caching:** Store results for performance
5. **Page Injection:** Add recommendations to page data

### Performance Optimization
**Caching Strategy:**
- **Similarity Cache:** Store pre-calculated similarities
- **Incremental Updates:** Only recalculate when content changes
- **Lazy Loading:** Calculate recommendations on page request

**Memory Management:**
- **Streaming:** Process large JSON files in chunks
- **Compression:** Compress similarity matrices
- **Cleanup:** Remove unused embeddings data

### Configuration Options
```yaml
# _config.yml
embeddings_recommendations:
  enabled: true
  copilot_file: ".obsidian/copilot-index-*.json"
  similarity_threshold: 0.7
  max_recommendations: 9
  cache_similarities: true
  exclude_tags: ["private", "draft"]
  manual_overrides: true
```

---

## Quality Assurance

### Testing Strategy
1. **Unit Tests:** Similarity calculation accuracy
2. **Integration Tests:** Jekyll plugin functionality  
3. **Performance Tests:** Large dataset handling
4. **UI Tests:** Component rendering and styling

### Validation Metrics
- **Precision:** How relevant are the recommendations?
- **Coverage:** What percentage of notes get recommendations?
- **Performance:** Page build time impact
- **User Experience:** Do recommendations feel useful?

### Manual Validation
- **Semantic Check:** Do similar notes actually relate?
- **Topic Coherence:** Are recommendations thematically consistent?
- **Edge Cases:** Handle notes with no similarities
- **Quality Control:** Manual curation overrides

---

## Advanced Features (Future Phases)

### Smart Filtering
- **Tag-based filtering:** Only recommend within similar topics
- **Recency weighting:** Prefer newer content
- **User behavior:** Track which recommendations get clicked
- **Diversity optimization:** Avoid too-similar recommendations

### Content Analysis Enhancement  
- **Title weighting:** Give more weight to title similarity
- **Length consideration:** Account for document length
- **Structure analysis:** Consider headings and sections
- **Link graph:** Incorporate existing backlink relationships

### Manual Curation System
```yaml
# In front matter
manual_recommendations:
  - note-slug-1
  - note-slug-2
  
exclude_from_recommendations: true
```

---

## Implementation Checklist

### Phase 1: Foundation
- [ ] Parse Co-Pilot JSON structure
- [ ] Map document IDs to Jekyll files
- [ ] Extract embedding vectors
- [ ] Build basic similarity calculator

### Phase 2: Core Engine
- [ ] Implement cosine similarity calculation
- [ ] Build caching system
- [ ] Create Jekyll plugin structure
- [ ] Add configuration options

### Phase 3: Integration
- [ ] Inject recommendations into page data
- [ ] Create Liquid template components
- [ ] Design CSS styling
- [ ] Test with real content

### Phase 4: Optimization
- [ ] Performance benchmarking
- [ ] Memory usage optimization
- [ ] Error handling and edge cases
- [ ] Documentation and examples

---

## Success Metrics

**Technical Success:**
- Plugin builds without errors
- Similarity calculations are accurate
- Performance impact < 10% build time increase
- Cache system reduces subsequent build times

**User Experience Success:**
- Recommendations feel semantically relevant
- UI integrates seamlessly with design system
- Page load times remain fast
- Users engage with recommended content

**Maintenance Success:**
- System updates automatically with new content
- Manual overrides work reliably
- Error conditions are handled gracefully
- Documentation enables future development

---

This comprehensive plan provides a roadmap for building a sophisticated, Steph Ango-inspired recommendation system using the rich embeddings data from Obsidian Co-Pilot.