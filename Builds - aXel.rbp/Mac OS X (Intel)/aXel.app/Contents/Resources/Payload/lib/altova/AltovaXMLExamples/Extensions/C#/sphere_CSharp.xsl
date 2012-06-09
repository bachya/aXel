<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:csharp="http://csharp.org">
<xsl:output method="xml" omit-xml-declaration="yes" />

<msxsl:script language="CSharp" implements-prefix="csharp">
<![CDATA[
	public double circumference(double radius)
	{
		return 2 * Math.PI * radius;
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
       <circumference>
          <xsl:value-of select="csharp:circumference(radius)"/>        
       </circumference>
	<xsl:text>&#10;</xsl:text>
    </sphere>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
  </root>
  </xsl:template>
</xsl:stylesheet>
