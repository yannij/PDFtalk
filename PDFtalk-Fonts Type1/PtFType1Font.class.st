"
A Type 1 PostScript font
"
Class {
	#name : #PtFType1Font,
	#superclass : #PtFFont,
	#instVars : [
		'metrics'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'accessing metrics' }
PtFType1Font >> ascender [
	^self metrics ascender
]

{ #category : #testing }
PtFType1Font >> canDisplayCharacter: aCharacter [
	^(self characterCodeOf: aCharacter) ~= Character illegalCode
]

{ #category : #'accessing metrics' }
PtFType1Font >> capHeight [
	| height |
	height := self metrics capHeight.
	height isZero ifTrue: [
		^self ascender].
	^height
]

{ #category : #accessing }
PtFType1Font >> characterCodeOf: aCharacter [
	^self encoder encode: aCharacter
]

{ #category : #accessing }
PtFType1Font >> characterGlyphs [
	^self glyphs
]

{ #category : #'accessing metrics' }
PtFType1Font >> descender [
	^self metrics descender
]

{ #category : #accessing }
PtFType1Font >> encoder [
	^self class winAnsiEncoder
]

{ #category : #accessing }
PtFType1Font >> file [
	^self
]

{ #category : #'accessing metrics' }
PtFType1Font >> fontBBox [
	^self metrics fontBBox
]

{ #category : #accessing }
PtFType1Font >> glyphOrNilAtUnicode: aUnicodeInteger [
	| code |
	aUnicodeInteger = Character illegalCode ifTrue: [
		^nil].
	code := self characterCodeOf: aUnicodeInteger asCharacter.
	code = Character illegalCode ifTrue: [
		^nil].
	(PSCharacterNames characterNamesAtUnicode: aUnicodeInteger) do: [:psName |
		(self glyphs detect: [:glyph | glyph postScriptName = psName] ifNone: [nil]) ifNotNil: [:glyph |
			^glyph]].
	^nil
]

{ #category : #accessing }
PtFType1Font >> glyphs [
	^self metrics charMetrics
]

{ #category : #'initialize-release' }
PtFType1Font >> initializeMetrics: aFontMetrics [
	aFontMetrics font: self.
	metrics := aFontMetrics
]

{ #category : #testing }
PtFType1Font >> isFixedPitch [
	^self metrics isFixedPitch
]

{ #category : #testing }
PtFType1Font >> isItalic [
	^self metrics isItalic
]

{ #category : #accessing }
PtFType1Font >> italicAngle [
	^self metrics italicAngle
]

{ #category : #'accessing metrics' }
PtFType1Font >> leftSideBearingOfUnicode: unicode [
	^(self metrics charMetricAt: unicode) ifNil: [0] ifNotNil: [:metric | metric leftSideBearing]
]

{ #category : #'accessing metrics' }
PtFType1Font >> metrics [
	"<AdobeFontMetrics>
	the metrics from a .AFM file (.PFM are not sufficient)"

	^metrics
]

{ #category : #accessing }
PtFType1Font >> name [
	^self postScriptName
]

{ #category : #accessing }
PtFType1Font >> postScriptName [
	"<String>
	the name as used by PostScript and PDF"

	^self metrics postScriptName
]

{ #category : #printing }
PtFType1Font >> printOn: stream [
	stream
		nextPutAll: 'Type1(';
		nextPutAll: self postScriptName;
		nextPut: $)
]

{ #category : #'accessing metrics' }
PtFType1Font >> stemV [
	^self metrics stemV
]

{ #category : #accessing }
PtFType1Font >> undefinedGlyph [
	"sometimes there is no .notdef glyph in the font - a space is returned, if even this is not available, the first glyph is returned"

	^self glyphs detect: [:glyph | glyph postScriptName asString = '.notdef'] ifNone: [
		self glyphs detect: [:glyph | glyph postScriptName asString = 'space'] ifNone: [
			self glyphs first]]
]

{ #category : #'accessing metrics' }
PtFType1Font >> underlinePosition [
	^self metrics underlinePosition
]

{ #category : #'accessing metrics' }
PtFType1Font >> underlineThickness [
	^self metrics underlineThickness
]

{ #category : #accessing }
PtFType1Font >> weight [
	^self metrics weightNumber
]

{ #category : #'accessing metrics' }
PtFType1Font >> widthOfUndefinedGlyph [
	^self unitsPerEm
]

{ #category : #'accessing metrics' }
PtFType1Font >> xHeight [
	^self metrics xHeight
]
