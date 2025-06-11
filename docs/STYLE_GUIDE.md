---
title: Style Guide
layout: note
---

# Max Milne Website Design System
*A systematic approach to cozy, contemplative design*

**Last updated:** June 11, 2025  
**Design Philosophy:** Systems thinking with mathematical relationships  
**Current theme:** Viola/Rams with Factor-Based Architecture

---

## 1. Design Philosophy & Systems Thinking

### Core Principles

**Mys (Swedish):** That feeling of cozy contentment - candlelight warmth, intimate conversations, thoughtful reflection.

**Lagom (Swedish):** Just the right amount - not too much, not too little.

**Kaizen:** Continuous subtle improvements that enhance without overwhelming.

**Systems Thinking:** Every design decision creates relationships. Changes should be universal, factor-based, and mathematically consistent.

### Aesthetic: "Viola/Rams + Systems"

**Viola (The Mood):** Atmospheric and contemplative, achieved through warm, dark backgrounds and clean blue accents.

**Rams (The Structure):** Functional and honest. Every element is purposeful, with clear typographic hierarchy over decoration.

**Systems (The Method):** Factor-based spacing, universal color variables, and mathematical relationships that scale consistently.

---

## 2. Systems Architecture

### Factor-Based Spacing System

Our spacing system uses **mathematical relationships** rather than arbitrary values:

```scss
/* Base Spacing Scale */
--space-xs: 0.25rem;    /* Base unit */
--space-sm: 0.5rem;     /* 2x base */
--space-md: 1rem;       /* 4x base */
--space-lg: 1.75rem;    /* 7x base */
--space-xl: 3rem;       /* 12x base */
```

**Mathematical relationships:**
- All spacing derives from `0.25rem` base unit
- Creates harmonic proportions: 1:2:4:7:12
- Enables consistent scaling across all elements

### Universal Spacing Rules

**Content Container Spacing:**
```scss
main {
  margin: calc(var(--space-xl) * 1.25) 0 var(--space-xl) 0;
}
/* Creates 3.75rem top margin universally across all page types */
```

**Horizontal Rules (HR) System:**
```scss
hr {
  margin: calc(var(--space-xl) * 1) 0 calc(var(--space-xl) * 1.5) 0;
  background: var(--color-divider);
}
/* Creates 3rem top, 4.5rem bottom in 2:3 ratio for visual harmony */
```

**Systems Benefits:**
- ✅ **Universal consistency** - One rule affects all pages
- ✅ **Mathematical harmony** - 2:3 proportional relationships
- ✅ **Maintenance simplicity** - Change factors, not individual values
- ✅ **Visual rhythm** - Predictable spacing relationships

---

## 3. Color Architecture

### Primary Palette with Systematic Variables

```scss
/* Base Colors */
--color-deep: #141210;              /* Background */
--color-charcoal: #201d1a;          /* Secondary backgrounds */
--color-graphite: #2d2926;          /* Borders, subtle elements */
--color-stone: #4a453f;             /* Base divider color */
--color-cream: #e8ddd4;             /* Primary text */
--color-warm-gray: #c7beb5;         /* Secondary text */
--color-meta: #9c958c;              /* Label text, metadata */

/* Interactive */
--color-accent-hover: #93c5fd;      /* All hover states */
--color-accent-subtle: #3b82f6;     /* Accent elements */

/* System Colors - Mathematical Relationships */
--color-divider: rgba(74, 69, 63, 0.6); /* Stone + systematic 0.6 opacity */
```

### Universal Divider System

**One variable controls ALL content dividers:**

```scss
/* Applied consistently to: */
hr { background: var(--color-divider); }
footer { border-top: 1px solid var(--color-divider); }
.backlink-box { border-left: 2px solid var(--color-divider); }
```

**Systems Benefits:**
- ✅ **Single source of truth** for divider appearance
- ✅ **Consistent visual weight** across all dividers
- ✅ **Easy theme changes** - modify one variable
- ✅ **No scattered opacity values**

---

## 4. Typography System

### Hierarchical Scale with Mathematical Relationships

```scss
/* Font Hierarchy */
h1 { font-size: 2rem; }           /* 32px - Primary heading */
h2 { font-size: 1.65rem; }        /* 26.4px - Section heading */
h3 { font-size: 1.35rem; }        /* 21.6px - Subsection */
body { font-size: 1rem; }         /* 16px base */

/* Systematic Line Heights */
--line-height: 1.7;               /* Body text optimized for reading */
h1 { line-height: 1.15; }         /* Tighter for impact */
h2-h6 { line-height: 1.25; }      /* Balanced for hierarchy */
```

### Spacing Relationships

```scss
/* Factor-based margins */
h2 { margin-top: calc(var(--space-xl) * 1.25); }  /* 3.75rem section breaks */
h3 { margin-top: var(--space-xl); }               /* 3rem subsection breaks */
p { margin: var(--space-md) 0 var(--space-lg) 0; } /* 1rem - 1.75rem rhythm */
```

---

## 5. Component Architecture

### Latest Section - Factor-Based Design

```scss
.latest-section {
  margin: 0 0 calc(var(--space-xl) * 1.5) 0;  /* 4.5rem bottom spacing */
}
```

