<?xml version="1.0" encoding="UTF-8"?>
<!-- Example file to demonstrate java function calls from xslt2.0 -->
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:string="java:java.lang.String">


<xsl:output exclude-result-prefixes="fn xsl fo xs string"/>

<xsl:template match="/">
	<result >
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="lstring" select="'lower case string'" />
		<string><xsl:value-of select="string:toUpperCase(/doc)" /></string>
		<xsl:text>&#10;</xsl:text>
		<string><xsl:value-of select="string:substring('some lower case string', 5)" /></string>
		<xsl:text>&#10;</xsl:text>
		<string><xsl:value-of select="string:replaceAll(string:toUpperCase($lstring), 'LOWER', 'UPPER')" /></string>
		<xsl:text>&#10;</xsl:text>
		<xsl:variable name="sarray" select="string:getBytes($lstring)" />
		<character><xsl:value-of select="$sarray[1], codepoints-to-string($sarray[1] ) " /></character>
		<xsl:text>&#10;</xsl:text>
		<character><xsl:value-of select="$sarray[2], codepoints-to-string($sarray[2] )" /></character>
		<xsl:text>&#10;</xsl:text>
	</result>
</xsl:template>
</xsl:stylesheet>

