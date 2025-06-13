---
layout: page
title: Topics
id: topics
permalink: /topics
---

{% comment %}
Build tags collection manually from notes collection
{% endcomment %}
{% assign all_tags_array = "" | split: "" %}
{% for note in site.notes %}
  {% if note.tags %}
    {% for tag in note.tags %}
      {% assign all_tags_array = all_tags_array | push: tag %}
    {% endfor %}
  {% endif %}
{% endfor %}

{% assign unique_tags = all_tags_array | sort | uniq %}

<div class="topics-section">
  <ul class="topics-list">
    {% for tag in unique_tags %}
      {% assign tag_count = 0 %}
      {% for note in site.notes %}
        {% if note.tags contains tag %}
          {% assign tag_count = tag_count | plus: 1 %}
        {% endif %}
      {% endfor %}
      {% assign tag_slug = tag | slugify %}
      <li class="topic-item">
        <a href="{{ site.baseurl }}/tags/{{ tag_slug }}/" class="topic-link">
          <span class="topic-name">{{ tag }}</span>
        </a>
      </li>
    {% endfor %}
  </ul>
</div>