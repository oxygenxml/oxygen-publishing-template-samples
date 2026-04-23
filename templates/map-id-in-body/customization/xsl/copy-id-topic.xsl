<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:oxygen="http://www.oxygenxml.com/functions"
  exclude-result-prefixes="#all"
  version="3.0">

  <xsl:template match="html:html" mode="copy_template">
    <xsl:param name="ditaot_topicContent" tunnel="yes"/>
    
    <xsl:copy copy-namespaces="no">
      <xsl:choose>
        <xsl:when test="exists($ditaot_topicContent/html:html)">
          <!-- EXM-36308 - Merge attributes -->
          <xsl:apply-templates select="oxygen:mergeHTMLAttributes(
            'html', 
            @*, 
            $ditaot_topicContent/html:html/@*)" mode="copy_template"/>          
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="@*" mode="#current"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:variable name="rootID" select="doc($WEBHELP_DITAMAP_URL)/*/@id"/>
      <xsl:if test="$rootID">
        <xsl:attribute name="id" select="$rootID"/>
      </xsl:if>
      
      <!-- Copy elements -->
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>