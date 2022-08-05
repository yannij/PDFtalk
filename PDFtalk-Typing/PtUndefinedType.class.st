"
A type for anything unrecognized
"
Class {
	#name : #PtUndefinedType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #accessing }
PtUndefinedType >> name [
	^self type printString
]

{ #category : #printing }
PtUndefinedType >> printOn: stream [
	stream nextPutAll: self class name asString, ' onSymbol: ', self name
]

{ #category : #testing }
PtUndefinedType >> specifiesObject: aPDFObject [
	^true
]

{ #category : #testing }
PtUndefinedType >> specifiesReference: aPDFReference [
	^true
]
