"
Format 0: Byte encoding table

This is the Apple standard character to glyph index mapping table.
Type 		Name 				Description
USHORT 	format 				Format number is set to 0.
USHORT 	length 				This is the length in bytes of the subtable.
USHORT 	language 			Please see “Note on the language field in 'cmap' subtables“ in this document.
BYTE 		glyphIdArray[256] 	An array that maps character codes to glyph index values.

This is a simple 1 to 1 mapping of character codes to glyph indices. The glyph set is limited to 256. Note that if this format is used to index into a larger glyph set, only the first 256 glyphs will be accessible.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable0,
	#superclass : #PtOTCmapLanguageSubtable,
	#instVars : [
		'glyphIdArray'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable0 class >> formatNumber [
	^0
]

{ #category : #specification }
PtOTCmapSubtable0 class >> localSpecification [
	<constant: #glyphIdArray class: #ByteArray comment: 'An array that maps character codes to glyph index values'>
]

{ #category : #'instance creation' }
PtOTCmapSubtable0 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger glyphIdArray: glyphIdArrayByteArray [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		glyphIdArray: glyphIdArrayByteArray.
	^inst
]

{ #category : #accessing }
PtOTCmapSubtable0 >> glyphIdArray [
	"<ByteArray>
	An array that maps character codes to glyph index values"

	^glyphIdArray
]

{ #category : #accessing }
PtOTCmapSubtable0 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable0 >> indexToCode [
	^self notYetImplemented
]

{ #category : #'initialize-release' }
PtOTCmapSubtable0 >> initializePlatform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger glyphIdArray: glyphIdArrayByteArray [
	platform := platformInteger.
	encoding := encodingInteger.
	contents := contentsByteArray.
	language := languageInteger.
	glyphIdArray := glyphIdArrayByteArray.
	self beImmutable
]

{ #category : #printing }
PtOTCmapSubtable0 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'platform' value: self platform).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'contents' value: self contents).
	args add: (printer constant: 'language' value: self language).
	args add: (printer constant: 'glyphIdArray' value: self glyphIdArray).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
PtOTCmapSubtable0 >> readFrom: bytes at: offset [
	"Type  	Name  	Description
USHORT 	format 	Format number is set to 0.
USHORT 	length 	This is the length in bytes of the subtable.
USHORT 	language 	Please see “Note on the language field in 'cmap' subtables“ in this document.
BYTE 	glyphIdArray[256] 	An array that maps character codes to glyph index values."

	| subtable |
	subtable := super readFrom: bytes at: offset.
	^self class
		platform: subtable platform
		encoding: subtable encoding
		contents: subtable contents
		language: subtable language
		glyphIdArray: (subtable contents copyFrom: 6 to: subtable contents size)
]
