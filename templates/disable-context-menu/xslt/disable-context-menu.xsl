<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*:body[contains(@class, 'wh_topic_page')]" mode="copy_template">

        <xsl:copy copy-namespaces="no">
            <xsl:attribute name="oncontextmenu">return false;</xsl:attribute>
            
            <!-- Apply the default processing -->
            <xsl:next-match/>
        </xsl:copy>
            
    </xsl:template>
    
</xsl:stylesheet>