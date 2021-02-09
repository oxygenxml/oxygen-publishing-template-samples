# Custom search engine 

This is a sample publishing template that overrides WebHelp's search engine and search results area.

To integrate a custom search engine into your WebHelp Responsive output, follow these steps:

1. Create a publishing template by following the instructions in the [How to Create a Publishing Template](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html) topic.

2. Create the following items in the folder that contains your publishing descriptor file \(the .opt file\):

    - A file named **custom-search-results-fragment.xml**.
    - A file named **custom-search-script-fragment.xml**.
    - A folder named **js**.
3. In the **custom-search-results-fragment.xml** file, define the HTML structure that will be used as the search results area. For example:

    ```
    <div id="cumstom-search-results">...</div>
    ```

    **Note:** The custom search engine script will need to find an HTML element from the HTML structure that will be used as the search results area and write the search results inside it. In this example, it is the <div> element with the id *custom-search-results*.

4. In the **js** folder, create a file named **custom-search.js**.

5. As a starting point, you can copy the following content to the **custom-search.js** file:

    ```
    $(document).ready(function () {
      const params = new URLSearchParams(window.location.search);
      const searchQuery = params.get('searchQuery');
      // Implement your custom search engine
      // Display the search results
    });
    ```

    **Important:** The value entered by the user in the search page will be available in the URL's query parameters in a parameter named *searchQuery*.

    **Attention:** *URLSearchParams* is not supported on all browsers \(it is used as an example\). A list with the supported browsers can be found [here](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams#browser_compatibility). A different solution should be used if you need to support other browsers.

6. Implement your custom search engine.

    **Note:** The search results should be pushed into the <div> element created earlier with the id *custom-search-results*.

7. In the **custom-search-script-fragment.xml** file, define the scripts that are required for your custom search engine to run. For example:

    ```
    <div>
        <script src="${oxygen-webhelp-template-dir}/js/custom-search.js"></script>
    </div>
    ```

8. Copy the **js** folder to the output folder during the transformation process. For this, open the .opt file and add the following content in the `resources` section \(see [Template Resources](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#ariaid-title3)for more details\):

    ```
    <fileset>
      <include name="js/**"/>
    </fileset>
    ```

9. Set the transformation parameters needed to enable the custom search engine. For this, open the .opt file and add the following content inside the `webhelp` element:

    ```
    <html-fragments>
      <fragment file="custom-search-script-fragment.xml" placeholder="webhelp.fragment.custom.search.engine.script"/>
      <fragment file="custom-search-results-fragment.xml" placeholder="webhelp.fragment.custom.search.engine.results"/>
    </html-fragments>
    ```

10. Run the transformation with this publishing template selected.
