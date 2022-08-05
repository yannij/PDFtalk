"
""The Compact Font Format Specification"", Adobe Technical Note #5176.

This document describes the specification of a font format that is suitable for compactly representing one or more Type 1 or CID-keyed fonts. 
Unlike previous Type 1 and CID-keyed font formats, CFF allows multiple fonts to be stored together in a unit called a FontSet. 
Principal space savings are a result of using a compact binary representation for most of the information, sharing of common data between fonts, and defaulting frequently occurring data.

The CFF format is designed to be used in conjunction with Type 2 charstrings for the character description procedures (see Adobe Technical Note #5177: “The Type 2 Charstring Format”).
The design supports the embedding of PostScript® language code which permits additional flexibility and extensibility of the format when used in printer environments.
"
Class {
	#name : #CFFFontSet,
	#superclass : #Object,
	#instVars : [
		'version',
		'fonts'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFFontSet class >> for: anOpenTypeFile fromBytes: aByteStream [
	| header version names topDicts strings globalSubr fonts |
	header := CFFHeader fromBytes: aByteStream.
	version := header version.
	aByteStream skip: header hdrSize - 4.
	names := CFFIndex stringsFromBytes: aByteStream.
	topDicts := CFFIndex fromBytes: aByteStream collect: [:data |
		CFFTopDict fromBytes: data readStream].
	strings := CFFIndex stringsFromBytes: aByteStream.
	globalSubr := CFFIndex fromBytes: aByteStream collect: [:data | CFFSubroutine bytes: data].
	fonts := OrderedCollection new.
	names with: topDicts do: [:fontName :topDict |
		fonts add: (topDict
			fontNamed: fontName
			file: anOpenTypeFile
			strings: strings
			globalSubr: globalSubr
			from: aByteStream)].
	^self version: version fonts: fonts
]

{ #category : #'instance creation' }
CFFFontSet class >> version: versionVersion fonts: fontsArray [
	| inst |
	inst := self new.
	inst initializeVersion: versionVersion fonts: fontsArray.
	^inst
]

{ #category : #accessing }
CFFFontSet >> fonts [
	"<Array of: Font>"

	^fonts
]

{ #category : #accessing }
CFFFontSet >> forceBold [
	"<Boolean>"

	^self fonts first forceBold
]

{ #category : #'initialize-release' }
CFFFontSet >> initializeVersion: versionVersion fonts: fontsArray [
	version := versionVersion.
	(fontsArray notNil and: [
	fontsArray notEmpty]) ifTrue: [
			fonts := (Array withAll: fontsArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
CFFFontSet >> nameOfGlyph: aGlyphId [
	"<String>"

	^self fonts first nameOfGlyph: aGlyphId
]

{ #category : #printing }
CFFFontSet >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'version' value: self version).
	args add: (printer array: 'fonts' value: self fonts).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFFontSet >> version [
	"<Float>"

	^version
]
