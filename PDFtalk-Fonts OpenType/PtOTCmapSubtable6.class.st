"
Format 6: Trimmed table mapping

Type	Name	Description
USHORT	format	Format number is set to 6.
USHORT	length	This is the length in bytes of the subtable.
USHORT	language	Please see “Note on the language field in 'cmap' subtables“ in this document.
USHORT	firstCode	First character code of subrange.
USHORT	entryCount	Number of character codes in subrange.
USHORT	glyphIdArray [entryCount]	Array of glyph index values for character codes in the range.

The firstCode and entryCount values specify a subrange (beginning at firstCode,length = entryCount) within the range of possible character codes. Codes outside of this subrange are mapped to glyph index 0. The offset of the code (from the first code) within this subrange is used as index to the glyphIdArray, which provides the glyph index value.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable6,
	#superclass : #PtOTCmapLanguageSubtable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable6 class >> formatNumber [
	^6
]

{ #category : #accessing }
PtOTCmapSubtable6 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable6 >> indexToCode [
	^self notYetImplemented
]
