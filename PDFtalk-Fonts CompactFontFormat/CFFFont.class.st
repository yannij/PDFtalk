"
A font stored in a font set of a CFF file
"
Class {
	#name : #CFFFont,
	#superclass : #Object,
	#instVars : [
		'file',
		'name',
		'topDict',
		'encoding',
		'charset',
		'privateDict',
		'charStrings',
		'strings',
		'localSubr',
		'globalSubr'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFFont class >> name: nameString file: anOpenTypeFile topDict: topDictTopDict encoding: encodingEncoding charset: charsetCharset privateDict: privateDictPrivateDict charStrings: charStringsArray strings: stringsArray localSubr: localSubrArray globalSubr: globalSubrArray [
	| inst |
	inst := self new.
	inst
		initializeName: nameString
		file: anOpenTypeFile
		topDict: topDictTopDict
		encoding: encodingEncoding
		charset: charsetCharset
		privateDict: privateDictPrivateDict
		charStrings: charStringsArray
		strings: stringsArray
		localSubr: localSubrArray
		globalSubr: globalSubrArray.
	^inst
]

{ #category : #accessing }
CFFFont class >> standardStrings [
	"from Appendix A"

	^#('.notdef' 'space' 'exclam' 'quotedbl' 'numbersign' 'dollar' 'percent' 'ampersand' 'quoteright' 'parenleft' 'parenright' 'asterisk' 'plus' 'comma' 'hyphen' 'period' 'slash' 'zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'colon' 'semicolon' 'less' 'equal' 'greater' 'question' 'at' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' 'bracketleft' 'backslash' 'bracketright' 'asciicircum' 'underscore' 'quoteleft' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' 'braceleft' 'bar' 'braceright' 'asciitilde' 'exclamdown' 'cent' 'sterling' 'fraction' 'yen' 'florin' 'section' 'currency' 'quotesingle' 'quotedblleft' 'guillemotleft' 'guilsinglleft' 'guilsinglright' 'fi' 'fl' 'endash' 'dagger' 'daggerdbl' 'periodcentered' 'paragraph' 'bullet' 'quotesinglbase' 'quotedblbase' 'quotedblright' 'guillemotright' 'ellipsis' 'perthousand' 'questiondown' 'grave' 'acute' 'circumflex' 'tilde' 'macron' 'breve' 'dotaccent' 'dieresis' 'ring' 'cedilla' 'hungarumlaut' 'ogonek' 'caron' 'emdash' 'AE' 'ordfeminine' 'Lslash' 'Oslash' 'OE' 'ordmasculine' 'ae' 'dotlessi' 'lslash' 'oslash' 'oe' 'germandbls' 'onesuperior' 'logicalnot' 'mu' 'trademark' 'Eth' 'onehalf' 'plusminus' 'Thorn' 'onequarter' 'divide' 'brokenbar' 'degree' 'thorn' 'threequarters' 'twosuperior' 'registered' 'minus' 'eth' 'multiply' 'threesuperior' 'copyright' 'Aacute' 'Acircumflex' 'Adieresis' 'Agrave' 'Aring' 'Atilde' 'Ccedilla' 'Eacute' 'Ecircumflex' 'Edieresis' 'Egrave' 'Iacute' 'Icircumflex' 'Idieresis' 'Igrave' 'Ntilde' 'Oacute' 'Ocircumflex' 'Odieresis' 'Ograve' 'Otilde' 'Scaron' 'Uacute' 'Ucircumflex' 'Udieresis' 'Ugrave' 'Yacute' 'Ydieresis' 'Zcaron' 'aacute' 'acircumflex' 'adieresis' 'agrave' 'aring' 'atilde' 'ccedilla' 'eacute' 'ecircumflex' 'edieresis' 'egrave' 'iacute' 'icircumflex' 'idieresis' 'igrave' 'ntilde' 'oacute' 'ocircumflex' 'odieresis' 'ograve' 'otilde' 'scaron' 'uacute' 'ucircumflex' 'udieresis' 'ugrave' 'yacute' 'ydieresis' 'zcaron' 'exclamsmall' 'Hungarumlautsmall' 'dollaroldstyle' 'dollarsuperior' 'ampersandsmall' 'Acutesmall' 'parenleftsuperior' 'parenrightsuperior' 'twodotenleader' 'onedotenleader' 'zerooldstyle' 'oneoldstyle' 'twooldstyle' 'threeoldstyle' 'fouroldstyle' 'fiveoldstyle' 'sixoldstyle' 'sevenoldstyle' 'eightoldstyle' 'nineoldstyle' 'commasuperior' 'threequartersemdash' 'periodsuperior' 'questionsmall' 'asuperior' 'bsuperior' 'centsuperior' 'dsuperior' 'esuperior' 'isuperior' 'lsuperior' 'msuperior' 'nsuperior' 'osuperior' 'rsuperior' 'ssuperior' 'tsuperior' 'ff' 'ffi' 'ffl' 'parenleftinferior' 'parenrightinferior' 'Circumflexsmall' 'hyphensuperior' 'Gravesmall' 'Asmall' 'Bsmall' 'Csmall' 'Dsmall' 'Esmall' 'Fsmall' 'Gsmall' 'Hsmall' 'Ismall' 'Jsmall' 'Ksmall' 'Lsmall' 'Msmall' 'Nsmall' 'Osmall' 'Psmall' 'Qsmall' 'Rsmall' 'Ssmall' 'Tsmall' 'Usmall' 'Vsmall' 'Wsmall' 'Xsmall' 'Ysmall' 'Zsmall' 'colonmonetary' 'onefitted' 'rupiah' 'Tildesmall' 'exclamdownsmall' 'centoldstyle' 'Lslashsmall' 'Scaronsmall' 'Zcaronsmall' 'Dieresissmall' 'Brevesmall' 'Caronsmall' 'Dotaccentsmall' 'Macronsmall' 'figuredash' 'hypheninferior' 'Ogoneksmall' 'Ringsmall' 'Cedillasmall' 'questiondownsmall' 'oneeighth' 'threeeighths' 'fiveeighths' 'seveneighths' 'onethird' 'twothirds' 'zerosuperior' 'foursuperior' 'fivesuperior' 'sixsuperior' 'sevensuperior' 'eightsuperior' 'ninesuperior' 'zeroinferior' 'oneinferior' 'twoinferior' 'threeinferior' 'fourinferior' 'fiveinferior' 'sixinferior' 'seveninferior' 'eightinferior' 'nineinferior' 'centinferior' 'dollarinferior' 'periodinferior' 'commainferior' 'Agravesmall' 'Aacutesmall' 'Acircumflexsmall' 'Atildesmall' 'Adieresissmall' 'Aringsmall' 'AEsmall' 'Ccedillasmall' 'Egravesmall' 'Eacutesmall' 'Ecircumflexsmall' 'Edieresissmall' 'Igravesmall' 'Iacutesmall' 'Icircumflexsmall' 'Idieresissmall' 'Ethsmall' 'Ntildesmall' 'Ogravesmall' 'Oacutesmall' 'Ocircumflexsmall' 'Otildesmall' 'Odieresissmall' 'OEsmall' 'Oslashsmall' 'Ugravesmall' 'Uacutesmall' 'Ucircumflexsmall' 'Udieresissmall' 'Yacutesmall' 'Thornsmall' 'Ydieresissmall' '001.000' '001.001' '001.002' '001.003' 'Black' 'Bold' 'Book' 'Light' 'Medium' 'Regular' 'Roman' 'Semibold')
]

{ #category : #accessing }
CFFFont >> charStrings [
	"<Array>"

	^charStrings ifNil: [#()]
]

{ #category : #accessing }
CFFFont >> charset [
	"<Charset>"

	^charset
]

{ #category : #accessing }
CFFFont >> encoding [
	"<Encoding>"

	^encoding
]

{ #category : #accessing }
CFFFont >> familyName [
	"<String>
	Used to locate screen fonts on Windows"

	^self stringAt: self topDict familyName
]

{ #category : #accessing }
CFFFont >> file [
	^file
]

{ #category : #accessing }
CFFFont >> fontBBox [
	"<Rectangle>"

	| array llx lly urx ury |
	array := self topDict fontBBox.
	llx := array at: 1.
	lly := array at: 2.
	urx := array at: 3.
	ury := array at: 4.
	^llx @ lly corner: urx @ ury
]

{ #category : #accessing }
CFFFont >> forceBold [
	"<Boolean>"

	^self privateDict forceBold
]

{ #category : #accessing }
CFFFont >> globalSubr [
	"<Array>"

	^globalSubr ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFFont >> initializeName: nameString file: anOpenTypeFile topDict: topDictTopDict encoding: encodingEncoding charset: charsetCharset privateDict: privateDictPrivateDict charStrings: charStringsArray strings: stringsArray localSubr: localSubrArray globalSubr: globalSubrArray [
	file := anOpenTypeFile.
	name := nameString.
	topDict := topDictTopDict.
	encoding := encodingEncoding.
	charset := charsetCharset.
	privateDict := privateDictPrivateDict.
	(charStringsArray notNil and: [
	charStringsArray notEmpty]) ifTrue: [
			charStrings := (Array withAll: charStringsArray) beImmutable].
	(stringsArray notNil and: [
	stringsArray notEmpty]) ifTrue: [
			strings := (Array withAll: stringsArray) beImmutable].
	(localSubrArray notNil and: [
	localSubrArray notEmpty]) ifTrue: [
			localSubr := (Array withAll: localSubrArray) beImmutable].
	(globalSubrArray notNil and: [
	globalSubrArray notEmpty]) ifTrue: [
			globalSubr := (Array withAll: globalSubrArray) beImmutable]
]

{ #category : #accessing }
CFFFont >> localSubr [
	"<Array>"

	^localSubr ifNil: [#()]
]

{ #category : #accessing }
CFFFont >> name [
	"<String>
	the PostScript name of the font.
	Used in PDF in the font resource dictionary.
	This is not used to locate fonts on Windows where you have to use #familyName (see OpenType.File>>logfont:)"

	^name
]

{ #category : #accessing }
CFFFont >> nameOfGlyph: aGlyphId [
	"<String>"

	^self stringAt: (self charset sids at: aGlyphId + 1)
]

{ #category : #printing }
CFFFont >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'topDict' value: self topDict).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'charset' value: self charset).
	args add: (printer constant: 'privateDict' value: self privateDict).
	args add: (printer array: 'charStrings' value: self charStrings).
	args add: (printer array: 'strings' value: self strings).
	args add: (printer array: 'localSubr' value: self localSubr).
	args add: (printer array: 'globalSubr' value: self globalSubr).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFFont >> privateDict [
	"<PrivateDict>"

	^privateDict
]

{ #category : #accessing }
CFFFont >> stringAt: integer [
	integer <= 390 ifTrue: [
		^self class standardStrings at: integer + 1].
	^self strings at: integer - 390
]

{ #category : #accessing }
CFFFont >> strings [
	"<Array>"

	^strings ifNil: [#()]
]

{ #category : #accessing }
CFFFont >> topDict [
	"<TopDict>"

	^topDict
]

{ #category : #accessing }
CFFFont >> unitsPerEm [
	"<Integer>
	Valid range is from 16 to 16384. This value should be a power of 2 for fonts that have TrueType outlines"

	^self file unitsPerEm
]
