"
This type matches concrete types of attribute values.

#subsumes: aPDFObject answers:

true, if the type of aPDFObject is the identical to the type of the receiver
true, if the type is a subtype of the receiver's type
"
Class {
	#name : #PtObjectType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #comparing }
PtObjectType >> = anObject [
	^self class == anObject class and: [
	self type name == anObject type name]
]

{ #category : #converting }
PtObjectType >> asDirectType [
	^PtDirectType onType: self type
]

{ #category : #comparing }
PtObjectType >> hash [
	^self type hash
]

{ #category : #accessing }
PtObjectType >> name [
	^self type name asString
]

{ #category : #typing }
PtObjectType >> specializedObject: aPDFObject [
	^self type specialized: aPDFObject
]

{ #category : #testing }
PtObjectType >> specifiesArray: aPDFArray [
	^self type isExemplar: aPDFArray
]

{ #category : #testing }
PtObjectType >> specifiesDictionary: aPDFDictionary [
	^self type isExemplar: aPDFDictionary
]

{ #category : #testing }
PtObjectType >> specifiesObject: aPDFObject [
	^self type isExemplar: aPDFObject
]

{ #category : #testing }
PtObjectType >> specifiesReference [
	^self type name = #Reference
]

{ #category : #testing }
PtObjectType >> specifiesReference: aPDFReference [
	^aPDFReference referent compliesTo: self asDirectType
]
