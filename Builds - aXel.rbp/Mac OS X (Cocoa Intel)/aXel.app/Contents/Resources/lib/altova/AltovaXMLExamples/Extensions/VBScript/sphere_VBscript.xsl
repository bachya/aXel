<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:vb="http://vb.org">
<xsl:output method="xml" omit-xml-declaration="yes" />

<msxsl:script language="vbScript" implements-prefix="vb">
<![CDATA[
	Public Function volume(radius As Double) As Double
		return 4 / 3 * Math.PI * Math.Pow(radius, 3)
	End Function
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
       <volume>
          <xsl:value-of select="vb:volume(radius)"/>        
       </volume>
	<xsl:text>&#10;</xsl:text>
    </sphere>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
  </root>
  </xsl:template>
</xsl:stylesheet>

