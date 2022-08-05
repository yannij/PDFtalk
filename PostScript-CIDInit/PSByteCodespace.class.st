"
A codespace with an ordered collection of mappings

On creation, mappings are added one by one, possibly overwriting existing ones.
The mappings are at any moment in a canonical form and totally ordered (no overlap).
	- no duplicated source code (later wins)
	- no single code range mapping (converted to a char mapping)
	- no neighboring mappings (joined to range mappings)

Instances are the leaf nodes in the codespace tree
"
Class {
	#name : #PSByteCodespace,
	#superclass : #PSCodespace,
	#instVars : [
		'mappings'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #specification }
PSByteCodespace class >> localSpecification [
	<sequence: #mappings comment: '<Array of: Mapping>
	During construction, instances are not immutable, but are modified - cheating Values'>
]

{ #category : #'instance creation optional' }
PSByteCodespace class >> range: rangeRange [
	^self range: rangeRange mappings: nil
]

{ #category : #'instance creation' }
PSByteCodespace class >> range: rangeRange mappings: mappingsArray [
	| inst |
	inst := self new.
	inst initializeRange: rangeRange mappings: mappingsArray.
	^inst
]

{ #category : #adding }
PSByteCodespace >> addMapping: aMapping [
	"canonical form of char and range mappings:
		- orderedMappings contain only mappings with the same source length
		- no duplicated source code (later wins)
		- no single code range mapping (converted to a char mapping)
		- no neighboring mappings (joined to range mappings)"

	self mappings isEmpty ifTrue: [
		mappings := OrderedCollection new: self range numberOfCodes.
		self mappings add: aMapping.
		^self].
	(self mappings last source isBefore: aMapping source) ifTrue: [
		(self mappings last joined: aMapping) ifNotNil: [:joined |
			self mappings at: self mappings size put: joined.
			^self].
		self mappings add: aMapping.
		^self].
	self overwriteMapping: aMapping
]

{ #category : #accessing }
PSByteCodespace >> allMappings [
	^self mappings
]

{ #category : #accessing }
PSByteCodespace >> at: aCode ifAbsent: absentBlock [
	(self range includesCode: aCode) ifFalse: [
		^absentBlock value].
	^self mappings detect: [:mapping | mapping maps: aCode] ifNone: absentBlock
]

{ #category : #copying }
PSByteCodespace >> copyWithArrays [
	^self class range: self range mappings: self mappings asArray
]

{ #category : #testing }
PSByteCodespace >> hasMappings [
	^self mappings notEmpty
]

{ #category : #adding }
PSByteCodespace >> indexIntervalOfMappingsTouching: aMapping [
	"<Interval>
	indexes of all mappings touching aMapping
	called when aMapping could not be added as last mapping"

	| start end |
	1 to: self mappings size do: [:index |
		((self mappings at: index) isBeforeAndNotAttaching: aMapping) ifFalse: [
			start := index.
			end := start - 1.
			start to: self mappings size do: [:i |
				((self mappings at: i) isAfterAndNotAttaching: aMapping)
					ifFalse: [end := i]
					ifTrue: [
					^start to: end]].
			^start to: end]].
	"all elements are before aMapping. This should never happen"
	^self halt
]

{ #category : #'initialize-release' }
PSByteCodespace >> initializeRange: rangeRange mappings: mappingsArray [
	range := rangeRange.
	(mappingsArray notNil and: [
	mappingsArray notEmpty]) ifTrue: [
			mappings := (Array withAll: mappingsArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
PSByteCodespace >> mappings [
	"<Array of: Mapping>
	During construction, instances are not immutable, but are modified - cheating Values"

	^mappings ifNil: [#()]
]

{ #category : #accessing }
PSByteCodespace >> numberOfChars [
	^self mappings inject: 0 into: [:sum :mapping | sum + mapping numberOfChars]
]

{ #category : #accessing }
PSByteCodespace >> numberOfMappedCodes [
	^self mappings inject: 0 into: [:sum :mapping | sum + mapping numberOfCodes]
]

{ #category : #accessing }
PSByteCodespace >> numberOfMappings [
	^self mappings size
]

{ #category : #accessing }
PSByteCodespace >> numberOfRanges [
	^self mappings inject: 0 into: [:sum :mapping | sum + mapping numberOfRanges]
]

{ #category : #adding }
PSByteCodespace >> overwriteMapping: aMapping [
	"destructively modifies mappings"

	| touchingIndexInterval firsttouching firstMappings lasttouching |
	touchingIndexInterval := self indexIntervalOfMappingsTouching: aMapping.
	touchingIndexInterval isEmpty ifTrue: [
		self mappings add: aMapping beforeIndex: touchingIndexInterval first.
		"the first entry not before is after aMapping => just insert aMapping before"
		^self].
	"only the first and last one have to be considered, all others are dropped"
	firsttouching := self mappings at: touchingIndexInterval first.
	touchingIndexInterval size = 1 ifTrue: [
		self
			replaceAt: touchingIndexInterval first
			withAll: (firsttouching mappingsOverwrittenBy: aMapping).
		^self].
	firstMappings := firsttouching mappingsOverwrittenBy: aMapping.
	lasttouching := self mappings at: touchingIndexInterval last.
	self
		replaceAtAll: touchingIndexInterval
		withAll: (firstMappings allButLast: 1) , (lasttouching mappingsOverwrittenBy: firstMappings last).
	^self
]

{ #category : #printing }
PSByteCodespace >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'range' value: self range).
	args add: (printer array: 'mappings' value: self mappings).
	^printer printvalue: self arguments: args
]

{ #category : #modifying }
PSByteCodespace >> replaceAt: anIndex withAll: someMappings [
	someMappings isEmpty ifTrue: [
		self mappings removeIndex: anIndex.
		^self].
	self mappings at: anIndex put: someMappings first.
	someMappings size = 1 ifTrue: [
		^self].
	(someMappings allButFirst: 1) withIndexDo: [:mapping :index |
		self mappings add: mapping beforeIndex: anIndex + index]
]

{ #category : #modifying }
PSByteCodespace >> replaceAtAll: anInterval withAll: someElements [
	someElements isEmpty ifTrue: [
		self mappings removeFrom: anInterval first to: anInterval last.
		^self].
	anInterval size <= someElements size ifTrue: [
		self mappings
			replaceFrom: anInterval first
			to: anInterval last
			with: (someElements first: anInterval size).
		(someElements allButFirst: anInterval size) withIndexDo: [:mapping :index |
			self mappings add: mapping beforeIndex: anInterval last + index].
		^self].
	self mappings
		replaceFrom: anInterval first
		to: anInterval first + someElements size - 1
		with: someElements.
	self mappings removeFrom: anInterval first + someElements size to: anInterval last
]
