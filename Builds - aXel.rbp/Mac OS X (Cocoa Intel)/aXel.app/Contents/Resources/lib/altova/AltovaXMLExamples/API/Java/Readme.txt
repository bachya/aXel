This directory contains Java examples for the AltovaXML API. You can test it directly from the command line using the batch file "buildAndRun.bat", or you can compile and run it from within Eclipse.

For details see the section "Application API" of the AltovaXML user documentation.

-------------------------------------------------------------------------
File list
-------------------------------------------------------------------------
Readme.txt			- this file

AltovaAutomation.dll	- Java-COM bridge DLL part
AltovaAutomation.jar	- Java-COM bridge Java library part
AltovaXMLAPI.jar		- Java classes of the AltovaXML API

UseAltovaXML.java		- Java example source code

buildAndRun.bat		- batch file to compile and run example code from
				  command line prompt.
				  Expects folder where Java Virtual Machine resides
				  as parameter.

.classpath 		- Eclipse project helper file
.project			- Eclipse project file

-------------------------------------------------------------------------
What the example does
-------------------------------------------------------------------------
The example starts up AltovaXML and checks if the given document is well-formed and performs an XSLT transformation. when done, AltovaXML stays open. Please, close it manually.

You can modify the example in any way you like.

-------------------------------------------------------------------------
Running the example from command line prompt
-------------------------------------------------------------------------
Open a command prompt window and type:

	buildAndRun.bat "C:\Program Files (x86)\Java\jre1.6.0_04\bin"

You may need to adapt the path to point to the binary folder of a 32-bit JRE or JDK 1.5 or later installation on your computer.

Press the 'Return' key. The Java source in UseAltovaXML.java will be compiled and then executed.

-------------------------------------------------------------------------
Loading the example into Eclipse
-------------------------------------------------------------------------
Open Eclipse and use the 'Import | Existing Projects into Workspace' command to add the Eclipse project file located in the same folder as this Readme file to your workspace. The project 'UseAltovaXML' will then appear in your Package Explorer or Navigator.

Select the project and use 'Run as | Java Application' to execute the example.
