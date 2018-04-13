# oxygen-publishing-template-samples
Project containing various examples of Oxygen Publishing Templates.

This is a demo project that introduces the concept of the Oxygen Webhelp [Publishing Template](https://www.oxygenxml.com/doc/ug-editor/topics/whr-publishing-template.html) that defines all aspects of the layout and
style of WebHelp Responsive output. 

The project contains a sample DITA map and a publsihing template that customizes the WebHelp Responsive output by changing the font and color of several sections and adds a background and logo image.

The possible benefits for using the publishing template package include:
- You can use any of the existing built-in templates as a starting point for future customizations
- The customized template packages are easy to share with others
- Custom template packages remain intact even when you upgrade Oxygen to a new version
- A publishing template can be easily integrated with a continuous integration publishing system

Each WebHelp Responsive publishing template is a package that contains a [descriptor](https://www.oxygenxml.com/doc/versions/20.0/ug-editor/topics/whr_publishing_template_contents.html#ariaid-title2) file and
various resources. The descriptor file controls the template package by defining the references to the
other resources in the package.
![Publishing Template package](resources/PubTemplatePackage.png)

