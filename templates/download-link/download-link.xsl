<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  version="3.0">

  <xsl:template match="*[contains(@class, 'topic/xref')][contains(@class, 'download')]" mode="copy-topic-content">
    <xsl:copy>
      <xsl:attribute name="download"/>
      <xsl:copy-of select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>