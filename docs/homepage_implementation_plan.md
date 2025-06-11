# Detailed Plan for Implementing Steph Ango-inspired Homepage

**Goal:** Replicate the "Latest Section", "Topics", and "Writing" structure on the homepage (`_pages/index.md`), ensuring proper styling and functionality.

**Current Status:**
*   The CSS for the "Latest Section" is already in `_sass/_style.scss`.
*   The Jekyll logic for the "Latest Section" (single note) and "Writing" (recent notes) is already in `_pages/index.md`.

**Steps:**

1.  **Verify and Refine `_pages/index.md` Structure:**
    *   Ensure the "Latest Section" is at the top.
    *   Insert the new "Topics" section after the "Latest Section".
    *   Ensure the "Writing" section follows the "Topics" section.

2.  **Implement "Topics" Section in `_pages/index.md`:**
    *   This section will display a list of unique tags from all notes.
    *   I will iterate through `site.tags` (Jekyll automatically collects tags from front matter) and display them as links.
    *   Each tag link will point to a page listing all notes with that tag. (This assumes you have a mechanism for generating tag pages, either via a plugin or manual setup. If not, the links will lead to 404s, which can be addressed in a separate task.)

3.  **Add CSS for "Topics" Section to `_sass/_style.scss`:**
    *   Define styles for the "Topics" heading and the list of tags to match the overall aesthetic, similar to the existing "Writing" section's list styling.

**Mermaid Diagram:**

```mermaid
graph TD
    A[User Request: Implement Steph Ango Homepage] --> B{Analyze Existing Files};
    B --> C1[_pages/index.md: Latest & Writing sections exist];
    B --> C2[_sass/_style.scss: Latest section CSS exists];
    B --> C3[_config.yml: Notes & Projects collections defined];
    C1 & C2 & C3 --> D[Formulate Plan];
    D --> E[Step 1: Refine _pages/index.md Structure];
    E --> F[Step 2: Implement "Topics" Section in _pages/index.md];
    F --> G[Step 3: Add CSS for "Topics" to _sass/_style.scss];
    G --> H[Review Plan with User];
    H -- Approved --> I[Write Plan to Markdown (Optional)];
    I --> J[Switch to Code Mode for Implementation];