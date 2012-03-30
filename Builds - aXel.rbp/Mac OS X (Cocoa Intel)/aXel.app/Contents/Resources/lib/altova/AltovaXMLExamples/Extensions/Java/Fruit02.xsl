<?xml version="1.0" encoding="UTF-8"?>
<!-- Using a Jar file, full file reference, no package name -->
  <!-- FileName: fruit01 -->
  <!-- Creator: Margaret Gruen-Kerr -->
  <!-- Purpose: Test case create a java object (fruit)  if the jar file is in the local directory then a relative file path can be used.
        invoke  a instance method - which requires as input an instance parameter
        and a static method which does not need any instance -->
 
<xsl:stylesheet 
version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:fruit = "java" > <!-- only the java prefix is declared, the class must be in the current directory -->

<xsl:output exclude-result-prefixes="fn fruit xsl fo xs"/>

<xsl:template match="/">
 <xsl:variable name="myLemon" select="fruit:Fruit.new('yellow')" /> 
 
<test>
<instanceMethod><xsl:value-of select="fruit:Fruit.getFruitColor($myLemon)"/></instanceMethod>
<staticMethod><xsl:value-of select="fruit:Fruit.getFruitType()"/></staticMethod>
 </test>
</xsl:template>

</xsl:stylesheet>
