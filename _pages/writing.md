---
layout: page
title: Writing
id: writing
permalink: /writing
---

<div class="writing-section">
  <ul>
    {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
    {% for note in recent_notes %}
    <li>
      <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">
        <span class="article-date">{{ note.last_modified_at | date: "%Y %m" }}</span>
        <span class="article-separator">·</span>
        <span class="article-title">{{ note.title }}</span>
      </a>
    </li>
    {% endfor %}
  </ul>
</div>