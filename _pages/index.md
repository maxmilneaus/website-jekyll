---
layout: default
title: "Your Name"
permalink: /
---

<nav class="site-nav">
  <span class="site-title">
    <a href="/">Your Name</a>
  </span>
  <span class="nav-links">
    <a href="/about">About</a>
    <a href="/now">Now</a>
  </span>
</nav>

<main>
  <div class="content-wrap">

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

  </div>
</main>

<footer>
  <div class="footer-content">
    <p><a href="/subscribe" class="footer-link">Receive my updates</a></p>
    <p>Follow me via email, <a href="/feed.xml">RSS</a>, <a href="https://twitter.com/yourusername" target="_blank">Twitter</a>, and <a href="/subscribe">other options</a></p>
    
    <!-- Email signup form -->
    <div class="email-signup">
      <form action="https://your-email-service.com/subscribe" method="post" class="signup-form">
        <input type="email" name="email" placeholder="Enter your email" required>
        <input type="submit" value="Sign up">
      </form>
    </div>
  </div>
</footer>

<style>
/* Basic styling to match Steph Ango's design */
.site-nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
  font-family: system-ui, -apple-system, sans-serif;
}

.site-title a {
  text-decoration: none;
  font-weight: 600;
  color: inherit;
}

.nav-links a {
  text-decoration: none;
  color: #666;
  margin-left: 1rem;
}

.nav-links a:hover {
  color: inherit;
}

.content-wrap {
  max-width: 650px;
  margin: 0 auto;
}

.section-label {
  color: #666;
  text-decoration: none;
  font-family: system-ui, -apple-system, sans-serif;
  font-size: 0.9rem;
}

.latest-post {
  margin: 1rem 0;
}

.post-link {
  text-decoration: none;
  color: inherit;
  display: block;
}

.post-link h2 {
  margin: 0.5rem 0;
  font-size: 1.5rem;
  font-weight: 600;
}

.post-meta {
  color: #666;
  font-size: 0.85rem;
  margin-bottom: 0.5rem;
  font-family: system-ui, -apple-system, sans-serif;
}

.post-excerpt {
  color: #666;
  font-size: 0.9rem;
  line-height: 1.4;
}

.section-divider {
  border: none;
  border-top: 1px solid #e1e1e1;
  margin: 2rem 0;
}

.topics-list {
  line-height: 1.6;
  margin: 1rem 0;
}

.topic-link {
  text-decoration: none;
  color: inherit;
}

.topic-link:hover {
  text-decoration: underline;
}

.separator {
  color: #666;
}

.writing-list {
  list-style: none;
  padding: 0;
  font-family: 'SF Mono', Monaco, monospace;
}

.writing-list li {
  margin: 0.3rem 0;
}

.writing-item {
  text-decoration: none;
  color: inherit;
  display: flex;
  align-items: baseline;
}

.post-date {
  color: #666;
  font-size: 0.85rem;
  min-width: 80px;
  margin-right: 1rem;
  flex-shrink: 0;
}

.post-title {
  text-decoration: underline;
  text-decoration-thickness: 1px;
  text-underline-offset: 2px;
}

.writing-item:hover .post-title {
  text-decoration: none;
}

.footer-content {
  border-top: 1px solid #e1e1e1;
  padding-top: 2rem;
  margin-top: 3rem;
  font-family: system-ui, -apple-system, sans-serif;
  font-size: 0.9rem;
}

.footer-link {
  color: #666;
  text-decoration: none;
}

.email-signup {
  margin-top: 1rem;
}

.signup-form {
  display: flex;
  gap: 0.5rem;
}

.signup-form input[type="email"] {
  flex: 1;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.signup-form input[type="submit"] {
  padding: 0.5rem 1rem;
  background: #000;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>