---
layout: page
title: Home
id: home
permalink: /
---
### Latest

<div class="latest-posts">
<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 5 %}
    <li>
      <time>{{ note.last_modified_at | date: "%Y-%m" }}</time>
      <span>— <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a></span>
    </li>
  {% endfor %}
</ul>
</div>

<style>
  /* Latest posts - clean typography and spacing */
  .latest-posts {
    margin: var(--space-lg) 0 var(--space-xl) 0;
  }
  
  .latest-posts ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .latest-posts li {
    display: flex;
    gap: var(--space-lg);
    align-items: baseline;
    margin: 0 0 var(--space-md) 0;
    padding: var(--space-xs) 0;
  }
  
  .latest-posts time {
    flex-shrink: 0;
    min-width: 3.5rem;
    font-variant-numeric: tabular-nums;
    color: var(--color-warm-gray);
    font-size: 0.85rem;
    font-weight: var(--font-weight-medium);
    letter-spacing: 0.02em;
    display: inline;
    margin: 0;
  }
  
  .latest-posts span {
    color: var(--color-cream);
  }
</style>


