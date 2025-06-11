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

**Latest Section (.latest-section)**

A featured section that automatically displays the most recent note, inspired by Steph Ango's design approach.

**Structure:**
- **"Latest" Label:** Clickable link that navigates to the most recent note
- **Title:** Large, prominent heading linking to the full article
- **Metadata:** Date and reading time estimate
- **Preview:** Smart excerpt showing the first complete sentence (or first 35 words if the sentence is longer)
- **Call-to-Action:** "Keep reading →" link

**Typography:**
- Label: 1rem, normal weight, meta color (`--color-meta`) with hover state
- Title: 1.25rem, medium weight, cream color with blue hover
- Meta: 0.875rem, meta color for both date and reading time
- Preview: Meta color, 1.6 line height, matches body text weight

**Content Logic:**
- Automatically pulls the most recent note based on `last_modified_at_timestamp`
- Smart truncation: Shows first complete sentence, or truncates at 35 words with ellipsis
- Reading time calculated at 200 words per minute

**Interactive Elements:**
- "Latest" label links to the full article with subtle blue hover
- Title has hover effect transitioning to accent color
- "Keep reading →" maintains consistent underline styling

**Recent Implementation (June 2025):** Complete Latest section with smart content truncation and consistent link styling throughout.

Latest Articles List (.latest-posts)

This component displays a list of recent articles with a refined, typographic structure.

**Layout:** A 3-column grid: Date | Separator | Title.

**Date Format:** YYYY MM (e.g., 2024 06).

**Typography:** 
- Date: Monospace font, light blue color (`--color-accent-hover`), 0.9em size
- Separator: Stone color (`--color-stone`) dot character (·)
- Title: Cream color with stone-colored underline

**Text Decoration:** Only the article title has an underline. The date and separator explicitly have `text-decoration: none` to ensure clean presentation.

**Hover Interaction:** On hover, only the article title changes color to light blue (`--color-accent-hover`) with matching underline color.

**Spacing:** Vertical spacing between list items is tight (0.3rem) to create a dense, easily scannable directory.

**Recent Update (June 2025):** Removed underlines from date and separator elements to match clean link styling patterns (inspired by stephango.com).

Projects List (.projects-list)

This component displays a list of projects in a clean, structured layout.

**System:** Uses the `_projects` collection with Jekyll front matter for metadata.

**Layout:** 2-column grid layout with year/date in the left column (100px) and content in the right column (1fr). Grid collapses to single column on mobile.

**Structure:** Each project entry contains:
- **Year column:** Project year or date range (e.g., "2024" or "2008 - 2024")
- **Content column:** Project title (linked) and description

**Typography:** 
- Year: Small secondary text (`--color-text-secondary`, 0.85rem)
- Title: Medium weight heading (1rem, 500 weight) with standard link styling
- Description: Secondary text with reduced opacity (0.85)

**Link Behavior:** Project titles use consistent site-wide link styling:
- Default: Cream text with stone-colored underline
- Hover: Light blue text and underline (`--color-accent-hover`)
- Transition: 200ms ease for both color and text-decoration-color

**Container Interaction:** Subtle background color change on hover (rgba(255,255,255,0.02)) with 200ms ease transition.

**Spacing:** Generous vertical padding (1.25rem) with bottom borders between entries for clear separation.

**Recent Update (June 2025):** Removed padding shifts on hover to prevent layout movement. Links now behave identically to all other site links.

## Section Headers Pattern

**Standardized approach for all content sections (Latest, Topics, Writing, etc.)**

All section headers follow a consistent pattern inspired by Steph Ango's minimal design approach:

**Typography:**
- Font size: `1rem` (consistent across all sections)
- Font weight: `var(--font-weight-normal)` (400)
- Color: `var(--color-meta)` for subtle hierarchy
- Letter spacing: `0.03em` for refined appearance

**Spacing:**
- Bottom margin: `var(--space-md)` (1rem) for proper separation from content
- Creates breathing room between section label and content

**Implementation Pattern:**
```scss
.section-label {
  font-size: 1rem;
  font-weight: var(--font-weight-normal);
  color: var(--color-meta);
  letter-spacing: 0.03em;
  margin-bottom: var(--space-md);
  display: block;
}
```

**Usage:** Apply `.section-label` class to any section header element. For clickable labels (like Latest), additional hover states can be added while maintaining the core typography and spacing pattern.

**Recent Standardization (June 2025):** Unified all section headers to use the same font size and spacing, ensuring consistent visual hierarchy across Latest, Topics, Writing, and future sections.

This style guide documents the current "Viola/Rams" aesthetic - a cozy, contemplative design perfect for thoughtful writing and slow reading.

