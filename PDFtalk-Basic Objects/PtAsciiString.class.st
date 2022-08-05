"
The bytes are all in the ASCII range
"
Class {
	#name : #PtAsciiString,
	#superclass : #PDFString,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #accessing }
PtAsciiString class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #AsciiString
		supertype: #Textstring
		section: '7.9.2.1'
		documentation: 'Shall be used for characters that are represented in a single byte using ASCII encoding.'
]
