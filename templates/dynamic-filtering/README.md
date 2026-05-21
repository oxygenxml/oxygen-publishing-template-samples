# Dynamic Filtering
This is a sample Publishing Template filtering topics displayed content based on the selected audience.

![dynamic-filtering.png](dynamic-filtering.png)

It uses an [HTML fragment](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/wh-add-custom-html.html) displayed after WebHelp's top menu.

The HTML fragment ([fragments/after-menu.xml](fragments/after-menu.xml)) consists in a dropdown menu for selecting an audience, along with a JavaScript function that filters the content accordingly.

It also includes a custom CSS stylesheet ([custom.css](custom.css)) styling the inserted fragment:
```css
.audience-container {
  display: inline-block;
  vertical-align: middle;
  font-size: 0.9em;
}
```


## How to use the Customization
This template relies on the `audience` profiling attribute, so the first step is to ensure that the attribute is passed through the output:
```xml
<val>
    <prop action="passthrough" att="audience"/>
</val>
```
The same approach can be applied to any [DITA profiling attribute](https://www.oxygenxml.com/doc/ug-editor/topics/dita-profiling-conditional-text.html#dita-profiling-conditional-text__profiling_attributes).
