"
Maps one code to one destination code
"
Class {
	#name : #PSCharMapping,
	#superclass : #PSMapping,
	#category : #'PostScript-CIDInit'
}

{ #category : #converting }
PSCharMapping >> appendedToCode: aCodeMapping [
	^PSRangeMapping
		source: (aCodeMapping source to: self source)
		destination: aCodeMapping destination
]

{ #category : #converting }
PSCharMapping >> appendedToRange: aRangeMapping [
	^PSRangeMapping
		source: (aRangeMapping source first to: self source)
		destination: aRangeMapping destination
]

{ #category : #converting }
PSCharMapping >> asSimplestMapping [
	^self
]

{ #category : #accessing }
PSCharMapping >> characterAt: aCode [
	"assumes that aCode is equal to the receivers source; no checks are done!"

	^self destination psMappedCharacter
]

{ #category : #accessing }
PSCharMapping >> characters [
	^String with: self destination psMappedCharacter
]

{ #category : #accessing }
PSCharMapping >> codes [
	^Array
		with: self source
		with: self destination
]

{ #category : #accessing }
PSCharMapping >> destinationAt: aCode [
	"assumes that aCode is equal to the receivers source; no checks are done!"

	^self destination
]

{ #category : #testing }
PSCharMapping >> isNext: aMapping [
	^(self source isNext: aMapping source) and: [
	self destination + 1 = aMapping destination]
]

{ #category : #accessing }
PSCharMapping >> mappingsOverwrittenBy: aMapping [
	"the receiver can be directly before aMapping"

	(self joined: aMapping) ifNotNil: [:joined |
		^Array with: joined].
	"or directly after aMapping"
	(aMapping joined: self) ifNotNil: [:joined |
		^Array with: joined].
	"or inside aMappings source. Then forget about it, because it is shadowed by aMapping"
	^Array with: aMapping
]

{ #category : #testing }
PSCharMapping >> maps: aCode [ 
	^self source = aCode
]

{ #category : #accessing }
PSCharMapping >> numberOfChars [
	^1
]

{ #category : #accessing }
PSCharMapping >> numberOfCodes [
	^1
]

{ #category : #accessing }
PSCharMapping >> numberOfRanges [
	^0
]

{ #category : #converting }
PSCharMapping >> rangeWith: aMapping [
	^aMapping appendedToCode: self
]
