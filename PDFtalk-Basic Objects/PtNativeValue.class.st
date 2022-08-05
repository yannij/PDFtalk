"
A PDF value.

Abstract superclass of all PDF values, i.e. objects which do not change after creation.
The sister class hierarchy contains PDF Objects.

A PDF value wraps a corresponding Smalltalk value which is held in the instvar #content.

Values are created with: #on:
"
Class {
	#name : #PtNativeValue,
	#superclass : #Value,
	#instVars : [
		'content'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtNativeValue class >> content: contentValue [
	"<NativeValue>
	A new PDF object on anObject"

	| inst |
	inst := self new.
	inst initializeContent: contentValue.
	^inst
]

{ #category : #'instance creation' }
PtNativeValue class >> empty [
	^self new
]

{ #category : #specification }
PtNativeValue class >> localSpecification [
	<constant: #content class: #Value comment: 'the Smalltalk object for the value I represent'>
]

{ #category : #'instance creation' }
PtNativeValue class >> newFrom: aPDFObject [
	"<PDF.Object>
	A new PDF object on aPDFObject.
	Needed for specialization 
		where aPDFObject is an instance of a superclass like Dictionary or Array 
		which gets copied as an instance of the receiver"

	^self on: aPDFObject content
]

{ #category : #'instance creation' }
PtNativeValue class >> on: anObject [
	"<PDF.NativeValue>
	A new PDF object on anObject"

	^self content: anObject
]

{ #category : #accessing }
PtNativeValue class >> type [
	"<Symbol>
	type entry"
	^self name
]

{ #category : #converting }
PtNativeValue >> asSmalltalkValue [
	^self content
]

{ #category : #accessing }
PtNativeValue >> content [
	"<Value>
	the Smalltalk object for the value I represent"

	^content
]

{ #category : #copying }
PtNativeValue >> copy [
	^self class on: self content
]

{ #category : #'initialize-release' }
PtNativeValue >> initializeContent: contentValue [
	content := contentValue.
	self beImmutable
]

{ #category : #printing }
PtNativeValue >> printOn: aStream [
	aStream nextPutAll: self pdfSource
]

{ #category : #printing }
PtNativeValue >> printvalueWith: printer [
	^LiteralPrintvalue string: self content asSource
]
