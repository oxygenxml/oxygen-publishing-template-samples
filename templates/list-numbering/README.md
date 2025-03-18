# Custom List Numbering

This is a sample publishing template that allows ordered lists to start at a given index.

## How to use the Customization

To use this customization in your Publishing Template you must perform the following steps:

1. Create a list with `outputclass="start-X"` (where X is the index start number):
    ```xml
    <ol outputclass="start-5">
        <li>Starts at 5</li>
        <li>Sixth item</li>
        <li>Seventh item</li>
    </ol>
    ```
1. Copy the *list-numbering.css* file and reference it in the *&lt;css>* section of your *opt* file. Alternatively you can copy the CSS rules from *list-numbering.css* into your template's CSS file.

    The customization is made for X=3, 4 and 5 but the same rule can be applied for any other number. 

**Note:** If you haven't created a Publishing Template yet, you can create one by following the procedure described in [this topic](https://www.oxygenxml.com/doc/ug-webhelp-responsive/topics/whr-create-publishing-template-x.html).
