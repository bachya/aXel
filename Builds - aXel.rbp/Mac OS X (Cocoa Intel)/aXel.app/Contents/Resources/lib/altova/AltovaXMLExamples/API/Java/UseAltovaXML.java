import com.altova.automation.AltovaXML.*;
import com.altova.automation.libs.AutomationException;


public class UseAltovaXML
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		// Locate samples installed with the product.
		// REMARK: You will need to modify this if you use a different major version, use the 64-bit
		//         version of the program or installed AltovaXML to a different location.
		String strExamplesFolder = System.getenv("ProgramFiles") + "/Altova/AltovaXML2012/AltovaXMLExamples/";
		
		String inFilename = strExamplesFolder + "simple.xml";
		String xqFilename = strExamplesFolder + "CopyInput.xq";
		System.out.println("AltovaXML Java JNI XQuery");
		
		AltovaXMLFactory xmlFactory = null;
		try 
		{
			// get application instance
			xmlFactory = new AltovaXMLFactory();
			
			// get XML validator and XQ method pointers from the application instance
			XMLValidator validator = xmlFactory.getXMLValidator();
			XQuery xQuery = xmlFactory.getXQuery();
			
			// we only want to work with input files that are well-formed.
			validator.setInputXMLFileName(inFilename);  
			if (validator.isWellFormed()) 
			{                      
				// if the file is well-formed copy it using XQuery
				xQuery.setInputXMLFileName(inFilename);
				xQuery.setXQueryFileName(xqFilename);
				
				// test return value
				String resultString = xQuery.executeAndGetResultAsString();
				if (resultString == null ) 
				      System.out.println("XQuery error: " + xQuery.getLastErrorMessage());
				else
				      System.out.println("Transform contents: " + resultString );
			}
			else
				System.out.println("Not wellformed error: " + validator.getLastErrorMessage() );
			
		} 
		catch (AutomationException e) 
		{
			// An error occurred when talking to the AltovaXML COM interface.
			System.out.println("Error accessing AltovaXML: " + e.getMessage());
		}
		finally
		{
			// now we can release the factory to immediately shut-down AltovaXML_COM.exe
			if ( xmlFactory != null )
				xmlFactory.dispose();
		}
	}
}
