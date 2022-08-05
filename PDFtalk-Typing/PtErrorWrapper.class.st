"
Wrapper around an error with the wrong PDF object and its types
"
Class {
	#name : #PtErrorWrapper,
	#superclass : #Object,
	#instVars : [
		'myObject',
		'types'
	],
	#category : #'PDFtalk-Typing'
}

{ #category : #'error handling' }
PtErrorWrapper >> errorClass [
	"<Error class>"

	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PtErrorWrapper >> initializeObject: aPDFObject types: someTypes [
	myObject := aPDFObject.
	types := someTypes
]

{ #category : #accessing }
PtErrorWrapper >> myObject [
	^myObject
]

{ #category : #'error handling' }
PtErrorWrapper >> signalError [
	self errorClass signalWith: self
]

{ #category : #typing }
PtErrorWrapper >> typed: listOfAttributeTypes [
	^self
]

{ #category : #accessing }
PtErrorWrapper >> types [
	"<Array of: AttributeType>"

	^types
]

{ #category : #accessing }
PtErrorWrapper >> typesString [
	"<String>"

	| wst |
	wst := String new writeStream.
	self types do: [:type | wst nextPutAll: type name] separatedBy: [
		wst nextPutAll: '|'].
	^wst contents
]
