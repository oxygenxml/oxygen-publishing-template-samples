# Change query before the search engine is executed

This is a sample publishing template that allows you to modify the search query before the search engine executes it.

In this example the string "modified" is added at the end of the search query entered by the user. 

## How to use the Customization

To use this customization in your custom Publishing Template you must perform the following steps:

1. Copy both *fragments/js.html* and *js/custom.js* files in your template's base directory
1. Reference the HTML file in the *&lt;html-fragments>* section of your template's descriptor file (*opt*):
    ```xml
    <html-fragments>
        <fragment file="fragments/js.html" placeholder="webhelp.fragment.after.body"/>
    </html-fragments>
    ```
1. Instruct the Publishing Template engine to copy the JS resources in the output directory by adding the following *fileset* in the *&lt;resources>* section of your PT's descriptor file:
    ```xml
    <fileset>
        <include name="js/**"/>
    </fileset>
    ```
1. To modify the functionality you can edit the *custom.js* file content

**Note:** If you haven't created a Publishing Template yet, you can create one by following the procedure described in [this topic](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html).
