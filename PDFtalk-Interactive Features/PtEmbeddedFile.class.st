"
PDF embedded file as defined in PDF 32000_2008.pdf, section 7.11.4.1, pp. 103.

If a PDF file contains file specifications that refer to an external file and the PDF file is archived or transmitted, some provision should be made to ensure that the external references will remain valid. One way to do this is to arrange for copies of the external files to accompany the PDF file. Embedded file streams address this problem by allowing the contents of referenced files to be embedded directly within the body of the PDF file. This makes the PDF file a self-contained unit that can be stored or transmitted as a single entity. (The embedded files are included purely for convenience and need not be directly processed by any conforming reader.)
"
Class {
	#name : #PtEmbeddedFile,
	#superclass : #PDFStream,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtEmbeddedFile class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #EmbeddedFile
		supertype: #Stream
		section: '7.11.4.1'
		documentation: 'If a PDF file contains file specifications that refer to an external file and the PDF file is archived or transmitted, some provision should be made to ensure that the external references will remain valid. One way to do this is to arrange for copies of the external files to accompany the PDF file. Embedded file streams address this problem by allowing the contents of referenced files to be embedded directly within the body of the PDF file. This makes the PDF file a self-contained unit that can be stored or transmitted as a single entity. (The embedded files are included purely for convenience and need not be directly processed by any conforming reader.)'
]

{ #category : #'accessing entries' }
PtEmbeddedFile >> Params [
	<type: #EmbeddedFileParameter>
	<attribute: 3 documentation: 'An embedded file parameter dictionary that shall contain additional file-specific information'>
	^self objectAt: #Params ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtEmbeddedFile >> Subtype [
	<type: #Name>
	<attribute: 2 documentation: 'The subtype of the embedded file. The value of this entry shall be a first-class name, as defined in Annex E. Names without a registered prefix shall conform to the MIME media type names defined in Internet RFC 2046, Multipurpose Internet Mail Extensions (MIME), Part Two: Media Types, with the provision that characters not allowed in names shall use the 2-character hexadecimal code format'>
	^self objectAt: #Subtype ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEmbeddedFile >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes'>
	^self objectAt: #Type ifAbsent: [#EmbeddedFile asPDF]
]
