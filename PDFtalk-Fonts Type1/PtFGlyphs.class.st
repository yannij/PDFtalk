"
a container for all glyphs of a font
"
Class {
	#name : #PtFGlyphs,
	#superclass : #Object,
	#instVars : [
		'glyphs',
		'font'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFGlyphs class >> on: someGlyphs font: aFont [
	| inst |
	inst := self new.
	inst initializeGlyphs: someGlyphs font: aFont.
	^inst
]

{ #category : #accessing }
PtFGlyphs >> font [
	^font
]

{ #category : #accessing }
PtFGlyphs >> glyphs [
	^glyphs ifNil: [#()]
]

{ #category : #'initialize-release' }
PtFGlyphs >> initializeGlyphs: someGlyphs font: aFont [
	glyphs := someGlyphs.
	font := aFont
]
