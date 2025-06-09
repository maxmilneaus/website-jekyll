# Jekyll Markdown Cheat Sheet

## 🔧 FRONT MATTER
*Controls page behavior - goes at top between `---`*

```yaml
---
layout: post                    # default, post, page, home
title: "My Page Title"         
date: 2025-06-09              # YYYY-MM-DD format
categories: [web, jekyll]      # Creates URL structure
tags: [tutorial, beginner]    # For filtering only
permalink: /custom-url/        # Optional custom URL
published: false              # Draft mode
excerpt: "Preview text"       
author: "Your Name"           
image: /assets/img/photo.jpg  
---
```

**Example:**
```yaml
---
layout: post
title: "Learning Jekyll"
date: 2025-06-09
categories: [tutorials]
tags: [jekyll, beginner]
---
```

---

## 📝 MARKDOWN

### Headers
```markdown
# H1    ## H2    ### H3    #### H4    ##### H5    ###### H6
```

### Text
```markdown
**Bold**  *Italic*  ***Both***  ~~Strike~~  `code`
> Quote block
```

### Lists
```markdown
- Item one
- Item two
  - Nested (2 spaces)

1. Numbered
2. List
```

### Links & Images
```markdown
[Link text](https://example.com)
[Internal](/about/)
![Alt text](/assets/image.jpg)
![With caption](/path/image.jpg "Caption")
```

### Code Blocks
```markdown
```javascript
function hello() {
    console.log("Hello!");
}
``` 
```

---

## 🎨 LIQUID TAGS
*Dynamic content that Jekyll processes*

### Variables
```liquid
{{ page.title }}        # Page title
{{ page.date }}         # Page date  
{{ site.title }}        # Site name
{{ content }}           # Page content
```

### Filters
```liquid
{{ page.date | date: "%B %d, %Y" }}    # June 09, 2025
{{ page.title | upcase }}              # UPPERCASE
{{ site.posts | size }}                # Count posts
```

### Auto-Populating Content
```liquid
<!-- Latest post -->
{% assign latest = site.posts.first %}
{{ latest.title }}               # Most recent post title
{{ latest.url }}                 # Link to latest post
{{ latest.excerpt }}             # Post preview

<!-- All tags as links -->
{% for tag in site.tags %}
  <a href="/topics/{{ tag[0] | slugify }}">{{ tag[0] }}</a>
{% endfor %}

<!-- All posts by date -->
{% for post in site.posts %}
  {{ post.date | date: '%Y · %m' }} {{ post.title }}
{% endfor %}

<!-- Posts in category -->
{% for post in site.categories.tutorials %}
  {{ post.title }}
{% endfor %}
```

### Logic
```liquid
{% if page.image %}
  <img src="{{ page.image }}">
{% endif %}

{% for post in site.posts limit:3 %}
  <h3>{{ post.title }}</h3>
{% endfor %}
```

### Includes
```liquid
{% include header.html %}
{% include nav.html title="Menu" %}
```

---

## 📁 FILE STRUCTURE

```
_config.yml              # Site settings
_layouts/default.html    # Page templates  
_includes/header.html    # Reusable parts
_posts/2025-06-09-title.md  # Blog posts
_pages/about.md          # Static pages
assets/css/style.css     # Styling
index.md                 # Homepage
```

---

## 📄 EXAMPLES

### Blog Post
```markdown
---
layout: post
title: "My First Post"
date: 2025-06-09
---

# Hello World

This is my **first** Jekyll post!

- Easy to write
- Easy to publish
```

### Static Page  
```markdown
---
layout: page
title: "About"
permalink: /about/
---

# About Me

I build websites with *Jekyll*.
```

### Post List
```markdown
---
layout: default
---

# Latest Posts

{% for post in site.posts limit:5 %}
  <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
  <time>{{ post.date | date: "%B %d, %Y" }}</time>
{% endfor %}
```

---

## ⚡ WHEN TO USE HTML

**Stay in Markdown:** Posts, pages, basic formatting
**Use HTML:** Custom styling, forms, complex layouts

### Mix Both
```markdown
# Markdown Title

Regular **markdown** text here.

<div class="custom-box">
  <button onclick="alert('Hi!')">Click Me</button>
</div>

Back to *markdown*.
```

### File Types
- `.md` files → Content (posts, pages)
- `.html` files → Templates (_layouts, _includes)
- `.css` files → Styling (assets/css/)

---

## 🚨 TROUBLESHOOTING

| Issue | Fix |
|-------|-----|
| Page not showing | Check `---` at top/bottom of front matter |
| Wrong date | Use `YYYY-MM-DD` format exactly |
| Liquid error | Check `{{ }}` and `{% %}` syntax |
| Post not appearing | Filename: `YYYY-MM-DD-title.md` |

---

**File Naming:**
- Posts: `2025-06-09-my-post.md`
- Pages: `about.md` → `/about/`
- Drafts: `_drafts/post-name.md` (no date)

*Start with markdown, add HTML only when needed.*