---
layout: page
title: Home
id: home
permalink: /
---
### Latest

  <ul>
    {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
    {% for note in recent_notes limit: 10 %}
    <li>
      <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">
        <span class="article-date">{{ note.last_modified_at | date: "%Y %m" }}</span>
        <span class="article-separator">·</span>
        <span class="article-title">{{ note.title }}</span>
      </a>
    </li>
    {% endfor %}
  </ul>

