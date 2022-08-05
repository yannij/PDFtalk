"
An Adobe Type 1 Font Program

Instances correspond to the contents of an PFA file (or windows PFB file, which has identical content).

Documented in ""Adobe Type 1 Font Format"", 1990, ISBN 0-201-57044-0
online at http://partners.adobe.com/public/developer/en/font/T1_SPEC.PDF

Parsing the information from these files is provisorial. Needs a proper PostScript interpreter to do it right.
"
Class {
	#name : #PtFFontProgram,
	#superclass : #Value,
	#instVars : [
		'header',
		'contents',
		'glyphs',
		'trailerExtra'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #encryption }
PtFFontProgram class >> charstringDecoded: aByteArray [
	"<ByteArray>"

	^self decode: aByteArray key: 4330
]

{ #category : #encryption }
PtFFontProgram class >> charstringEncoded: aByteArray [
	"<ByteArray>"

	^self encode: aByteArray key: 4330
]

{ #category : #encryption }
PtFFontProgram class >> decode: aByteArray key: keyInteger [
	"<ByteArray>"

	| wst |
	wst := WriteStream on: (ByteArray new: aByteArray size).
	aByteArray inject: keyInteger into: [:r :byte |
		wst nextPut: (byte bitXor: (r bitShift: -8)).
		self nextR: byte + r].
	^wst contents
]

{ #category : #'instance creation' }
PtFFontProgram class >> decodedAsciiHexadecimal: asciiString [
	"<ByteArray>"

	| charsToCodes asciiRst nibbleWst nibbleRst byteWst |
	charsToCodes := IdentityDictionary new.
	'0123456789abcdef' withIndexDo: [:char :index | charsToCodes at: char put: index - 1].
	'ABCDEF' withIndexDo: [:char :index | charsToCodes at: char put: index + 9].
	asciiRst := asciiString readStream.
	nibbleWst := ByteArray new writeStream.
	[asciiRst atEnd] whileFalse: [
		charsToCodes at: asciiRst next ifPresent: [:index | nibbleWst nextPut: index]].
	nibbleRst := nibbleWst contents readStream.
	byteWst := ByteArray new writeStream.
	[nibbleRst atEnd] whileFalse: [
		byteWst nextPut: nibbleRst next * 16 + nibbleRst next].
	^byteWst contents
]

{ #category : #encryption }
PtFFontProgram class >> eexecDecoded: aByteArray [
	"<ByteArray>"

	^self decode: aByteArray key: 55665
]

{ #category : #encryption }
PtFFontProgram class >> eexecEncoded: aByteArray [
	"<ByteArray>"

	^self encode: aByteArray key: 55665
]

{ #category : #encryption }
PtFFontProgram class >> encode: aByteArray key: keyInteger [
	"<ByteArray>"

	| wst |
	wst := WriteStream on: (ByteArray new: aByteArray size).
	aByteArray inject: keyInteger into: [:r :byte |
		| cipher |
		cipher := byte bitXor: (r bitShift: -8).
		wst nextPut: cipher.
		self nextR: cipher + r].
	^wst contents
]

{ #category : #'instance creation' }
PtFFontProgram class >> fromPfa: aPfaString [
	| rst header rest wst |
	rst := aPfaString readStream.
	header := rst upToAll: 'eexec'.
	header := header , (rst next: 6).
	rest := rst upToEnd.
	rst := rest reverse readStream.
	wst := String new writeStream.
	wst nextPutAll: (rst upTo: $0).
	wst nextPut: $0.
	[
	| char |
	char := rst peek.
	char = $0 or: [
	char = Character cr or: [
	char = Character lf]]] whileTrue: [
			wst nextPut: rst next].
	^self
		newHeader: (PtFFontProgramHeader fromHeader: header)
		contents: (self eexecDecoded: (self decodedAsciiHexadecimal: rst upToEnd reverse)) asString
		trailerExtra: (self trailerExtraFrom: (wst contents allButLast: 1) reverse)
]

{ #category : #'instance creation' }
PtFFontProgram class >> fromPfb: aByteArray [
	| rst header contents trailer |
	rst := ByteReadStream littleEndianOn: aByteArray.
	(rst next: 2) = #[128 1] ifFalse: [
		self error: 'Start of ASCII Section expected'].
	header := (rst next: rst nextUnsignedLong) asString.
	(rst next: 2) = #[128 2] ifFalse: [
		self error: 'Start of Binary Section expected'].
	contents := rst next: rst nextUnsignedLong.
	(rst next: 2) = #[128 1] ifFalse: [
		self error: 'Start of ASCII Section expected'].
	trailer := (rst next: rst nextUnsignedLong) asString.
	(rst next: 2) = #[128 3] ifFalse: [
		self error: 'EOF expected'].
	^self
		newHeader: (PtFFontProgramHeader fromHeader: header)
		contents: (self eexecDecoded: contents) asString
		trailerExtra: (self trailerExtraFrom: trailer)
]

{ #category : #'instance creation' }
PtFFontProgram class >> glyphsDictionaryFrom: contentsByteString [
	| dict rst done |
	dict := Valuemap new.
	rst := contentsByteString readStream.
	rst upToAll: '/CharStrings'.
	rst next: 12.
	done := false.
	[done] whileFalse: [
		| charName |
		rst upTo: $/.
		charName := (rst upTo: Character space) asSymbol.
		charName = #FontName
			ifTrue: [done := true]
			ifFalse: [
			| length charString |
			length := (rst upTo: Character space) asNumber.
			rst upTo: Character space.
			charString := self charstringDecoded: (rst next: length) asByteArray.
			dict at: charName put: charString]].
	^dict
]

{ #category : #'instance creation' }
PtFFontProgram class >> header: headerFontProgramHeader contents: contentsByteString glyphs: glyphsDictionary trailerExtra: trailerExtraString [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerFontProgramHeader
		contents: contentsByteString
		glyphs: glyphsDictionary
		trailerExtra: trailerExtraString.
	^inst
]

{ #category : #'instance creation optional' }
PtFFontProgram class >> header: headerFontProgramHeader contents: contentsByteString trailerExtra: trailerExtraString [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerFontProgramHeader
		contents: contentsByteString
		glyphs: nil
		trailerExtra: trailerExtraString.
	^inst
]

{ #category : #specification }
PtFFontProgram class >> localSpecification [
	<constant: #header class: #PtFFontProgramHeader comment: 'cleartext PostScript code'>
	<constant: #contents class: #String comment: 'the content of the binary part'>
	<map: #glyphs comment: 'dictionary of charstrings'>
	<constant: #trailerExtra class: #String comment: 'extra PostScript code after the standard trailer of 0''s and #cleartomark'>
]

{ #category : #'instance creation' }
PtFFontProgram class >> newHeader: headerFontProgramHeader contents: contentsByteString trailerExtra: trailerExtraString [
	^self
		header: headerFontProgramHeader
		contents: contentsByteString
		glyphs: (self glyphsDictionaryFrom: contentsByteString)
		trailerExtra: trailerExtraString
]

{ #category : #encryption }
PtFFontProgram class >> nextR: anInteger [
	"<Integer>
	16 Bit"

	^anInteger * 52845 + 22719 bitAnd: 16rFFFF
]

{ #category : #'instance creation' }
PtFFontProgram class >> trailerExtraFrom: aString [
	"<String>
	extra string after the standard trailer of 512 $0 and 'cleartomark' "

	| rst |
	rst := (aString copyReplaceAll: (String with: Character lf) with: (String with: Character cr)) readStream.
	((rst upToAll: 'cleartomark') select: [:char | char = $0]) size = 512 ifFalse: [
		self error: '512 zeros $0 expected'].
	(rst upTo: Character cr) = 'cleartomark' ifFalse: [
		self error: '''cleartomark'' expected'].
	^rst upToEnd
]

{ #category : #converting }
PtFFontProgram >> asPfa [
	"<String>
	the contents of a PFA file"
	| wst |
	wst := String new writeStream.
	wst
		nextPutAll: self header contents;
		nextPutAll: (self encodedAsciiHexadecimal: (self class
							eexecEncoded: self contents asByteArray));
		cr;
		nextPutAll: self trailer.
	^wst contents
]

{ #category : #converting }
PtFFontProgram >> asPfb [
	"<ByteArray>
	the contents of a PFB file"

	| head meat foot wst |
	head := self header contents.
	meat := self contents.
	foot := self trailer.
	wst := ByteWriteStream on: (ByteArray new: 6 + head size + 6 + meat size + 6 + foot size + 2).
	wst nextPutAll: #[128 1].
	wst nextPutUnsignedLong: head size.
	wst nextPutAll: head asByteArray.
	wst nextPutAll: #[128 2].
	wst nextPutUnsignedLong: meat size.
	wst nextPutAll: meat asByteArray.
	wst nextPutAll: #[128 1].
	wst nextPutUnsignedLong: foot size.
	wst nextPutAll: foot asByteArray.
	wst nextPutAll: #[128 3].
	^wst contents
]

{ #category : #accessing }
PtFFontProgram >> binaryContents [
	"<ByteArray>
	the second (binary) section of a PFM file suitable to embed it into PDF"

	^self class eexecEncoded: self contents asByteArray
]

{ #category : #accessing }
PtFFontProgram >> contents [
	"<ByteString>
	the content of the binary part - eexec decoded"

	^contents
]

{ #category : #converting }
PtFFontProgram >> encodedAsciiHexadecimal: aByteArray [
	"<String>
	hexadecimal ASCII string using lower case letters and line breaks after 32 bytes (64 characters)"

	| codesToChars rst wst count |
	codesToChars := '0123456789abcdef'.
	rst := aByteArray readStream.
	wst := String new writeStream.
	count := 0.
	[rst atEnd] whileFalse: [
		| byte |
		byte := rst next.
		count := count + 1.
		wst nextPut: (codesToChars at: byte // 16 + 1).
		wst nextPut: (codesToChars at: byte \\ 16 + 1).
		count >= 32 ifTrue: [
			wst cr.
			count := 0]].
	^wst contents
]

{ #category : #accessing }
PtFFontProgram >> familyName [
	"<String>"

	^self header familyName
]

{ #category : #accessing }
PtFFontProgram >> fontBBox [
	"<Rectangle>"

	^self header fontBBox
]

{ #category : #accessing }
PtFFontProgram >> glyphs [
	"<Dictionary>
	dictionary of charstrings"

	^glyphs ifNil: [Dictionary new beImmutable]
]

{ #category : #accessing }
PtFFontProgram >> header [
	"<FontProgramHeader>
	cleartext PostScript code"

	^header
]

{ #category : #'initialize-release' }
PtFFontProgram >> initializeHeader: headerFontProgramHeader contents: contentsByteString glyphs: glyphsDictionary trailerExtra: trailerExtraString [
	header := headerFontProgramHeader.
	contents := contentsByteString.
	(glyphsDictionary notNil and: [
	glyphsDictionary notEmpty]) ifTrue: [
			glyphs := (Valuemap withAll: glyphsDictionary) beImmutable].
	trailerExtra := trailerExtraString.
	self beImmutable
]

{ #category : #marshaling }
PtFFontProgram >> passInstVars [
	"for OpenTalk StSt"

	^#(#default #default #value #default)
]

{ #category : #printing }
PtFFontProgram >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'header' value: self header).
	args add: (printer constant: 'contents' value: self contents).
	args add: (printer dictionary: 'glyphs' value: self glyphs).
	args add: (printer constant: 'trailerExtra' value: self trailerExtra).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtFFontProgram >> trailer [
	"<String>"

	| zerosLine wst |
	zerosLine := String new: 64 withAll: $0.
	wst := String new writeStream.
	8 timesRepeat: [
		wst
			nextPutAll: zerosLine;
			cr].
	wst
		nextPutAll: 'cleartomark';
		cr.
	wst nextPutAll: self trailerExtra.
	^wst contents
]

{ #category : #accessing }
PtFFontProgram >> trailerByteString [
	"<ByteString>
	suitable for embedding in PDF"

	self trailerExtra isEmpty ifTrue: [
		^String new].
	^self trailer asString
]

{ #category : #accessing }
PtFFontProgram >> trailerExtra [
	"<String>
	extra PostScript code after the standard trailer of 0's and #cleartomark"

	^trailerExtra
]
