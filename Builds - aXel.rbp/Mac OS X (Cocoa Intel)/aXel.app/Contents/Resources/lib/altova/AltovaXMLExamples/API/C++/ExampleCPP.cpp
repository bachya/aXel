// CPP usage example for AltovaXML (lowlevel interface)
// Purpose: 
// -  Generate an AltovaXML application pointer
//	- Use the validator class to check that the input instance is well-formed
//  - Use the XSTL2 engine to copy the input instance 
// note: for simplicity file names have been hard-coded, adjust the names as required. 

// The import statement specifies the raw-interfaces-only attribute. This exposes only the low level 
// contents of the type library. The function names are taken directly from the type library.
// There are no error-handling wrapper functions created. 
//
// REMARK: You might need to adapt paths in this sample if running AltovaXML 64-bit, a different major 
//         version of AltovaXML or have installed AltovaXML to a different path.

#include <iostream>

#import "c:\\program files (x86)\\altova\\AltovaXML2012\\AltovaXML_COM.exe" no_namespace raw_interfaces_only


// Demonstrate the calling of the XSLT2 engine
HRESULT xslt2call(IApplicationPtr ipAppl, BSTR infilename)
{
	IXSLT2Ptr ipXSLT2;
	HRESULT hr = S_OK;
	BSTR bstrResult;
	BSTR xslfilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/CopyInputXSLT2.xsl");
    BSTR outfilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/Out.xml");
	
	hr = ipAppl->get_XSLT2(&ipXSLT2);
	if FAILED(hr) return(hr);

	ipXSLT2->put_XSLFileName(xslfilename);
	ipXSLT2->put_InputXMLFileName(infilename);
	hr = ipXSLT2->Execute(outfilename);
	if FAILED(hr)
	{
		hr= ipXSLT2->get_LastErrorMessage(&bstrResult);
		std::cout << "\nError Message :" <<  _com_util::ConvertBSTRToString(bstrResult);
		return(hr);
	}
	std::cout << "\nCopy Successful \n\n";
	return(0);
}


int main(int argc, char* argv[])
{

	HRESULT hr = S_OK;
	hr = CoInitialize(NULL);
    BSTR infilename = ::SysAllocString(L"C:/Program Files (x86)/Altova/AltovaXML2012/AltovaXMLExamples/simple.xml");

    
	if (SUCCEEDED(hr))
	{
		IApplicationPtr ipApplication;

		hr = CoCreateInstance( __uuidof( Application ), 
				NULL, 
				CLSCTX_ALL, 
				__uuidof(IApplication), 
				reinterpret_cast<void**>(&ipApplication) 
				);
		if (SUCCEEDED(hr))
		{	
			IXMLValidatorPtr ipVAL;
			//check if the input file is well-formed
			hr = ipApplication->get_XMLValidator(&ipVAL);
			if (SUCCEEDED(hr))
			{
				
				VARIANT_BOOL bIsWellFormed;
				ipVAL->put_InputXMLFileName(infilename);
				hr = ipVAL->IsWellFormed(&bIsWellFormed);
				if (SUCCEEDED(hr))
				{
					if ( bIsWellFormed == VARIANT_TRUE )  //if well-formed then copy the input file to the output
					{
						hr = xslt2call(ipApplication, infilename);
					}
					else   //find out why it wasn't well-formed.
					{
						BSTR  bstrMessage;
						hr = ipVAL->get_LastErrorMessage(&bstrMessage);
						std::cout << "\nValidation Message :" <<  _com_util::ConvertBSTRToString(bstrMessage);
					
					}
				}

			}

			//release the application object
			ipApplication.Release();
		}

		CoUninitialize();
	}
	return(hr);



}
