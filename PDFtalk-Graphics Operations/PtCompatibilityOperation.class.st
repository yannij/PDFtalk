"
PDF Content Streams as defined in PDF 32000_2008.pdf, section 7.8.2, pp. 81.

Ordinarily, when a conforming reader encounters an operator in a content stream that it does not recognize, an error shall occur. 
A pair of compatibility operators, BX and EX (PDF 1.1), shall modify this behaviour. 
These operators shall occur in pairs and may be nested. 
They bracket a compatibility section, a portion of a content stream within which unrecognized operators shall be ignored without error. 
This mechanism enables a conforming writer to use operators defined in later versions of PDF without sacrificing compatibility with older applications. 
It should be used only in cases where ignoring such newer operators is the appropriate thing to do. 
The BX and EX operators are not themselves part of any graphics object or of the graphics state.
"
Class {
	#name : #PtCompatibilityOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}
