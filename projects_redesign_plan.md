# Jekyll Projects Page Redesign Plan

## Overview
Transform the current projects page to match Steph Ango's minimalist chronological style, where projects are listed by year with clean typography and simple navigation.

## Current State Analysis
- **Layout**: Grid-based cards with images
- **Data**: title, link, image, content
- **Navigation**: External links only
- **Style**: Visual card-based approach

## Target Design (Steph Ango Style)
- **Layout**: Chronological list, newest first
- **Data**: year, title, one-line description
- **Navigation**: Links to individual project pages AND external links
- **Style**: Minimalist text-based list

## Implementation Plan

### 1. Update Project Front Matter Schema
```yaml
---
title: "Project Name"
year: 2024
description: "One-line project description"
link: "https://external-link.com"  # optional external link
status: "live"  # live, archived, concept
---
```

### 2. Create New Projects Layout Template
**File**: `_layouts/projects.html`
- Chronological grouping by year
- Clean typography matching site style
- Dual navigation: project pages + external links
- Responsive design

### 3. Update Individual Project Pages
**Template**: `_layouts/project.html`
- Individual project detail pages
- Back navigation to projects index
- Consistent with site design system

### 4. Data Structure Strategy
```
_projects/
├── 2024-voice-project.md
├── 2024-photography-site.md
├── 2023-first-project.md
└── ...
```

### 5. CSS Styling Approach
- Minimal, typography-focused
- Year headers with subtle styling
- Hover states for interactivity
- Mobile-responsive design

### 6. Navigation Logic
- Project title links to individual project page (`/projects/project-name/`)
- External icon/link for live projects
- "Back to projects" on individual pages

### 7. Content Migration
- Rename existing project files with year prefix
- Add year and description fields
- Maintain existing content for detail pages

## File Changes Required

### New Files
- `_layouts/project.html` - Individual project template
- `_sass/_projects.scss` - Projects-specific styles

### Modified Files
- `_layouts/projects.html` - Complete redesign
- `_projects/*.md` - Update front matter schema
- `_sass/style.scss` - Import projects styles

### Configuration Changes
- `_config.yml` - Ensure proper project permalinks

## Benefits of This Approach
1. **Scalable**: Easy to add new projects
2. **SEO-friendly**: Individual pages for each project
3. **User Experience**: Quick scanning + detailed views
4. **Maintainable**: Simple front matter updates
5. **Professional**: Clean, portfolio-ready presentation

## Implementation Steps
1. Update project file structure and front matter
2. Create new project layout template
3. Redesign projects index layout
4. Add CSS styling
5. Test and refine responsive design
6. Migrate existing project content

## Sample Output Structure
```
2024
├── VOICE - AI voice synthesis tool
├── Photography Site - Personal portfolio redesign

2023
├── First Project - Modern web application
└── ...
```

This approach gives you the best of both worlds: a clean, scannable index page like Steph Ango's, plus detailed individual project pages for more context when needed.