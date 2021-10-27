# Generate Publication TOC in JSON format

This is a sample publishing template that processes the topics hierarchy as defined in the source DITA map and generates the associated Table of Contents in JSON format. .


The template registers an 
[XSLT Extension](https://www.oxygenxml.com/doc/versions/24.0/ug-webhelp-responsive/topics/whr-responsive-override-xslt-dita-xslt-import.html) File to process the contents of the temporary *toc.xml* file and generates a file named _toc.json_ in the output directory.

The XSLT file ([_xsl/json-toc.xsl_](xsl/json-toc.xsl)) is registered on the `com.oxygenxml.webhelp.xsl.createNavLinks` extension point in the Publishing Template's [descriptor](json-toc.opt):
```
<xslt>
    <extension file="xsl/json-toc.xsl" id="com.oxygenxml.webhelp.xsl.createNavLinks"/>
</xslt>
```

### Sample files:

- _toc.xml_: [samples/toc.xml](samples/toc.xml)
- _toc.json_: [samples/toc.json](samples/toc.json)



