<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*[contains(@class, ' topic/dl ')]">
        <xsl:call-template name="setaname"/>
        <xsl:apply-templates select="
            *[contains(@class,
            ' ditaot-d/ditaval-startprop ')]" mode="out-of-line"/>
        <!-- Wrap in a table -->
        <table>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="setid"/>
            <xsl:apply-templates/>
        </table>
        <xsl:apply-templates select="
            *[contains(@class,
            ' ditaot-d/ditaval-endprop ')]" mode="out-of-line"/>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
        <!-- Wrap in a table row -->
        <tr>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="setidaname"/>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="
        *[contains(@class, ' topic/dd ')] |
        *[contains(@class, ' topic/dt ')]">
        <!-- Wrap in a cell -->
        <td>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="setidaname"/>
            <xsl:apply-templates select="
                ../*[contains(@class,
                ' ditaot-d/ditaval-startprop ')]" mode="out-of-line"/>
            <xsl:apply-templates/>
            <xsl:apply-templates select="
                ../*[contains(@class,
                ' ditaot-d/ditaval-endprop ')]" mode="out-of-line"/>
        </td>
    </xsl:template>
    
</xsl:stylesheet>