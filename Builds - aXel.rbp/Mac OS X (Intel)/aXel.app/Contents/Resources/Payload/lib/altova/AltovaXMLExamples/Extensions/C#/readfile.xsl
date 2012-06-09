<!-- c# with using elements -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:csharp="http://csharp.org" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" omit-xml-declaration="yes" />

<msxsl:script language="C#" implements-prefix="csharp">
<msxsl:using namespace="System.Text" />
<msxsl:using namespace="System.IO" />
<![CDATA[
	public string GetSomeText(string file)
	{
		try
		{
		using (StreamReader sr = new StreamReader(file))
		{
			return sr.ReadToEnd();
		}
		}
		catch( Exception e)
		{
			return e.ToString();
		}
	}
]]>
</msxsl:script>
<msxsl:script language="C#" implements-prefix="csharp">
<msxsl:using namespace="System.Text" />
<msxsl:using namespace="System.IO" />
<![CDATA[
	public string GetSomeText1(string file)
	{
		using (StreamReader sr = new StreamReader(file))
		{
			return sr.ReadToEnd();
		}
	}
]]>
</msxsl:script>
<xsl:template match="/">
<xsl:text> this is a text copy of the source document
</xsl:text>
<xsl:text>Base Uri:</xsl:text><xsl:value-of select="fn:base-uri()" /><xsl:text>
</xsl:text>
<xsl:value-of select="csharp:GetSomeText(replace(substring-after(fn:base-uri(), 'file:///'), '/', '\\'))" />
<!--xsl:value-of select="csharp:GetSomeText1(fn:base-uri())" /-->
</xsl:template>
</xsl:stylesheet>
