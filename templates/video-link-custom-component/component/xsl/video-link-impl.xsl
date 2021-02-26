<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:comp="http://example.com/custom-components"
    exclude-result-prefixes="xs comp"
    version="3.0">
    
    <!-- Custom component implementation -->
    <xsl:template match="comp:video-link" mode="copy_template">
        <xsl:param name="ditaot_topicContent" tunnel="yes"/>
        <!-- Look for a 'video-link' <meta> element in the current topic content -->
        <xsl:variable name="videoLinkMeta"  select="$ditaot_topicContent//*:meta[@name='video-link']"/>
        <xsl:if test="exists($videoLinkMeta)">
            <div class="video-link-container">
                <a href="{$videoLinkMeta[1]/@content}"
                   class="video-link" target="_blank" aria-label="Video">
                    <span>Video</span>
                </a>
            </div>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>