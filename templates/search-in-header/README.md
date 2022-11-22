# Search Input in Page Header

This is a sample publishing template that moves the *Search Input* component from its default location to the header section of each output page.

![Output Sample](search-in-header.png)

It uses an 
[XSLT Extension](https://www.oxygenxml.com/doc/versions/23.1/ug-webhelp-responsive/topics/whr-responsive-override-xslt-dita-xslt-import.html) File to move the *Search Input* component to the header serction.

The XSLT extension removes the *Search Input* component from the default location and inserts it after the *Menu* component in the page header. 

The XSLT extension:
```xml
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    exclude-result-prefixes="xs whc"
    version="2.0">
    
    <!-- 
        The header section is not contained it the main HTML Layout file.
        It is contained in header.xml which is included as an HTML Fragment file.  
    --> 
    <xsl:template match="whc:include_html[@href]" mode="copy_template">
        <xsl:param name="templatePageRootElem" as="element()" select="/*" tunnel="yes"></xsl:param>
        <xsl:next-match>
            <xsl:with-param name="templatePageRootElem" select="$templatePageRootElem" tunnel="yes"/>
        </xsl:next-match>
    </xsl:template>
    
    <xsl:template match="whc:webhelp_search_input" mode="copy_template">
        <!-- Flag used to control the location where the search component is emitted. -->
        <!-- The search component is omitted by default -->
        <xsl:param name="outputComponent" as="xs:boolean" select="false()" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$outputComponent">
                <!-- Apply default processing. -->
                <xsl:next-match/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Copy the WebHelp Welcome Fragment in its original location -->
                <xsl:apply-templates select="*[contains(@class, 'wh_welcome')]" mode="copy_template">
                    <xsl:with-param name="skip" select="false()"></xsl:with-param>
                </xsl:apply-templates>                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, 'wh_header_flex_container')]" mode="copy_template">
        <!-- The root element of the HTML Layout page (ie: wt_index.html, wt_topic, etc. ). -->
        <xsl:param name="templatePageRootElem" as="element()" select="/*" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates mode="copy_template" select="@*"/>
            <xsl:apply-templates mode="copy_template" select="node()"/>
            <xsl:apply-templates select="$templatePageRootElem//whc:webhelp_search_input" mode="copy_template">
                <xsl:with-param name="outputComponent" as="xs:boolean" select="true()" tunnel="yes"/>
            </xsl:apply-templates>
        </xsl:copy>  
    </xsl:template>
    
    <xsl:template match="*[contains(@class, 'wh_welcome')]" mode="copy_template">
        <!-- Flag used to avoid copying the WebHelp Welcome Fragment in the header section -->
        <xsl:param name="skip" select="true()"/>
        <xsl:if test="not($skip)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
```

The Publishing Template also uses a custom CSS file (`search-in-header.css`) to adjust the layout the *Search Input* component and make it fit into the header section:
```css

#searchForm > div {
  width: 100%;
}

.wh_top_menu_and_indexterms_link {
    flex-grow: .9;
}

.wh_search_textfield {
    height: 2em;
}

.wh_search_button {
    height: 2em;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0;
}
```


