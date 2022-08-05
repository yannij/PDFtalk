"
Format 12: Segmented coverage

This is the Microsoft standard character to glyph index mapping table for fonts supporting the UCS-4 characters in the Unicode Surrogates Area (U+D800 - U+DFFF). It is a bit like format 4, in that it defines segments for sparse representation in 4-byte character space. Here's the subtable format:

Type		Name		Description
USHORT	format		Subtable format; set to 12.
USHORT	reserved	Reserved; set to 0
ULONG		length		Byte length of this subtable (including the header)
ULONG		language	Please see “Note on the language field in 'cmap' subtables“ in this document.
ULONG		nGroups	Number of groupings which follow

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable12,
	#superclass : #PtOTCmapLanguageSubtable32,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable12 class >> formatNumber [
	^12
]

{ #category : #accessing }
PtOTCmapSubtable12 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable12 >> indexToCode [
	^self notYetImplemented
]
