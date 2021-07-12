<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:oxyf="http://www.oxygenxml.com/functions"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Topic page title -->
    <xsl:template match="/*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]"
        mode="text-only">
        <!-- Apply the default processing -->
        <xsl:next-match/> -
        <xsl:call-template name="formatted-date-time"/>
    </xsl:template>
    
    <xsl:template name="formatted-date-time">
        <xsl:value-of select="format-date(current-date(), '[M01]/[D01]/[Y01]')"/>
    </xsl:template>
</xsl:stylesheet>
