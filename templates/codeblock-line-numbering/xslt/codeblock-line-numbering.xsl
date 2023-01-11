<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="*[contains(@class, ' pr-d/codeblock ')]">
        <xsl:variable name="nm">
            <xsl:next-match/>
        </xsl:variable>
        <xsl:apply-templates select="$nm" mode="line-numbering"/>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="line-numbering">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' pr-d/codeblock ')]" mode="line-numbering">
        <xsl:element name="{name()}">
            <xsl:copy-of select="@*"/>
            <span class="+ topic/pre pr-d/codeblock-new-line pre codeblock-new-line"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="*[contains(@class, ' pr-d/codeblock ')]//text()" mode="line-numbering">
        <xsl:analyze-string regex="\n" select=".">
            <xsl:matching-substring>
                <xsl:value-of select="."/>
                <span class="+ topic/pre pr-d/codeblock-new-line pre codeblock-new-line"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
</xsl:stylesheet>