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