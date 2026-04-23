<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:oxygen="http://www.oxygenxml.com/functions"
  exclude-result-prefixes="#all"
  version="3.0">

  <xsl:template match="html:html" mode="copy_template">
    <xsl:variable name="html">
      <xsl:next-match/>
    </xsl:variable>
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:attribute name="lang" select="oxygen:getParameter('webhelp.language')"/>
      <xsl:attribute name="dir" select="oxygen:getParameter('webhelp.page.direction')"/>
      <xsl:variable name="rootID" select="doc($WEBHELP_DITAMAP_URL)/*/@id"/>
      <xsl:if test="$rootID">
        <xsl:attribute name="id" select="$rootID"/>
      </xsl:if>
      
      <!-- Copy elements -->
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>