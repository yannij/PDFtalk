"
PDF Number object as defined in PDF 32000_2008.pdf p. 14.

Real objects represent mathematical real numbers.
The range and precision of numbers may be limited by the internal representations used in the computer on which the conforming reader is running.
"
Class {
	#name : #PtNumber,
	#superclass : #PtNativeValue,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtNumber class >> on: aNumber [
	"<PDF.Integer | PDF.Real>"

	aNumber isInteger ifTrue: [
		^PtInteger on: aNumber].
	^PtReal on: aNumber
]

{ #category : #accessing }
PtNumber class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Number
		supertype: #Object
		section: '7.3.3'
		documentation: 'PDF provides two types of numeric objects: integer and real. Integer objects represent mathematical integers. Real objects represent mathematical real numbers.'
]

{ #category : #'instance creation' }
PtNumber class >> zero [
	^PtInteger content: 0
]

{ #category : #testing }
PtNumber >> isPositiveInteger [
	^self asSmalltalkValue isInteger and: [
	self asSmalltalkValue strictlyPositive]
]

{ #category : #testing }
PtNumber >> nonNegativeInteger [
	^self asSmalltalkValue isInteger and: [
	self asSmalltalkValue positive]
]

{ #category : #writing }
PtNumber >> writePDFOn: aWriter indent: anInteger [
	self asSmalltalkValue writePDFOn: aWriter indent: anInteger
]
