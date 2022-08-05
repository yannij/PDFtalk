"
The OS/2 table consists of a set of metrics that are required in OpenType fonts.

"
Class {
	#name : #PtOTOS2,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTOS2 class >> tag [
	^'OS/2'
]

{ #category : #accessing }
PtOTOS2 >> avgCharWidth [
	"Format: 	2-byte signed short
Units: 			Pels / em units
Title: 			Average weighted escapement.
Description: 	The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all non-zero width glyphs in the font.
Comments: 		The value for xAvgCharWidth is calculated by obtaining the arithmetic average of the width of all non-zero width glyphs in the font. 
				Furthermore, it is strongly recommended that implementers do not rely on this value for computing layout for lines of text. 
				Especially, for cases where complex scripts are used."

	^self bytes shortAt: 3
]

{ #category : #testing }
PtOTOS2 >> canEmbed [
	^(self fsType bitAnd: 2r1110) > 2
]

{ #category : #testing }
PtOTOS2 >> canSubset [
	^(self fsType bitAnd: 2r1100000000) isZero
]

{ #category : #accessing }
PtOTOS2 >> capHeight [
	"Format: 	SHORT
Description: 	This metric specifies the distance between the baseline and the approximate height of uppercase letters measured in FUnits. This value would normally be specified by a type designer but in situations where that is not possible, for example when a legacy font is being converted, the value may be set equal to the top of the unscaled and unhinted glyph bounding box of the glyph encoded at U+0048 (LATIN CAPITAL LETTER H). If no glyph is encoded in this position the field should be set to 0.

This metric, if specified, can be used in systems that specify type size by capital height measured in millimeters. It can also be used as an alignment metric; the top of a drop capital, for instance, can be aligned to the sCapHeight metric of the first line of text. "

	^self bytes shortAt: 89
]

{ #category : #accessing }
PtOTOS2 >> firstCharIndex [
	"Format: 	2-byte USHORT
Description: 	The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and platform- specific encoding ID 0 or 1. For most fonts supporting Win-ANSI or other character sets, this value would be 0x0020. This field cannot represent supplementary character values (codepoints greater than 0xFFFF). Fonts that support supplementary characters should set the value in this field to 0xFFFF if the minimum index value is a supplementary character."

	^self bytes unsignedShortAt: 65
]

{ #category : #accessing }
PtOTOS2 >> fsSelection [
	"Format: 	2-byte bit field.
Title: 	Font selection flags.
Description: 	Contains information concerning the nature of the font patterns, as follows:

Bit # 	macStyle bit 	C definition 			Description
0 		bit 1 			ITALIC 				Font contains Italic characters, otherwise they are upright.
1 	  					UNDERSCORE 		Characters are underscored.
2 	  					NEGATIVE 			Characters have their foreground and background reversed.
3 	  					OUTLINED 			Outline (hollow) characters, otherwise they are solid.
4 	  					STRIKEOUT 		Characters are overstruck.
5 		bit 0 			BOLD 				Characters are emboldened.
6 	  					REGULAR 			Characters are in the standard weight/style for the font.

Comments: 	All undefined bits must be zero.

This field contains information on the original design of the font. Bits 0 & 5 can be used to determine if the font was designed with these features or whether some type of machine simulation was performed on the font to achieve this appearance. Bits 1-4 are rarely used bits that indicate the font is primarily a decorative or special purpose font.

If bit 6 is set, then bits 0 and 5 must be clear, else the behavior is undefined. As noted above, the settings of bits 0 and 1 must be reflected in the macStyle bits in the 'head' table. While bit 6 on implies that bits 0 and 1 of macStyle are clear (along with bits 0 and 5 of fsSelection), the reverse is not true. Bits 0 and 1 of macStyle (and 0 and 5 of fsSelection) may be clear and that does not give any indication of whether or not bit 6 of fsSelection is clear (e.g., Arial Light would have all bits cleared; it is not the regular version of Arial)."

	^self bytes unsignedShortAt: 63
]

{ #category : #accessing }
PtOTOS2 >> fsType [
	"Format: 	2-byte unsigned short
Title: 			Type flags.
Description: 	Indicates font embedding licensing rights for the font. 
				Embeddable fonts may be stored in a document. 
				When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), 
				the embedded font may be loaded for temporary (and in some cases, permanent) use on that system 
				by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.

				The OpenType Font Embedding DLL Specification and DLL release notes 
				describe the APIs used to implement support for OpenType font embedding and loading. 
				Applications that implement support for font embedding, 
				either through use of the Font Embedding DLL or through other means, 
				must not embed fonts which are not licensed to permit embedding. 
				Further, applications loading embedded fonts for temporary use (see Preview & Print and Editable embedding below) 
				must delete the fonts when the document containing the embedded font is closed.

				This version of the OS/2 table makes bits 0 - 3 a set of exclusive bits. 
				In other words, at most one bit in this range may be set at a time. 
				The purpose is to remove misunderstandings caused by previous behavior of using the least restrictive of the bits that are set.

Bit 	Bit Mask 	Description
  	0x0000 		Installable Embedding: No fsType bit is set. Thus fsType is zero.
				Fonts with this setting indicate that they may be embedded and permanently installed on the remote system by an application. 
				The user of the remote system acquires the identical rights, obligations and licenses for that font as the original purchaser of the font, 
				and is subject to the same end-user license agreement, copyright, design patent, and/or trademark as was the original purchaser.
0 	0x0001 		Reserved, must be zero.
1 	0x0002 		Restricted License embedding:
				Fonts that have only this bit set must not be modified, embedded or exchanged in any manner 
				without first obtaining permission of the legal owner.
				Caution: For Restricted License embedding to take effect, it must be the only level of embedding selected.
2 	0x0004 		Preview & Print embedding: When this bit is set, the font may be embedded, and temporarily loaded on the remote system. 
				Documents containing Preview & Print fonts must be opened 'read-only;' no edits can be applied to the document.
3 	0x0008 		Editable embedding: When this bit is set, the font may be embedded but must only be installed temporarily on other systems. 
				In contrast to Preview & Print fonts, documents containing Editable fonts may be opened 
				for reading, editing is permitted, and changes may be saved.
4-7 	  			Reserved, must be zero.
8 	0x0100 		No subsetting: When this bit is set, the font may not be subsetted prior to embedding. 
				Other embedding restrictions specified in bits 0-3 and 9 also apply.
9 	0x0200 		Bitmap embedding only: When this bit is set, only bitmaps contained in the font may be embedded. 
				No outline data may be embedded. 
				If there are no bitmaps available in the font, then the font is considered unembeddable and the embedding services will fail. 
				Other embedding restrictions specified in bits 0-3 and 8 also apply.
10-15 	  		Reserved, must be zero. "

	^self bytes unsignedShortAt: 9
]

{ #category : #testing }
PtOTOS2 >> hasRestriction [
	^self fsType isZero not
]

{ #category : #testing }
PtOTOS2 >> isItalic [
	^(self fsSelection bitAnd: 1) isZero not
]

{ #category : #accessing }
PtOTOS2 >> lastCharIndex [
	"Format: 	2-byte USHORT
Description: 	The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1. This value depends on which character sets the font supports. This field cannot represent supplementary character values (codepoints greater than 0xFFFF). Fonts that support supplementary characters should set the value in this field to 0xFFFF."

	^self bytes unsignedShortAt: 67
]

{ #category : #accessing }
PtOTOS2 >> sFamilyClass [
	"Format:  	2-byte signed short
Title: 	Font-family class and subclass.
Description: 	This parameter is a classification of font-family design.
Comments: 	The font class and font subclass are registered values assigned by IBM to each font family. This parameter is intended for use in selecting an lternate font when the requested font is not available. The font class is the most general and the font subclass is the most specific. The high byte of this field contains the family class, while the low byte contains the family subclass. More information about this field."

	^self bytes shortAt: 31
]

{ #category : #accessing }
PtOTOS2 >> stemV [
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
	wc := self weightClass / 65.
	^(wc * wc + 50) rounded
]

{ #category : #accessing }
PtOTOS2 >> typoAscender [
	"Format: 	SHORT
Description: 	The typographic ascender for this font. Remember that this is not the same as the Ascender value in the 'hhea' table, which Apple defines in a far different manner. One good source for sTypoAscender in Latin based fonts is the Ascender value from an AFM file. For CJK fonts see below.

The suggested usage for sTypoAscender is that it be used in conjunction with unitsPerEm to compute a typographically correct default line spacing. The goal is to free applications from Macintosh or Windows-specific metrics which are constrained by backward compatibility requirements. These new metrics, when combined with the character design widths, will allow applications to lay out documents in a typographically correct and portable fashion. These metrics will be exposed through Windows APIs. Macintosh applications will need to access the 'sfnt' resource and parse it to extract this data from the 'OS/2' table.

For CJK (Chinese, Japanese, and Korean) fonts that are intended to be used for vertical writing (in addition to horizontal writing), the required value for sTypoAscender is that which describes the top of the of the ideographic em-box. For example, if the ideographic em-box of the font extends from coordinates 0,-120 to 1000,880 (that is, a 1000x1000 box set 120 design units below the Latin baseline), then the value of sTypoAscender must be set to 880. Failing to adhere to these requirements will result in incorrect vertical layout."

	^self bytes shortAt: 69
]

{ #category : #accessing }
PtOTOS2 >> typoDescender [
	"Format: 	SHORT
Description: 	The typographic descender for this font. Remember that this is not the same as the Descender value in the 'hhea' table, which Apple defines in a far different manner. One good source for sTypoDescender in Latin based fonts is the Descender value from an AFM file. For CJK fonts see below.

The suggested usage for sTypoDescender is that it be used in conjunction with unitsPerEm to compute a typographically correct default line spacing. The goal is to free applications from Macintosh or Windows-specific metrics which are constrained by backward compatability requirements. These new metrics, when combined with the character design widths, will allow applications to lay out documents in a typographically correct and portable fashion. These metrics will be exposed through Windows APIs. Macintosh applications will need to access the 'sfnt' resource and parse it to extract this data from the 'OS/2' table (unless Apple exposes the 'OS/2' table through a new API).

For CJK (Chinese, Japanese, and Korean) fonts that are intended to be used for vertical writing (in addition to horizontal writing), the required value for sTypoDescender is that which describes the bottom of the of the ideographic em-box. For example, if the ideographic em-box of the font extends from coordinates 0,-120 to 1000,880 (that is, a 1000x1000 box set 120 design units below the Latin baseline), then the value of sTypoDescender must be set to -120. Failing to adhere to these requirements will result in incorrect vertical layout. "

	^self bytes shortAt: 71
]

{ #category : #accessing }
PtOTOS2 >> version [
	"Format: 	2-byte unsigned short
Units: 			n/a
Title: 			OS/2 table version number.
Description: 	The version number for this OS/2 table.
Comments: 		The version number allows for identification of the precise contents and layout for the OS/2 table. 
				The version number for this layout is three (3). 
				Versions zero (0, TrueType rev 1.5), one (1, TrueType rev 1.66), and two (2, OpenType rev 1.2) have been used previously."

	^self bytes unsignedShortAt: 1
]

{ #category : #accessing }
PtOTOS2 >> weightClass [
	"Format: 	2-byte unsigned short
Title: 			Weight class.
Description: 	Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
Comments:
Value 	Description 				C Definition (from windows.h)
100 	Thin 					FW_THIN
200 	Extra-light (Ultra-light) 	FW_EXTRALIGHT
300 	Light 					FW_LIGHT
400 	Normal (Regular) 		FW_NORMAL
500 	Medium 				FW_MEDIUM
600 	Semi-bold (Demi-bold) 	FW_SEMIBOLD
700 	Bold 					FW_BOLD
800 	Extra-bold (Ultra-bold) 	FW_EXTRABOLD
900 	Black (Heavy) 			FW_BLACK"

	^self bytes unsignedShortAt: 5
]

{ #category : #accessing }
PtOTOS2 >> widthClass [
	"Format: 	2-byte unsigned short
Title: 			Width class.
Description: 	Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
Comments: 		Although every character in a font may have a different numeric aspect ratio, 
				each character in a font of normal width has a relative aspect ratio of one. 
				When a new type style is created of a different width class (either by a font designer or by some automated means) 
				the relative aspect ratio of the characters in the new font is 
				some percentage greater or less than those same characters in the normal font -- it is this difference that this parameter specifies.

Value 	Description 			C Definition 							% of normal
1 		Ultra-condensed 	FWIDTH_ULTRA_CONDENSED 	50
2 		Extra-condensed 	FWIDTH_EXTRA_CONDENSED 	62.5
3 		Condensed 			FWIDTH_CONDENSED 			75
4 		Semi-condensed 	FWIDTH_SEMI_CONDENSED 		87.5
5 		Medium (normal) 	FWIDTH_NORMAL 					100
6 		Semi-expanded 		FWIDTH_SEMI_EXPANDED 		112.5
7 		Expanded 			FWIDTH_EXPANDED 				125
8 		Extra-expanded 		FWIDTH_EXTRA_EXPANDED 		150
9 		Ultra-expanded 		FWIDTH_ULTRA_EXPANDED 		200"

	^self bytes unsignedShortAt: 7
]

{ #category : #accessing }
PtOTOS2 >> xHeight [
	"Format: 	SHORT
Description: 	This metric specifies the distance between the baseline and the approximate height of non-ascending lowercase letters measured in FUnits. This value would normally be specified by a type designer but in situations where that is not possible, for example when a legacy font is being converted, the value may be set equal to the top of the unscaled and unhinted glyph bounding box of the glyph encoded at U+0078 (LATIN SMALL LETTER X). If no glyph is encoded in this position the field should be set to 0.

This metric, if specified, can be used in font substitution: the xHeight value of one font can be scaled to approximate the apparent size of another. "

	^self bytes shortAt: 87
]
