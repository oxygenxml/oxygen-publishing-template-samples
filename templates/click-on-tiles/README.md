# Click on Tiles

This is a sample publishing template that contributes custom JavaScript that registers a 'click' event handler on each tile that opens the associated link.

It uses an [HTML Fragment](https://www.oxygenxml.com/doc/versions/22.1/ug-webhelp-responsive/topics/wh-add-custom-html.html) that contains the custom Javascript snippet.

The HTML Fragment:
```
<script type="text/javascript">
 <!-- 
    const list = document.querySelectorAll('.wh_tile');
    Array.prototype.forEach.call(list, function (tile) {
        tile.addEventListener('click', event => {
            tile.querySelector('a').click();
        });
    });
 -->
</script>

```

The Publishing Template also uses a custom CSS file (`tiles.css`) to set a pointer cursor style for each tile:
```
.wh_tile {
  cursor: pointer;
}
```

## How to use the Cutsomization

To use this customization in your custom Publishing Template you must perform the following steps:

1. Copy the *html-fragments/click-on-tiles.xml* file in your template's base directory
1. Reference the XML file in the *&lt;html-fragments>* section of your template's descriptor file (*opt*):
    ```
    <html-fragments>
           <fragment placeholder="webhelp.fragment.after.toc_or_tiles" file="html-fragments/click-on-tiles.xml"/>
        </html-fragments>
    ```
1. Optionally, you may copy the *tiles.css* file and reference it in the *&lt;css>* section of your *opt* file. Alternatively you can copy the CSS rules from *tiles.css* into your template's CSS file.

**Note:** If you haven't created a Publishing Template yet, you can create one by following the procedure described in[this topic](https://www.oxygenxml.com/doc/versions/25.0/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html).


