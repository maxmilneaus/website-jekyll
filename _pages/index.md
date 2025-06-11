---
layout: page
title: Home
id: home
permalink: /
---
{% assign latest_note = site.notes | sort: "last_modified_at_timestamp" | reverse | first %}
{% if latest_note %}
  {% assign content_text = latest_note.content | strip_html | strip_newlines | truncate: 120 %}
  {% assign word_count = latest_note.content | strip_html | number_of_words %}
  {% assign reading_time = word_count | divided_by: 200 | plus: 1 %}

  <div class="latest-section">
    <a href="{{ site.baseurl }}{{ latest_note.url }}" class="latest-label internal-link">Latest</a>
    <a href="{{ site.baseurl }}{{ latest_note.url }}" class="latest-title-link internal-link">
      <h2 class="latest-title">{{ latest_note.title }}</h2>
    </a>
    <div class="latest-meta">
      <span class="latest-date">{{ latest_note.last_modified_at | date: "%B %d, %Y" }}</span>
      <span class="latest-separator">·</span>
      <span class="latest-reading-time">{{ reading_time }} minute read</span>
    </div>
    <p class="latest-preview">{{ content_text }} <a href="{{ site.baseurl }}{{ latest_note.url }}" class="read-more internal-link">Keep reading →</a></p>
    <hr>
  </div>
{% endif %}
<h2 id="topics">Topics</h2>
<div class="topics-section">
  <ul class="topics-list">
    {% assign all_tags = site.tags | sort %}
    {% for tag in all_tags %}
      {% assign tag_slug = tag | first | slugify %}
      {% assign tag_name = tag | first %}
      {% assign tag_count = tag | last | size %}
      <li class="topic-item">
        <a href="{{ site.baseurl }}/tags/{{ tag_slug }}/" class="topic-link">
          <span class="topic-name">{{ tag_name }}</span>
          <span class="topic-count">({{ tag_count }})</span>
        </a>
      </li>
    {% endfor %}
  </ul>
</div>

<h2 id="writing">Writing</h2>
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

