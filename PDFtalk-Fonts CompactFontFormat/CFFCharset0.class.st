"
Each element of the glyph array represents the name of the corresponding glyph.
This format should be used when the SIDs are in a fairly random order.
The number of glyphs (nGlyphs) is the value of the count field in the CharStrings INDEX.
(There is one less element in the glyph name array than nGlyphs because the .notdef glyph name is omitted.)
"
Class {
	#name : #CFFCharset0,
	#superclass : #CFFCharset,
	#instVars : [
		'glyphs'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFCharset0 class >> glyphs: glyphsArray [
	| inst |
	inst := self new.
	inst initializeGlyphs: glyphsArray.
	^inst
]

{ #category : #specification }
CFFCharset0 class >> localSpecification [
	<sequence: #glyphs comment: 'Glyph name array'>
]

{ #category : #'instance creation' }
CFFCharset0 class >> numberOfGlyphs: numberOfGlyphs fromBytes: aByteStream [
	| glyphs |
	glyphs := OrderedCollection new: numberOfGlyphs - 1.
	numberOfGlyphs - 1 timesRepeat: [glyphs add: (self sidFrom: aByteStream)].
	^self glyphs: glyphs
]

{ #category : #accessing }
CFFCharset0 >> glyphs [
	"<Array>
	Glyph name array"

	^glyphs ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFCharset0 >> initializeGlyphs: glyphsArray [
	(glyphsArray notNil and: [
	glyphsArray notEmpty]) ifTrue: [
			glyphs := (Array withAll: glyphsArray) beImmutable].
	self beImmutable
]

{ #category : #printing }
CFFCharset0 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'glyphs' value: self glyphs).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFCharset0 >> sids [
	^#(0), self glyphs
]
