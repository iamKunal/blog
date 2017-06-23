---
title: "All Posts"
layout: archive
permalink: /posts/
---
<h3 class="archive__subtitle"></h3>

{% for post in site.posts %}
  {% include archive-single.html %}
{% endfor %}

{% include paginator.html %}
