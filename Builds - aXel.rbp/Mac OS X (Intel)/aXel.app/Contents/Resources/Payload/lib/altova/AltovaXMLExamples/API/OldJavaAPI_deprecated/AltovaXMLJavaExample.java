import com.altova.engines.*;
import java.io.*;

/*	Java usage example for AltovaXML
**  	Purpose: 
	** -  Generate an AltovaXML application class
	**	- Use the validator class to check that the input instance is wellformed
	**  - Use the XQuery engine to copy the input instance 
	** note: for simplicity file names have been hardcoded, adjust the names as required. 
	** MAG Sept. 2006
	*/
public class AltovaXMLJavaExample

{
	public static void main(String[] args) {
		String inFilename = "c:/program files/altova/altovaxml2007/AltovaXMLexamples/simple.xml";
		String doesNotExist = "c:/program files/doesNotExist.xml";

		String xqFilename = "c:/program files/altova/altovaxml2007/AltovaXMLexamples/CopyInput.xq";
		String resultString;
		System.out.println("AltovaXML Java JNI XQuery");

		/* get application instance */
		try {
			IAltovaXMLFactory objXmlApp = AltovaXMLFactory.getInstance();
			/* get Validator and XQ  method pointers */
			IXMLValidator val = objXmlApp.getXMLValidatorInstance();
			IXQuery xq = objXmlApp.getXQueryInstance();
			/*remove comments on line below to see error being caught*/
			/*val.setInputXMLFileName(doesNotExist);*/
			 val.setInputXMLFileName(inFilename);  
			 if (val.isWellFormed()) {                      /*if the file is wellformed copy it using XQuery*/
				xq.setInputXMLFileName(inFilename);
				xq.setXQueryFileName(xqFilename);
				/* test return value */
				resultString = xq.executeAndGetResultAsString();
				if (resultString == null ) {
					System.out.println("XQuery error : "
							+ xq.getLastErrorMessage());
				}
				else{
					System.out.println("Transform contents>>" + resultString );
				}
			}
			else{
				System.out.println("Not wellformed error>>" + val.getLastErrorMessage() );
			}
			/* release instance pointer */
			objXmlApp.releaseInstance();
		} catch (Exception e  ) {
			System.out.println("Error : " + e);
		}
	}
}