**Structure with systematic spacing:**
- **Label:** `var(--space-md)` bottom margin (1rem)
- **Title:** `var(--space-xs)` bottom margin (0.25rem) 
- **Meta:** `var(--space-sm)` bottom margin (0.5rem)
- **Preview:** `var(--space-md)` bottom margin (1rem)

### Section Headers - Universal Pattern

```scss
.section-label {
  font-size: 1rem;                          /* Consistent across all sections */
  font-weight: var(--font-weight-normal);   /* 400 weight */
  color: var(--color-meta);                 /* Systematic hierarchy color */
  letter-spacing: 0.03em;                   /* Refined spacing */
  margin-bottom: var(--space-md);           /* 1rem breathing room */
}
```

### Article Lists - Grid System

```scss
ul a {
  display: grid;
  grid-template-columns: auto auto 1fr;     /* Date | Separator | Title */
  gap: 0.25rem;                             /* Quarter-unit spacing */
  align-items: baseline;
}
```

---

## 6. Systems Guidelines for Future Development

### Making Systematic Design Decisions

**✅ DO: Use Factor-Based Thinking**
```scss
/* Good - uses mathematical relationship */
margin: calc(var(--space-xl) * 1.5) 0;

/* Good - derives from base spacing */
padding: var(--space-md) var(--space-lg);
```

**❌ DON'T: Use Arbitrary Values**
```scss
/* Bad - magic number with no system relationship */
margin: 47px 0;

/* Bad - inline styles that can't be systematically updated */
style="margin-top: 2.3rem;"
```

### Adding New Components

**1. Spacing:** Use existing `--space-*` variables or create factors of them
**2. Colors:** Use existing palette or add systematic variables to `:root`
**3. Typography:** Follow established hierarchy relationships
**4. Dividers:** Always use `var(--color-divider)` for consistency

### Scaling the System

**Factor Adjustments:**
```scss
/* To increase all HR spacing proportionally: */
hr { margin: calc(var(--space-xl) * 1.2) 0 calc(var(--space-xl) * 1.8) 0; }
/* Maintains 2:3 ratio while scaling up */
```

**Color System Extensions:**
```scss
/* Add new systematic colors following the pattern: */
--color-success: rgba(34, 197, 94, 0.8);   /* Green with systematic opacity */
--color-warning: rgba(251, 191, 36, 0.8);  /* Yellow with systematic opacity */
```

---

## 7. Link System

### Universal Link Behavior

**All links share consistent styling:**

```scss
a {
  color: var(--color-stone);                     /* Subtle default color */
  text-decoration: underline;
  text-decoration-color: var(--color-stone);     /* Matching underline */
  text-underline-offset: 0.2em;                 /* Systematic offset */
  transition: color 200ms ease, text-decoration-color 200ms ease;
}

a:hover {
  color: var(--color-accent-hover);              /* Blue hover */
  text-decoration-color: var(--color-accent-hover); /* Matching underline */
}
```

**External Link Differentiation:**
- ↗ arrow indicator with `--color-warm-gray`
- Italic styling to distinguish from internal links
- No underline on arrow icon

---

## 8. Implementation Patterns

### Universal Rules Over Specific Overrides

**✅ Systematic Approach:**
```scss
/* One rule affects all content containers */
main { margin: calc(var(--space-xl) * 1.25) 0 var(--space-xl) 0; }
```

**❌ Individual Overrides:**
```html
<!-- Avoid scattered inline styles -->
<article style="margin-top: 3.75rem;">
<div style="margin-top: 60px;">
```

### CSS Custom Properties for Systematic Control

**✅ Variables for Mathematical Relationships:**
```scss
:root {
  --section-spacing-factor: 1.25;           /* Factor for section spacing */
  --divider-opacity: 0.6;                   /* Systematic divider opacity */
}

.latest-section {
  margin-top: calc(var(--space-xl) * var(--section-spacing-factor));
}
```

---

## 9. Responsive Behavior

### Systematic Breakpoints

```scss
/* Mobile-first with systematic scaling */
@media (max-width: 600px) {
  body { padding: var(--space-lg) 4vw; }     /* Scales down systematically */
}

@media (min-width: 820px) {
  body { 
    font-size: 1.05rem;                     /* 5% increase */
    line-height: 1.75;                      /* Proportional line-height */
  }
}
```

---

## 10. Quality Assurance Checklist

### Before Making Changes

- [ ] Does this use existing spacing variables or create systematic factors?
- [ ] Are colors drawn from the established palette?
- [ ] Do spacing relationships maintain mathematical harmony?
- [ ] Can this change be made universally rather than specifically?
- [ ] Does this improve the system or just solve an isolated problem?

### After Implementation

- [ ] Do all similar elements now behave consistently?
- [ ] Are there new arbitrary values that should be systematized?
- [ ] Can this pattern be documented for future reuse?
- [ ] Does the change scale properly across breakpoints?

---

This design system creates **mathematical harmony** through factor-based relationships while maintaining the cozy, contemplative aesthetic. Every spacing decision derives from systematic thinking rather than visual approximation.

**Key Philosophy:** *Changes should improve the entire system, not just individual components.*