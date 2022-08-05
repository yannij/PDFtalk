"
The header section of a PFM file.

This is only used for PostScript Type 1 fonts (PFM files are used in windows also for raster and other fonts).
Fields fixed for this kind of PFM are implicit: the fixed value is hard coded and not stored or read from a variable.

The implementation saves only the contents fields in values for later use.
Internal file management data (offsets and counts) are read and written by the enclosing PostScriptFontMetrics.

ATTENTION: The usual constructor and initializer methods for this Value class are removed.
Pharo does not allow more than 15 arguments for a method.
Therefore, only the #fromBytes: constructor (and the corresponding #asBytes) are maintained.
"
Class {
	#name : #PtFPFMHeader,
	#superclass : #Value,
	#instVars : [
		'copyright',
		'ascent',
		'internalLeading',
		'externalLeading',
		'italic',
		'underline',
		'strikeOut',
		'weight',
		'charSet',
		'pixHeight',
		'pitchAndFamily',
		'avgWidth',
		'maxWidth',
		'firstChar',
		'lastChar',
		'defaultChar',
		'breakChar'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFPFMHeader class >> fromBytes: aByteArray95 [
	| inst |
	inst := self new.
	inst initializeFromBytes: aByteArray95.
	^inst
]

{ #category : #specification }
PtFPFMHeader class >> localSpecification [
	"<constant: #version class: #{Integer} comment: 'WORD: A user-defined version number for the resource data that tools can use to read and write resource files'>"
	"<constant: #fileSize class: #{Integer} comment: 'DWORD: The size of the file, in bytes'>"
	<constant: #copyright class: #String comment: 'CHAR[60]: The font supplier''s copyright information'>
	"<constant: #type class: #{Integer} comment: 'WORD: The type of font file'>"
	"<constant: #points class: #{Integer} comment: 'WORD: The point size at which this character set looks best'>"
	"<constant: #vertRes class: #{Integer} comment: 'WORD: The vertical resolution, in dots per inch, at which this character set was digitized'>"
	"<constant: #horizRes class: #{Integer} comment: 'WORD: The horizontal resolution, in dots per inch, at which this character set was digitized'>"
	<constant: #ascent class: #Integer comment: 'WORD: The distance from the top of a character definition cell to the baseline of the typographical font'>
	<constant: #internalLeading class: #Integer comment: 'WORD: The amount of leading inside the bounds set by pixHeight. Accent marks and other diacritical characters can occur in this area'>
	<constant: #externalLeading class: #Integer comment: 'WORD: The amount of extra leading that the application adds between rows'>
	<constant: #italic class: #Boolean comment: 'BYTE: An italic font if not equal to zero'>
	<constant: #underline class: #Boolean comment: 'BYTE: An underlined font if not equal to zero'>
	<constant: #strikeOut class: #Boolean comment: 'BYTE: An strikeout font if not equal to zero'>
	<constant: #weight class: #Integer comment: 'WORD: The weight of the font in the range 0 through 1000. For example, 400 is roman and 700 is bold. If this value is zero, a default weight is used'>
	<constant: #charSet class: #Integer comment: 'BYTE: The character set of the font'>
	"<constant: #pixWidth class: #{Integer} comment: 'WORD: The width of the grid on which a vector font was digitized. For raster fonts, if the member is not equal to zero, it represents the width for all the characters in the bitmap. If the member is equal to zero, the font has variable-width characters'>"
	<constant: #pixHeight class: #Integer comment: 'WORD: The height of the character bitmap for raster fonts or the height of the grid on which a vector font was digitized'>
	<constant: #pitchAndFamily class: #Integer comment: 'BYTE: The pitch and the family of the font'>
	<constant: #avgWidth class: #Integer comment: 'WORD: The average width of characters in the font (generally defined as the width of the letter x). This value does not include the overhang required for bold or italic characters'>
	<constant: #maxWidth class: #Integer comment: 'WORD: The width of the widest character in the font'>
	<constant: #firstChar class: #Integer comment: 'BYTE: The first character code defined in the font'>
	<constant: #lastChar class: #Integer comment: 'BYTE: The last character code defined in the font'>
	<constant: #defaultChar class: #Integer comment: 'BYTE: The character to substitute for characters not in the font'>
	<constant: #breakChar class: #Integer comment: 'BYTE: The character that will be used to define word breaks for text justification'>
	"<constant: #widthBytes class: #{Integer} comment: 'WORD: The number of bytes in each row of the bitmap. This value is always even so that the rows start on word boundaries. For vector fonts, this member has no meaning'>"
	"<constant: #device class: #{Integer} comment: 'DWORD: The offset in the file to a null-terminated string that specifies a device name. For a generic font, this value is zero'>"
	"<constant: #face class: #{Integer} comment: 'DWORD: The offset in the file to a null-terminated string that names the typeface'>"
	"<constant: #bitsPointer class: #{Integer} comment: 'DWORD: This member is reserved'>"
	"<constant: #bitsOffset class: #{Integer} comment: 'DWORD: The name of the device if this font file is designated for a specific device'>"
]

{ #category : #converting }
PtFPFMHeader >> asBytes [
	"<ByteArray[95]>
	ByteArray suited to be written to a PFM file"

	| wst |
	wst := ByteWriteStream littleEndianOn: (ByteArray new: 95).
	wst
		nextPutAll: self copyright asByteArray;
		nextPutUnsignedShort: self type;
		nextPutUnsignedShort: self points;
		nextPutUnsignedShort: self vertRes;
		nextPutUnsignedShort: self horizRes;
		nextPutUnsignedShort: self ascent;
		nextPutUnsignedShort: self internalLeading;
		nextPutUnsignedShort: self externalLeading;
		nextPutBooleanByte: self italic;
		nextPutBooleanByte: self underline;
		nextPutBooleanByte: self strikeOut;
		nextPutUnsignedShort: self weight;
		nextPut: self charSet;
		nextPutUnsignedShort: self pixWidth;
		nextPutUnsignedShort: self pixHeight;
		nextPut: self pitchAndFamily;
		nextPutUnsignedShort: self avgWidth;
		nextPutUnsignedShort: self maxWidth;
		nextPut: self firstChar;
		nextPut: self lastChar;
		nextPut: self defaultChar;
		nextPut: self breakChar;
		nextPutUnsignedShort: self widthBytes.
	^wst contents
]

{ #category : #accessing }
PtFPFMHeader >> ascent [
	"<Integer>
	WORD: The distance from the top of a character definition cell to the baseline of the typographical font"

	^ascent
]

{ #category : #accessing }
PtFPFMHeader >> avgWidth [
	"<Integer>
	WORD: The average width of characters in the font (generally defined as the width of the letter x). This value does not include the overhang required for bold or italic characters"

	^avgWidth
]

{ #category : #accessing }
PtFPFMHeader >> breakChar [
	"<Integer>
	BYTE: The character that will be used to define word breaks for text justification"

	^breakChar
]

{ #category : #accessing }
PtFPFMHeader >> charSet [
	"<Integer>
	BYTE: The character set of the font"

	^charSet
]

{ #category : #accessing }
PtFPFMHeader >> copyright [
	"<String>
	CHAR[60]: The font supplier's copyright information"

	^copyright
]

{ #category : #accessing }
PtFPFMHeader >> defaultChar [
	"<Integer>
	BYTE: The character to substitute for characters not in the font"

	^defaultChar
]

{ #category : #accessing }
PtFPFMHeader >> externalLeading [
	"<Integer>
	WORD: The amount of extra leading that the application adds between rows"

	^externalLeading
]

{ #category : #accessing }
PtFPFMHeader >> familySymbol [
	"<Symbol>
	The family of the font as Symbol known to Windows.
	Raises error on unknown"

	| bits |
	bits := self pitchAndFamily bitShift: -4.
	bits isZero ifTrue: [
		^#FF_DONTCARE].
	^#(#FF_ROMAN #FF_SWISS #FF_MODERN #FF_SCRIPT #FF_DECORATIVE) at: bits
]

{ #category : #accessing }
PtFPFMHeader >> firstChar [
	"<Integer>
	BYTE: The first character code defined in the font"

	^firstChar
]

{ #category : #accessing }
PtFPFMHeader >> horizRes [
	"<Integer>	WORD
	This field contains the horizontal resolution at which the font was digitized (the value is in dots per inch). The value of this field should be set to 0x012C (300 dpi)"

	^16r012c
]

{ #category : #'initialize-release' }
PtFPFMHeader >> initializeFromBytes: aByteArray95 [
	| dummy rst |
	dummy := self class new.
	rst := ByteReadStream littleEndianOn: aByteArray95.
	copyright := (rst next: 60) asString.
	rst nextUnsignedShort = dummy type ifFalse: [
		self error: 'type is not correct'].
	rst nextUnsignedShort.	"points ignored - doc says points are irrelevant and should be set to 10. However found 12 in a TeX font"
	rst nextUnsignedShort = dummy vertRes ifFalse: [
		self error: 'vertRes is not correct'].
	rst nextUnsignedShort = dummy horizRes ifFalse: [
		self error: 'horizRes is not correct'].
	ascent := rst nextUnsignedShort.
	internalLeading := rst nextUnsignedShort.
	externalLeading := rst nextUnsignedShort.
	italic := rst nextBooleanByte.
	underline := rst nextBooleanByte.
	strikeOut := rst nextBooleanByte.
	weight := rst nextUnsignedShort.
	charSet := rst next.
	rst nextUnsignedShort.	"pixWidth ignored - doc says points are irrelevant and should be set to 0. However found 1000 in a TeX font"
	pixHeight := rst nextUnsignedShort.
	pitchAndFamily := rst next.
	avgWidth := rst nextUnsignedShort.
	maxWidth := rst nextUnsignedShort.
	firstChar := rst next.
	lastChar := rst next.
	defaultChar := rst next.
	breakChar := rst next.
	rst nextUnsignedShort = dummy widthBytes ifFalse: [
		self error: 'widthBytes is not correct'].
	self beImmutable
]

{ #category : #accessing }
PtFPFMHeader >> internalLeading [
	"<Integer>
	WORD: The amount of leading inside the bounds set by pixHeight. Accent marks and other diacritical characters can occur in this area"

	^internalLeading
]

{ #category : #testing }
PtFPFMHeader >> isFixedPitch [
	^(self pitchAndFamily bitAnd: 2r00000001) isZero
]

{ #category : #accessing }
PtFPFMHeader >> italic [
	"<Boolean>
	BYTE: An italic font if not equal to zero"

	^italic
]

{ #category : #accessing }
PtFPFMHeader >> lastChar [
	"<Integer>
	BYTE: The last character code defined in the font"

	^lastChar
]

{ #category : #accessing }
PtFPFMHeader >> maxWidth [
	"<Integer>
	WORD: The width of the widest character in the font"

	^maxWidth
]

{ #category : #accessing }
PtFPFMHeader >> numberOfCharacters [
	"<Integer>"

	^self lastChar - self firstChar + 1
]

{ #category : #accessing }
PtFPFMHeader >> pitchAndFamily [
	"<Integer>
	BYTE: The pitch and the family of the font"

	^pitchAndFamily
]

{ #category : #accessing }
PtFPFMHeader >> pitchSymbol [
	"<Symbol>
	The pitch of the font as Symbol known to Windows.
	Raises error on unknown"

	self isFixedPitch ifTrue: [
		^#FIXED_PITCH].
	^#VARIABLE_PITCH
]

{ #category : #accessing }
PtFPFMHeader >> pixHeight [
	"<Integer>	WORD
	This field contains the height of all characters in the font. For raster fonts this field contains the height in scan lines of every character bitmap. For vector fonts this field contains the height of the grid on which the font was digitized. The value is ignored by PostScript printer drivers"

	^pixHeight
]

{ #category : #accessing }
PtFPFMHeader >> pixWidth [
	"<Integer>	WORD
	This field contains the width of all characters in the font. For raster fonts this field contains the width in pixels of every character bitmap if the font is fixed-pitch, otherwise this field is zero and the character's widths are specified in the WidthTable table. For vector fonts this field contains the width of the grid on which the font was digitized. The value is ignored by PostScript printer drivers"

	^0
]

{ #category : #accessing }
PtFPFMHeader >> points [
	"<Integer>	WORD
	This field contains the point size at which this font looks best. Since this is not relevant for scalable fonts the field is ignored. The value of this field should be set to 0x000a (10 pt)"

	^16r000a
]

{ #category : #printing }
PtFPFMHeader >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'fromBytes' value: self asBytes).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtFPFMHeader >> stemV [
	"<Integer>"
	"usWeightClass - roughly estimate StemV.
Estimation is based on the following expression:
	stemv = (os2->usWeightClass/65)*(os2->usWeightClass/65)+50
I've found this expression in some Adobe document (lost). We use
this expression also, otherwise, we must analyze glyph data.

found in:
(This is dvipdfmx, an eXtended version of dvipdfm by Mark A. Wicks.
Copyright (C) 2002 by Jin-Hwan Cho and Shunsaku Hirata,
the dvipdfmx project team <dvipdfmx@project.ktug.or.kr>)"

	| wc |
	wc := self weight / 65.
	^(wc * wc + 50) rounded
]

{ #category : #accessing }
PtFPFMHeader >> strikeOut [
	"<Boolean>
	BYTE: An strikeout font if not equal to zero"

	^strikeOut
]

{ #category : #accessing }
PtFPFMHeader >> type [
	"<Integer>	WORD
	This field contains the font type. The low-order byte is a combination of the following values (only the values being of interest in PFM files are given):

    0x00 (PF_RASTER_TYPE): font is a raster font
    0x01 (PF_VECTOR_TYPE): font is a vector font
    0x80 (PF_DEVICE_REALIZED): font realized by the device driver 

The high-order byte is never used in PFM files, it is always zero.
In PFM files for Type-1 fonts the value in this field is always 0x0081. "

	^16r0081
]

{ #category : #accessing }
PtFPFMHeader >> underline [
	"<Boolean>
	BYTE: An underlined font if not equal to zero"

	^underline
]

{ #category : #accessing }
PtFPFMHeader >> vertRes [
	"<Integer>	WORD
	This field contains the vertical resolution at which the font was digitized (the value is in dots per inch). The value of this field should be set to 0x012C (300 dpi)"

	^16r012c
]

{ #category : #accessing }
PtFPFMHeader >> weight [
	"<Integer>
	WORD: The weight of the font in the range 0 through 1000. For example, 400 is roman and 700 is bold. If this value is zero, a default weight is used"

	^weight
]

{ #category : #accessing }
PtFPFMHeader >> widthBytes [
	"<Integer>	WORD
	This field contains the number of bytes in every row of the font bitmap. The value is always an even quantity so that rows of the bitmap start on 16 bit boundaries. This field is not used for vector fonts, it is therefore zero in e.g. PFM files for Type-1 fonts"

	^0
]
