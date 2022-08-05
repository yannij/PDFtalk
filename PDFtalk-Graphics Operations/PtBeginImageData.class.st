"
Begin the image data for an inline image object
"
Class {
	#name : #PtBeginImageData,
	#superclass : #PtInlineImageOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginImageData class >> documentation [
	^'Begin the image data for an inline image object'
]

{ #category : #accessing }
PtBeginImageData class >> operatorName [
	^#ID
]

{ #category : #actions }
PtBeginImageData >> addAsContentTokenWith: someOperands to: someOperators inParser: aContentParser [
	| newOperands |
	newOperands := super
		addAsContentTokenWith: someOperands
		to: someOperators
		inParser: aContentParser.
	^newOperands , (Array with: aContentParser readImageData)
]

{ #category : #actions }
PtBeginImageData >> processWith: aProcessor at: indexInteger [
	aProcessor addBeginImageData: self
]
