# Generate `@target="blank"` attribute on `imagemap`'s `xref`
This is a sample Publishing Template that sets the `@target="blank"` attribute on all image map links. 

It uses an 
[XSLT Extension](https://www.oxygenxml.com/doc/versions/23.1/ug-webhelp-responsive/topics/whr-responsive-override-xslt-dita-xslt-import.html) File (_xsl/image-map-xref.xsl_) to add the attribute.

```
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <xsl:template match="*[contains(@class, ' topic/xref ')]" mode="imagemap-xref">
        <xsl:next-match/>
        <xsl:attribute name="target">_blank</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
```
The file is registered in the Publishing Template's descriptor on the `com.oxygenxml.webhelp.xsl.dita2webhelp` extension point as it should only process topic content:
```
<xslt>
    <extension id="com.oxygenxml.webhelp.xsl.dita2webhelp" file="xsl/process-meta.xsl"/>
</xslt>
```