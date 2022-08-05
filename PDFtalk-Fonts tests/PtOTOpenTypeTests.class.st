Class {
	#name : #PtOTOpenTypeTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #tests }
PtOTOpenTypeTests >> testFontHeaderReadWrite [
	self assert: PtOTFontHeader example asBytes size = 54.
	self assert: (PtOTFontHeader fromBytes: PtOTFontHeader example asBytes) asBytes = PtOTFontHeader example asBytes.
	self assert: PtOTFontHeader exampleDifferentDates asBytes size = 54.
	self assert: (PtOTFontHeader fromBytes: PtOTFontHeader exampleDifferentDates asBytes) = PtOTFontHeader exampleDifferentDates.
	self assert: (PtOTFontHeader fromBytes: PtOTFontHeader exampleDifferentDates asBytes) asBytes = PtOTFontHeader exampleDifferentDates asBytes.
	self assert: PtOTFontHeader exampleUnitsPerEm2000 asBytes size = 54.
	self assert: (PtOTFontHeader fromBytes: PtOTFontHeader exampleUnitsPerEm2000 asBytes) asBytes = PtOTFontHeader exampleUnitsPerEm2000 asBytes
]

{ #category : #tests }
PtOTOpenTypeTests >> testGlyphNameMapping [
	"no tabular glyphs (with Adobe notation of '*.tab' "

	| font |
	font := PtOTFont freeSansBold.
	self assert: font numGlyphs = 2469.
	0 to: font numGlyphs - 1 do: [:gid |
		self assert: (font glyphNamed: (font nameOfGlyph: gid)) id = gid].
	self assert: ((font tabularGlyphsFor: 'ABC') collect: #id) asArray = #(36 37 38).
	self assert: ((font tabularGlyphsFor: '0123456789') collect: #id) asArray = #(19 20 21 22 23 24 25 26 27 28).
	self assert: font tabularGlyphIds = #()
]

{ #category : #tests }
PtOTOpenTypeTests >> testNames [
	| font fontNames |
	font := PtOTFont freeSansBold.
	self assert: (font nameAt: 1) = 'FreeSans'.
	self assert: (font nameAt: 6) = 'FreeSansBold'.
	self assert: (font nameAt: 7) isNil.
	fontNames := font nameTable nameRecords select: [:nameRecord | nameRecord nameID = 2].
	self assert: (fontNames collect: #string) = #('Bold' 'получерен' 'tučné' 'fed' 'Fett' 'Έντονα' 'Bold' 'Negrita' 'Lihavoitu' 'Gras' 'Félkövér' 'Grassetto' 'Vet' 'Halvfet' 'Pogrubiony' 'Negrito' 'gros' 'Полужирный' 'Tučné' 'Fet' 'Kalın' 'huruf tebal' 'жирний' 'Krepko' 'treknraksts' 'pusjuodis' 'đậm' 'Lodia').
	fontNames := font nameTable nameRecords select: [:nameRecord | nameRecord nameID = 4].
	self assert: (fontNames collect: #string) = #(
'Free Sans Bold' 
'Free Sans получерен' 
'Free Sans tučné' 
'Free Sans fed' 
'Free Sans Fett' 
'Free Sans Έντονα' 
'Free Sans Bold' 
'Free Sans Negrita' 
'Free Sans Lihavoitu' 
'Free Sans Gras' 
'Free Sans Félkövér' 
'Free Sans Grassetto' 
'Free Sans Vet' 
'Free Sans Halvfet' 
'Free Sans Pogrubiony' 
'Free Sans Negrito' 
'Free Sans gros' 
'Free Sans Полужирный' 
'Free Sans Tučné' 
'Free Sans Fet' 
'Free Sans Kalın' 
'Free Sans huruf tebal' 
'Free Sans жирний' 
'Free Sans Krepko' 
'Free Sans treknraksts' 
'Free Sans pusjuodis' 
'Free Sans đậm' 
'Free Sans Lodia')
]

{ #category : #tests }
PtOTOpenTypeTests >> testStringWidthWithUndefinedGlyphs [
	| font string |
	font := PtOTFont freeSansBold.
	string := String
		with: 1 asCharacter
		with: 32 asCharacter
		with: 3 asCharacter
		with: $A.
	self shouldnt: [(font widthOfString: string) * 10] raise: Error
]
