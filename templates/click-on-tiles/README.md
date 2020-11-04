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


