# Custom short description length

This publishing template allows you to increase the 200 character length for the short description. This will work only for topics that do not have a <shortdesc> element inside a DITA topic. 

To change the value for the maximum number of characters for the short description follow the procedure bellow:
1. Download the attached zip for the publishing template
2. Open the xsl/custom-shortdesc-length.xsl
3. Change the variable value at line 7. In this template the maximum length of the short description is set to 500.
![xsl](https://user-images.githubusercontent.com/18349514/192517615-120fabd8-c326-4e56-8be7-35438061e830.PNG)
4. Run the WebHelp transformation with this publishing template.


