# Control the initial expand/collapse state  of sections, subtopics and tables

In the WebHelp Responsive output the content of the collapsible elements (subtopics, sections and tables) initially expanded by default.
The purpose of this custom publishing template is to allow authors to control the initial expanded state of these elements.

## Prerequisites

To determine several elements to be initially collapsed you have to set the value of the **@outputclass** attribute to **collapsed**. This value can be set on: 

- the root element of a nested topic (e.g.: chunked topics)
- *&lt;section>* elements
- *&lt;table>* elements

Examples:
```xml
<concept outputclass="collapsed"><!-- ... topic content --></concept>
```
```xml
<section outputclass="collapsed"><!-- ... section content --></section>
```
```xml
<table outputclass="collapsed"> <!-- ... table content --></table>
```


## Customization implementation
This template contributes a custom JavaScript file that changes the initial expanded state of sections, subtopics and tables based on an _outputclass_ value specified on these elements.

It uses an [HTML Fragment](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/wh-add-custom-html.html) that references a Javascript file. Both the HTML fragment file and the JS file are contained in the current publishing template.

The HTML Fragment:
```xml
<script defer="true" src="${path(oxygen-webhelp-template-dir)}/js/custom-collapsed-sections.js"></script>
```
The JS code:
```js
const COLLAPSED_CLS = "collapsed";
addEventListener('DOMContentLoaded', (event) => {
    const toCollapseNodes = document.querySelectorAll(`.${COLLAPSED_CLS}`);
    toCollapseNodes.forEach((toCollapse) => {
        console.log(toCollapse);
        // Wait for the default expanded state to be initialized
        setTimeout(() => {collapse(toCollapse);},50);
    });
});

const collapse = (toCollapse) => {
    const expandBtn = toCollapse.querySelector('.wh_expand_btn');
    console.log('Expand button:', expandBtn);
    if (expandBtn) {
        // Change the Expand button's state
        expandBtn.classList.remove("expanded");
        expandBtn.ariaExpanded = "false";
        expandBtn.ariaLabel = "Expand";

        // The node that remains visible when toggling between the expanded and collapsed states
        const titleNode = expandBtn.parentNode;
        
        // Hide title siblings
        Array.from(toCollapse.children)
            .filter(child => child != titleNode)
            .filter(child => !child.classList.contains('wh_not_expandable'))
            .forEach(child => {
                child.setAttribute('style', 'display:none');
            });
    }
    toCollapse.classList.remove(COLLAPSED_CLS);
};
```
## :bulb: Important:
Note that the [JS file](js/custom-collapsed-sections.js) is not directly referenced in the publishing template's [descriptor file](custom-collapsed-sections.opt). It is referenced by the [HTML frgament file](fragments/script.xml).
In order to instruct the publishing template engine to copy the JS file in the output directory, you have to specify a custom ANT-like fileset in the descriptor file that will match the path of the JS file.

```xml
<publishing-template>
  <webhelp>       
    <!--  ... -->
    <resources>
      <!--  ... -->
      
      <fileset>
        <include name="js/custom-collapsed-sections.js"/>
      </fileset>
    
    </resources>
  </webhelp>
</publishing-template>  
```


