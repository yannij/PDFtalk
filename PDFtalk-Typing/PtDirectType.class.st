"
This type matches a concrete PDF object - no Reference.
"
Class {
	#name : #PtDirectType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #testing }
PtDirectType >> appliesToReference [
	^false
]

{ #category : #testing }
PtDirectType >> isDirectType [
	^true
]

{ #category : #accessing }
PtDirectType >> name [
	^'!', self type name asString
]

{ #category : #typing }
PtDirectType >> specializedObject: aPDFObject [
	^self type specialized: aPDFObject
]

{ #category : #testing }
PtDirectType >> specifiesArray: aPDFArray [
	^self type isExemplar: aPDFArray
]

{ #category : #testing }
PtDirectType >> specifiesDictionary: aPDFDictionary [
	^self type isExemplar: aPDFDictionary
]

{ #category : #testing }
PtDirectType >> specifiesObject: aPDFObject [
	^self type isExemplar: aPDFObject
]

{ #category : #testing }
PtDirectType >> specifiesReference [
	^self type name = #Reference
]
