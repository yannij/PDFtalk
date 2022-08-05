"
Format 14: Unicode Variation Sequences

Subtable format 14 specifies the Unicode Variation Sequences (UVSes) supported by the font. A Variation Sequence, according to the Unicode Standard, comprises a base character followed by a variation selector; e.g. <U+82A6, U+E0101>.

The subtable partitions the UVSes supported by the font into two categories: “default” and “non-default” UVSes. Given a UVS, if the glyph obtained by looking up the base character of that sequence in the Unicode cmap subtable (i.e. the UCS-4 or the BMP cmap subtable) is the glyph to use for that sequence, then the sequence is a “default” UVS; otherwise it is a “non-default” UVS, and the glyph to use for that sequence is specified in the format 14 subtable itself.

The example at the bottom of the page shows how a font vendor can use format 14 for a JIS-2004–aware font.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable14,
	#superclass : #PtOTCmapSubtable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable14 class >> formatNumber [
	^14
]

{ #category : #accessing }
PtOTCmapSubtable14 >> glyphIndexAtUnicode: aUnicodeInteger [
	^self notYetImplemented
]

{ #category : #accessing }
PtOTCmapSubtable14 >> indexToCode [
	^self notYetImplemented
]

{ #category : #reading }
PtOTCmapSubtable14 >> readFrom: uninterpretedBytes at: offset [
	^self notYetImplemented
]
