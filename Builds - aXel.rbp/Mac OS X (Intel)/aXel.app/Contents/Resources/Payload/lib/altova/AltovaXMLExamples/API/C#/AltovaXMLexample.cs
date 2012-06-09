using System;
using Altova.AltovaXML;

namespace CS
{
	// C# usage example for AltovaXML
	// Purpose: 
	// -  Create an AltovaXML application class
	//	- Use the validator class to check that the input instance is well-formed
	//  - Use the XQuery engine to copy the input instance 
	// note: for simplicity file names have been hard-coded, adjust the names as required. 
	//
	class Class1
	{
        static void Main(String[] args)
		{
			try 
			{
                // locate samples installed with Altova XML.
                // REMARK: You might need to adapt this if running AltovaXML 64-bit, a different major version of AltovaXML or have installed AltovaXML to a different path.
                String strExamplesFolder = Environment.GetEnvironmentVariable("ProgramFiles(x86)") + "\\Altova\\AltovaXML2012\\AltovaXMLExamples\\";
                String infilename = strExamplesFolder + "simple.xml";
                String xqfilename = strExamplesFolder + "CopyInput.xq";

                String sTmp;
	            // Allocate an AltovaXML Application object.
				ApplicationClass app = new ApplicationClass();

                // Access the Validator
				XMLValidator val = app.XMLValidator;
				XSLT1 xslt1 = app.XSLT1;

                // check input file if it is well-formed
                bool isWellformed;
				val.InputXMLFileName = infilename;
				isWellformed = val.IsWellFormed();
				if (isWellformed)
				{ 
                    // copy using XQuery
                    try
                    {
                        app.XQuery.InputXMLFileName = infilename;
                        app.XQuery.XQueryFileName = xqfilename;
                        sTmp = app.XQuery.ExecuteAndGetResultAsString();
                        Console.WriteLine( "Text From Query:" + sTmp);
                        app = null;
                    }
                    catch 
                    {
                        Console.WriteLine(app.XQuery.LastErrorMessage);
                    }
				}
				else
				{
                    //deals with not well formed files, these do not throw exceptions
                    Console.WriteLine(val.LastErrorMessage);
				}
			}
			catch (Exception e)  //catches file not found and system errors. 
			{
				Console.WriteLine (e.ToString());
			}
		}
	}
}
