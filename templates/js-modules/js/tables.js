define(["jquery", "localization", "./datatables/datatables.min"], function ($, i18n) {
    $(document).ready(function () {
        
        console.log("i18n: ", i18n.getLocalization('webhelp.search'));
        
        $('.table').DataTable();
    });
});
