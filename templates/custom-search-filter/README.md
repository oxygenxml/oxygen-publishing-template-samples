# Custom Search Filter 

This is a sample publishing template that allows you to filter the search results obtained from the search engine. This sample will show in the search result page only the topics that contains the text "Flowers" in the topic title.

To integrate a custom search filter into your WebHelp Responsive output, follow these steps:

1. Create a publishing template by following the instructions in the [How to Create a Publishing Template](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html) topic.

2. Create the following items in the folder that contains your publishing descriptor file \(the .opt file\):
    - A folder named js.
    - A folder named fragments.

3. In the js folder, create a file named search-filter.js

4. As a starting point, you can copy the following content to the search-filter.js file:

    ```
    /**
     * Object that implements the methods required by WebHelp to run a search filter.
     */
    function CustomSearchFilter() {

        /**
         * Method required to run the search filter in webhelp. It is called when the users 
         * executes the query in the search page. 
         * 
         * @param {WebHelpAPI.SearchResult} searchResult The search result for the executed query.
         *
         * @return A list of WebHelpAPI.SearchResult objects
         */
        this.filterResults = function (searchResult) {
            // implement filter
            return filteredResults;
        }
    }

    // Set the Search Filter to WebHelp
    WebHelpAPI.setCustomSearchFilter(new CustomSearchFilter());
    ```
    **Note:** See the [API Search Objects](https://www.oxygenxml.com/doc/versions/25.0/ug-webhelp-responsive/topics/whr_how_to_replace_webhelp_search_engine.html#whr_how_to_replace_webhelp_search_engine__section_rsg_vn3_bvb) section for details on how to create a *WebHelpAPI.SearchResult* object.

5. Implement your custom search filter.
6. In the fragments folder, create a file named search-filter-script-fragment.xml.
7. In the search-filter-script-fragment.xml file, define the scripts that are required for your custom search filter to run. For example:

    ```
    <div>
        <script src="${oxygen-webhelp-template-dir}/js/search-filter.js"></script>
    </div>
    ```
    
 8. Copy the js folder to the output folder during the transformation process. For this, open the .opt file and add the following content in the <resources> section (see Template Resources for more details):
    ```
    <fileset>
      <include name="js/**"/>
    </fileset>
    ```
 9. Set the transformation parameters needed to enable the custom search filter. For this, open the .opt file and add the following content inside the <webhelp> element:
    ```
    <html-fragments>
      <fragment file="fragments/search-filter-script-fragment.xml" placeholder="webhelp.fragment.head.search.page"/>
    </html-fragments>
    ```
10. Run the transformation with this publishing template selected.
