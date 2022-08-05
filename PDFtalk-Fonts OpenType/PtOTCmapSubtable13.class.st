"
Format 13: Last Resort Font

This subtable deals with situations where the same glyph is used for dozens or even tens of thousands of consecutive characters, from one end of Unicode to the other. This is common when creating a “Last Resort” font. Here's the subtable format:

Type		Name		Description
USHORT	format		Subtable format; set to 13.
USHORT	reserved	Reserved; set to 0
ULONG		length		Byte length of this subtable (including the header)
ULONG		language	Please see “Note on the language field in 'cmap' subtables“ in this document.
ULONG		nGroups	Number of groupings which follow

Here follow the individual groups, each of which has the following format:
Type		Name			Description
ULONG		startCharCode	First character code in this group
ULONG		endCharCode	Last character code in this group
ULONG		glyphID			Glyph index to be used for all the characters in the group's range.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable13,
	#superclass : #PtOTCmapLanguageSubtable32,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable13 class >> formatNumber [
	^13
]

{ #category : #accessing }
PtOTCmapSubtable13 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable13 >> indexToCode [
	^self notYetImplemented
]
