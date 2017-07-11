---
title: "All Posts"
layout: archive
permalink: /posts/
---

Here you can see all the blog posts I've added so far in reverse chronological order.
<h3 class="archive__subtitle"></h3>

{% for post in site.posts %}
{% assign wordCount = post.content | number_of_words %}
<!--  {{ wordCount }} words -->
  {% include archive-single.html %}
{% endfor %}

{% include paginator.html %}
