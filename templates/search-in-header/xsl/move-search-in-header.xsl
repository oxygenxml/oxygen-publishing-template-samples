<?xml version="1.0" encoding="UTF-8"?>
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