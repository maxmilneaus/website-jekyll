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
      <time>{{ note.last_modified_at | date: "%Y-%m-%d" }}</time>
      <span>— <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a></span>
    </li>
  {% endfor %}
</ul>
</div>

<style>
  .wrapper {
    max-width: 46em;
  }
  
  /* Latest posts alignment */
  .latest-posts ul {
    list-style: none;
    padding: 0;
  }
  
  .latest-posts li {
    display: flex;
    gap: var(--space-md);
    align-items: baseline;
    margin: var(--space-sm) 0;
  }
  
  .latest-posts time {
    flex-shrink: 0;
    min-width: 6rem;
    font-variant-numeric: tabular-nums;
    color: var(--color-warm-gray);
    font-size: 0.9rem;
    display: inline;
    margin: 0;
  }
</style>


