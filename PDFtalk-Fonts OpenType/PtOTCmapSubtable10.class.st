"
Format 10: Trimmed array

Format 10 is a bit like format 6, in that it defines a trimmed array for a tight range of 32-bit character codes:
Type	Name	Description
USHORT	format	Subtable format; set to 10.
USHORT	reserved	Reserved; set to 0
ULONG	length	Byte length of this subtable (including the header)
ULONG	language	Please see “Note on the language field in 'cmap' subtables“ in this document.
ULONG	startCharCode	First character code covered
ULONG	numChars	Number of character codes covered
USHORT	glyphs[]	Array of glyph indices for the character codes covered

This format is not supported by Microsoft.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable10,
	#superclass : #PtOTCmapLanguageSubtable32,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable10 class >> formatNumber [
	^10
]

{ #category : #accessing }
PtOTCmapSubtable10 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable10 >> indexToCode [
	^self notYetImplemented
]
