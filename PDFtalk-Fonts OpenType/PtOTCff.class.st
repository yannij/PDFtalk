"
This table contains a compact representation of a PostScript Type 1, or CIDFont and is structured according to Adobe Technical Note #5176: “The Compact Font Format Specification,” and Adobe Technical Note #5177: “Type 2 Charstring Format.”

Existing TrueType fonts use a glyph index to specify and access glyphs within a font, e.g. to index the loca table and thereby access glyph data in the glyf table. This concept is retained in OpenType™ PostScript fonts except that glyph data is accessed through the CharStrings INDEX of the CFF table.
"
Class {
	#name : #PtOTCff,
	#superclass : #PtOTTable,
	#instVars : [
		'fontSet'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCff class >> tag [
	^'CFF '
]

{ #category : #accessing }
PtOTCff >> fontSet [
	"<FontSet>"

	^fontSet ifNil: [
		fontSet := CFFFontSet for: self file fromBytes: self contents readStream]
]

{ #category : #accessing }
PtOTCff >> forceBold [
	"<Boolean>"

	^self fontSet forceBold
]

{ #category : #accessing }
PtOTCff >> nameOfGlyph: aGlyphId [
	"<String>"

	^self fontSet nameOfGlyph: aGlyphId
]

{ #category : #printing }
PtOTCff >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'tag' value: self tag).
	args add: (printer optional: 'contents' value: contents).
	args add: (printer constant: 'fontSet' value: self fontSet).
	^printer printvalue: self arguments: args
]
