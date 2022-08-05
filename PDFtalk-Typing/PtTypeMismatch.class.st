"
TypeMismatch is a wrapper around a PDF object with the wrong type
"
Class {
	#name : #PtTypeMismatch,
	#superclass : #PtErrorWrapper,
	#category : #'PDFtalk-Typing'
}

{ #category : #'instance creation' }
PtTypeMismatch class >> for: aPDFObject expected: someTypes [
	| inst |
	inst := self new.
	inst initializeObject: aPDFObject types: someTypes.
	inst signalError.
	^inst
]

{ #category : #tracing }
PtTypeMismatch >> copyWithNewReferencesIn: visited [
	| copy |
	copy := self class new.
	copy initializeObject: (myObject copyWithNewReferencesIn: visited) types: self types.
	^copy
]

{ #category : #'error handling' }
PtTypeMismatch >> doesNotUnderstand: aMessage [
	(myObject respondsTo: aMessage selector) ifTrue: [
		^myObject perform: aMessage selector withArguments: aMessage arguments].
	^super doesNotUnderstand: aMessage
]

{ #category : #'error handling' }
PtTypeMismatch >> errorClass [
	^PtTypeError
]

{ #category : #accessing }
PtTypeMismatch >> pdfVersion [
	^myObject pdfVersion
]

{ #category : #printing }
PtTypeMismatch >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: (myObject pdfType ifNotNil: [:type | type name] ifNil: ['nil']);
		nextPut: $/;
		nextPutAll: self typesString;
		nextPut: $)
]

{ #category : #tracing }
PtTypeMismatch >> tracedReferences: visited do: oneArgumentBlock [
	myObject tracedReferences: visited do: oneArgumentBlock
]

{ #category : #writing }
PtTypeMismatch >> writePDFOn: aWriter indent: anInteger [
	myObject writePDFOn: aWriter indent: anInteger
]
