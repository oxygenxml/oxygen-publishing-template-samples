<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="whc:webhelp_search_input" mode="copy_template">
        <xsl:variable name="searchComponent">
            <xsl:next-match/>
        </xsl:variable>
        <xsl:apply-templates select="$searchComponent" mode="copy_search"/>
    </xsl:template>
    
    <!-- Templates used to post process the content of the search component -->
    <xsl:template match="*[@id='searchForm']/*:div" mode="copy_search">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="copy_search"/>
            <xsl:call-template name="generateLogoComponent"/>
            <span class="input_container">
                <xsl:apply-templates select="node()" mode="copy_search"/>
            </span>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="copy_search">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="copy_search"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template used to regenerate the overidden Logo component  -->
    <xsl:template name="generateLogoComponent">
        <xsl:variable name="artificialLogo">
            <whc:webhelp_logo class="d-none d-sm-block"/>
        </xsl:variable>
        <span class="logo_container">
            <xsl:apply-templates select="$artificialLogo/*"  mode="copy_template"/>
        </span>
    </xsl:template>
    
    <!-- Replace the default Logo component -->
    <xsl:template match="*:header//whc:webhelp_logo" mode="copy_template"/>
</xsl:stylesheet>