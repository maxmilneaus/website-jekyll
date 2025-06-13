# Plan for Fixing Navigation Text Color

## Problem
The "Max Milne" text in the navigation bar appears too dark when the website is deployed online (e.g., on Netlify), but it displays correctly in local development (`_site` versions). This indicates a discrepancy in how CSS is applied or interpreted in different environments.

## Hypothesis
The `site-title` CSS class, which is defined in `_sass/_style.scss` to set the text color to `var(--color-cream)` (a light cream color), is not being correctly applied to the navigation link containing `{{ site.title }}` in `_includes/nav.html`. If this class is not applied, the link likely falls back to a darker default link color, causing the issue observed online.

## Current State Analysis
- `_includes/nav.html`:
  ```html
  <a class="internal-link" href="{{ site.baseurl }}/"><b>{{ site.title }}</b></a>
  ```
  The `site.title` is wrapped in an `<a>` tag with `internal-link` class and a `<b>` tag.
- `_sass/_style.scss`:
  ```scss
  .site-title a {
    color: var(--color-cream);
    font-weight: 300;
    text-decoration: none;
    transition: color 200ms ease;
    padding: 0;
    margin: 0;

    &:hover {
      color: var(--color-accent-hover);
    }
  }
  ```
  This CSS rule targets an `<a>` tag *inside* an element with the `site-title` class.

The issue is that the `<a>` tag itself does not have the `site-title` class, so the specific styling for `.site-title a` is not being applied. Additionally, the `<b>` tag is redundant as font-weight can be controlled via CSS.

## Plan
1.  **Modify `_includes/nav.html`**:
    *   Add the `site-title` class to the `<a>` tag that wraps `{{ site.title }}`.
    *   Remove the `<b>` tag from around `{{ site.title }}`. The desired bolding/font-weight will be handled by the CSS rule for `.site-title a`.

### Proposed `_includes/nav.html` change:
```diff
--- a/_includes/nav.html
+++ b/_includes/nav.html
@@ -1,5 +1,5 @@
 <div class="nav-container">
     <div class="nav-left">
-        <a class="internal-link" href="{{ site.baseurl }}/"><b>{{ site.title }}</b></a>
+        <a class="internal-link site-title" href="{{ site.baseurl }}/">{{ site.title }}</a>
         {% if page.layout == 'note' or page.layout == 'tag' %}
             <span class="nav-breadcrumb-separator">/</span>
```

## Expected Outcome
After applying these changes, the "Max Milne" text in the navigation bar should correctly display with the `var(--color-cream)` color, both locally and when deployed online, resolving the reported issue.

## Mermaid Diagram
```mermaid
graph TD
    A[User reports dark nav text online] --> B{Check _includes/nav.html};
    B --> C{Check _sass/_style.scss for .site-title};
    C --> D{Identify missing .site-title class on nav link};
    D --> E[Propose adding .site-title class to <a> tag];
    E --> F[Propose removing <b> tag];
    F --> G{User approves plan?};
    G -- Yes --> H[Implement changes in _includes/nav.html];
    H --> I[Verify fix online];
    G -- No --> J[Re-evaluate and adjust plan];