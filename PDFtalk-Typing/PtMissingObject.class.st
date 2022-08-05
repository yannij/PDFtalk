"
A reference is pointing to a missing object
"
Class {
	#name : #PtMissingObject,
	#superclass : #PtErrorWrapper,
	#category : #'PDFtalk-Typing'
}

{ #category : #'instance creation' }
PtMissingObject class >> at: anObjectId expected: someTypes [
	| inst |
	inst := self new.
	inst initializeObject: anObjectId types: someTypes.
	inst signalError.
	^inst
]

{ #category : #'error handling' }
PtMissingObject >> errorClass [
	^PtMissingObjectError
]

{ #category : #printing }
PtMissingObject >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: myObject printString;
		nextPut: $/;
		nextPutAll: self typesString;
		nextPut: $)
]

{ #category : #writing }
PtMissingObject >> writePDFOn: aWriter indent: anInteger [
	| string |
	string := 'The original object is missing'.
	self types notEmpty ifTrue: [
		string := string, '. It should have been a ' , self typesString].
	aWriter nextPutString: string asPDF
]
