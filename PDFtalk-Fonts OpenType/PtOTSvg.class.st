"
OpenType fonts with either TrueType or CFF outlines may also contain an optional ‘SVG ’ table, which allows some or all glyphs in the font to be defined with color, gradients, or animation.

SVG - The SVG (Scalable Vector Graphics) table

This table contains SVG descriptions for some or all of the glyphs in the font. For every SVG glyph description, there must also exist a corresponding CFF or TT glyph description in the font.
"
Class {
	#name : #PtOTSvg,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTSvg class >> tag [
	^'SVG '
]
