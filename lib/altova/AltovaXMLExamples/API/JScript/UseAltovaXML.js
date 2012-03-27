//	Javascript usage example for AltovaXML
// 	Purpose: 
// -  Generate an AltovaXML application object
//  - Use the XSLT2 engine to copy the input instance 

// start AltovaXML
var objAltovaXML = WScript.GetObject("", "AltovaXML.Application");

// Locate examples via USERPROFILE shell variable. The path needs to be adapted to major release versions,
// 64-bit versions of the product or alternate installation locations.
objWshShell = WScript.CreateObject("WScript.Shell");
strExampleFolder = objWshShell.ExpandEnvironmentStrings("%ProgramFiles(x86)%") + "\\Altova\\AltovaXML2012\\AltovaXMLExamples\\";

// acess XSLT 2.0 engine
var xslt2 = objAltovaXML.XSLT2;

xslt2.XSLFileName = strExampleFolder + "CopyInputXSLT2.xsl";
xslt2.InputXMLFileName = strExampleFolder + "simple.xml";

try 
{
	 xslt2.Execute(strExampleFolder + "API\\JScript\\OutJavaScript.xml"); 
}
catch(err)
{
	WScript.Echo( "Error:", xslt2.LastErrorMessage );
};
