<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whc="http://www.oxygenxml.com/webhelp/components"
    exclude-result-prefixes="xs whc"
    version="2.0">
    
    <xsl:template match="whc:webhelp_search_input" mode="copy_template">
        <!-- Wrap the Search Component in a Bootstrap container -->
        <div class="container-fluid">
            <div class="row">
                <!-- Apply default processing. -->
                <xsl:next-match/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>