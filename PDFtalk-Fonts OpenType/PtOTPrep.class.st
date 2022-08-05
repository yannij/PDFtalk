"
The Control Value Program consists of a set of TrueType instructions that will be executed whenever the font or point size or transformation matrix change and before each glyph is interpreted. Any instruction is legal in the CV Program but since no glyph is associated with it, instructions intended to move points within a particular glyph outline cannot be used in the CV Program. The name 'prep' is anachronistic (the table used to be known as the Pre Program table.)
"
Class {
	#name : #PtOTPrep,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTPrep class >> tag [
	^'prep'
]
