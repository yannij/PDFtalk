"
This type matches a Reference to a PDF object - the object cannot be direct.
"
Class {
	#name : #PtIndirectType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #converting }
PtIndirectType >> asDirectType [
	^PtDirectType onType: self type
]

{ #category : #converting }
PtIndirectType >> asIndirectType [
	^self
]

{ #category : #testing }
PtIndirectType >> isIndirect [
	^true
]

{ #category : #accessing }
PtIndirectType >> name [
	^'»', self type name asString
]

{ #category : #typing }
PtIndirectType >> specializedReference: aReference [
	^(aReference referent asType: self asDirectType) ifNotNil: [:specialized |
		aReference copyWithReferent: specialized]
]

{ #category : #testing }
PtIndirectType >> specifiesReference: aPDFReference [
	^aPDFReference referent compliesTo: self asDirectType
]
