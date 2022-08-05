"
Maps a range to a destination range
"
Class {
	#name : #PSRangeMapping,
	#superclass : #PSMapping,
	#category : #'PostScript-CIDInit'
}

{ #category : #converting }
PSRangeMapping >> appendedToCode: aCodeMapping [
	^self class
		source: (aCodeMapping source to: self source last)
		destination: aCodeMapping destination
]

{ #category : #converting }
PSRangeMapping >> appendedToRange: aRangeMapping [
	^self class
		source: (aRangeMapping source first to: self source last)
		destination: aRangeMapping destination
]

{ #category : #converting }
PSRangeMapping >> asSimplestMapping [
	self source numberOfCodes = 1 ifTrue: [
		^self source first --> self destination].
	^self
]

{ #category : #accessing }
PSRangeMapping >> characterAt: aCode [
	"assumes that aCode is included in the receiver; no checks are done!"

	| offset |
	offset := aCode asInteger - self source first asInteger.
	^(self destination + offset) psMappedCharacter
]

{ #category : #accessing }
PSRangeMapping >> characters [
	^String withAll: (self destinationInterval collect: #psMappedCharacter)
]

{ #category : #accessing }
PSRangeMapping >> codes [
	^Array
		with: self source first
		with: self source last
		with: self destination
]

{ #category : #accessing }
PSRangeMapping >> destinationAt: aCode [
	"assumes that aCode is included in the receiver; no checks are done!
	The result may even be negative"

	^self destination + (aCode asInteger - self source first asInteger)
]

{ #category : #accessing }
PSRangeMapping >> destinationInterval [
	"<Interval>"

	^self destination to: self destination + self numberOfCodes - 1
]

{ #category : #testing }
PSRangeMapping >> isNext: aMapping [
	^(self source isNext: aMapping source) and: [
	self lastDestination + 1 = aMapping destination]
]

{ #category : #accessing }
PSRangeMapping >> lastDestination [
	"<Integer>"

	^self destination + self source numberOfCodes - 1
]

{ #category : #accessing }
PSRangeMapping >> mappingPartAfter: aCode [
	| start |
	start := aCode next.
	^((start to: self source last) --> (self destinationAt: start)) asSimplestMapping
]

{ #category : #accessing }
PSRangeMapping >> mappingPartBefore: aCode [
	^((self source first to: aCode previous) --> self destination) asSimplestMapping
]

{ #category : #accessing }
PSRangeMapping >> mappingsOverwrittenBy: aMapping [
	"the receiver can be directly before aMapping"

	| partAfter |
	(self joined: aMapping) ifNotNil: [:joined |
		^Array with: joined].
	"or directly after aMapping"
	(aMapping joined: self) ifNotNil: [:joined |
		^Array with: joined].
	"or overlapping at the beginning (and possibly the end)"
	(aMapping source includesCode: self source first) ifFalse: [
		| mappingBefore mappingsBefore |
		mappingBefore := self mappingPartBefore: aMapping source first.
		mappingsBefore := (mappingBefore joined: aMapping)
			ifNotNil: [:joined |
			Array with: joined]
			ifNil: [
			Array
				with: mappingBefore
				with: aMapping].
		(aMapping source includesCode: self source last)
			ifTrue: [
			^mappingsBefore]
			ifFalse: [
			| mappingAfter |
			mappingAfter := self mappingPartAfter: mappingsBefore last source last.
			(mappingsBefore last joined: mappingAfter)
				ifNotNil: [:joined |
				^(mappingsBefore allButLast: 1) , (Array with: joined)]
				ifNil: [
				^mappingsBefore , (Array with: mappingAfter)]]].
	"or inside aMappings source. Then forget about it, because it is shadowed by aMapping"
	(aMapping source includesCode: self source last) ifTrue: [
		^Array with: aMapping].
	"or overlapping at the end"
	partAfter := self mappingPartAfter: aMapping source last.
	(aMapping joined: partAfter)
		ifNotNil: [:joined |
		^Array with: joined]
		ifNil: [
		^Array
			with: aMapping
			with: partAfter]
]

{ #category : #testing }
PSRangeMapping >> maps: aCode [ 
	^self source includesCode: aCode
]

{ #category : #accessing }
PSRangeMapping >> numberOfChars [
	^0
]

{ #category : #accessing }
PSRangeMapping >> numberOfCodes [
	^self source numberOfCodes
]

{ #category : #accessing }
PSRangeMapping >> numberOfCodesString [
	^self source numberOfCodesString
]

{ #category : #accessing }
PSRangeMapping >> numberOfRanges [
	^1
]

{ #category : #printing }
PSRangeMapping >> printDestinationOn: aStream [
	super printDestinationOn: aStream.
	aStream nextPutAll: '..'.
	self lastDestination printOn: aStream
]

{ #category : #printing }
PSRangeMapping >> printSourceOn: aStream [
	super printSourceOn: aStream.
	aStream nextPutAll: self numberOfCodesString
]

{ #category : #converting }
PSRangeMapping >> rangeWith: aMapping [
	^aMapping appendedToRange: self
]
