"
A segment with a idRangeOffset
"
Class {
	#name : #PtOTIndexedSegment,
	#superclass : #PtOTSegment,
	#instVars : [
		'glyphIdArrayIndex'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #specification }
PtOTIndexedSegment class >> localSpecification [
	<constant: #glyphIdArrayIndex class: #Integer comment: 'Index in glyphIdArray'>
]

{ #category : #'instance creation' }
PtOTIndexedSegment class >> startCode: startCodeInteger endCode: endCodeInteger delta: deltaInteger glyphIdArrayIndex: glyphIdArrayIndexInteger [
	| inst |
	inst := self new.
	inst
		initializeStartCode: startCodeInteger
		endCode: endCodeInteger
		delta: deltaInteger
		glyphIdArrayIndex: glyphIdArrayIndexInteger.
	^inst
]

{ #category : #accessing }
PtOTIndexedSegment >> codes [
	^(self startCode to: self endCode) collect: [:code | self glyphArrayIndexOf: code]
]

{ #category : #accessing }
PtOTIndexedSegment >> glyphArrayIndexOf: aCharacterCode [
	^self glyphIdArrayIndex + (aCharacterCode - self startCode)
]

{ #category : #accessing }
PtOTIndexedSegment >> glyphIdArrayIndex [
	"<Integer>
	Index in glyphIdArray"

	^glyphIdArrayIndex
]

{ #category : #accessing }
PtOTIndexedSegment >> glyphIndexAtCode: aCharacterCode glyphs: glyphIdArray [
	"<Integer | nil>"

	| i id |
	self startCode <= aCharacterCode ifFalse: [
		^nil].
	i := self glyphArrayIndexOf: aCharacterCode.
	id := glyphIdArray at: i + 1.
	id isZero ifTrue: [
		^nil].
	^id + self delta bitAnd: 16rFFFF
]

{ #category : #'initialize-release' }
PtOTIndexedSegment >> initializeStartCode: startCodeInteger endCode: endCodeInteger delta: deltaInteger glyphIdArrayIndex: glyphIdArrayIndexInteger [
	startCode := startCodeInteger.
	endCode := endCodeInteger.
	delta := deltaInteger.
	glyphIdArrayIndex := glyphIdArrayIndexInteger.
	self beImmutable
]

{ #category : #printing }
PtOTIndexedSegment >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'startCode' value: self startCode).
	args add: (printer constant: 'endCode' value: self endCode).
	args add: (printer constant: 'delta' value: self delta).
	args add: (printer constant: 'glyphIdArrayIndex' value: self glyphIdArrayIndex).
	^printer printvalue: self arguments: args
]
