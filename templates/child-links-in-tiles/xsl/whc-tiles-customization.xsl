<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
    >
    <xsl:template match="toc:topic" mode="create-tiles">
        <xsl:param name="tileTemplate"/>
        <div class="tile-container">
            <xsl:next-match>
                <xsl:with-param name="tileTemplate" select="$tileTemplate"/>
            </xsl:next-match>
            <xsl:apply-templates select="toc:topic" mode="#current">
                <xsl:with-param name="tileTemplate" select="$tileTemplate"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>
    
</xsl:stylesheet>