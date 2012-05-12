<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
 <!-- Purpose: Copy Input to Output using the XSLT2 engine. mag October 2006-->

<xsl:output omit-xml-declaration="yes"/>
<xsl:template match="/">
<xsl:comment>XSLT2 Copy input to output</xsl:comment>
<xsl:copy-of  select="/*"/>  
<xsl:text>
</xsl:text>
 </xsl:template>
</xsl:stylesheet>