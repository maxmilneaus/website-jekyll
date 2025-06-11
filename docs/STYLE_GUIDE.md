---
title: Style Guide
layout: note
---

# Max Milne Website Style Guide
*A cozy, contemplative aesthetic for thoughtful writing*

**Last updated:** June 11, 2025  
**Current theme:** Viola/Rams Aesthetic

1. Design Philosophy
Core Principles

Mys (Swedish): That feeling of cozy contentment - candlelight warmth, intimate conversations, thoughtful reflection.

Lagom (Swedish): Just the right amount - not too much, not too little.

Kaizen: Continuous subtle improvements that enhance without overwhelming.

Reading-first: Every design decision serves comfortable, focused reading.

Aesthetic: "Viola/Rams"

This style guide implements a synthesis of two core principles:

Viola (The Mood): The design feels atmospheric and contemplative, achieved through a warm, dark background and the use of a clean, light blue accent for clarity.

Rams (The Structure): The design is functional and honest. Every element is purposeful, with a preference for clear typographic hierarchy over unnecessary decoration. "Less, but better."

## Color Palette
The palette is built on warm, soft-contrast tones, with a single light blue accent for all interactive states.

### Color Reference Key

| Role | Variable | Hex | Primary Usage |
|------|----------|-----|---------------|
| **Background** | `--color-deep` | `#141210` | Main page background |
| **Secondary BG** | `--color-charcoal` | `#201d1a` | Cards, code blocks, project backgrounds |
| **Subtle Elements** | `--color-graphite` | `#2d2926` | Borders, card outlines |
| **Dividers** | `--color-stone` | `#4a453f` | **Link underlines**, borders, blockquote borders |
| **Primary Text** | `--color-cream` | `#e8ddd4` | Body text, headings, link text |
| **Secondary Text** | `--color-warm-gray` | `#c7beb5` | Muted text, external link arrows |
| **Interactive** | `--color-accent-hover` | `#93c5fd` | **All hover states**, article dates |

### SCSS Variables

```scss
/* Primary Palette */
--color-deep: #141210;              // Background
--color-charcoal: #201d1a;          // Secondary backgrounds
--color-graphite: #2d2926;          // Borders, subtle elements
--color-stone: #4a453f;             // Dividers, stronger borders
--color-cream: #e8ddd4;             // Primary text
--color-warm-gray: #c7beb5;        // Secondary text, muted elements

/* Unified Accent Color */
--color-accent-hover: #93c5fd;     /* Light blue for all hover/interactive states */
```

3. Typography
Typography is the primary tool for structure.

Font Stack

Primary: Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif (--font-primary)

Monospace: 'Roboto Mono', monospace (--font-mono)

Hierarchy & Key Styles

Headings (h1-h4): Use a clear size hierarchy to structure content.

Body Text: 1rem base size with a 1.7 line height for optimal readability.

Text Selection: A semi-transparent light blue background (rgba(147, 197, 253, 0.4)) provides clear feedback without obscuring text.

4. Interactive & Content Elements
Links

**Unified Style:** All links, both internal and external, share the same classic underline style for consistency. The underline color uses **Stone** for subtle contrast against the cream text.

**Hover State:** On hover, the link text and its underline both transition to **Interactive** blue.

**External Link Indicator:** External links are distinguished by a discreet ↗ arrow appended to the text, signaling navigation away from the site. The arrow is styled as `inline-block` to prevent underline interference.

**Recent Fix (June 2025):** Standardized all link underlines to use **Stone** color and fixed external link arrow underline issues.

Interactive Blockquote

Aesthetic: A space for quoted text, bordered with a neutral --color-stone.

Functionality: On hover, a "Copy" button elegantly appears in the top-right corner, allowing the user to easily copy the quote's text. This provides utility without cluttering the default reading view.

5. Components
Latest Articles List (.latest-posts)

This component displays a list of recent articles with a refined, typographic structure.

Layout: A 3-column grid: Date | Separator | Title.

Date Format: YYYY MM (e.g., 2024 06).

Date Styling: The date is colored with the light blue --color-accent-hover by default, giving it visual importance as a key piece of metadata.

Hover Interaction: On hover, the article title only changes color to match the date's light blue, creating a focused interaction.

Spacing: Vertical spacing between list items is tight (0.3rem) to create a dense, easily scannable directory.

Projects Page (.projects-list)

This component displays a list of projects, with each project being a standard internal note.

System: Uses the _notes directory and filters for notes with type: project in their front matter.

Layout: A clean, vertical list where each item is a clickable block, separated by top and bottom borders.

Content: Each list item displays the project's title and the first paragraph of its content as a short description.

Interaction: Hovering over a project block changes its background color to --color-charcoal and the project title's color to --color-accent-hover.

Linking: Clicking a project block navigates the user to the full project note within the site.

This style guide documents the current "Viola/Rams" aesthetic - a cozy, contemplative design perfect for thoughtful writing and slow reading.

