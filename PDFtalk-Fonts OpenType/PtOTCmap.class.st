"
This table defines the mapping of character codes to the glyph index values used in the font. It may contain more than one subtable, in order to support more than one character encoding scheme. Character codes that do not correspond to any glyph in the font should be mapped to glyph index 0. The glyph at this location must be a special glyph representing a missing character, commonly known as .notdef.

The table header indicates the character encodings for which subtables are present. Each subtable is in one of seven possible formats and begins with a format code indicating the format used.

The platform ID and platform-specific encoding ID in the header entry (and, in the case of the Macintosh platform, the language field in the subtable itself) are used to specify a particular 'cmap' encoding. The header entries must be sorted first by platform ID, then by platform-specific encoding ID, and then by the language field in the corresponding subtable. Each platform ID, platform-specific encoding ID, and subtable language combination may appear only once in the 'cmap' table.

"
Class {
	#name : #PtOTCmap,
	#superclass : #PtOTTable,
	#instVars : [
		'encodingTables'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmap class >> tag [
	^'cmap'
]

{ #category : #accessing }
PtOTCmap >> codeForGlyph: aGlyphId [
	^self platformTable codeForGlyph: aGlyphId
]

{ #category : #accessing }
PtOTCmap >> createEncodingTables [
	"The cmap table header is followed by an array of encoding records that specify the particular encoding and the offset to the subtable for that encoding. 
The number of encoding records is numTables. An encoding record entry looks like:
Record Type 	Name 		Description
USHORT 		platformID 	Platform ID.
USHORT 		encodingID 	Platform-specific encoding ID.
ULONG 		offset 		Byte offset from beginning of table to the subtable for this encoding."

	| b subtableClass subtable |
	b := self bytes.
	^(1 to: self numTables) collect: [:i |
		| pos platformID encodingID offset format |
		pos := (i - 1) * 8 + 5.
		platformID := b unsignedShortAt: pos.
		encodingID := b unsignedShortAt: pos + 2.
		offset := b unsignedLongAt: pos + 4.
		format := b unsignedShortAt: offset + 1.
		subtableClass := PtOTCmapSubtable subclassFor: format.
		subtable := subtableClass platform: platformID encoding: encodingID contents: ByteArray new.
		subtable readFrom: self contents at: offset]
]

{ #category : #accessing }
PtOTCmap >> encodingTables [
	"<Dictionary key: Integer value: CmapSubtable"

	^encodingTables ifNil: [
		| dict |
		dict := Valuemap new.
		self createEncodingTables do: [:table |
			(dict at: table platform ifAbsentPut: [OrderedCollection new]) add: table].
		encodingTables := dict]
]

{ #category : #accessing }
PtOTCmap >> glyphIndexAtUnicode: aUnicodeInteger [
	"<Integer | nil>"

	^self platformTable glyphIndexAtUnicode: aUnicodeInteger
]

{ #category : #accessing }
PtOTCmap >> numTables [
	"USHORT  	numTables  	Number of encoding tables that follow."

	^self bytes unsignedShortAt: 3
]

{ #category : #accessing }
PtOTCmap >> platformTable [
	"<CmapSubtable"

	^self platformTables first
]

{ #category : #accessing }
PtOTCmap >> platformTables [
	"<SequenceableCollection of: CmapSubtable"

	^self encodingTables at: self platformID
]

{ #category : #accessing }
PtOTCmap >> tables [
	^self encodingTables values inject: OrderedCollection new into: [:list :tables | list , tables]
]

{ #category : #accessing }
PtOTCmap >> version [
	"USHORT  	version  	Table version number (0)."

	^self bytes unsignedShortAt: 1
]
