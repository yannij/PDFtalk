"
Set width information for the glyph and declare that the glyph description specifies both its shape and its colour.

NOTE	This operator name ends in the digit 0.

wx denotes the horizontal displacement in the glyph coordinate system; 
it shall be consistent with the corresponding width in the font’s Widths array. 
wy shall be 0.

This operator shall only be permitted in a content stream appearing in a Type 3 font’s CharProcs dictionary. 
It is typically used only if the glyph description executes operators to set the colour explicitly.
"
Class {
	#name : #PtSetType3GlyphWidth,
	#superclass : #PtType3FontOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetType3GlyphWidth class >> documentation [
	^'Set width information for the glyph and declare that the glyph description specifies both its shape and its colour.

NOTE	This operator name ends in the digit 0.

wx denotes the horizontal displacement in the glyph coordinate system; it shall be consistent with the corresponding width in the font’s Widths array. wy shall be 0.

This operator shall only be permitted in a content stream appearing in a Type 3 font’s CharProcs dictionary. It is typically used only if the glyph description executes operators to set the colour explicitly.'
]

{ #category : #accessing }
PtSetType3GlyphWidth class >> operandTypes [
	^#(#('wx' Number) #('wy' Number))
]

{ #category : #accessing }
PtSetType3GlyphWidth class >> operatorName [
	^#d0
]
