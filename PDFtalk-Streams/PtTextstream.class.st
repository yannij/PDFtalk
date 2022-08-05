"
PDF Stream object as defined in PDF 32000_2008.pdf pp. 87.

A text stream shall be a PDF stream object whose unencoded bytes shall meet the same requirements as a text string with respect to encoding, byte order, and lead bytes.
"
Class {
	#name : #PtTextstream,
	#superclass : #PDFStream,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtTextstream class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Textstream
		supertype: #Stream
		version: #(1 5)
		section: '7.9.3'
		documentation: 'A text stream shall be a PDF stream object whose unencoded bytes shall meet the same requirements as a text string with respect to encoding, byte order, and lead bytes.'
]

{ #category : #converting }
PtTextstream >> asString [
	"<Core.String>
	the value as a Smalltalk String; properly encoded to be displayed to humans.
	Textstring takes care of the encoding"

	^((PtPDF classAt: #Textstring) on: self internal) asString
]
