<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:jscript="http://jscript.org">
<xsl:output method="xml" omit-xml-declaration="yes" />

<msxsl:script language="JavaScript" implements-prefix="jscript">
<![CDATA[
	public function area(radius : double) : double
	{
		return 4 * Math.PI * Math.pow(radius, 2);
	}
]]>
</msxsl:script>

  <xsl:template match="data">  
  <root>
  <xsl:text>&#10;</xsl:text>
  <xsl:for-each select="sphere">
    <sphere>
	<xsl:text>&#10;&#09;</xsl:text>
    <xsl:copy-of select="node()"/>
	<xsl:text>&#10;&#09;</xsl:text>
       <surface>
          <xsl:value-of select="jscript:area(radius)"/>        
       </surface>
	<xsl:text>&#10;</xsl:text>
    </sphere>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
  </root>
  </xsl:template>
</xsl:stylesheet>

