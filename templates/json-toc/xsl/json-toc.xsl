<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns:t="http://www.oxygenxml.com/ns/webhelp/toc" version="3.0">
    
    <xsl:import href="plugin:com.oxygenxml.webhelp.responsive:xsl/util/jsonUtil.xsl"/>
    <!-- {output-dir}/oxygen-webhelp/app/nav-links/json/ --> 
    <xsl:param name="JSON_OUTPUT_DIR_URI"/>
    
    <xsl:variable name="VOID_HREF" select="'javascript:void(0)'"/>
    
    <!-- Override a template from {DOT-DIR}/plugins/com.oxygenxml.webhelp.responsive/xsl/navLinks/navLinksImpl.xsl -->
    <xsl:template match="/t:toc">
        <!-- Process toc.xml and generate toc.json -->
        <xsl:apply-templates select="." mode="toc-json"/>
        <!-- Apply default processing -->
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template match="t:toc" mode="toc-json">
        <!-- Go up 4 dir levels to reach to the output dir -->
        <xsl:variable name="outputDirUrl" select="concat($JSON_OUTPUT_DIR_URI, '../../../../')"/>
        <xsl:variable name="tocJsonFileUrl" select="concat($outputDirUrl, 'toc.json')"/>
        <xsl:message>+++++ outputDirUrl: <xsl:value-of select="$outputDirUrl"/></xsl:message>
        <xsl:message>+++++ tocJsonFile: <xsl:value-of select="$tocJsonFileUrl"/></xsl:message>
        
        <xsl:result-document href="{$tocJsonFileUrl}" format="json">
            <xsl:variable name="jsonXml">
                <xsl:call-template name="object-property">
                    <xsl:with-param name="value">
                        <xsl:apply-templates select="t:title" mode="toc-json"/>
                        <xsl:call-template name="array-property">
                            <xsl:with-param name="name">topics</xsl:with-param>
                            <xsl:with-param name="value">
                                <xsl:apply-templates select="t:topic" mode="toc-json"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            <xsl:call-template name="xml2Json">
                <xsl:with-param name="jsonXml" select="$jsonXml"/>
            </xsl:call-template>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="t:title" mode="toc-json">
        <xsl:call-template name="string-property">
            <xsl:with-param name="name">title</xsl:with-param>
            <xsl:with-param name="value" select="node()"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="t:topic" mode="toc-json">
        <xsl:call-template name="object-property">
            <xsl:with-param name="value">
                <xsl:apply-templates select="t:title" mode="toc-json"/>
                <xsl:choose>
                    <xsl:when test="@href = $VOID_HREF">
                        <!-- WH-1781 Select the @href & @scope of the first descendant topic ref -->
                        <xsl:variable name="topicRefDescendant"
                            select="descendant::t:topic[@href and @href != $VOID_HREF][1]"/>
                        <xsl:call-template name="string-property">
                            <xsl:with-param name="name">href</xsl:with-param>
                            <xsl:with-param name="value">
                                <xsl:choose>
                                    <xsl:when test="$topicRefDescendant/@href">
                                        <xsl:value-of select="$topicRefDescendant/@href"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@href"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                        <xsl:if test="$topicRefDescendant/@scope">
                            <xsl:call-template name="string-property">
                                <xsl:with-param name="name">scope</xsl:with-param>
                                <xsl:with-param name="value" select="$topicRefDescendant/@scope"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="string-property">
                            <xsl:with-param name="name">href</xsl:with-param>
                            <xsl:with-param name="value" select="@href"/>
                        </xsl:call-template>
                        <xsl:if test="@scope">
                            <xsl:call-template name="string-property">
                                <xsl:with-param name="name">scope</xsl:with-param>
                                <xsl:with-param name="value" select="@scope"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="@outputclass">
                    <xsl:call-template name="string-property">
                        <xsl:with-param name="name">outputclass</xsl:with-param>
                        <xsl:with-param name="value" select="@outputclass"/>
                    </xsl:call-template>
                </xsl:if>

                <xsl:variable name="tocID" select="@wh-toc-id"/>

                <xsl:call-template name="string-property">
                    <xsl:with-param name="name">tocID</xsl:with-param>
                    <xsl:with-param name="value" select="$tocID"/>
                </xsl:call-template>
                <xsl:call-template name="array-property">
                    <xsl:with-param name="name">topics</xsl:with-param>
                    <xsl:with-param name="value">
                        <xsl:apply-templates select="t:topic" mode="toc-json"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="text()" mode="toc-json"/>
</xsl:stylesheet>
