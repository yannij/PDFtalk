Class {
	#name : #PtFCharacterDecodingTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #tests }
PtFCharacterDecodingTests >> testAdobeExamples [
	"see http://www.adobe.com/devnet/opentype/archives/glyph.html
	or http://www.adobe.com/devnet-archive/opentype/archives/glyph.html
	section 3"

	self assert: (PSCharacterNames unicodesForGlyphName: #Lcommaaccent) size = 1.
	self assert: (PSCharacterNames unicodesForGlyphName: #Lcommaaccent) first = 16r013B.
	self assert: (PSCharacterNames unicodesForGlyphName: #Lcommaaccent) first asCharacter asSource = '$Ļ'.
	self assert: (PSCharacterNames unicodesForGlyphName: #uni20AC0308) size = 2.
	self assert: (PSCharacterNames unicodesForGlyphName: #uni20AC0308) asArray = #(16r20AC 16r0308).
	self assert: (PSCharacterNames unicodesForGlyphName: #uni20AC0308) first asCharacter asSource = '$€'.
	self assert: (PSCharacterNames unicodesForGlyphName: #uni20AC0308) last asCharacter asSource = '$̈'.
	self assert: (PSCharacterNames unicodesForGlyphName: #u1040C) size = 1.
	self assert: (PSCharacterNames unicodesForGlyphName: #u1040C) first = 16r1040C.
	self assert: (PSCharacterNames unicodesForGlyphName: #uniD801DC0C) isEmpty.
	self assert: (PSCharacterNames unicodesForGlyphName: #uni20ac) isEmpty.
	self assert: (PSCharacterNames unicodesForGlyphName: #'Lcommaaccent_uni20AC0308_u1040C.alternate') size = 4.
	self assert: (PSCharacterNames unicodesForGlyphName: #'Lcommaaccent_uni20AC0308_u1040C.alternate') asArray = #(16r013B 16r20AC 16r0308 16r1040C).
	self assert: (PSCharacterNames unicodesForGlyphName: #foo) isEmpty.
	self assert: (PSCharacterNames unicodesForGlyphName: #'.notdef') isEmpty
]

{ #category : #tests }
PtFCharacterDecodingTests >> testCharacterNames [
	self assert: (PSCharacterNames characterNamesAtUnicode: 16r013B) sorted = #(#Lcedilla #Lcommaaccent).
	self assert: ((PtFFontBody named: 'Helvetica') characterNameAtUnicode: 16r013B) = #Lcommaaccent.
	self assert: (PSCharacterNames characterNamesAtUnicode: 16r20AC) sorted = #(#euro #Euro).
	self assert: ((PtFFontBody named: 'Helvetica') characterNameAtUnicode: 16r20AC) = #Euro.
	self assert: (PSCharacterNames characterNamesAtUnicode: 16r0308) = #(#dieresiscmb).
	self assert: ((PtFFontBody named: 'Helvetica') characterNameAtUnicode: 16r0308) = #'.notdef'.
	self assert: (PSCharacterNames characterNamesAtUnicode: 16r1040C) = #(#u1040C).
	self assert: (PSCharacterNames characterNamesAtUnicode: 16rD801) = #(#'.notdef').
	self assert: (PSCharacterNames characterNamesAtUnicode: 16rDC0C) = #(#'.notdef').
	self assert: (PSCharacterNames characterNamesAtUnicode: 16rFFFF) = #(#uniFFFF).
	self assert: ((PtFFontBody named: 'Helvetica') characterNameAtUnicode: 16rFFFF) = #'.notdef'.
	self assert: (PSCharacterNames unicodesForGlyphName: #uniFFFF) asArray = #(16rFFFF).
]
