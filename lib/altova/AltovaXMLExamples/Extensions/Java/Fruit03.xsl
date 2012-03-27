<?xml version="1.0" encoding="UTF-8"?>
<!-- Access packaged method in a class file, using only java as prefix, and the class path where the function is invoked. -->
  <!-- FileName: fruit03_packagedFruit -->
  <!-- Creator: Margaret Gruen-Kerr -->

 
<xsl:stylesheet 
version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:pf = "java" >  
<!-- only the java prefix is declared, the class must be in the current directory 
or it has to be in a package relative to the current directory -->

<xsl:output exclude-result-prefixes="fn pf xsl fo xs"/>

<xsl:template match="/">
 <xsl:variable name="myLemon" select="pf:com.altova.extfunc.Packagedfruit.new('yellow')" /> 
 
<test>
<instanceMethod><xsl:value-of select="pf:com.altova.extfunc.Packagedfruit.getFruitColor($myLemon)"/></instanceMethod>
<staticMethod><xsl:value-of select="pf:com.altova.extfunc.Packagedfruit.getFruitType()"/></staticMethod>
 </test>
</xsl:template>

</xsl:stylesheet>
