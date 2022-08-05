"
PDF Type1 Font as defined in PDF 32000_2008.pdf, clause 9.6.2, pp. 254.

A Type 1 font program is a stylized PostScript program that describes glyph shapes. 
It uses a compact encoding for the glyph descriptions, and it includes hint information that enables high-quality rendering even at small sizes and low resolutions.

NOTE 1		Details on this format are provided in a separate specification, Adobe Type 1 Font Format. 
			An alternative, more compact but functionally equivalent representation of a Type 1 font program is 
			documented in Adobe Technical Note #5176, The Compact Font Format Specification.
NOTE 2		Although a Type 1 font program uses PostScript language syntax, using it does not require 
			a full PostScript interpreter; a specialized Type 1 font interpreter suffices.

Some entries are optional for the standard 14 fonts, but are required otherwise.
"
Class {
	#name : #PtType1,
	#superclass : #PtFont,
	#instVars : [
		'usedExtraGlyphs'
	],
	#category : #'PDFtalk-Fonts'
}

{ #category : #testing }
PtType1 class >> isClassForDictionary: aDictionary [
	^(super isClassForDictionary: aDictionary) and: [
	(aDictionary hasKey: #BaseFont) and: [
	((PtPDF classAt: #StandardFont) fontNames includes: (aDictionary at: #BaseFont) asSmalltalkValue) not]]
]

{ #category : #accessing }
PtType1 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Type1
		supertype: #Font
		section: '9.6.2'
		documentation: 'A Type 1 font program is a stylized PostScript program that describes glyph shapes. 
It uses a compact encoding for the glyph descriptions, and it includes hint information that enables high-quality rendering even at small sizes and low resolutions.

NOTE 1		Details on this format are provided in a separate specification, Adobe Type 1 Font Format. 
			An alternative, more compact but functionally equivalent representation of a Type 1 font program is 
			documented in Adobe Technical Note #5176, The Compact Font Format Specification.
NOTE 2		Although a Type 1 font program uses PostScript language syntax, using it does not require 
			a full PostScript interpreter; a specialized Type 1 font interpreter suffices.

Some entries are optional for the standard 14 fonts, but are required otherwise.'
]

{ #category : #'accessing entries' }
PtType1 >> BaseFont [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'The PostScript name of the font.
For Type 1 fonts, this is always the value of the FontName entry in the font program.
The PostScript name of the font may be used to find the font program in the conforming reader or its environment.
It is also the name that is used when printing to a PostScript output device.'>
	^self objectAt: #BaseFont
]

{ #category : #'accessing entries' }
PtType1 >> Encoding [
	<type: #Name>
	<type: #Encoding>
	<attribute: 7 documentation: 'A specification of the font’s character encoding if different from its built-in encoding.
The value of Encoding shall be either the name of a predefined encoding (
	MacRomanEncoding, 
	MacExpertEncoding, or 
	WinAnsiEncoding) 
or an encoding dictionary that shall specify differences from the font’s built-in encoding or from a specified predefined encoding.'>
	^self objectAt: #Encoding
]

{ #category : #'accessing entries' }
PtType1 >> FirstChar [
	<type: #Integer>
	<required>
	<attribute: 3 documentation: 'The first character code defined in the font’s Widths array.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #FirstChar
]

{ #category : #'accessing entries' }
PtType1 >> FontDescriptor [
	<typeIndirect: #FontDescriptor>
	<required>
	<attribute: 6 documentation: 'A font descriptor describing the font’s metrics other than its glyph widths (see 9.8, "Font Descriptors"”\).
For the standard 14 fonts, the entries FirstChar, LastChar, Widths, and FontDescriptor shall either all be present or all be absent.
Ordinarily, these dictionary keys may be absent; specifying them enables a standard font to be overridden.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #FontDescriptor
]

{ #category : #'accessing entries' }
PtType1 >> LastChar [
	<type: #Integer>
	<required>
	<attribute: 4 documentation: 'The last character code defined in the font’s Widths array.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #LastChar
]

{ #category : #'accessing entries' }
PtType1 >> Name [
	<type: #Name>
	<attribute: 1 documentation: '(Required in PDF 1.0; optional otherwise)

The name by which this font is referenced in the Font subdictionary of the current resource dictionary.

This entry is obsolete and should not be used.'>
	^self objectAt: #Name
]

{ #category : #'accessing entries' }
PtType1 >> ToUnicode [
	<type: #ToUnicodeCMap>
	<version: 1 dot: 2>
	<attribute: 8 documentation: 'A stream containing a CMap file that maps character codes to Unicode values.'>
	^self objectAt: #ToUnicode
]

{ #category : #'accessing entries' }
PtType1 >> Widths [
	<typeArrayOf: #Number>
	<required>
	<attribute: 5 documentation: '(indirect reference preferred)

An array of (LastChar - FirstChar + 1) widths, each element being the glyph width for the character code that equals FirstChar plus the array index.
For character codes outside the range FirstChar to LastChar, the value of MissingWidth from the FontDescriptor entry for this font shall be used.
The glyph widths shall be measured in units in which 1000 units correspond to 1 unit in text space.
These widths shall be consistent with the actual widths given in the font program.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #Widths
]

{ #category : #accessing }
PtType1 >> addWinAnsiEncodingWith: aFont [
	| attributes |
	attributes := aFont pdfWinAnsiEncodingAttributesWith: self usedExtraGlyphs.
	attributes keysAndValuesDo: [:key :value | self at: key put: value]
]

{ #category : #tracing }
PtType1 >> copyWithNewReferencesIn: visited [
	| copy |
	copy := super copyWithNewReferencesIn: visited.
	copy usedExtraGlyphs addAll: self usedExtraGlyphs.
	^copy
]

{ #category : #accessing }
PtType1 >> decodedString: aByteArray [
	self hasEncoding ifTrue: [
		| encoder rst wst |
		encoder := self encoder.
		rst := aByteArray readStream.
		wst := String new writeStream.
		[rst atEnd] whileFalse: [wst nextPut: (encoder decode: rst next)].
		^wst contents].
	(self hasKey: #ToUnicode) ifTrue: [
		| rst wst |
		rst := aByteArray readStream.
		wst := String new writeStream.
		[rst atEnd] whileFalse: [
			(self ToUnicode cmap characterFrom: rst) ifNil: [rst next] ifNotNil: [:char |
				wst nextPut: char]].
		^wst contents].
	"needs work"
	^PtPDF standardEncoder ifNotNil: [:encoder |
		| rst wst |
		rst := aByteArray readStream.
		wst := String new writeStream.
		[rst atEnd] whileFalse: [wst nextPut: (encoder decode: rst next)].
		wst contents]
]

{ #category : #accessing }
PtType1 >> encoder [
	"<CharacterMap>"

	| encoding |
	self hasEncoding ifFalse: [
		^PtPDF standardEncoder].
	encoding := self Encoding asSmalltalkValue.
	encoding isSymbol ifTrue: [
		^PtPDF encoderAt: encoding].
	^self Encoding encoderFor: self
]

{ #category : #testing }
PtType1 >> hasEncoding [
	^self hasKey: #Encoding
]

{ #category : #accessing }
PtType1 >> newCodeForExtraGlyph [
	"<Integer>"

	| usedCodes |
	usedCodes := self usedExtraGlyphs values asSet.
	^#(31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 8 7 6 5 4 3 2 1) detect: [:code |
		(usedCodes includes: code) not]
]

{ #category : #accessing }
PtType1 >> postScriptName [
	| string |
	string := self BaseFont content.
	(string size >= 7 and: [
	((string first: 6) allSatisfy: #isUppercase) and: [
	(string at: 7) = $+]]) ifTrue: [
			^string copyFrom: 8 to: string size].
	^string
]

{ #category : #accessing }
PtType1 >> stringWidth: aContentString [
	^aContentString content inject: 0 into: [:width :characterCode | width + (self widthAt: characterCode)]
]

{ #category : #accessing }
PtType1 >> usedExtraGlyphs [
	"<OrderedDictionary key: Glyph value: Integer>"

	^usedExtraGlyphs ifNil: [usedExtraGlyphs := Valuemap new]
]

{ #category : #accessing }
PtType1 >> widthAt: aCharacterCode [
	| index |
	index := aCharacterCode - self FirstChar asSmalltalkValue + 1.
	(index between: 1 and: self Widths size) ifFalse: [
		"illegal character"
		^0].
	^(self Widths at: index) asSmalltalkValue
]
