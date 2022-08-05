"
Encoding Supplement

A few fonts have multiply-encoded glyphs which are not supported directly by any of the above formats.
This situation is indicated by setting the high-order bit in the format byte and supplementing the encoding, regardless of format type.

Each Supplement describes a single code-to-glyph mapping which provides another encoding for a glyph that has already been mentioned in the main encoding table.
"
Class {
	#name : #CFFEncodingSupplement,
	#superclass : #CFFMapping,
	#instVars : [
		'glyphsAtCode'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFEncodingSupplement class >> fromBytes: aByteStream [
	| dict |
	dict := Valuemap new.
	aByteStream next timesRepeat: [
		dict at: aByteStream next put: (self sidFrom: aByteStream)].
	^self glyphsAtCode: dict
]

{ #category : #'instance creation' }
CFFEncodingSupplement class >> glyphsAtCode: glyphsAtCodeDictionary [
	| inst |
	inst := self new.
	inst initializeGlyphsAtCode: glyphsAtCodeDictionary.
	^inst
]

{ #category : #specification }
CFFEncodingSupplement class >> localSpecification [
	<map: #glyphsAtCode>
]

{ #category : #accessing }
CFFEncodingSupplement >> glyphsAtCode [
	"<Dictionary>"

	^glyphsAtCode ifNil: [Dictionary new beImmutable]
]

{ #category : #'initialize-release' }
CFFEncodingSupplement >> initializeGlyphsAtCode: glyphsAtCodeDictionary [
	(glyphsAtCodeDictionary notNil and: [
	glyphsAtCodeDictionary notEmpty]) ifTrue: [
			glyphsAtCode := (Valuemap withAll: glyphsAtCodeDictionary) beImmutable].
	self beImmutable
]

{ #category : #printing }
CFFEncodingSupplement >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer dictionary: 'glyphsAtCode' value: self glyphsAtCode).
	^printer printvalue: self arguments: args
]
