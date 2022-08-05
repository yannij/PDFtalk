"
Superclass of the encoding formats
"
Class {
	#name : #CFFEncoding,
	#superclass : #CFFMapping,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFEncoding class >> fromBytes: aByteStream [
	| formatByte dataFormat |
	formatByte := aByteStream peek.
	dataFormat := formatByte bitAnd: 16r7F.
	dataFormat = 0 ifTrue: [
		^CFFEncoding0 fromBytes: aByteStream].
	dataFormat = 1 ifTrue: [
		^CFFEncoding1 fromBytes: aByteStream].
	self error: 'wrong format'
]
