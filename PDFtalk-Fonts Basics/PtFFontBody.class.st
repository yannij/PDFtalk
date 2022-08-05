"
reimplemented from VW PostScriptFontBody

Bugfix: afm (Ascii Font Metric) files are processed correctly
added instvar #fontBBox
"
Class {
	#name : #PtFFontBody,
	#superclass : #Object,
	#instVars : [
		'fullName',
		'family',
		'boldness',
		'italic',
		'fixedWidth',
		'setWidth',
		'widths',
		'simpleWidths',
		'encoder',
		'ascent',
		'descent',
		'underlinePosition',
		'underlineThickness',
		'fontBBox'
	],
	#classVars : [
		'PostScriptFonts'
	],
	#category : #'PDFtalk-Fonts Basics'
}

{ #category : #'font metric loading' }
PtFFontBody class >> installFromFont: aFont [
	"create an instance from the font, and add the FontBody to the printer fonts"

	| fontBody |
	fontBody := self new.
	fontBody initializeFromFont: aFont.
	self postScriptFonts at: fontBody name put: fontBody
]

{ #category : #utilities }
PtFFontBody class >> named: aName [

	^self postScriptFonts at: aName
]

{ #category : #accessing }
PtFFontBody class >> postScriptFonts [
	^PostScriptFonts ifNil: [PostScriptFonts := Dictionary new]
]

{ #category : #accessing }
PtFFontBody >> ascent [

	^ascent
]

{ #category : #accessing }
PtFFontBody >> boldness [

	^boldness
]

{ #category : #accessing }
PtFFontBody >> characterNameAtUnicode: anInteger [
	"<Symbol>"

	anInteger = Character illegalCode ifTrue: [
		^#'.notdef'].
	^(PSCharacterNames characterNamesAtUnicode: anInteger)
		detect: [:symbol |
		self widths includesKey: symbol]
		ifNone: [
		#'.notdef']
]

{ #category : #accessing }
PtFFontBody >> descent [

	^descent
]

{ #category : #accessing }
PtFFontBody >> encode: aCharacter [
	^self encoder encode: aCharacter
]

{ #category : #'initialize-release' }
PtFFontBody >> encode: cName as: code [
	code < 0 ifTrue: [
		^self].
	(PSCharacterNames characterNamed: cName) ifNotNil: [:char |
		self encoder encode: char as: code.
		self simpleWidths at: code + 1 put: (self widths at: cName)]
]

{ #category : #accessing }
PtFFontBody >> encodeSymbolic: aCharacter [
	| names |
	names := PSCharacterNames unicodeToNames at: aCharacter asInteger ifAbsent: [
		^nil].
	names do: [:name |
		(self widths includesKey: name) ifTrue: [
			^name]].
	^nil
]

{ #category : #accessing }
PtFFontBody >> encoder [
	^encoder ifNil: [encoder := PtCharacterMap new]
]

{ #category : #accessing }
PtFFontBody >> family [

	^family
]

{ #category : #accessing }
PtFFontBody >> fixedWidth [

	^fixedWidth
]

{ #category : #accessing }
PtFFontBody >> fontBBox [
	"<Rectangle>"

	^fontBBox
]

{ #category : #'initialize-release' }
PtFFontBody >> initializeFromFont: aFont [
	fullName := aFont postScriptName.
	family := aFont familyName.
	setWidth := aFont setWidth.
	boldness := aFont weight / 1000.0.
	italic := aFont isItalic.
	fixedWidth := aFont isFixedPitch.
	ascent := aFont ascenderInTextSpace.
	descent := aFont descenderInTextSpace negated.
	underlinePosition := aFont underlinePositionInTextSpace.
	underlineThickness := aFont underlineThicknessInTextSpace.
	fontBBox := aFont fontBBoxInTextSpace.
	self setEncodingFrom: aFont
]

{ #category : #accessing }
PtFFontBody >> italic [

	^italic
]

{ #category : #accessing }
PtFFontBody >> name [

	^fullName
]

{ #category : #printing }
PtFFontBody >> printOn: aStream [
	aStream
		print: self class;
		nextPut: $(;
		print: self name;
		nextPut: $)
]

{ #category : #'initialize-release' }
PtFFontBody >> release [
	self class postScriptFonts removeKey: self name.
	super release
]

{ #category : #accessing }
PtFFontBody >> serif [
	(#('avant garde gothic' 'helvetica') includes: family) ifTrue: [
		^false].
	^#('bookman' 'courier' 'new century schoolbook' 'palatino' 'times') includes: family
]

{ #category : #'initialize-release' }
PtFFontBody >> setEncoder: encode [

	encoder := encode
]

{ #category : #'initialize-release' }
PtFFontBody >> setEncodingFrom: aFont [
	| widthsAtUnicodes |
	widths := nil.
	widthsAtUnicodes := IdentityDictionary new: aFont characterGlyphs size.
	aFont characterGlyphs do: [:glyph |
		self widths at: glyph postScriptName put: glyph width.
		widthsAtUnicodes at: glyph unicode put: glyph width].
	simpleWidths := nil.
	encoder := aFont class winAnsiEncoder.
	self encoder decoder withIndexDo: [:char :index |
		widthsAtUnicodes at: char asInteger ifPresent: [:width |
			self simpleWidths at: index put: width]]
]

{ #category : #accessing }
PtFFontBody >> setWidth [

	^setWidth
]

{ #category : #accessing }
PtFFontBody >> simpleWidths [
	^simpleWidths ifNil: [simpleWidths := WordArray new: 256 withAll: 1000]
]

{ #category : #accessing }
PtFFontBody >> simpleWidthsScaledBy: aSize [
	"Answer an array that maps byte values to widths that are scaled by aSize."

	^self simpleWidths asArray collect: [:w | (w asFloat / 1000.0) * aSize]
]

{ #category : #accessing }
PtFFontBody >> underlinePosition [
	"<Float>
	location of the preferred underline, measured from the baseline as a value between 0 and 1"

	^underlinePosition
]

{ #category : #accessing }
PtFFontBody >> underlineThickness [
	"<Float>
	width of the preferred underline, as a value between 0 and 1"

	^underlineThickness
]

{ #category : #accessing }
PtFFontBody >> widthAt: code [
	"Answer the width of code as a value between 0 and 1."

	^(self widths at: code) / 1000.0
]

{ #category : #accessing }
PtFFontBody >> widths [
	^widths ifNil: [widths := IdentityDictionary new]
]
