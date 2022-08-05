"
PDF Text String object as defined in PDF 32000_2008.pdf pp. 86.

The text string type shall be used for character strings that contain information intended to be human-readable, such as text annotations, bookmark names, article names, document information, and so forth.

	NOTE 1		Text string type is a subtype of string type and represents data encoded using specific conventions.

The text string type shall be used for character strings that shall be encoded in either PDFDocEncoding or the UTF-16BE Unicode character encoding scheme.

The value should be shown with PDFDocEncoding
"
Class {
	#name : #PtTextstring,
	#superclass : #PDFString,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtTextstring class >> fromString: aByteString [
	| encoder wst |
	wst := ByteArray new writeStream.
	encoder := PtPDF pdfDocEncoder.
	aByteString do: [:char | wst nextPut: (encoder encode: char)].
	^self content: wst contents
]

{ #category : #accessing }
PtTextstring class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Textstring
		supertype: #String
		section: '7.9.2.2'
		documentation: 'The text string type shall be used for character strings that contain information intended to be human-readable, such as text annotations, bookmark names, article names, document information, and so forth.

	NOTE 1		Text string type is a subtype of string type and represents data encoded using specific conventions.

The text string type shall be used for character strings that shall be encoded in either PDFDocEncoding or the UTF-16BE Unicode character encoding scheme.

The value should be shown with PDFDocEncoding'
]

{ #category : #converting }
PtTextstring >> asString [
	| encoder wst |
	wst := String new writeStream.
	encoder := PtPDF pdfDocEncoder.
	self content do: [:code | wst nextPut: (encoder decode: code)].
	^wst contents asString
]
