# Dynamic Logo Template
This template adds a dynamic logo based on main ditamap meta information.

The logo path must be relative to the main ditamap:
```
<map>
    <title>Map</title>
    <topicmeta>
        <data><image outputclass="header-img" href="images/oxygen190x62_dark.png"/></data>
    </topicmeta>
    ...
</map>
```

The XML fragment uses the path macro to relativize the image to the current topic:
```
<div xmlns:whc="http://www.oxygenxml.com/webhelp/components" class="header-container">
  <div class="header">
    <div class="header-logo custom-logo">
      <a href="index.html">
        <img src="${path(oxygen-webhelp-output-dir)}/${map-xpath(/map/topicmeta/data/image[@outputclass='header-img']/@href)}"/>
      </a>
    </div>
  </div>
</div>

```
