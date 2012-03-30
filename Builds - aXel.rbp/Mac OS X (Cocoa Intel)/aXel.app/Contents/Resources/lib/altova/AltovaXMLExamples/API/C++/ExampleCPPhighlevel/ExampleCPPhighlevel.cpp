// CPP usage example for AltovaXML (highlevel interface)
// Purpose: 
// -  Generate an AltovaXML application pointer
//	- Use the validator class to check that the input instance is wellformed
//  - Use the XSTL2 engine to copy the input instance 
// note: for simplicity file names have been hardcoded, adjust the names as required. 
// MAG Sept. 2006



// ExampleCPPhighlevel.cpp : 
// Uses exceptions as opposed to return codes the import statement does not include  "raw_interfaces_only"
//

#include <iostream>



#include "atlbase.h"
#include "comutil.h"


//This path must be adjusted if AltovaXML is not in the default location
#import "c:\program files (x86)\altova\AltovaXML2012\AltovaXML_COM.exe" no_namespace 



HRESULT xslt2call(IApplicationPtr ipAppl, BSTR infilename)
{
	IXSLT2Ptr ipXSLT2;
	HRESULT hr = S_OK;

	BSTR xslfilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/CopyInputXSLT2.xsl");
    BSTR outfilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/Out.xml");
	
	hr = ipAppl->get_XSLT2(&ipXSLT2);
	ipXSLT2->put_XSLFileName(xslfilename);
	ipXSLT2->put_InputXMLFileName(infilename);
	hr = ipXSLT2->Execute(outfilename);

	std::cout << "\nHighlevel Copy Successful \n\n";
	return(0);
}





int main(int argc, char* argv[])
{
	HRESULT hr = S_OK;
	IApplicationPtr ipApplication;
    //BSTR infilename = ::SysAllocString(L"C:/Program Files/Altova (x86)/AltovaXML2012/AltovaXMLExamples/notWellformed.xml");
	BSTR infilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/simple.xml");

	
	
	try { // high level interface heing used, exceptions are thrown. 
		hr = CoInitialize(NULL);
	
	  	hr = CoCreateInstance( __uuidof( Application ), 
			NULL, 
			CLSCTX_ALL, 
			__uuidof(IApplication), 
			reinterpret_cast<void**>(&ipApplication)) ;

		{ //reduce the scope of this ptr. so only one release is necessary. 
			IXMLValidatorPtr ipVAL;
			VARIANT_BOOL bIsWellFormed;
			//validate the input file
			hr = ipApplication->get_XMLValidator(&ipVAL);
			hr = ipVAL->put_InputXMLFileName(infilename);
			bIsWellFormed = ipVAL->IsWellFormed();
			
			if ( bIsWellFormed == VARIANT_TRUE )  //then copy the input file to the output
			{
				hr = xslt2call(ipApplication, infilename);
			}
			else   //find out why it wasn't wellformed.
			{
				BSTR  bstrMessage;
				hr = ipVAL->get_LastErrorMessage(&bstrMessage);
				std::cout << "\nValidation Message :" <<  _com_util::ConvertBSTRToString(bstrMessage);
				
			}
			
			
		}
		
		
	}
		
	catch( _com_error& err )
		{
			BSTR  bstrMessage;
			(err).ErrorInfo()->GetDescription( &bstrMessage );
			std::cout <<  _com_util::ConvertBSTRToString( bstrMessage ) << std::endl;
		}

ipApplication.Release();
CoUninitialize();

return(0);	
}