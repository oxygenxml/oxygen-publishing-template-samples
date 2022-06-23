<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:oxygen="http://www.oxygenxml.com/functions" 
    xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
    exclude-result-prefixes="xs whc oxygen toc"
    version="3.0">
    
    <xsl:template match="*:div[contains(@class, 'wh_content_flex_container')]" mode="copy_template">
        <xsl:call-template name="generatePublicationTocComponent"/>
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template name="generatePublicationTocComponent">
        <nav id="wh_publication_toc" 
            aria-label="Table of Contents Container">
            <div id="wh_publication_toc_content">
                <div class=" wh_publication_toc ">
                    <xsl:apply-templates select="$toc" mode="create-toc"/>
                </div>
            </div>
        </nav>
    </xsl:template>
    
    <xsl:template match="toc:topic" mode="create-toc">
        <xsl:call-template name="generateTocEntry"/>
        <xsl:apply-templates select="toc:topic" mode="create-toc"/>
    </xsl:template>
    
    <xsl:template name="generateTocEntry">
        <li>
            <div data-tocid="{@wh-toc-id}">
                <xsl:attribute name="class">
                    <xsl:value-of select="'topicref'"/>
                    <xsl:if test="@outputclass">
                        <xsl:value-of select="concat(' ', @outputclass)"/>
                    </xsl:if>
                </xsl:attribute>
                <!-- WH-1820 Copy the Ditaval "pass through" attributes. -->
                <xsl:copy-of select="@*[starts-with(local-name(), 'data-')]"/>
                <xsl:variable name="hrefValue">
                    <xsl:call-template name="computeHrefAttr"/>
                </xsl:variable>
                <div class="title">
                    <a href="{$hrefValue}" id="{@wh-toc-id}-link">
                        <xsl:if test="@scope = 'external'">
                            <!-- Mark the current link as being external to the DITA map. -->
                            <xsl:attribute name="data-scope">external</xsl:attribute>
                        </xsl:if>
                        <xsl:copy-of select="toc:title/node()"/>
                    </a>
                    <xsl:apply-templates select="toc:shortdesc" mode="topic2html"/>
                </div>
            </div>
        </li>
    </xsl:template>
    
    
    <xsl:variable name="VOID_HREF" select="'javascript:void(0)'"/>
    <!-- Compute the href attribute to be used when compute link to topic  -->
    <xsl:template name="computeHrefAttr">
        <xsl:choose>
            <xsl:when test="@href and @href != $VOID_HREF">
                <xsl:value-of select="@href"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- EXM-38925 Select the href of the first descendant topic ref -->
                <xsl:value-of select="descendant::toc:topic[@href and @href != $VOID_HREF][1]/@href"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>