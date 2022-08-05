"
The Glyph Substitution table (GSUB) contains information for substituting glyphs to render the scripts and language systems supported in a font. Many language systems require glyph substitutes. For example, in the Arabic script, the glyph shape that depicts a particular character varies according to its position in a word or text string. In other language systems, glyph substitutes are aesthetic options for the user, such as the use of ligature glyphs in the English language.
"
Class {
	#name : #PtOTGsub,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTGsub class >> tag [
	^'GSUB'
]
