"
A cmap Subtable with a 32 bit header
"
Class {
	#name : #PtOTCmapLanguageSubtable32,
	#superclass : #PtOTCmapLanguageSubtable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #reading }
PtOTCmapLanguageSubtable32 >> readFrom: bytes at: offset [
	"Type  	Name  		Description
USHORT 	format 		Subtable format; set to 8.
USHORT	reserved	Reserved; set to 0
ULONG		length		Byte length of this subtable (including the header)
ULONG		language	Please see “Note on the language field in 'cmap' subtables“ in this document."

	| aLength aLanguage uBytes |
	uBytes := ByteReadStream bigEndianOn: (bytes copyFrom: offset + 1 to: offset + 12).
	uBytes nextUnsignedShort = self formatNumber ifFalse: [
		^self error: 'wrong format'].
	uBytes nextShort.
	aLength := uBytes nextUnsignedLong.
	aLanguage := uBytes nextUnsignedLong.
	^self class
		platform: self platform
		encoding: self encoding
		contents: (bytes copyFrom: offset + 1 to: offset + aLength)
		language: aLanguage
]
