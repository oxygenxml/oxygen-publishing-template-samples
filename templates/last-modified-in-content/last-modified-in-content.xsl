<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:file="http://expath.org/ns/file"
    exclude-result-prefixes="xs file whc"
    version="3.0">
    
    <xsl:template match="whc:webhelp_topic_content" mode="copy_template">
        <xsl:param name="i18n_context" select="/*" tunnel="yes" as="element()"/>
        <xsl:next-match/>
        <xsl:variable name="docUri" select="$i18n_context/*/@xtrf"/>
        <div class="last-modified">
            <xsl:variable name="lastModified" select="file:last-modified($docUri[1])"/>
            <time datetime="{$lastModified}"><xsl:value-of select="$lastModified"/></time>
        </div>
    </xsl:template>
</xsl:stylesheet>