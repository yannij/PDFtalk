"
This type matches a uniform array of attribute values of the same type.

The elements of the array are checked and specialized with the type
"
Class {
	#name : #PtArrayType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #testing }
PtArrayType >> isForArray [
	^true
]

{ #category : #accessing }
PtArrayType >> name [
	^'[' , self type name asString , ']'
]

{ #category : #typing }
PtArrayType >> specializedArray: aPDFArray [
	| elementType |
	elementType := self asObjectType.
	^(aPDFArray content collect: [:element |
		(element asType: elementType) ifNil: [
			^nil]]) asPDF
]

{ #category : #testing }
PtArrayType >> specifiesArray: aPDFArray [
	"elements can be direct or indirect"

	| elementType |
	elementType := self asObjectType.
	^aPDFArray content allSatisfy: [:element | element compliesTo: elementType]
]

{ #category : #testing }
PtArrayType >> specifiesReference: aPDFReference [
	^aPDFReference referent compliesTo: self
]
