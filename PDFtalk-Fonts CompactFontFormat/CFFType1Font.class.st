"
A Type-1 font stored in a font set of a CFF file

"
Class {
	#name : #CFFType1Font,
	#superclass : #CFFFont,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFType1Font >> ascender [
	^self file ascender
]

{ #category : #testing }
CFFType1Font >> canDisplayUnencodedGlyphs [
	^self file canDisplayUnencodedGlyphs
]

{ #category : #accessing }
CFFType1Font >> capHeight [
	^self file capHeight
]

{ #category : #accessing }
CFFType1Font >> descender [
	^self file descender
]

{ #category : #accessing }
CFFType1Font >> xHeight [
	^self file xHeight
]
