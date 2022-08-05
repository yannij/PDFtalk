"
Each Range describes a group of sequential SIDs.
The number of ranges is not explicitly specified in the font.
Instead, software utilizing this data simply processes ranges until all glyphs in the font are covered.
This format is particularly suited to charsets that are well ordered.
"
Class {
	#name : #CFFCharset1,
	#superclass : #CFFCharset,
	#instVars : [
		'ranges'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #specification }
CFFCharset1 class >> localSpecification [
	<sequence: #ranges>
]

{ #category : #'instance creation' }
CFFCharset1 class >> nLeftFrom: aByteStream [
	^aByteStream next
]

{ #category : #'instance creation' }
CFFCharset1 class >> numberOfGlyphs: numberOfGlyphs fromBytes: aByteStream [
	| ranges namesToRead |
	ranges := OrderedCollection new.
	namesToRead := numberOfGlyphs - 1.
	[namesToRead strictlyPositive] whileTrue: [
		| range |
		range := CFFRange first: (self sidFrom: aByteStream) nLeft: (self nLeftFrom: aByteStream).
		ranges add: range.
		namesToRead := namesToRead - (range nLeft + 1)].
	^self ranges: ranges
]

{ #category : #'instance creation' }
CFFCharset1 class >> ranges: rangesArray [
	| inst |
	inst := self new.
	inst initializeRanges: rangesArray.
	^inst
]

{ #category : #'initialize-release' }
CFFCharset1 >> initializeRanges: rangesArray [
	(rangesArray notNil and: [
	rangesArray notEmpty]) ifTrue: [
			ranges := (Array withAll: rangesArray) beImmutable].
	self beImmutable
]

{ #category : #printing }
CFFCharset1 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'ranges' value: self ranges).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFCharset1 >> ranges [
	"<Array>"

	^ranges ifNil: [#()]
]

{ #category : #accessing }
CFFCharset1 >> sids [
	| wst |
	wst := WriteStream on: Array new.
	wst nextPut: 0.
	self ranges do: [:range | wst nextPutAll: range values].
	^wst contents
]
