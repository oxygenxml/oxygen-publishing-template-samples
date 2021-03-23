# `mappull` custom plugin

Custom DITA-OT plugin that registers an XSLT file on the [`dita.xsl.mappull`](https://www.dita-ot.org/dev/extension-points/plugin-extension-points-xslt-import.html) extension point that overrides the `mappull` step in the pre-processing pipeline.

Given a list of preconfigured attributes names, for each `topicref` in the input DITA map, the plugin copies each attribute from the target topic if it was not declared on the current `topicref`.


## Example:
### Attributes to pull:
`audience` and `platform`
```
<xsl:variable name="attributes" select="('audience', 'platform')"/>
```

### `topicref`
```xml
<map>
  <topicref href="topic.dita" platform="windows"/>
</map>
```

### *topic.dita*
```xml
<topic id="topic" audience="de" platform="mac">
  <!-- ..... --->
</topic>
```
### Result:
```xml
<map>
  <topicref href="topic.dita" audience="de" platform="windows"/>
</map>
```

## Use case:
Can be used to copy profiling attributes from the target topic on each `topicref` from the DITA map. 

## How to install:

1. Copy the plugin's directory (*com.oxygenxml.sample.mappull*) into your current DITA-OT instance (*\[DITA-OT-DIR]/plugins/*)
1. Install  (integrate) the plugin: [https://www.dita-ot.org/3.6/topics/plugins-installing.html](https://www.dita-ot.org/3.6/topics/plugins-installing.html)
1. You can configure wich attributes to pull from the target topic, by edditing the value of the `$attributes` variable from *xsl/sample-mappull.xsl*

