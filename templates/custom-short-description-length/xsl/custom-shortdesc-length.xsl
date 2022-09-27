<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:variable name="shortdescCharLength" select="500"/>
    
    <!-- 
        Compute a description from the text body. 
    -->
    <xsl:template name="getContentForShortdesc">
        <xsl:variable name="text" select="normalize-space(string-join(//*:div[contains(@class, 'body')]//text(), ' '))"/>
        <xsl:variable name="textStart">
            <xsl:choose>
                <xsl:when test="string-length($text) &lt; $shortdescCharLength">
                    <xsl:value-of select="$text"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="description" select="string-join(tokenize(substring($text, 1, $shortdescCharLength + 1), ' ')[position() &lt; last()], ' ')"/>
                    <xsl:value-of select="concat($description, ' ...')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="translate($textStart, '&#xA;&#xD;&#x9;', '')"/>
    </xsl:template>
    
</xsl:stylesheet>