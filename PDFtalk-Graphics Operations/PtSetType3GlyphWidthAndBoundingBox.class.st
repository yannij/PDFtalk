"
Set width and bounding box information for the glyph and declare that the glyph description specifies only shape, not colour.

NOTE	This operator name ends in the digit 1.

wx denotes the horizontal displacement in the glyph coordinate system; it shall be consistent with the corresponding width in the font’s Widths array. 
wy shall be 0.

llx and lly denote the coordinates of the lower-left corner, and urx and ury denote the upper-right corner, of the glyph bounding box. 
The glyph bounding box is the smallest rectangle, oriented with the axes of the glyph coordinate system, 
that completely encloses all marks placed on the page as a result of executing the glyph’s description. 
The declared bounding box shall be correct—in other words, sufficiently large to enclose the entire glyph. 
If any marks fall outside this bounding box, the result is unpredictable.

A glyph description that begins with the d1 operator should not execute any operators that set the colour (or other colour-related parameters) in the graphics state; 
any use of such operators shall be ignored. 
The glyph description is executed solely to determine the glyph’s shape. 
Its colour shall be determined by the graphics state in effect each time this glyph is painted by a text-showing operator. 
For the same reason, the glyph description shall not include an image; 
however, an image mask is acceptable, since it merely defines a region of the page to be painted with the current colour.

This operator shall be used only in a content stream appearing in a Type 3 font’s CharProcs dictionary
"
Class {
	#name : #PtSetType3GlyphWidthAndBoundingBox,
	#superclass : #PtType3FontOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetType3GlyphWidthAndBoundingBox class >> documentation [
	^'Set width and bounding box information for the glyph and declare that the glyph description specifies only shape, not colour.

NOTE	This operator name ends in the digit 1.

wx denotes the horizontal displacement in the glyph coordinate system; it shall be consistent with the corresponding width in the font’s Widths array. wy shall be 0.

llx and lly denote the coordinates of the lower-left corner, and urx and ury denote the upper-right corner, of the glyph bounding box. The glyph bounding box is the smallest rectangle, oriented with the axes of the glyph coordinate system, that completely encloses all marks placed on the page as a result of executing the glyph’s description. The declared bounding box shall be correct—in other words, sufficiently large to enclose the entire glyph. If any marks fall outside this bounding box, the result is unpredictable.

A glyph description that begins with the d1 operator should not execute any operators that set the colour (or other colour-related parameters) in the graphics state; any use of such operators shall be ignored. The glyph description is executed solely to determine the glyph’s shape. Its colour shall be determined by the graphics state in effect each time this glyph is painted by a text-showing operator. For the same reason, the glyph description shall not include an image; however, an image mask is acceptable, since it merely defines a region of the page to be painted with the current colour.

This operator shall be used only in a content stream appearing in a Type 3 font’s CharProcs dictionary'
]

{ #category : #accessing }
PtSetType3GlyphWidthAndBoundingBox class >> operandTypes [
	^#(#('wx' Number) #('wy' Number) #('llx' Number) #('lly' Number) #('urx' Number) #('ury' Number))
]

{ #category : #accessing }
PtSetType3GlyphWidthAndBoundingBox class >> operatorName [
	^#d1
]
