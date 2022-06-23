# Copy Permalink

This is a sample publishing template that contributes a custom JavaScript that removes the default 'click' event for the permalink button and registers a custom 'click' event handler.

It uses a [JavaScript AMD Module](https://www.oxygenxml.com/doc/versions/24.1/ug-webhelp-responsive/topics/wh-add-js-amd.html) that adds the custom 'click' event handler.

The JavaScript code that removes the default 'click' event for the permalink button and registers a custom 'click' event handle cand be found in js/copy-permalink.js:
```
define(["jquery", "permalink"], function ($) {

    $(document).ready(function() {
        // Remove the initial permalink action for the on click event
        $("span.permalink").unbind( "click" ); 
        
        // Add the custom perlink action
        $("span.permalink").click(function (event) {
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
    
});

```


