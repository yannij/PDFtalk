"
Top DICT

The names of the Top DICT operators are, where possible, the same as the corresponding Type 1 dict key.

Several operators have been derived from FontInfo dict keys but have been grouped together with the Top DICT operators for simplicity.
"
Class {
	#name : #CFFTopDict,
	#superclass : #CFFDict,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFTopDict class >> fromBytes: aByteStream [
	| dict |
	dict := super fromBytes: aByteStream.
	dict operations first operator = (CFFTwoByteDictOperator value: 30) ifTrue: [
		^CFFCIDTopDict operations: dict operations].
	^dict
]

{ #category : #accessing }
CFFTopDict >> baseFontBlend [
	"<delta>
	(added as needed by Adobe-based technology)"

	| op |
	op := self operations detect: [:operation | operation isExtended: 23] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFTopDict >> baseFontName [
	"<SID>
	(added as needed by Adobe-based technology)"

	| op |
	op := self operations detect: [:operation | operation isExtended: 22] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> biasFor: nSubrs [
	"see 16 Local / Global Subrs INDEXes"

	self charstringType = 1 ifTrue: [
		^0].
	nSubrs < 1240 ifTrue: [
		^107].
	nSubrs < 33900 ifTrue: [
		^1131].
	^32768
]

{ #category : #accessing }
CFFTopDict >> charStrings [
	"<Number>
	CharStrings offset (0)"

	| op |
	op := self operations detect: [:operation | operation isSimple: 17] ifNone: [
		^0].
	^op operands first
]

{ #category : #'font creation' }
CFFTopDict >> charStringsFrom: aByteStream [
	aByteStream position: self charStrings.
	^CFFIndex fromBytes: aByteStream collect: [:data | CFFCharstring bytes: data]
]

{ #category : #accessing }
CFFTopDict >> charset [
	"<Number>
	charset offset (0)"

	| op |
	op := self operations detect: [:operation | operation isSimple: 15] ifNone: [
		^0].
	^op operands first
]

{ #category : #'font creation' }
CFFTopDict >> charsetForGlyphs: numberOfGlyphs from: aByteStream [
	| offset charsetFormat |
	offset := self charset.
	offset = 0 ifTrue: [
		^CFFStandardCharset isoAdobe].
	offset = 1 ifTrue: [
		^CFFStandardCharset expert].
	offset = 2 ifTrue: [
		^CFFStandardCharset expertSubset].
	aByteStream position: offset.
	charsetFormat := aByteStream next.
	charsetFormat = 0 ifTrue: [
		^CFFCharset0 numberOfGlyphs: numberOfGlyphs fromBytes: aByteStream].
	charsetFormat = 1 ifTrue: [
		^CFFCharset1 numberOfGlyphs: numberOfGlyphs fromBytes: aByteStream].
	^CFFCharset2 numberOfGlyphs: numberOfGlyphs fromBytes: aByteStream
]

{ #category : #accessing }
CFFTopDict >> charstringType [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 6] ifNone: [
		^2].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> copyright [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isExtended: 0]) operands first
]

{ #category : #accessing }
CFFTopDict >> encoding [
	"<Number>
	Encoding offset (0)"

	| op |
	op := self operations detect: [:operation | operation isSimple: 16] ifNone: [
		^0].
	^op operands first
]

{ #category : #'font creation' }
CFFTopDict >> encodingFrom: aByteStream [
	| offset |
	offset := self encoding.
	offset = 0 ifTrue: [
		^CFFStandardEncoding standard].
	offset = 1 ifTrue: [
		^CFFStandardEncoding expert].
	aByteStream position: offset.
	^CFFEncoding fromBytes: aByteStream
]

{ #category : #accessing }
CFFTopDict >> familyName [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isSimple: 3]) operands first
]

{ #category : #accessing }
CFFTopDict >> fontBBox [
	"<Array4 of: Number>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 5] ifNone: [
		^#(0 0 0 0)].
	^op operands
]

{ #category : #accessing }
CFFTopDict >> fontClass [
	^CFFType1Font
]

{ #category : #accessing }
CFFTopDict >> fontMatrix [
	"<Array6 of: Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 7] ifNone: [
		^#(0.001 0 0 0.001 0 0)].
	^op operands
]

{ #category : #'font creation' }
CFFTopDict >> fontNamed: fontName file: anOpenTypeFile strings: strings globalSubr: globalSubr from: aByteStream [
	| encoding charStrings charset privateDict localSubr |
	encoding := self encodingFrom: aByteStream.
	charStrings := self charStringsFrom: aByteStream.
	charset := self charsetForGlyphs: charStrings size from: aByteStream.
	privateDict := self privateDictFrom: aByteStream.
	localSubr := self localSubrFor: privateDict from: aByteStream.
	^self fontClass
		name: fontName
		file: anOpenTypeFile
		topDict: self
		encoding: encoding
		charset: charset
		privateDict: privateDict
		charStrings: charStrings
		strings: strings
		localSubr: localSubr
		globalSubr: globalSubr
]

{ #category : #accessing }
CFFTopDict >> fullName [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isSimple: 2]) operands first
]

{ #category : #accessing }
CFFTopDict >> isFixedPitch [
	"<Boolean>
	FontInfo"

	| op |
	op := self operations detect: [:operation | operation isExtended: 1] ifNone: [
		^false].
	^op operands first = 1
]

{ #category : #accessing }
CFFTopDict >> italicAngle [
	"<Number>
	FontInfo"

	| op |
	op := self operations detect: [:operation | operation isExtended: 2] ifNone: [
		^0].
	^op operands first
]

{ #category : #'font creation' }
CFFTopDict >> localSubrFor: privateDict from: aByteStream [
	"<Array>"

	| localOffset privateOffsetPair privateOffset |
	localOffset := privateDict subrs.
	localOffset isZero ifTrue: [
		^#()].
	privateOffsetPair := self private.
	privateOffsetPair isEmpty ifTrue: [
		^#()].
	privateOffset := privateOffsetPair last.
	aByteStream position: privateOffset + localOffset.
	^CFFIndex fromBytes: aByteStream collect: [:data | CFFSubroutine bytes: data]
]

{ #category : #accessing }
CFFTopDict >> notice [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isSimple: 1]) operands first
]

{ #category : #accessing }
CFFTopDict >> paintType [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 5] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> postScript [
	"<SID>
	embedded PostScript language code"

	| op |
	op := self operations detect: [:operation | operation isExtended: 21] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> private [
	"<Array2 of: Number>
	Private DICT size and offset (0)"

	| op |
	op := self operations detect: [:operation | operation isSimple: 18] ifNone: [
		^#()].
	^op operands
]

{ #category : #'font creation' }
CFFTopDict >> privateDictFrom: aByteStream [
	| sizeAndOffset |
	sizeAndOffset := self private.
	sizeAndOffset isEmpty ifTrue: [
		^CFFPrivateDict new].
	aByteStream position: sizeAndOffset last.
	^CFFPrivateDict fromBytes: (aByteStream next: sizeAndOffset first) readStream
]

{ #category : #accessing }
CFFTopDict >> strokeWidth [
	"<Number>
	FontInfo"

	| op |
	op := self operations detect: [:operation | operation isExtended: 8] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> syntheticBase [
	"<Number>
	synthetic base font index"

	| op |
	op := self operations detect: [:operation | operation isExtended: 20] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> underlinePosition [
	"<Number>
	FontInfo"

	| op |
	op := self operations detect: [:operation | operation isExtended: 3] ifNone: [
		^-100].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> underlineThickness [
	"<Number>
	FontInfo"

	| op |
	op := self operations detect: [:operation | operation isExtended: 4] ifNone: [
		^50].
	^op operands first
]

{ #category : #accessing }
CFFTopDict >> uniqueID [
	"<Number>"

	^(self operations detect: [:operation | operation isSimple: 13]) operands first
]

{ #category : #accessing }
CFFTopDict >> version [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isSimple: 0]) operands first
]

{ #category : #accessing }
CFFTopDict >> weight [
	"<SID>
	FontInfo"

	^(self operations detect: [:operation | operation isSimple: 4]) operands first
]

{ #category : #accessing }
CFFTopDict >> xUID [
	"<Array>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 14] ifNone: [
		^#()].
	^op operands
]
