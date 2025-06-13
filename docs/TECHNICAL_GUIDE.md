---
title: Technical Guide
layout: note
---

# Max Milne Website Technical Guide
*Implementation, configuration, and development documentation*

**Last updated:** June 11, 2025  
**Jekyll version:** Latest  
**Current setup:** Static site with collections

## Table of Contents
1. [Templates System](#templates-system)
2. [Front Matter Specifications](#front-matter-specifications)
3. [Collections & Layouts](#collections--layouts)
4. [Tag System](#tag-system)
5. [Development Workflow](#development-workflow)
6. [Plugin Configurations](#plugin-configurations)

---

## Templates System

### Overview
The website uses a streamlined template approach for consistent content creation. Templates are stored in `_templates/` and provide starting points for different content types.

### Available Templates

#### Web Project Template (`_templates/Web Project.md`)
```yaml
---
title: "{{title}}"
year: 2008 - 2024
description: "{{Description}}"
order: 1
tags:
---
Usage: For project portfolio entries
Collection: _projects/
Layout: project.html
Key fields:

title: Project name
year: Time period (can be range or single year)
description: Brief project summary
order: Display order (lower numbers first)
tags: Array of relevant tags
Web Note Template (_templates/Web Note.md)

YAML
---
title: "{{title}}"
layout: note
id: "{{note}}"
permalink: /{{note}}
---
Usage: For blog posts, notes, and general content
Collection: _notes/
Layout: note.html
Key fields:

title: Note/post title
layout: Always note
id: Unique identifier
permalink: Custom URL path
Template Philosophy

Minimal but complete: Only essential fields included
No publishing controls: Jekyll handles all content as published by default
Consistent structure: Predictable front matter across content types
Flexible content: Templates provide structure, not restrictions
Front Matter Specifications
Required Fields by Content Type

Projects (_projects/)

title (string): Required
year (string/number): Required for chronological sorting
description (string): Required for project listing page
order (number): Required for manual sorting
Notes (_notes/)

title (string): Required
layout (string): Should be "note"
Optional Fields

tags (array): For categorization
id (string): Custom identifier
permalink (string): Custom URL structure
Front Matter Best Practices

Use boolean values (true/false) not strings ("true"/"false")
Quote titles with special characters
Use consistent date formatting: YYYY-MM-DD
Keep arrays properly formatted: [item1, item2]
Collections & Layouts
Jekyll Collections Configuration

YAML
collections:
  notes:
    output: true
    permalink: /:slug
  projects:
    output: true
    permalink: /projects/:name/
Layout Hierarchy

_layouts/default.html: Base layout with navigation and footer
_layouts/note.html: Extends default, adds backlinks and metadata
_layouts/page.html: Extends default, minimal page layout
_layouts/project.html: Extends default, project-specific metadata
_layouts/projects.html: Projects listing page
Layout Dependencies

All layouts extend default.html
note.html expects page.title and page.last_modified_at
project.html expects page.title, page.year, page.status
projects.html sorts by order then year
tag.html expects page.tag and uses Jekyll collection filtering

---

## Tag System

### Overview
The website implements a fully automated tag system that generates individual pages for every unique tag found in notes. This system follows Steph Ango's design patterns for topics navigation.

### Tag Implementation Architecture

#### 1. Tag Collection (`_pages/index.md`)
```liquid
{% comment %} Manual tag aggregation since site.tags doesn't work with collections {% endcomment %}
{% assign all_tags_array = "" | split: "" %}
{% for note in site.notes %}
  {% if note.tags %}
    {% for tag in note.tags %}
      {% unless all_tags_array contains tag %}
        {% assign all_tags_array = all_tags_array | push: tag %}
      {% endunless %}
    {% endfor %}
  {% endif %}
{% endfor %}
```
**Technical Note:** Jekyll's `site.tags` doesn't work with custom collections, requiring manual tag aggregation.

#### 2. Automatic Page Generation (`_plugins/tag_generator.rb`)
```ruby
class TagPage < Jekyll::Page
  def initialize(site, base, tag)
    @site = site
    @base = base
    @dir = "tags/#{tag.downcase.gsub(/\s+/, '-')}"
    @name = 'index.html'
    
    self.process(@name)
    self.read_yaml(File.join(base, '_layouts'), 'tag.html')
    self.data['tag'] = tag
    self.data['title'] = tag
  end
end
```
**Features:**
- Generates clean URLs: `/tags/design/`, `/tags/development/`
- Automatic slug creation from tag names
- Uses `tag.html` layout template

#### 3. Tag Page Template (`_layouts/tag.html`)
```liquid
{% assign tagged_notes = site.notes | where_exp: "note", "note.tags contains page.tag" | sort: "last_modified_at_timestamp" | reverse %}
{% assign note_count = tagged_notes.size %}

<h1 class="tag-page-title">
  <a href="{{ site.baseurl }}/#topics" class="internal-link">Topics</a> / {{ page.tag | capitalize }}
</h1>

<p class="tag-meta">{{ note_count }} entr{% if note_count == 1 %}y{% else %}ies{% endif %} about this topic</p>
```
**Features:**
- Automatic capitalization of tag names
- Smart pluralization for entry counts
- Steph Ango inspired breadcrumb navigation
- Chronological listing of tagged notes

### Tag Styling System

#### Breadcrumb Navigation
```scss
.tag-page-title {
  font-size: 2rem;
  font-weight: var(--font-weight-normal);  /* Slimmer typography */
  color: var(--color-cream);              /* Tag name in cream */
  
  a {
    color: var(--color-meta);             /* "Topics" link in meta gray */
    text-decoration: none;
  }
}
```
**Design Features:**
- Different colors for hierarchy: "Topics" (meta gray) vs tag name (cream)
- Slimmer font weight following Steph Ango patterns
- Systematic spacing using design system variables

#### Topic Links on Homepage
```scss
.topic-link {
  display: inline-block;
  background: var(--color-charcoal);
  border: 1px solid var(--color-graphite);
  border-radius: var(--border-radius);
  padding: var(--space-xs) var(--space-sm);
  
  &:hover {
    background: var(--color-graphite);
    border-color: var(--color-accent-subtle);
    transform: translateY(-1px);
  }
}
```

### Adding Tags to Content

#### Front Matter Format
```yaml
---
title: "Note Title"
layout: note
tags: [design, process, creativity]
---
```

#### Template Integration
The `_templates/Web Note.md` template includes:
```yaml
tags: []
```
This ensures all new notes can participate in the tag system.

### Automatic Features

1. **Auto-Generation**: New tags automatically get pages without manual intervention
2. **Clean URLs**: Systematic slug generation handles spaces and special characters
3. **Smart Counting**: Proper pluralization for "1 entry" vs "2 entries"
4. **Link Behavior**: Internal navigation preserves same-page browsing
5. **Responsive Design**: Follows established design system patterns

### Technical Benefits

- **Scalable**: Handles unlimited tag growth automatically
- **Consistent**: Uses design system spacing and colors
- **Maintainable**: Single source of truth for tag page generation
- **SEO-Friendly**: Clean URLs and proper meta tags
- **User-Friendly**: Intuitive navigation following established patterns
Development Workflow
Adding New Content

Projects:

Copy _templates/Web Project.md
Save to _projects/project-name.md
Update front matter fields
Add content below front matter
Notes:

Copy _templates/Web Note.md
Save to _notes/note-name.md
Update front matter fields
Add content below front matter
File Organization

_templates/          # Template files (not built)
_projects/           # Project portfolio items
_notes/              # Blog posts, notes, articles
_pages/              # Static pages (about, now, etc.)
_layouts/            # Jekyll layout templates
_includes/           # Reusable template components
_sass/               # Stylesheet partials
Build Process

Jekyll processes collections (_notes, _projects)
Applies appropriate layouts based on front matter
Generates static HTML files
Applies SCSS compilation
Outputs to _site/
Plugin Configurations
open_external_links_in_new_tab.rb

This plugin automatically adds target="_blank" to any <a> tag to make it open in a new browser tab.

Logic: It purposefully ignores any link that has the class internal-link, footnote, or reversefootnote.

Modification (June 11, 2025): The plugin was modified to add more exceptions. The CSS selector was updated to also ignore links with the classes .latest-label, .latest-title-link, and .read-more. This was done to prevent links in the "Latest" section on the homepage from incorrectly opening in a new tab.

bidirectional_links_generator.rb

This plugin is responsible for two key features:

It finds all Roam-style [[wiki-links]] within your notes and converts them into standard HTML <a class="internal-link"> tags.
It processes all notes to find which notes link to others, generating the backlinks data used on the note.html layout. It also generates the _includes/notes_graph.json file used to render the interactive graph visualization.
Change Log
June 13, 2025

Tag System: Implemented fully automated tag system with Steph Ango inspired design
- Added automatic tag page generation via `tag_generator.rb` plugin
- Created `tag.html` layout template with smart pluralization
- Implemented manual tag collection for homepage topics section
- Added capitalization and differential color styling for breadcrumbs
- Updated templates to include tag support

June 11, 2025

Plugin Fix: Modified the open_external_links_in_new_tab.rb plugin to correctly handle internal links in the "Latest" section.
Documentation: Added new "Plugin Configurations" section to the technical guide.
Templates System: Streamlined Web Project and Web Note templates.
Front Matter: Removed complex publishing controls, simplified to essential fields.
Documentation: Created technical guide to complement existing style guide.
Future Enhancements
[x] Document plugin configurations
[x] Implement automated tag system
[ ] Add automated testing for front matter validation
[ ] Implement template validation scripts
[ ] Add development environment setup documentation
[ ] Add tag analytics and usage tracking