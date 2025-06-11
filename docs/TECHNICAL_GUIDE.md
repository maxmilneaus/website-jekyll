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
4. [Development Workflow](#development-workflow)

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
```

**Usage:** For project portfolio entries
**Collection:** `_projects/`
**Layout:** `project.html`
**Key fields:**
- `title`: Project name
- `year`: Time period (can be range or single year)
- `description`: Brief project summary
- `order`: Display order (lower numbers first)
- `tags`: Array of relevant tags

#### Web Note Template (`_templates/Web Note.md`)
```yaml
---
title: "{{title}}"
layout: note
id: "{{note}}"
permalink: /{{note}}
---
```

**Usage:** For blog posts, notes, and general content
**Collection:** `_notes/`
**Layout:** `note.html`
**Key fields:**
- `title`: Note/post title
- `layout`: Always `note`
- `id`: Unique identifier
- `permalink`: Custom URL path

### Template Philosophy
- **Minimal but complete:** Only essential fields included
- **No publishing controls:** Jekyll handles all content as published by default
- **Consistent structure:** Predictable front matter across content types
- **Flexible content:** Templates provide structure, not restrictions

---

## Front Matter Specifications

### Required Fields by Content Type

#### Projects (`_projects/`)
- `title` (string): Required
- `year` (string/number): Required for chronological sorting
- `description` (string): Required for project listing page
- `order` (number): Required for manual sorting

#### Notes (`_notes/`)
- `title` (string): Required
- `layout` (string): Should be "note"

### Optional Fields
- `tags` (array): For categorization
- `id` (string): Custom identifier
- `permalink` (string): Custom URL structure

### Front Matter Best Practices
- Use boolean values (`true`/`false`) not strings (`"true"`/`"false"`)
- Quote titles with special characters
- Use consistent date formatting: `YYYY-MM-DD`
- Keep arrays properly formatted: `[item1, item2]`

---

## Collections & Layouts

### Jekyll Collections Configuration
```yaml
collections:
  notes:
    output: true
    permalink: /:slug
  projects:
    output: true
    permalink: /projects/:name/
```

### Layout Hierarchy
- `_layouts/default.html`: Base layout with navigation and footer
- `_layouts/note.html`: Extends default, adds backlinks and metadata
- `_layouts/page.html`: Extends default, minimal page layout
- `_layouts/project.html`: Extends default, project-specific metadata
- `_layouts/projects.html`: Projects listing page

### Layout Dependencies
- All layouts extend `default.html`
- `note.html` expects `page.title` and `page.last_modified_at`
- `project.html` expects `page.title`, `page.year`, `page.status`
- `projects.html` sorts by `order` then `year`

---

## Development Workflow

### Adding New Content

1. **Projects:**
   - Copy `_templates/Web Project.md`
   - Save to `_projects/project-name.md`
   - Update front matter fields
   - Add content below front matter

2. **Notes:**
   - Copy `_templates/Web Note.md`
   - Save to `_notes/note-name.md`
   - Update front matter fields
   - Add content below front matter

### File Organization
```
_templates/          # Template files (not built)
_projects/           # Project portfolio items
_notes/              # Blog posts, notes, articles
_pages/              # Static pages (about, now, etc.)
_layouts/            # Jekyll layout templates
_includes/           # Reusable template components
_sass/               # Stylesheet partials
```

### Build Process
1. Jekyll processes collections (`_notes`, `_projects`)
2. Applies appropriate layouts based on front matter
3. Generates static HTML files
4. Applies SCSS compilation
5. Outputs to `_site/`

---

## Change Log

### June 11, 2025
- **Templates System:** Streamlined Web Project and Web Note templates
- **Front Matter:** Removed complex publishing controls, simplified to essential fields
- **Documentation:** Created technical guide to complement existing style guide

---

## Future Enhancements
- [ ] Add automated testing for front matter validation
- [ ] Implement template validation scripts
- [ ] Add development environment setup documentation
- [ ] Document plugin configurations

---

*This guide complements the [STYLE_GUIDE.md](STYLE_GUIDE.md) which covers design and aesthetic specifications.*