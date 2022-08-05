"
Range of codes

like interval based on Codes

The bounds must have the same number of bytes
"
Class {
	#name : #PSRange,
	#superclass : #PSMappingSource,
	#instVars : [
		'first',
		'last'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #'instance creation' }
PSRange class >> first: firstCode last: lastCode [
	| inst |
	inst := self new.
	inst initializeFirst: firstCode last: lastCode.
	^inst
]

{ #category : #'instance creation' }
PSRange class >> from: firstByteArray to: lastByteArray [
	^self withFirst: (PSCode bytes: firstByteArray) andLast: (PSCode bytes: lastByteArray)
]

{ #category : #'instance creation' }
PSRange class >> fromByte: firstByte to: lastByte [
	^self withFirst: (PSCode withByte: firstByte) andLast: (PSCode withByte: lastByte)
]

{ #category : #specification }
PSRange class >> localSpecification [
	<constant: #first class: #PSCode comment: 'the first, lowest code'>
	<constant: #last class: #PSCode comment: 'the last, highest code'>
]

{ #category : #'instance creation' }
PSRange class >> withFirst: firstCode andLast: lastCode [
	| inst |
	inst := self first: firstCode last: lastCode.
	inst isValid ifFalse: [
		self error: 'The range is not valid'].
	^inst
]

{ #category : #comparing }
PSRange >> < aMappingSource [
	^aMappingSource greaterThanRange: self
]

{ #category : #comparing }
PSRange >> <= aMappingSource [
	^aMappingSource greaterThanOrEqualToRange: self
]

{ #category : #converting }
PSRange >> asByteRanges [
	"<Array of: Range>
	one byte range per byte"

	self length = 1 ifTrue: [
		^Array with: self].
	^(1 to: self length) collect: [:index |
		self class fromByte: (self first bytes at: index) to: (self last bytes at: index)]
]

{ #category : #converting }
PSRange >> asCodespace [
	^PSCodespace newForRange: self
]

{ #category : #copying }
PSRange >> asRangeWithLength: anInteger [
	^self class
		from: (self first bytes first: anInteger)
		to: (self last bytes first: anInteger)
]

{ #category : #accessing }
PSRange >> codes [
	"<Array of: Code>
	only applicable to mapping sources where only the last byte can vary"

	| prefixBytes codes |
	prefixBytes := self first bytes first: self length - 1.
	(prefixBytes = (self last bytes first: self length - 1)) ifFalse: [
		^self error: 'this is not a byte range'].
	codes := OrderedCollection new: self numberOfCodes.
	self first bytes last to: self last bytes last do: [:byte |
		codes add: (PSCode bytes: prefixBytes , (ByteArray with: byte))].
	^codes asArray
]

{ #category : #accessing }
PSRange >> first [
	^first
]

{ #category : #converting }
PSRange >> firstByteRange [
	"<Range>
	one byte range for the first byte"

	self length = 1 ifTrue: [
		^self].
	^self class fromByte: self first bytes first to: self last bytes first
]

{ #category : #comparing }
PSRange >> greaterThanCode: aCode [
	^aCode < self first
]

{ #category : #comparing }
PSRange >> greaterThanOrEqualToCode: aCode [
	^aCode <= self first
]

{ #category : #testing }
PSRange >> includesCode: aCode [
	aCode length = self length ifFalse: [
		^false].
	1 to: self length do: [:index |
		((aCode bytes at: index)
			between: (self first bytes at: index)
			and: (self last bytes at: index)) ifFalse: [
				^false]].
	^true
]

{ #category : #testing }
PSRange >> includesRange: aRange [
	"A code shall be considered to match the range if it is the same length as the bounding codes 
	and the value of each of its bytes lies between the corresponding bytes of the lower and upper bounds
	(from 9.7.6.2 'CMap Mapping' of the PDF spec)"

	^(self includesCode: aRange first) and: [
	self includesCode: aRange last]
]

{ #category : #'initialize-release' }
PSRange >> initializeFirst: firstCode last: lastCode [
	first := firstCode.
	last := lastCode.
	self beImmutable
]

{ #category : #accessing }
PSRange >> interval [
	"<Interval>"

	^self first asInteger to: self last asInteger
]

{ #category : #testing }
PSRange >> isAfterCode: aCode [
	^aCode isNext: self first
]

{ #category : #testing }
PSRange >> isAfterRange: aRange [
	| found |
	found := false.
	aRange asByteRanges with: self asByteRanges do: [:start :next |
		start = next ifFalse: [
			(found not and: [
			start last isNext: next first])
					ifTrue: [found := true]
					ifFalse: [
					^false]]].
	^found
]

{ #category : #testing }
PSRange >> isBefore: aMappingSource [	
	^self last < aMappingSource first
]

{ #category : #testing }
PSRange >> isInRange: aRange [
	^aRange includesRange: self
]

{ #category : #testing }
PSRange >> isNext: aMappingSource [
	^aMappingSource isAfterRange: self
]

{ #category : #testing }
PSRange >> isValid [
	^self first length = self last length and: [
	self first <= self last]
]

{ #category : #testing }
PSRange >> joinedRange: aFollowingRange [
	"<Range | nil>
	joined when all byte dimension ranges are the same except for one which can join"

	| found newByteRanges newFirst newLast |
	self length = aFollowingRange length ifFalse: [
		^nil].
	found := false.
	newByteRanges := OrderedCollection new.
	self asByteRanges with: aFollowingRange asByteRanges do: [:start :next |
		start = next
			ifTrue: [newByteRanges add: start]
			ifFalse: [
			(found not and: [
			start last isNext: next first])
					ifTrue: [
					found := true.
					newByteRanges add: (start first to: next last)]
					ifFalse: [
					^nil]]].
	found ifFalse: [
		^nil].
	newFirst := PSCode bytes: (ByteArray withAll: ((newByteRanges collect: #first) collect: #firstByte)).
	newLast := PSCode bytes: (ByteArray withAll: ((newByteRanges collect: #last) collect: #firstByte)).
	^newFirst to: newLast
]

{ #category : #accessing }
PSRange >> last [
	^last
]

{ #category : #accessing }
PSRange >> length [
	^self first length
]

{ #category : #accessing }
PSRange >> mappingClass [
	^PSRangeMapping
]

{ #category : #accessing }
PSRange >> numberOfCodes [
	| bytes |
	bytes := 1.
	self first bytes with: self last bytes do: [:byte1 :byte2 | bytes := (byte2 - byte1 + 1) * bytes].
	^bytes
]

{ #category : #accessing }
PSRange >> numberOfCodesString [
	^'[' , (NumberPrintPolicy print: self numberOfCodes using: '#,##0') asString , ']'
]

{ #category : #testing }
PSRange >> overlaps: aRange [
	"Answer whether aRange has common elements with the receiver"

	aRange length = self length ifTrue: [
		^(self includesCode: aRange first) or: [
		(self includesCode: aRange last) or: [
		(aRange includesCode: self first) or: [
		aRange includesCode: self last]]]].
	aRange length > self length ifTrue: [
		^aRange overlaps: self].
	"aRange is shorter"
	^(self asRangeWithLength: aRange length) overlaps: aRange
]

{ #category : #printing }
PSRange >> printOn: aStream [
	self first printOn: aStream.
	aStream nextPutAll: '..'.
	self last printOn: aStream
]

{ #category : #printing }
PSRange >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'first' value: self first).
	args add: (printer constant: 'last' value: self last).
	^printer printvalue: self arguments: args
]

{ #category : #converting }
PSRange >> withoutFirstByte [
	^self first withoutFirstByte to: self last withoutFirstByte
]
