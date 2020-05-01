<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    xmlns:oxyf="http://www.oxygenxml.com/functions"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="whc:webhelp_search_input" mode="copy_template">
        <xsl:param name="template_base_uri" tunnel="yes"/>
        <xsl:param name="i18n_context" tunnel="yes" as="element()*"/>
        
        <div class="custom-search-component">
            <!-- Apply default processing -->
            <xsl:next-match/>
            <!-- Output your content here -->
            <div class="after-search">
                <xsl:variable name="afterSearchContentFragment" select="oxyf:getParameter('custom.webhelp.after.search.fragment')"/> 
                
                <xsl:call-template name="extractFileContent">
                    <xsl:with-param name="href" select="$afterSearchContentFragment"/>
                    <xsl:with-param name="template_base_uri" select="$template_base_uri"/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>