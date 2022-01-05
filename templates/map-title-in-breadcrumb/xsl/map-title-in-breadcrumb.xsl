<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math whc"
    version="3.0">
    
    
    <xsl:variable name="titleFragment">
        <span class="map-title">
            <a href="${{path(oxygen-webhelp-output-dir)}}/index.html"><whc:macro value="${{map-xpath(/map/title)}}"/></a>
        </span>
    </xsl:variable>
    
    <xsl:template match="whc:webhelp_breadcrumb" mode="copy_template">
        <div class="breadcrumb-container">
            <xsl:apply-templates select="$titleFragment/*" mode="copy_template"/>
            <xsl:next-match/>
        </div>
    </xsl:template>
</xsl:stylesheet>