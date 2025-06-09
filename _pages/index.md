---
layout: default
title: "Home"
permalink: /
---

<!-- LATEST POST SECTION -->
{% assign latest_post = site.posts.first %}
{% if latest_post %}
<p><a href="{{ latest_post.url }}" class="section-label">Latest</a></p>

<div class="latest-post">
  <a href="{{ latest_post.url }}" class="post-link">
    <h2>{{ latest_post.title }}</h2>
    <div class="post-meta">
      <time datetime="{{ latest_post.date | date: '%Y-%m-%d' }}">{{ latest_post.date | date: '%B %-d, %Y' }}</time>
      {% if latest_post.reading_time %}
      · <span class="reading-time">{{ latest_post.reading_time }} minute read</span>
      {% endif %}
    </div>
    <div class="post-excerpt">
      {% if latest_post.excerpt %}
        {{ latest_post.excerpt | strip_html | truncatewords: 20 }}
      {% else %}
        {{ latest_post.content | strip_html | truncatewords: 20 }}
      {% endif %}
      Keep reading →
    </div>
  </a>
</div>
{% endif %}

<hr class="section-divider">

<!-- TOPICS SECTION (Auto-generated from tags) -->
<p><a href="/topics" class="section-label">Topics</a></p>

<div class="topics-list">
  {% assign sorted_tags = site.tags | sort %}
  {% for tag in sorted_tags %}
    {% assign tag_name = tag[0] %}
    {% assign tag_posts = tag[1] %}
    <a href="/topics/{{ tag_name | slugify }}" class="topic-link">{{ tag_name }}</a>{% unless forloop.last %}<span class="separator">,</span> {% endunless %}
  {% endfor %}
</div>

<hr class="section-divider">

<!-- WRITING SECTION (All posts chronologically) -->
<p class="section-label">Writing</p>

<ul class="writing-list">
  {% for post in site.posts %}
  <li>
    <a href="{{ post.url }}" class="writing-item">
      <span class="post-date">{{ post.date | date: '%Y · %m' }}</span>
      <span class="post-title">{{ post.title }}</span>
    </a>
  </li>
  {% endfor %}
</ul>