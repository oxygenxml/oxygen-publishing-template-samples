var executed = false;
$( document ).ready(function() {
    $("#searchForm").on("submit", (e) => {
        // WebHelps triggers the submit event handler multiple times.
        if(!executed) { // We make sure that we execute it only one time.
            e.stopPropagation(); 
            var userQuery = $('#textToSearch').val();
            if (userQuery.trim() === '') {
                e.preventDefault();
                return false;
            }
            
            userQuery = userQuery + "modified"; // Modify the query according to your needs.
            $('#textToSearch').val(userQuery);
            executed = true;
        }
    });
});