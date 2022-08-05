"
Encoding Format 1

Each Range1 describes a group of sequential codes.
For example, the codes 51 52 53 54 55 could be represented by the Range1: 51 4,
and a perfectly ordered encoding of 256 codes can be described with the Range1: 0 255.

This format is particularly suited to encodings that are well ordered.
"
Class {
	#name : #CFFEncoding1,
	#superclass : #CFFEncoding,
	#instVars : [
		'ranges',
		'supplement'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFEncoding1 class >> fromBytes: aByteStream [
	| formatByte hasSupplement nRanges ranges |
	formatByte := aByteStream next.
	hasSupplement := (formatByte bitAnd: 16r80) isZero not.
	nRanges := aByteStream next.
	ranges := OrderedCollection new: nRanges.
	nRanges timesRepeat: [
		ranges add: (CFFRange first: aByteStream next nLeft: aByteStream next)].
	hasSupplement ifFalse: [
		^self ranges: ranges].
	^self ranges: ranges supplement: (CFFEncodingSupplement fromBytes: aByteStream)
]

{ #category : #specification }
CFFEncoding1 class >> localSpecification [
	<sequence: #ranges>
	<optional: #supplement class: #CFFEncodingSupplement default: 'EncodingSupplement new'>
]

{ #category : #'instance creation optional' }
CFFEncoding1 class >> ranges: rangesArray [
	| inst |
	inst := self new.
	inst initializeRanges: rangesArray supplement: nil.
	^inst
]

{ #category : #'instance creation' }
CFFEncoding1 class >> ranges: rangesArray supplement: supplementEncodingSupplement [
	| inst |
	inst := self new.
	inst initializeRanges: rangesArray supplement: supplementEncodingSupplement.
	^inst
]

{ #category : #'instance creation optional' }
CFFEncoding1 class >> supplement: supplementEncodingSupplement [
	| inst |
	inst := self new.
	inst initializeRanges: nil supplement: supplementEncodingSupplement.
	^inst
]

{ #category : #'initialize-release' }
CFFEncoding1 >> initializeRanges: rangesArray supplement: supplementEncodingSupplement [
	(rangesArray notNil and: [
	rangesArray notEmpty]) ifTrue: [
			ranges := (Array withAll: rangesArray) beImmutable].
	(supplementEncodingSupplement notNil and: [
	self supplement ~= supplementEncodingSupplement]) ifTrue: [
			supplement := supplementEncodingSupplement].
	self beImmutable
]

{ #category : #printing }
CFFEncoding1 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'ranges' value: self ranges).
	args add: (printer optional: 'supplement' value: supplement).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFEncoding1 >> ranges [
	"<Array>"

	^ranges ifNil: [#()]
]

{ #category : #accessing }
CFFEncoding1 >> supplement [
	"<EncodingSupplement>"

	^supplement ifNil: [CFFEncodingSupplement new]
]
