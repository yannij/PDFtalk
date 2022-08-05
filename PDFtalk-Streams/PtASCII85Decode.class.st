"
PDF Filter as defined in PDF 32000_2008.pdf pp. 25.

Decodes data encoded in an ASCII base-85 representation, reproducing the original binary data.
"
Class {
	#name : #PtASCII85Decode,
	#superclass : #PtASCIIFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtASCII85Decode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #ASCII85Decode
		supertype: #Filter
		section: '7.4.3'
		documentation: 'Decodes data encoded in an ASCII base-85 representation, reproducing the original binary data.'
]

{ #category : #filtering }
PtASCII85Decode >> decoded [
	self externalIsError ifTrue: [
		^self external].
	^[String fromASCII85: self external] on: ASCII85DecodeError do: [:ex |
		ex resignalAs: (PtReadError new messageText: ex messageText)]
]

{ #category : #filtering }
PtASCII85Decode >> encoded [
	self internalIsError ifTrue: [
		^self internal].
	^self internal asASCII85
]
