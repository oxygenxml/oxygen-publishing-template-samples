# Download Link Template
This template alters links to trigger downloads instead of opening them.

The link must have the @outputclass="download":
```
<xref href="archive.zip" format="zip" outputclass="download">download link</xref>
```

:information_source:**Note:** Download links only work for same-origin URLs, or blob: and data: schemes.