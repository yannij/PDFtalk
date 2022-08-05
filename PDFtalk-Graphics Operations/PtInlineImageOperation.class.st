"
PDF Inline Images as defined in PDF 32000_2008.pdf, section 8.9.7, pp. 214.

As an alternative to the image XObjects, a sampled image may be specified in the form of an inline image. 
This type of image shall be defined directly within the content stream in which it will be painted rather than as a separate object. 
Because the inline format gives the reader less flexibility in managing the image data, it shall be used only for small images (4 KB or less).

An inline image object shall be delimited in the content stream by the operators BI (begin image), ID (image data), and EI (end image). 
BI and ID shall bracket a series of key-value pairs specifying the characteristics of the image, such as its dimensions and colour space; 
the image data shall follow between the ID and EI operators. 
The format is thus analogous to that of a stream object such as an image XObject:
	BI
	…Key-value pairs…
	ID
	…Image data…
	EI
"
Class {
	#name : #PtInlineImageOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}
