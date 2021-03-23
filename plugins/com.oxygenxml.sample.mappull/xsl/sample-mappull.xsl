<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mappull="http://dita-ot.sourceforge.net/ns/200704/mappull"
    exclude-result-prefixes="xs mappull"
    version="3.0">
    
    <xsl:variable name="attributes" select="('audience', 'platform')"/>
    
    <!-- Grab type from the target topic if it's not defined locally-->
    <xsl:template match="*" mode="mappull:get-stuff_get-type" as="attribute()*">
        <xsl:param name="type" as="xs:string"/>
        <xsl:param name="scope" as="xs:string"/>
        <xsl:param name="topicpos" as="xs:string"/>
        <xsl:param name="format" as="xs:string"/>
        <xsl:param name="file" as="xs:string"/>
        <xsl:param name="classval" as="xs:string"/>
        <xsl:param name="topicid" as="xs:string"/>
        <xsl:param name="doc" as="document-node()?"/>
        
        <xsl:next-match>
            <xsl:with-param name="type" select="$type"/>
            <xsl:with-param name="scope" select="$scope"/>
            <xsl:with-param name="topicpos" select="$topicpos"/>
            <xsl:with-param name="format" select="$format"/>
            <xsl:with-param name="file" select="$file"/>
            <xsl:with-param name="classval" select="$classval"/>
            <xsl:with-param name="topicid" select="$topicid"/>
            <xsl:with-param name="doc" select="$doc"/>
        </xsl:next-match>
        
        <xsl:variable name="topicref" select="."/>
        <xsl:for-each select="$attributes">
            <xsl:apply-templates select="$topicref" mode="get-attribute">
                <xsl:with-param name="attribute" select="."/>
                <xsl:with-param name="doc" select="$doc"/>
            </xsl:apply-templates>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="*" mode="get-attribute">
        <xsl:param name="attribute"/>
        <xsl:param name="doc"/>
        
        <xsl:if test="not(@*[local-name()=$attribute])">
            <xsl:copy-of select="($doc//*[contains(@class, ' topic/topic ')])[1]/@*[local-name()=$attribute]"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>