<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:template match="/">
	<root xmlns:string="clitype:System.String">
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="lstring" select="'lower case string'" />
		<string><xsl:value-of select="string:ToUpper($lstring)" /></string>
		<xsl:text>&#10;</xsl:text>
		<string><xsl:value-of select="string:Substring('lower case string', 6, 4)" /></string>
		<xsl:text>&#10;</xsl:text>
		<string><xsl:value-of select="string:Replace(string:ToUpper($lstring), 'LOWER', 'UPPER')" /></string>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="sarray" select="string:ToCharArray($lstring)" />
		<string><xsl:value-of select="$sarray[1]" /></string>
		<xsl:text>&#10;</xsl:text>
		<string><xsl:value-of select="$sarray[2]" /></string>
		<xsl:text>&#10;</xsl:text>
	</root>
</xsl:template>
</xsl:stylesheet>

