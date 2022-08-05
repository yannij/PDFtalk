"
PDF Name object as defined in PDF 32000_2008.pdf pp. 17.

A name is represented by a Symbol, for browsing references
"
Class {
	#name : #PtName,
	#superclass : #PtNativeValue,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #testing }
PtName class >> isClassForName: aName [
	
	^self name = aName asSmalltalkValue
]

{ #category : #'implementation limits' }
PtName class >> maxSize [
	"Maximum length of a name, in bytes."

	^127
]

{ #category : #'instance creation' }
PtName class >> on: aSymbol [
	(aSymbol size <= self maxSize) ifTrue: [
		^super on: aSymbol].
	^PtError raiseSignal: 'the symbol ' , aSymbol printString , ' is too big for PDF names'
]

{ #category : #accessing }
PtName class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Name
		supertype: #Object
		section: '7.3.5'
		documentation: 'A name object is an atomic symbol uniquely defined by a sequence of any characters (8-bit values) except null (character code 0).
Uniquely defined means that any two name objects made up of the same sequence of characters denote the same object.
Atomic means that a name has no internal structure; although it is defined by a sequence of characters, those characters are not considered elements of the name.'
]

{ #category : #testing }
PtName >> canBeExemplarOf: aType [
	
	^aType implementingClass isClassForName: self
]

{ #category : #accessing }
PtName >> pdfVersion [
	(self pdfSource includes: $#) ifTrue: [
		^PtVersion pdf1_2].
	^super pdfVersion
]

{ #category : #writing }
PtName >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutName: self
]
