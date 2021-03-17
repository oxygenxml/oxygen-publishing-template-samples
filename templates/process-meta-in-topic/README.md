# Process Cutom Metadata (`<othermeta>`) in Topic Content

This is a sample publishing template that processes custom metadata in each topic.


It uses an 
[XSLT Extension](https://www.oxygenxml.com/doc/versions/23.1/ug-webhelp-responsive/topics/whr-responsive-override-xslt-dita-xslt-import.html) File to process custom metadata (`<othermeta>`) in each topic and generates the desired HTML content.

In this example the following DITA content:
```
<prolog>
    <metadata>
        <othermeta name="refresh" content="5; url=https://www.oxygenxml.com/"/>    
    </metadata>
</prolog>
```
is transformed into
```
<meta http-equiv="refresh" content="5; url=https://www.oxygenxml.com/"/>
```

The XSLT extension file (_xsl/process-meta.xsl_) content is:
```
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:template match="*[contains(@class,' topic/othermeta ')][@name='refresh']" mode="gen-metadata">
        <meta http-equiv="refresh" content="{@content}"/>
    </xsl:template>
</xsl:stylesheet>
```
The XSLT extension file is registered in the Publishing Template's descriptor on the `com.oxygenxml.webhelp.xsl.dita2webhelp` extension point as it should only process topic content:
```
<xslt>
    <extension id="com.oxygenxml.webhelp.xsl.dita2webhelp" file="xsl/process-meta.xsl"/>
</xslt>
```