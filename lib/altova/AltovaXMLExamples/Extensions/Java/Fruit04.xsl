<?xml version="1.0" encoding="UTF-8"?>
<!-- Access packaged method in a class file, assigning the classpath to the prefix.-->
  <!-- FileName: fruit04_packagedFruit -->
  <!-- Creator: Margaret Gruen-Kerr -->
  
 
<xsl:stylesheet 
version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:pf = "java:com.altova.extfunc.Packagedfruit?path=file:./com/altova/extfun" > 

<xsl:output exclude-result-prefixes="fn pf xsl fo xs"/>

<xsl:template match="/">
 <xsl:variable name="myLemon" select="pf:new('yellow')" /> 
 
<test>
<instanceMethod><xsl:value-of select="pf:getFruitColor($myLemon)"/></instanceMethod>
<staticMethod><xsl:value-of select="pf:getFruitType()"/></staticMethod>
 </test>
</xsl:template>

</xsl:stylesheet>
