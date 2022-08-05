"
PDF Filter as defined in PDF 32000_2008.pdf pp. 24.

Decodes data encoded in an ASCII hexadecimal representation, reproducing the original binary data.
"
Class {
	#name : #PtASCIIHexDecode,
	#superclass : #PtASCIIFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtASCIIHexDecode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #ASCIIHexDecode
		supertype: #Filter
		section: '7.4.2'
		documentation: 'Decodes data encoded in an ASCII hexadecimal representation, reproducing the original binary data.'
]

{ #category : #accessing }
PtASCIIHexDecode >> decoded [
	self externalIsError ifTrue: [
		^self external].
	^PtHexStringEncoder decoded: (self external readStream upTo: $>)
]

{ #category : #accessing }
PtASCIIHexDecode >> encoded [
	"<String>"

	self internalIsError ifTrue: [
		^self internal].
	^(PtHexStringEncoder encoded: self internal) asString , '>'
]
