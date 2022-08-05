"
PDF Composite Fonts as defined in PDF 32000_2008.pdf, clause 9.7, pp. 267.

A composite font, also called a Type 0 font, is one whose glyphs are obtained from a fontlike object called a CIDFont. 
A composite font shall be represented by a font dictionary whose Subtype value is Type0. 
The Type 0 font is known as the root font, and its associated CIDFont is called its descendant.

NOTE 1		Composite fonts in PDF are analogous to composite fonts in PostScript but with some limitations. 
			In particular, PDF requires that the character encoding be defined by a CMap, which is only one of several encoding methods available in PostScript. 
			Also, PostScript allows a Type 0 font to have multiple descendants, which might also be Type 0 fonts. 
			PDF supports only a single descendant, which shall be a CIDFont.

When the current font is composite, the text-showing operators shall behave differently than with simple fonts. 
For simple fonts, each byte of a string to be shown selects one glyph, whereas for composite fonts, 
a sequence of one or more bytes are decoded to select a glyph from the descendant CIDFont.

NOTE 2		This facility supports the use of very large character sets, such as those for the Chinese, Japanese, and Korean languages. 
			It also simplifies the organization of fonts that have complex encoding requirements.

This sub-clause first introduces the architecture of CID-keyed fonts, which are the only kind of composite font supported in PDF. 
Then it describes the CIDFont and CMap dictionaries, which are the PDF objects that represent the correspondingly named components of a CID-keyed font. 
Finally, it describes the Type 0 font dictionary, which combines a CIDFont and a CMap to produce a font 
whose glyphs may be accessed by means of variable-length character codes in a string to be shown.
"
Class {
	#name : #PtType0,
	#superclass : #PtFont,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtType0 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Type0
		supertype: #Font
		section: '9.7'
		documentation: 'A composite font, also called a Type 0 font, is one whose glyphs are obtained from a fontlike object called a CIDFont. 
A composite font shall be represented by a font dictionary whose Subtype value is Type0. 
The Type 0 font is known as the root font, and its associated CIDFont is called its descendant.

NOTE 1		Composite fonts in PDF are analogous to composite fonts in PostScript but with some limitations. 
			In particular, PDF requires that the character encoding be defined by a CMap, which is only one of several encoding methods available in PostScript. 
			Also, PostScript allows a Type 0 font to have multiple descendants, which might also be Type 0 fonts. 
			PDF supports only a single descendant, which shall be a CIDFont.

When the current font is composite, the text-showing operators shall behave differently than with simple fonts. 
For simple fonts, each byte of a string to be shown selects one glyph, whereas for composite fonts, 
a sequence of one or more bytes are decoded to select a glyph from the descendant CIDFont.

NOTE 2		This facility supports the use of very large character sets, such as those for the Chinese, Japanese, and Korean languages. 
			It also simplifies the organization of fonts that have complex encoding requirements.

This sub-clause first introduces the architecture of CID-keyed fonts, which are the only kind of composite font supported in PDF. 
Then it describes the CIDFont and CMap dictionaries, which are the PDF objects that represent the correspondingly named components of a CID-keyed font. 
Finally, it describes the Type 0 font dictionary, which combines a CIDFont and a CMap to produce a font 
whose glyphs may be accessed by means of variable-length character codes in a string to be shown.'
]

{ #category : #'accessing entries' }
PtType0 >> BaseFont [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The name of the font.
If the descendant is a Type 0 CIDFont, this name should be the concatenation of the CIDFont’s BaseFont name, a hyphen, and the CMap name given in the Encoding entry (or the CMapName entry in the CMap).
If the descendant is a Type 2 CIDFont, this name should be the same as the CIDFont’s BaseFont name.
NOTE	In principle, this is an arbitrary name, since there is no font program associated directly with a Type 0 font dictionary.
		The conventions described here ensure maximum compatibility with existing readers'>
	^self objectAt: #BaseFont
]

{ #category : #'accessing entries' }
PtType0 >> DescendantFonts [
	<typeArrayOf: #CIDFont>
	<required>
	<attribute: 3 documentation: 'A one-element array specifying the CIDFont dictionary that is the descendant of this Type 0 font'>
	^self objectAt: #DescendantFonts
]

{ #category : #'accessing entries' }
PtType0 >> Encoding [
	<type: #Name>
	<type: #CMap>
	<required>
	<attribute: 2 documentation: 'The name of a predefined CMap, or a stream containing a CMap that maps character codes to font numbers and CIDs.
If the descendant is a Type 2 CIDFont whose associated TrueType font program is not embedded in the PDF file, the Encoding entry shall be a predefined CMap name'>
	^self objectAt: #Encoding
]

{ #category : #accessing }
PtType0 >> FontDescriptor [
	^(self DescendantFonts objectAt: 1) FontDescriptor
]

{ #category : #'accessing entries' }
PtType0 >> ToUnicode [
	<type: #ToUnicodeCMap>
	<attribute: 4 documentation: 'A stream containing a CMap file that maps character codes to Unicode values'>
	^self objectAt: #ToUnicode
]

{ #category : #accessing }
PtType0 >> decodedString: aByteArray [
	| rst cids gids descendantFont systemInfo characterCollection |
	self Encoding asSmalltalkValue = #'Identity-H' ifFalse: [
		^self error: 'not implemented yet'].
	rst := aByteArray readStream.
	(self hasKey: #ToUnicode) ifTrue: [
		| wst |
		wst := String new writeStream.
		[rst atEnd] whileFalse: [wst nextPut: (self ToUnicode cmap characterFrom: rst)].
		^wst contents].
	"needs work"
	self halt.
	descendantFont := self DescendantFonts objectAt: 1.
	systemInfo := descendantFont CIDSystemInfo.
	characterCollection := systemInfo asCharacterCollection.
	cids := characterCollection mapCharacterCodes: aByteArray.
	cids := OrderedCollection new: aByteArray size // 2.
	[rst atEnd] whileFalse: [cids add: rst next * 256 + rst next].
	gids := cids.
	^String withAll: (gids collect: #asCharacter)
]

{ #category : #accessing }
PtType0 >> stringWidth: aContentString [
	self Encoding asSmalltalkValue = #'Identity-H' ifFalse: [
		^self error: 'not implemented yet'].
	^self DescendantFonts first stringWidth: aContentString
]

{ #category : #accessing }
PtType0 >> widthAt: aCharacterCode [
	^self notYetImplemented
]
