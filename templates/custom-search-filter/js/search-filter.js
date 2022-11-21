function CustomSearchFilter() {

    this.filterResults = function (searchResult) {
        var filteredResult = searchResult.filter(el => el.title.includes("Flowers"));
        return filteredResult;
    }
}

WebHelpAPI.setCustomSearchFilter(new CustomSearchFilter());
