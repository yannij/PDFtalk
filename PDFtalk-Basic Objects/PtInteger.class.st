"
PDF Number object as defined in PDF 32000_2008.pdf p. 14.

An integer shall be written as one or more decimal digits optionally preceded by a sign.
The value shall be interpreted as a signed decimal integer and shall be converted to an integer object.
"
Class {
	#name : #PtInteger,
	#superclass : #PtNumber,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtInteger class >> on: anInteger [
	^self content: anInteger
]

{ #category : #accessing }
PtInteger class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Integer
		supertype: #Number
		section: '7.3.3'
		documentation: 'An integer shall be written as one or more decimal digits optionally preceded by a sign.
The value shall be interpreted as a signed decimal integer and shall be converted to an integer object.'
]
