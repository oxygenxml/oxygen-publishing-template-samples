# How to create a WebHelp custom component

This topic demonstrates how to use several customization methods of the WebHelp output to define and implement a custom component for the generated HTML pages.

## Predefined components

The WebHelp output is based on a set of [HTML Page Layout Files](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#ariaid-title8) which define the default layout of the generated pages. Each layout file is made of a set of various components. Each component is described using an associated XML element that is processed at the generation time resulting in its associated component being included in the output HTML pages.

Here are a few examples of predefined components: **Logo**, **Title**, **Menu**, **Search Input**, **Topics Tiles**, **Topic Breadcrumb**, **Topic Content**, **Publication Table of Contents**, etc. A complete list with all the available components is available here: [Layout of the Responsive Page Types](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr-html5-pages.html).

For example the page component that is used to define the Search Input available in the WebHelp HTML pages is defined as follows:

```xml
<!-- Search form -->
<whc:webhelp_search_input class="navbar-form wh_topic_page_search search" role="form"/>
```

At publishing time the above component will be expanded into:

```xml
<div class=" wh_search_input navbar-form wh_topic_page_search search">
    <form id="searchForm" method="get" role="search" action="../search.html">
        <div>
            <input type="search" placeholder="Search "
                class="wh_search_textfield ui-autocomplete-input" id="textToSearch"
                name="searchQuery" aria-label="Search query" required="required" autocomplete="off"/>
            <button type="submit" class="wh_search_button" aria-label="Search">
                <span class="search_input_text">Search</span>
            </button>
        </div>
    </form>
</div>
```

## Customization methods

The most common customization methods of the WebHelp Responsive output include:

-   applying [custom CSS styles](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/webhelp-customizing-with-css.html) to change the default layout and styles
-   [inserting additional HTML content](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/wh-add-custom-html.html) using one of the available [HTML Fragments Extension Points](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#ariaid-title6)
-   extending the default processing using [XSLT Extension Points](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#ariaid-title5)
-   configuring the available [Transformation Parameters](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/webhelp-responsive-plugin-additional-parameters.html)

## Use case

Let's consider the following use case: you have a DITA project for the User Manual of one of your products. It contains various topics describing the product's features. You also have various video demonstrations available on your website. You may want to link a video demonstration for certain feature with its associated DITA topic in the User Manual.

You could simply add a link somewhere in your DITA topic's content \(topic's body \), but this approach would not be very suitable for the printable version \(PDF for example\) of your User Manual. Thus you need to include the link to the associated video demonstration only in the WebHelp output of your User Manual.

One way to link a video with its associated topic is to include its URL in the topic's metadata section. For example:

```xml
<prolog>
    <metadata>
        <othermeta name="video-link" content="https://www.youtube.com/watch?v=zNmXfKWXwO8"/>
    </metadata>
</prolog>
```

Next, you need to instruct WebHelp to pick up the URL from the topic's metadata and generate a link in a specific location of the HTML output page. You can achieve this by creating your own WebHelp custom component.

## Custom component

You can combine several of the available customization methods to define and implement your own WebHelp custom component.

![Custom component](custom-component.png "Custom component")

To create a custom component that displays a link to the current topic's associated video tutorial follow these steps:

1.  Define your component. For example it may have the following form:

    ```xml
    <comp:video-link xmlns:comp="http://example.com/custom-components"/>
    ```

    As you can see, the component is an XML element belonging to a custom define namespace.

2.  Next you have to insert the component in your topic pages. To do this you will have to save the associated XML element in an HTML Fragment file \(let's consider that the file is named video-link-fragment.xml\).
3.  Next you have to reference the HTML Fragment file in you current Publishing Template's [descriptor file](https://www.oxygenxml.com/doc/versions/23.0/ug-webhelp-responsive/topics/whr_publishing_template_contents.html#ariaid-title2) and associate it with an HTML Fragment placeholder that is available for the topic pages \(`webhelp.fragment.before.topic.toolbar` in this case\):

    ```xml
    <html-fragments>
        <fragment file="component/html-fragment/video-link-fragment.xml" placeholder="webhelp.fragment.before.topic.toolbar"/>
    </html-fragments>
    ```

    **Note:** The HTML Fragment file is referenced using a path relative to the Publishing Template's root directory.

4.  Create a custom XSLT file that processes you component and picks up the video URL available in the current topic's metadata and generate a link to the page containing the video:

    ```xml
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:comp="http://example.com/custom-components"
        exclude-result-prefixes="xs comp"
        version="3.0">
        
        <!-- Custom component implementation -->
        <xsl:template match="comp:video-link" mode="copy_template">
            <xsl:param name="ditaot_topicContent" tunnel="yes"/>
            <!-- Look for a 'video-link' <meta> element in the current topic content -->
            <xsl:variable name="videoLinkMeta"  select="$ditaot_topicContent//*:meta[@name='video-link']"/>
            <xsl:if test="exists($videoLinkMeta)">
                <div class="video-link-container">
                    <a href="{$videoLinkMeta[1]/@content}"
                       class="video-link" target="_blank" aria-label="Video">
                        <span>Video</span>
                    </a>
                </div>
            </xsl:if>
        </xsl:template>
        
    </xsl:stylesheet>
    ```

    The HTML content generated for your component will look as follows:

    ```xml
    <div class="video-link-container">
        <a href="https://www.youtube.com/watch?v=zNmXfKWXwO8" class="video-link" target="_blank"
            aria-label="Video">
            <span>Video</span>
        </a>
    </div>
    ```

5.  Reference the above XSL file in your Publishing Template's descriptor file using the XSLT extension point associated with the XSL module that generates the HTML file for each DITA topic:

    ```xml
    <xslt>
        <extension file="component/xsl/video-link-impl.xsl" id="com.oxygenxml.webhelp.xsl.dita2webhelp"/>
    </xslt>
    ```

6.  Create a custom CSS file containing the rules for styling the output for your component:

    ```css
    @import url('https://fonts.googleapis.com/icon?family=Material+Icons');
    
    .video-link-container {
        display: flex;
        align-items: center;
        flex-grow: 10;
        justify-content: flex-end;
    }
    
    .video-link {
        display: flex;
        align-items: center;
        color: #fff !important;
    }
    
    .video-link:before {
        content: "smart_display";
        font-family: 'Material Icons';
        font-size: 20px;
        display: inline-block;
        word-wrap: normal;
        white-space: nowrap;
    }
    
    .video-link span {
        display: none;
    }
    
    .wh_right_tools {
        padding: 0;
    }
    ```

7.  Reference the above CSS file in your Publishing Template's descriptor file:

    ```xml
    <resources>
        <css file="ashes.css"/>
        <css file="notes.css"/>
        <css file="component/css/video-link.css"/>
    </resources>
    ```

8.  The output will look like in the following image:

    ![Output](output.png "Output")

