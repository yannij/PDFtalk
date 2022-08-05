"
A cmap subtable supports one character encoding scheme. Character codes that do not correspond to any glyph in the font should be mapped to glyph index 0. The glyph at this location must be a special glyph representing a missing character, commonly known as .notdef.

The table header indicates the character encodings for which subtables are present. Each subtable is in one of seven possible formats and begins with a format code indicating the format used.

The platform ID and platform-specific encoding ID in the header entry (and, in the case of the Macintosh platform, the language field in the subtable itself) are used to specify a particular 'cmap' encoding. The header entries must be sorted first by platform ID, then by platform-specific encoding ID, and then by the language field in the corresponding subtable. Each platform ID, platform-specific encoding ID, and subtable language combination may appear only once in the 'cmap' table.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable,
	#superclass : #Value,
	#instVars : [
		'platform',
		'encoding',
		'contents'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable class >> formatNumber [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #specification }
PtOTCmapSubtable class >> localSpecification [
	<constant: #platform class: #Integer comment: 'Platform ID'>
	<constant: #encoding class: #Integer comment: 'Platform-specific encoding ID'>
	<constant: #contents class: #ByteArray comment: 'Bytes of this subtable'>
]

{ #category : #'instance creation' }
PtOTCmapSubtable class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray.
	^inst
]

{ #category : #accessing }
PtOTCmapSubtable class >> subclassFor: formatInteger [
	^self allSubclasses detect: [:sc |
		sc subclasses isEmpty and: [
		sc formatNumber = formatInteger]]
]

{ #category : #accessing }
PtOTCmapSubtable >> codeForGlyph: aGlyphId [
	^self indexToCode at: aGlyphId ifAbsent: [Character illegalCode]
]

{ #category : #accessing }
PtOTCmapSubtable >> contents [
	"<ByteArray>
	Bytes of this subtable"

	^contents
]

{ #category : #accessing }
PtOTCmapSubtable >> encoding [
	"<Integer>
	Platform-specific encoding ID"

	^encoding
]

{ #category : #accessing }
PtOTCmapSubtable >> formatNumber [
	"<Integer>"

	^self class formatNumber
]

{ #category : #accessing }
PtOTCmapSubtable >> glyphIndexAtUnicode: aUnicodeInteger [
	"<Integer | nil>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtOTCmapSubtable >> indexToCode [
	"<Dictionary key: Integer value: Integer>"

	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PtOTCmapSubtable >> initializePlatform: platformInteger encoding: encodingInteger contents: contentsByteArray [
	platform := platformInteger.
	encoding := encodingInteger.
	contents := contentsByteArray.
	self beImmutable
]

{ #category : #accessing }
PtOTCmapSubtable >> platform [
	"<Integer>
	Platform ID"

	^platform
]

{ #category : #printing }
PtOTCmapSubtable >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'platform' value: self platform).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'contents' value: self contents).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
PtOTCmapSubtable >> readFrom: uninterpretedBytes at: offset [
	"<CmapSubtable>"

	^self subclassResponsibility
]
