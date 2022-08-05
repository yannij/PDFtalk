"
This table specifies the y coordinate of the vertical origin of every glyph in the font.

This table may be optionally present only in CFF OpenType fonts. If present in TrueType OpenType fonts it must be ignored by font clients, just as any other unrecognized table would be. This is because this table is not needed for TrueType OpenType fonts: the Vertical Metrics ('vmtx') and Glyph Data ('glyf') tables in TrueType OpenType fonts provide all the information necessary to accurately calculate the y coordinate of a glyph's vertical origin. See the “Vertical Origin and Advance Height” section in the 'vmtx' table specification for more details.

This table was added to version 1.3 of the OpenType specification. Note that the 'vmtx' and Vertical Header ('vhea') tables continue to be required for all OpenType fonts that support vertical writing. Advance heights must continue to be obtained from the 'vmtx' table; that is the only place they are stored.

If a 'VORG' table is present in a CFF OpenType font, a font client may choose to obtain the y coordinate of a glyph's vertical origin either:

   1. directly from the 'VORG', or:
   2. by first calculating the top of the glyph's bounding box from the CFF charstring data and then adding to it the glyph's top side bearing from the 'vmtx' table.

The former method offers the advantage of increased accuracy and efficiency, since bounding box results calculated from the CFF charstring as in the latter method can differ depending on the rounding decisions and data types of the bounding box algorithm. The latter method provides compatibility for font clients who are either unaware of or choose not to support the 'VORG'.

Thus, the 'VORG' doesn't add any new font metric values per se; it simply improves accuracy and efficiency for CFF OpenType font clients, since the intermediate step of calculating bounding boxes from the CFF charstring is rendered unnecessary.

See the section “OpenType CJK Font Guidelines“ for more information about constructing CJK (Chinese, Japanese, and Korean) fonts.
"
Class {
	#name : #PtOTVorg,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTVorg class >> tag [
	^'VORG'
]
