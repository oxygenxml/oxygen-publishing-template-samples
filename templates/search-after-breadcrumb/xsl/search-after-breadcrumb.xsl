<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    version="3.0">
    
    <xsl:template match="*:body[contains(@class, 'wh_topic_page')]/whc:webhelp_search_input" mode="copy_template">
        <xsl:param name="i18n_context" tunnel="yes" as="element()*"/>
        <!-- Do not generate the search input in the default location -->
    </xsl:template>
</xsl:stylesheet>