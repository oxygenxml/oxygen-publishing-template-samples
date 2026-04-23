# Insert Map ID in HTML `<body>`

This is a sample Publishing Template that extratcs the root map ID attribute and inserts it as a `div` in the output HTML `body` element.

## The HTML Fragment
The template inserts a custom [HTML fragment](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/wh-add-custom-html.html) at the begining of the HTML `body` element. The HTML fragment uses the `map-xpath` [WebHelp Responsive Macro](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#id_svt_4c1_c2b__macro_map-xpath) in order to query the root map for its ID.

The [HTML Fragment file](customization/fragments/topic-meta.xml):
```xml
<div id="${map-xpath(/*/@id)}"/>
```

The HTML fragment is bound on the `webhelp.fragment.before.body` placeholder (see the [`*.opt`](topic-meta-in-body.opt) file):
```xml
<html-fragments>
    <fragment placeholder="webhelp.fragment.before.body" file="customization/fragments/map-id.xml"/>
</html-fragments>
```

The HTML resulted in output:
```xml
<html>
    ....
    <body>
        <div id="green"></div>
        ....
    <body>
<html>
```

## The custom CSS: 

The template uses a custom CSS to define colors sets based on the div ID.

```css
@media screen {
  #green ~ * {
    --wh-search-input-bg: #008000;
    --wh-shortdesc-color: #008000;
  }
}

@media screen {
  #blue ~ * {
    --wh-search-input-bg: #0000ff;
    --wh-shortdesc-color: #0000ff;
  }
}
```


