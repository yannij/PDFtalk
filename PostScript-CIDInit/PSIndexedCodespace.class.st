"
A codespace with an array of codespaces

It has a fixed array of codespaces for the range of the first byte.

The first byte is an index to another codespace (indexed by the remaining bytes).

Instances are the intermediate nodes in the codespace tree
"
Class {
	#name : #PSIndexedCodespace,
	#superclass : #PSCodespace,
	#instVars : [
		'codespaces'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #specification }
PSIndexedCodespace class >> localSpecification [
	<sequence: #codespaces comment: '<Array of: Codespace>
	During construction, instances are not immutable, but are modified - cheating Values'>
]

{ #category : #'instance creation optional' }
PSIndexedCodespace class >> range: rangeRange [
	^self range: rangeRange codespaces: nil
]

{ #category : #'instance creation' }
PSIndexedCodespace class >> range: rangeRange codespaces: codespacesArray [
	| inst |
	inst := self new.
	inst initializeRange: rangeRange codespaces: codespacesArray.
	^inst
]

{ #category : #adding }
PSIndexedCodespace >> addMapping: aMapping [
	(self codespaceAt: aMapping source first firstByte) addMapping: aMapping withoutFirstByte
]

{ #category : #accessing }
PSIndexedCodespace >> allMappings [
	"<SequenceableCollection of: Mapping>"

	^(self codespaces reject: #isNil) inject: OrderedCollection new into: [:list :codespace |
		list addAll: codespace allMappings.
		list]
]

{ #category : #accessing }
PSIndexedCodespace >> at: aCode ifAbsent: absentBlock [
	"<Mapping>"

	(self range includesCode: aCode) ifFalse: [
		^absentBlock value].
	(self codespaces at: (self codespaceIndexFor: aCode firstByte)) ifNotNil: [:codespace |
		^codespace at: aCode withoutFirstByte ifAbsent: absentBlock].
	^absentBlock value
]

{ #category : #accessing }
PSIndexedCodespace >> codespaceAt: aByte [
	| index codespace |
	index := self codespaceIndexFor: aByte.
	codespace := self codespaces at: index.
	codespace ifNil: [
		codespace := PSCodespace newForRange: self range withoutFirstByte.
		self codespaces at: index put: codespace].
	^codespace
]

{ #category : #accessing }
PSIndexedCodespace >> codespaceIndexFor: aByte [
	"<Integer>
	the internal index into the array of codespaces"

	^aByte - self firstIndex + 1
]

{ #category : #accessing }
PSIndexedCodespace >> codespaces [
	"<Array of: Codespace>
	During construction, instances are not immutable, but are modified - cheating Values"

	^codespaces ifNil: [codespaces := Array new: self range firstByteRange numberOfCodes]
]

{ #category : #copying }
PSIndexedCodespace >> copyWithArrays [
	^self class
		range: self range
		codespaces: (self codespaces collect: [:item |
			item ifNotNil: [item copyWithArrays]])
]

{ #category : #accessing }
PSIndexedCodespace >> firstIndex [
	^self range first firstByte
]

{ #category : #testing }
PSIndexedCodespace >> hasMappings [
	^(self codespaces reject: #isNil) anySatisfy: #hasMappings
]

{ #category : #'initialize-release' }
PSIndexedCodespace >> initializeRange: rangeRange codespaces: codespacesArray [
	range := rangeRange.
	(codespacesArray notNil and: [
	codespacesArray notEmpty]) ifTrue: [
			codespaces := (Array withAll: codespacesArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
PSIndexedCodespace >> mappings [
	^(self codespaces reject: #isNil) inject: OrderedCollection new into: [:list :codespace |
		list addAll: codespace mappings.
		list]
]

{ #category : #accessing }
PSIndexedCodespace >> numberOfChars [
	^(self codespaces reject: #isNil) inject: 0 into: [:sum :codespace | sum + codespace numberOfChars]
]

{ #category : #accessing }
PSIndexedCodespace >> numberOfMappedCodes [
	^(self codespaces reject: #isNil) inject: 0 into: [:sum :codespace | sum + codespace numberOfMappedCodes]
]

{ #category : #accessing }
PSIndexedCodespace >> numberOfMappings [
	^(self codespaces reject: #isNil) inject: 0 into: [:sum :codespace | sum + codespace numberOfMappings]
]

{ #category : #accessing }
PSIndexedCodespace >> numberOfRanges [
	^(self codespaces reject: #isNil) inject: 0 into: [:sum :codespace | sum + codespace numberOfRanges]
]

{ #category : #printing }
PSIndexedCodespace >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'range' value: self range).
	args add: (printer array: 'codespaces' value: self codespaces).
	^printer printvalue: self arguments: args
]
