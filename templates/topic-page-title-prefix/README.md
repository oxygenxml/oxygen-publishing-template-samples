# Prefix for each Topic Page Title

This is a sample publishing template that generates a prefix for the `head/title` element of each topic page.

![Output Sample](topic-page-title-prefix.png)

It uses an 
[XSLT Extension](https://www.oxygenxml.com/doc/versions/22.1/ug-webhelp-responsive/topics/whr-responsive-override-xslt-dita-xslt-import.html) File to generate the page title prefix.

The XSLT extension:
```
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template name="gen-user-panel-title-pfx">
        <xsl:text>[Title prefix] - </xsl:text>
    </xsl:template>
</xsl:stylesheet>
```


