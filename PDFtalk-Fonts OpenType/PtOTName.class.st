"
The naming table allows multilingual strings to be associated with the OpenTypeTM font file. These strings can represent copyright notices, font names, family names, style names, and so on. To keep this table short, the font manufacturer may wish to make a limited set of entries in some small set of languages; later, the font can be ""localized"" and the strings translated or added. Other parts of the OpenType font file that require these strings can then refer to them simply by their index number. Clients that need a particular string can look it up by its platform ID, character encoding ID, language ID and name ID. Note that some platforms may require single byte character strings, while others may require double byte strings.

"
Class {
	#name : #PtOTName,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTName class >> tag [
	^'name'
]

{ #category : #accessing }
PtOTName >> count [
	"USHORT  	count  	Number of name records."

	^self bytes unsignedShortAt: 3
]

{ #category : #accessing }
PtOTName >> format [
	"USHORT  	format  	Format selector (=0)."

	^self bytes unsignedShortAt: 1
]

{ #category : #accessing }
PtOTName >> nameAt: nameId [
	"<String | nil>
	returns a string from the names table with ID nameId.
	Incoplete implementation (should be able to map language and encoding IDs properly).
	So, you may not get the string in the correct encoding/language, 
	but if there is a string with the right ID, one of its variants will be returned."

	| allNames platformNames |
	allNames := self nameRecords select: [:nameRecord | nameRecord nameID = nameId].
	allNames isEmpty ifTrue: [
		^nil].
	platformNames := allNames select: [:nameRecord | nameRecord platformID = self platformID].
	platformNames isEmpty ifTrue: [
		^allNames first string].
	^platformNames first string
]

{ #category : #accessing }
PtOTName >> nameRecords [
	"<SequenceableCollection of: NameRecord>
	NameRecord  	nameRecord[count]  	The name records where count is the number of records."

	| length start stringOffset |
	stringOffset := self stringOffset.
	^(1 to: self count) collect: [:i |
		| offset bytes platformID encodingID languageID nameID |
		offset := 7 + (12 * (i - 1)).
		bytes := ByteReadStream bigEndianOn: (self contents copyFrom: offset to: offset + 11).
		platformID := bytes nextUnsignedShort.
		encodingID := bytes nextUnsignedShort.
		languageID := bytes nextUnsignedShort.
		nameID := bytes nextUnsignedShort.
		length := bytes nextUnsignedShort.
		start := stringOffset + bytes nextUnsignedShort.
		PtOTNameRecord
			platformID: platformID
			encodingID: encodingID
			languageID: languageID
			nameID: nameID
			bytes: (self contents copyFrom: start + 1 to: start + length)]
]

{ #category : #accessing }
PtOTName >> stringOffset [
	"USHORT  	stringOffset  	Offset to start of string storage (from start of table)."

	^self bytes unsignedShortAt: 5
]
