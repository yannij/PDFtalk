"
A codespace with a range of potential mappings and the actual mappings

Multi byte codespace ranges create a tree of codespaces , each responsible for one byte.
The last byte is taken care of by ByteCodespaces, forming the leafs of the tree.
The byte ranges before are represented by IndexedCodespace, forming the intermediate nodes of the tree.
Example:
	A range <3020>..<407F> results in an IndexedCodespace for range <30>..<40> with an array with 17 slots.
	Each slot may hold a ByteCodespace with range <20>..<7F> with an ordered list of mappings.
	The codespaces are created on demand when mappings in that range are added.

The mappings are indexed by code
"
Class {
	#name : #PSCodespace,
	#superclass : #Value,
	#instVars : [
		'range'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #specification }
PSCodespace class >> localSpecification [
	<constant: #range class: #PSRange comment: 'byte range of potential mappings'>
]

{ #category : #'instance creation' }
PSCodespace class >> newForRange: aRange [
	"creates a mutable version for incremental buildup"

	| inst |
	inst := aRange length = 1
		ifTrue: [PSByteCodespace new]
		ifFalse: [PSIndexedCodespace new].
	inst initializeMutableWithRange: aRange.
	^inst
]

{ #category : #'instance creation' }
PSCodespace class >> range: rangeRange [
	| inst |
	inst := self new.
	inst initializeRange: rangeRange.
	^inst
]

{ #category : #adding }
PSCodespace >> addMapping: aMapping [
	"add aMapping to the receiver
	create substructures on demand"
	
	self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> allMappings [
	"<SequenceableCollection of: Mapping>"

	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> at: aCode [
	"<Object | nil>"

	^self at: aCode ifAbsent: [nil]
]

{ #category : #accessing }
PSCodespace >> at: aCode ifAbsent: absentBlock [
	"<Mapping>"

	^self subclassResponsibility
]

{ #category : #testing }
PSCodespace >> canMap: aMapping [
	^aMapping source isInRange: self range
]

{ #category : #accessing }
PSCodespace >> codeLength [
	^self range length
]

{ #category : #copying }
PSCodespace >> copyWithArrays [
	"copy as immutable value"

	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> from [
	"<ByteArray>
	the lower bound"

	^self range from
]

{ #category : #testing }
PSCodespace >> hasMappings [
	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PSCodespace >> initializeMutableWithRange: rangeRange [
	range := rangeRange
]

{ #category : #'initialize-release' }
PSCodespace >> initializeRange: rangeRange [
	range := rangeRange.
	self beImmutable
]

{ #category : #accessing }
PSCodespace >> mappings [
	"<SequenceableCollection of: Mapping>"

	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> numberOfChars [
	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> numberOfCodes [
	"<Integer>
	number of potential codes in this codespace range"

	^self range numberOfCodes
]

{ #category : #accessing }
PSCodespace >> numberOfMappedCodes [
	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> numberOfMappings [
	^self subclassResponsibility
]

{ #category : #accessing }
PSCodespace >> numberOfRanges [
	^self subclassResponsibility
]

{ #category : #printing }
PSCodespace >> printOn: aStream [
	aStream
		nextPutAll: self class name asString;
		nextPut: $(.
	self range printOn: aStream.
	aStream
		nextPut: $);
		nextPutAll: self range firstByteRange numberOfCodesString
]

{ #category : #printing }
PSCodespace >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'range' value: self range).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PSCodespace >> range [
	"<Range>
	the range of potential mappings"

	^range
]

{ #category : #accessing }
PSCodespace >> to [
	"<ByteArray>
	the upper bound"

	^self range to
]
