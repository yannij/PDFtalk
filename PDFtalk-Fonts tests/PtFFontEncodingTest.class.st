Class {
	#name : #PtFFontEncodingTest,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #Testing }
PtFFontEncodingTest >> testDecoderDifferenceToISO8859_1 [
	| fontEncoder isoEncoder fontDecoderSet isoDecoderSet inFontButNotInIso inIsoButNotInFont inFontButNotInIsoString inIsoButNotInFontString |
	fontEncoder := (PtFFontBody named: 'Helvetica') encoder.
	isoEncoder := PtCharacterMap iso8859_1.
	fontDecoderSet := fontEncoder decoder asSet.
	isoDecoderSet := isoEncoder decoder asSet.
	inFontButNotInIso := fontDecoderSet reject: [:i | isoDecoderSet includes: i].
	inIsoButNotInFont := isoDecoderSet reject: [:i1 | fontDecoderSet includes: i1].
	inFontButNotInIsoString := String fromString: inFontButNotInIso asSortedCollection.
	inIsoButNotInFontString := String fromString: inIsoButNotInFont asSortedCollection.
	self assert: inFontButNotInIsoString = 'ŒœŠšŸŽžƒˆ˜–—‘’‚“”„†‡•…‰‹›€™￿'.
	self deny: inIsoButNotInFontString = ' 	

''` ¤¦­²³µ¹¼½¾Ð×ÝÞðýþ'
]

{ #category : #Testing }
PtFFontEncodingTest >> testDifferenceToISO8859_1 [
	| fontEncoder isoEncoder fontEncoderDict isoEncoderDict inFontButNotInIso inIsoButNotInFont |
	fontEncoder := (PtFFontBody named: 'Helvetica') encoder.
	isoEncoder := PtCharacterMap iso8859_1.
	fontEncoderDict := fontEncoder instVarNamed: #encoder asString.
	isoEncoderDict := isoEncoder instVarNamed: #encoder asString.
	inFontButNotInIso := fontEncoderDict reject: [:i | isoEncoderDict includes: i].
	inIsoButNotInFont := isoEncoderDict reject: [:i1 | fontEncoderDict includes: i1].
	self assert: inFontButNotInIso isEmpty.
	self deny: inIsoButNotInFont isEmpty
]

{ #category : #Testing }
PtFFontEncodingTest >> testISO8859_15Encoder [
	| wst string |
	wst := ((ByteArray new: 1000) withEncoding: #ISO8859_15) writeStream.
	"isoEncoder := StreamEncoder lookupEncoderDirectory: #ISO8859_15."
	wst nextPutAll: 'äöüÄÖÜß€'.
	string := wst encodedContents asStringEncoding: #ISO8859_15.
	self assert: string = 'äöüÄÖÜß€'
]

{ #category : #Testing }
PtFFontEncodingTest >> testSomeSymbolicEncodings [
	| font |
	font := PtFFontBody named: 'Helvetica'.
	self assert: (font encodeSymbolic: $Ä) = #Adieresis.
	self assert: (font encodeSymbolic: $ä) = #adieresis.
	self assert: (font encodeSymbolic: $Ö) = #Odieresis.
	self assert: (font encodeSymbolic: $ö) = #odieresis.
	self assert: (font encodeSymbolic: $Ü) = #Udieresis.
	self assert: (font encodeSymbolic: $ü) = #udieresis.
	self assert: (font encodeSymbolic: $ß) = #germandbls.
	self assert: (font encodeSymbolic: 16r20AC asCharacter) = #Euro.
	self assert: (font encodeSymbolic: $€) = #Euro
]

{ #category : #Testing }
PtFFontEncodingTest >> testSymbolicEncoding [
	| font decodingArray list wst psEncoding |
	font := PtFFontBody named: 'Helvetica'.
	decodingArray := font encoder decoder.
	list := OrderedCollection new: 128.
	129 to: 256 do: [:char |
		| symb |
		symb := font encodeSymbolic: (decodingArray at: char).
		symb isNil
			ifTrue: [list add: #space]
			ifFalse: [list add: symb]].
	wst := WriteStream on: (String new: 1000).
	list do: [:symbol |
		wst nextPut: $/.
		wst nextPutAll: symbol asString].
	psEncoding := wst contents.
	self assert: psEncoding = '/Euro/space/quotesinglbase/florin/quotedblbase/ellipsis/dagger/daggerdbl/circumflex/perthousand/Scaron/guilsinglleft/OE/space/Zcaron/space/space/quoteleft/quoteright/quotedblleft/quotedblright/bullet/endash/emdash/tilde/trademark/scaron/guilsinglright/oe/space/zcaron/Ydieresis/space/exclamdown/cent/sterling/currency/yen/brokenbar/section/dieresis/copyright/ordfeminine/guillemotleft/logicalnot/space/registered/macron/degree/plusminus/twosuperior/threesuperior/acute/mu/paragraph/periodcentered/cedilla/onesuperior/ordmasculine/guillemotright/onequarter/onehalf/threequarters/questiondown/Agrave/Aacute/Acircumflex/Atilde/Adieresis/Aring/AE/Ccedilla/Egrave/Eacute/Ecircumflex/Edieresis/Igrave/Iacute/Icircumflex/Idieresis/Eth/Ntilde/Ograve/Oacute/Ocircumflex/Otilde/Odieresis/multiply/Oslash/Ugrave/Uacute/Ucircumflex/Udieresis/Yacute/Thorn/germandbls/agrave/aacute/acircumflex/atilde/adieresis/aring/ae/ccedilla/egrave/eacute/ecircumflex/edieresis/igrave/iacute/icircumflex/idieresis/eth/ntilde/ograve/oacute/ocircumflex/otilde/odieresis/divide/oslash/ugrave/uacute/ucircumflex/udieresis/yacute/thorn/ydieresis'
]

{ #category : #Testing }
PtFFontEncodingTest >> testSymbolicEncodingsSymbol [
	| font |
	[font := PtFFontBody named: 'Symbol'] on: KeyNotFound do: [:ex |
		^self].
	self assert: (font encodeSymbolic: $Ä) isNil.
	self assert: (font encodeSymbolic: $ä) isNil.
	self assert: (font encodeSymbolic: $Ö) isNil.
	self assert: (font encodeSymbolic: $ö) isNil.
	self assert: (font encodeSymbolic: $Ü) isNil.
	self assert: (font encodeSymbolic: $ü) isNil.
	self assert: (font encodeSymbolic: $ß) isNil.
	self assert: (font encodeSymbolic: 16r20AC asCharacter) = #Euro.
	self assert: (font encodeSymbolic: $€) = #Euro
]
