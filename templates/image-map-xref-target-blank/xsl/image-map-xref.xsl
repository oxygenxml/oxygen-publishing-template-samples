<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <xsl:template match="*[contains(@class, ' topic/xref ')]" mode="imagemap-xref">
        <xsl:next-match/>
        <xsl:attribute name="target">_blank</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>