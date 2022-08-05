"
PDF CIDFonts as defined in PDF 32000_2008.pdf, clause 9.7.4, pp. 269.

A CIDFont program contains glyph descriptions that are accessed using a CID as the character selector. 
There are two types of CIDFonts:

	•	A Type 0 CIDFont contains glyph descriptions based on CFF

NOTE	The term “Type 0” when applied to a CIDFont has a different meaning than for a “Type 0 font”.

	•	A Type 2 CIDFont contains glyph descriptions based on the TrueType font format

A CIDFont dictionary is a PDF object that contains information about a CIDFont program. 
Although its Type value is Font, a CIDFont is not actually a font. 
It does not have an Encoding entry, it may not be listed in the Font subdictionary of a resource dictionary, and it may not be used as the operand of the Tf operator. 
It shall be used only as a descendant of a Type 0 font. 
The CMap in the Type 0 font shall be what defines the encoding that maps character codes to CIDs in the CIDFont.
"
Class {
	#name : #PtCIDFont,
	#superclass : #PtFont,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtCIDFont class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #CIDFont
		supertype: #Font
		section: '9.7.4'
		documentation: 'A CIDFont program contains glyph descriptions that are accessed using a CID as the character selector. 
There are two types of CIDFonts:

	•	A Type 0 CIDFont contains glyph descriptions based on CFF

NOTE	The term “Type 0” when applied to a CIDFont has a different meaning than for a “Type 0 font”.

	•	A Type 2 CIDFont contains glyph descriptions based on the TrueType font format

A CIDFont dictionary is a PDF object that contains information about a CIDFont program. 
Although its Type value is Font, a CIDFont is not actually a font. 
It does not have an Encoding entry, it may not be listed in the Font subdictionary of a resource dictionary, and it may not be used as the operand of the Tf operator. 
It shall be used only as a descendant of a Type 0 font. 
The CMap in the Type 0 font shall be what defines the encoding that maps character codes to CIDs in the CIDFont.'
]

{ #category : #'accessing entries' }
PtCIDFont >> BaseFont [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The PostScript name of the CIDFont.
For Type 0 CIDFonts, this shall be the value of the CIDFontName entry in the CIDFont program.
For Type 2 CIDFonts, it shall be derived the same way as for a simple TrueType font.
In either case, the name may have a subset prefix if appropriate'>
	^self objectAt: #BaseFont
]

{ #category : #'accessing entries' }
PtCIDFont >> CIDSystemInfo [
	<type: #CIDSystemInfo>
	<required>
	<attribute: 2 documentation: 'A dictionary containing entries that define the character collection of the CIDFont'>
	^self objectAt: #CIDSystemInfo
]

{ #category : #'accessing entries' }
PtCIDFont >> DW [
	<type: #Integer>
	<attribute: 4 documentation: 'The default width for glyphs in the CIDFont'>
	^self objectAt: #DW ifAbsent: [1000 asPDF]
]

{ #category : #'accessing entries' }
PtCIDFont >> DW2 [
	<typeArrayOf: #Number>
	<attribute: 6 documentation: '(Optional; applies only to CIDFonts used for vertical writing)
An array of two numbers specifying the default metrics for vertical writing'>
	^self objectAt: #DW2 ifAbsent: [#(880 -1000) asPDF]
]

{ #category : #'accessing entries' }
PtCIDFont >> FontDescriptor [
	<typeIndirect: #FontDescriptor>
	<required>
	<attribute: 3 documentation: 'A font descriptor describing the CIDFont’s default metrics other than its glyph widths'>
	^self objectAt: #FontDescriptor
]

{ #category : #'accessing entries' }
PtCIDFont >> W [
	<type: #Array>
	<attribute: 5 documentation: 'A description of the widths for the glyphs in the CIDFont.
NOTE
	The array’s elements have a variable format that can specify individual widths for consecutive CIDs or one width for a range of CIDs.
Default value: none (the DW value shall be used for all glyphs)'>
	^self objectAt: #W ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtCIDFont >> W2 [
	<type: #Array>
	<attribute: 7 documentation: '(Optional; applies only to CIDFonts used for vertical writing)
A description of the metrics for vertical writing for the glyphs in the CIDFont.
Default value: none (the DW2 value shall be used for all glyphs)'>
	^self objectAt: #W2 ifAbsent: [nil]
]

{ #category : #accessing }
PtCIDFont >> stringWidth: aContentString [
	| cids rst |
	cids := OrderedCollection new.
	rst := aContentString content readStream.
	[rst atEnd] whileFalse: [cids add: rst next * 256 + (rst next ifNil: [0])].
	^cids inject: 0 into: [:width :cid | width + (self widthAt: cid)]
]

{ #category : #accessing }
PtCIDFont >> widthAt: aCID [
	| widths rst |
	widths := self objectAt: #W ifAbsent: [
		^self DW asSmalltalkValue].
	rst := widths asSmalltalkValue readStream.
	[rst atEnd] whileFalse: [
		| cid arrayOrCID |
		cid := rst next.
		arrayOrCID := rst next.
		arrayOrCID isSequenceable
			ifTrue: [
			((cid to: cid + arrayOrCID size - 1) includes: aCID) ifTrue: [
				^arrayOrCID at: aCID - cid + 1]]
			ifFalse: [
			| width |
			width := rst next.
			((cid to: arrayOrCID) includes: aCID) ifTrue: [
				^width]]].
	^self DW asSmalltalkValue
]
