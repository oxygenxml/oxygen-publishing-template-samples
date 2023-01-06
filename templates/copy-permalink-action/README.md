# Copy Permalink

This is a sample publishing template that contributes a custom JavaScript that registers a custom 'click' event handler on the *permalink* button.

It uses an [HTML Fragment](https://www.oxygenxml.com/doc/versions/25.0/ug-webhelp-responsive/topics/wh-add-custom-html.html) that references:
1. the custom Javascript file (*js/copy-permalink.js*).
1. JQuery from a remote CDN

The HTML Fragment:
```
<html>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script type="text/javascript" defer="defer" src=" ${oxygen-webhelp-template-dir}/js/copy-permalink.js"/>
</html>
</script>
```

**Note:** The custom JS file is referenced using the `${oxygen-webhelp-template-dir}` macro because its path must to be relative to the templates directory from the output directory.


The JavaScript code that registers a custom 'click' event handle cand be found in js/copy-permalink.js:
```
$(document).ready(function () {
    
    // Add the custom perlink action
    $(document).on("click","span.permalink", function (event) {
        // Retrieve the section id for which the permalink button was clicked.
        var id = $(this).closest('[id]').attr('id');
        
        // Add the section id to the browser URL
        var hash = '#' + id;
        history.replaceState({}, '', hash);
        
        // Copy the URL to the clipboard.
        navigator.clipboard.writeText(window.location.href);
        
        // Display a message on the screen to inform the user that the action was successfull 
        $(this).parent().append("<div id=\"copy-to-clipboard-message\" style=\"display: inline-block; font-size: 14px; font-weight: normal; font-style: italic;\">Copied to clipboard</div>")
        
        // Make the message dissapear after 2 seconds.
        setTimeout(function () {
            $("#copy-to-clipboard-message").remove();
        }, 2000);
   });
});

```

## How to use the Customization

To use this customization in your custom Publishing Template you must perform the following steps:

1. Copy the *html-fragments/insert-js.xml* file in your template's base directory
1. Reference the XML file in the *&lt;html-fragments>* section of your template's descriptor file (*opt*):
    ```
    <html-fragments>
        <fragment file="html-fragments/insert-js.xml" placeholder="webhelp.fragment.head.topic.page"/>
    </html-fragments>
    ```
1. Instruct the Publishing Template engine to copy the JS resources in the output directory by adding the following *fileset* in the *&lt;resources>* section of your PT's descriptor file:
    ```
    <fileset>
        <include name="js/**"/>
    </fileset>
    ```


**Note:** If you haven't created a Publishing Template yet, you can create one by following the procedure described in [this topic](https://www.oxygenxml.com/doc/versions/25.0/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html).


