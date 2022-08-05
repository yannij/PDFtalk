"
Super class of all exceptions thrown by the PDF code
"
Class {
	#name : #PtError,
	#superclass : #Error,
	#category : #'PDFtalk-Basics'
}

{ #category : #testing }
PtError class >> mayResume [

	^true
]

{ #category : #'instance creation' }
PtError class >> newSignal: aString [
	^(self new)
		searchFrom: thisContext sender;
		originator: thisContext sender homeReceiver;
		messageText: aString;
		yourself
]

{ #category : #'instance creation' }
PtError class >> newWith: aParameter message: aString [
	"Create an exception without raising it"

	^(self new)
		searchFrom: thisContext sender;
		originator: thisContext sender homeReceiver;
		messageText: aString;
		parameter: aParameter;
		yourself
]

{ #category : #signalling }
PtError class >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PtError class >> raiseSignal: aString [
	^self signal: aString
]

{ #category : #signalling }
PtError class >> signal: aString with: aParameter [
	"Raise an exception"

	^(self newWith: aParameter message: aString) signal
]

{ #category : #signalling }
PtError >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PtError >> raiseSignal: aString [
	^self signal: aString
]
