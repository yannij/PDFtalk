Extension { #name : #PtFFont }

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFont >> addPDFFontFileTo: aFontDescriptor [
	"do nothing"
]

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFont >> newPDFEncodingWith: extraGlyphs [
	"<Symbol | Encoding>"

	| encoding runs diffs |
	extraGlyphs isEmpty ifTrue: [
		^#WinAnsiEncoding].
	runs := extraGlyphs values asSortedCollection piecesCutWhere: [:code1 :code2 |
		code1 + 1 ~= code2].
	diffs := OrderedCollection new.
	runs do: [:run |
		diffs add: run first.
		diffs addAll: (run collect: [:code | (extraGlyphs keyAtValue: code) name asSymbol])].
	encoding := (PDF classAt: #Encoding) empty.
	encoding at: #BaseEncoding put: #WinAnsiEncoding.
	encoding at: #Differences put: diffs.
	^encoding
]

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFont >> pdfFont [
	"<PDFtalk.Font>
	PDF structure to be embedded into a PDF Document"

	| pdfFont fontDescriptor |
	pdfFont := (PDF classAt: #Type1) empty.
	fontDescriptor := self pdfFontDescriptor.
	pdfFont at: #BaseFont put: fontDescriptor FontName.
	pdfFont at: #FontDescriptor put: fontDescriptor newReference.
	^pdfFont
]

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFont >> pdfFontDescriptor [
	| fontDescriptor |
	fontDescriptor := (PDF classAt: #FontDescriptor) empty.
	fontDescriptor at: #FontName put: self postScriptName asSymbol.
	fontDescriptor at: #Flags put: self pdfFlags.
	fontDescriptor at: #FontBBox put: self fontBBoxInStandardGlyphSpace.
	fontDescriptor at: #ItalicAngle put: self italicAngle.
	fontDescriptor at: #Ascent put: (self inStandardGlyphSpace: self ascender).
	fontDescriptor at: #Descent put: (self inStandardGlyphSpace: self descender).
	fontDescriptor at: #CapHeight put: (self inStandardGlyphSpace: self capHeight).
	fontDescriptor at: #StemV put: (self inStandardGlyphSpace: self stemV).
	self addPDFFontFileTo: fontDescriptor.
	^fontDescriptor
]

{ #category : #'*PDFtalk-Fonts-accessing' }
PtFFont >> pdfStringWithTabularCharacters: aString for: aPDFRenderer [
	"<String>
	string with WinAnsiEncoding where tabular glyphs are specially encoded.
	Tabular glyphs are not supported in PostScript Type-1 fonts"

	^aString
]

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFont >> pdfWinAnsiEncodingAttributesWith: extraGlyphs [
	| lastCharIndex lastChar firstCharIndex w firstChar widths dict |
	widths := self class winAnsiEncoder decoder asArray collect: [:char |
		(self glyphOrNilAtUnicode: char asInteger) ifNotNil: [:glyph | glyph width]].
	extraGlyphs keysAndValuesDo: [:glyph :code | widths at: code + 1 put: glyph width].
	firstChar := nil.
	firstCharIndex := 1.
	[firstChar isNil] whileTrue: [
		(widths at: firstCharIndex) ifNil: [firstCharIndex := firstCharIndex + 1] ifNotNil: [
			firstChar := firstCharIndex]].
	lastChar := nil.
	lastCharIndex := 256.
	[lastChar isNil] whileTrue: [
		(widths at: lastCharIndex) ifNil: [lastCharIndex := lastCharIndex - 1] ifNotNil: [
			lastChar := lastCharIndex]].
	w := widths copyFrom: firstChar to: lastChar.
	w replaceAll: nil with: self glyphs first width.
	dict := Valuemap new.
	dict at: #Widths put: (w collect: [:width | self inStandardGlyphSpace: width]).
	dict at: #FirstChar put: firstChar - 1.
	dict at: #LastChar put: lastChar - 1.
	dict at: #Encoding put: (self newPDFEncodingWith: extraGlyphs).
	^dict
]
