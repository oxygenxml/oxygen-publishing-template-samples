<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    exclude-result-prefixes="xs whc toc oxygen"
    version="3.0">
    <xsl:template match="/toc:toc/toc:topic[oxygen:isTileVisible(.)]" mode="create-tiles">
        <xsl:param name="tileTemplate"/>
        <div class="tiles-group">
            <xsl:call-template name="generateGroupHeader">
                <xsl:with-param name="tileTemplate" select="$tileTemplate"/>
            </xsl:call-template>
            <xsl:if test="count(toc:topic[oxygen:isTileVisible(.)]) > 0">
                <div class="tiles-group-content">
                    <xsl:apply-templates select="toc:topic[oxygen:isTileVisible(.)]" mode="#current">
                        <xsl:with-param name="tileTemplate" select="$tileTemplate"/>
                    </xsl:apply-templates>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template name="generateGroupHeader">
        <xsl:param name="tileTemplate"/>
        <div class="tiles-group-header">
            <!-- Generate the default tile content in a variable for further processing. -->
            <xsl:variable name="defaultTile">
                <xsl:next-match>
                    <xsl:with-param name="tileTemplate" select="$tileTemplate"/>
                </xsl:next-match>
            </xsl:variable>
            <!-- Copy the id of the associated dita topic -->
            <xsl:copy-of select="$defaultTile//@data-id"/>

            <!-- Copy the title of the associated dita topic -->
            <xsl:apply-templates select="$defaultTile//*[contains(@class, 'wh_tile_title')]"
                mode="copy-header"/>
            <!-- Copy the shortdesc of the associated dita topic -->
            <xsl:apply-templates select="$defaultTile//*[contains(@class, 'wh_tile_shortdesc')]"
                mode="copy-header"/>

        </div>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, 'wh_tile_title')]" priority="20" mode="copy-header">
        <div class="tiles-group-title">
            <xsl:apply-templates mode="#current"/> 
        </div>  
    </xsl:template>
    <xsl:template match="*[contains(@class, 'wh_tile_shortdesc')]" priority="15" mode="copy-header">
        <div class="tiles-group-shortdesc">
            <xsl:apply-templates mode="#current"/> 
        </div>  
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="copy-header" priority="10">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Test if a tile will be outputed for a topic -->
    <xsl:function name="oxygen:isTileVisible" as="xs:boolean">
        <xsl:param name="cTopic"/>
        <!-- Defined in com.oxygenxml.webhelp.responsive/xsl/template/mainPageComponentsExpander.xsl -->
        <xsl:sequence select="oxygen:shouldDisplayTile($cTopic)"/>
    </xsl:function>
</xsl:stylesheet>