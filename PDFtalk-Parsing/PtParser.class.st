"
Reads PDF objects of a byte stream.
Comments are not remembered
"
Class {
	#name : #PtParser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'tokenActions',
		'errors'
	],
	#category : #'PDFtalk-Parsing'
}

{ #category : #'instance creation' }
PtParser class >> onStream: aBinaryStream [
	| inst |
	inst := self new.
	inst initializeStream: aBinaryStream.
	^inst
]

{ #category : #'instance creation' }
PtParser class >> onString: aString [
	^self onStream: aString asByteArray readStream
]

{ #category : #reading }
PtParser >> addError: anError [
	anError raiseSignal.
	self errors add: anError
]

{ #category : #'stream access' }
PtParser >> atEnd [
	"<Boolean>"

	^self stream atEnd
]

{ #category : #accessing }
PtParser >> errors [
	"<SequenceableCollection of: Error>
	skipped errors during reading"

	^errors ifNil: [errors := OrderedCollection new]
]

{ #category : #reading }
PtParser >> expectInteger: anInteger [
	"read a token off the aStream.
	Throw error if the token is not as expected"

	| int pos |
	pos := self position.
	int := self nextInteger.
	int = anInteger ifTrue: [
		^self].
	self addError: (PtReadError
		newWith: pos
		message: 'Read "' , int printString , '". "' , anInteger printString , '" expected').
	self position: pos
]

{ #category : #reading }
PtParser >> expectLfPrecededByWhitespace [
	"read a LF off the aStream ignoring whitespace.
	Throw error if any other character is encountered"

	| char pos |
	pos := self position.
	[self atEnd] whileFalse: [
		char := self next.
		char = Character lf
			ifTrue: [
			^self]
			ifFalse: [
			(self isWhitespace: char) ifFalse: [
				self addError: (PtReadError
					newWith: pos
					message: 'Read "' , char asSource , '". "<Character lf>" expected').
				^self position: pos]]].
	self addError: (PtReadError newWith: pos message: 'Unexpected end of stream').
	self position: pos
]

{ #category : #reading }
PtParser >> expectToken: aStringOrSymbol [
	"read a token off the aStream.
	Throw error if the token is not as expected"

	| token pos error |
	pos := self position.
	token := self nextToken.
	token = aStringOrSymbol ifTrue: [
		^self].
	error := PtReadError
		newWith: pos
		message: 'Read ' , token printString , '. "' , aStringOrSymbol , '" expected'.
	self position: pos.
	self addError: error
]

{ #category : #accessing }
PtParser >> initialTokenActions [
	"<Core.Dictionary key: (String | Symbol) value: Block>"

	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PtParser >> initializeStream: aBinaryStream [
	stream := aBinaryStream
]

{ #category : #testing }
PtParser >> isForEncrypted [
	^false
]

{ #category : #testing }
PtParser >> isWhitespace: aCharacter [
	^#(0 9 10 12 13 32) includes: aCharacter asInteger
]

{ #category : #'stream access' }
PtParser >> next [
	"<Character | nil>"

	^self stream next ifNotNil: [:int | int asCharacter]
]

{ #category : #'stream access' }
PtParser >> next: count [
	"<String>"
	
	^(self stream next: count) asString
]

{ #category : #reading }
PtParser >> nextEncodedName [
	"<String>"

	| wst |
	wst := String new writeStream.
	[self atEnd] whileFalse: [
		| char |
		char := self peek.
		(char isPdfRegular and: [
		char asInteger between: 16r21 and: 16r7E])
				ifTrue: [
				wst nextPut: self next]
				ifFalse: [
				^wst contents]].
	^wst contents
]

{ #category : #reading }
PtParser >> nextEncodedString [
	"<String>
	The position is just after the first opening parenthesis.
	aStream is read up to and including the closing balanced parenthesis"

	| wst count c |
	count := 0.
	wst := String new writeStream.
	[self atEnd] whileFalse: [
		c := self next.
		wst nextPut: c.
		c == $\
			ifTrue: [wst nextPut: self next]
			ifFalse: [
			c == $( ifTrue: [
				count := count + 1].
			c == $) ifTrue: [
				count := count - 1.
				count negative ifTrue: [
					wst skip: -1.
					^wst contents]]]].
	^wst contents
]

{ #category : #reading }
PtParser >> nextInteger [
	"<Integer>"

	| wst |
	self skipWhitespace.
	wst := String new writeStream.
	[self atEnd] whileFalse: [
		self peek isDigit
			ifTrue: [wst nextPut: self next]
			ifFalse: [
			^wst contents asNumber]].
	^wst contents asNumber
]

{ #category : #reading }
PtParser >> nextNameSymbol [
	"<Symbol>"

	^(PtNameEncoder decoded: self nextEncodedName) asSymbol
]

{ #category : #reading }
PtParser >> nextNumberToken [
	"<String>"

	| wst char hadPeriod |
	wst := String new writeStream.
	char := self peek.
	char == $+ ifTrue: [
		self next].
	char == $- ifTrue: [
		wst nextPut: self next].
	hadPeriod := false.
	self peek == $. ifTrue: [wst nextPut: $0].
	[self atEnd] whileFalse: [
		char := self peek.
		char == $.
			ifTrue: [
			hadPeriod
				ifTrue: [
				^wst contents]
				ifFalse: [
				wst nextPut: self next.
				hadPeriod := true]]
			ifFalse: [
			char isDigit
				ifTrue: [wst nextPut: self next]
				ifFalse: [
				^wst contents]]].
	^wst contents
]

{ #category : #reading }
PtParser >> nextToken [
	"<String | Symbol | nil>
	read a token off the aStream.
	Answer the token string"

	| char |
	self skipWhitespace.
	char := self peek ifNil: [
		^nil].
	char isPdfDelimiter ifTrue: [
		self next.
		char == $< ifTrue: [
			self peek == $< ifTrue: [
				self next.
				^'<<']].
		^String with: char].
	char isPdfNumeric ifTrue: [
		^self nextNumberToken].
	char isPdfRegular ifTrue: [
		^self nextNameSymbol].
	PtReadError raiseSignal: 'No token found for: ' , char printString
]

{ #category : #'stream access' }
PtParser >> peek [
	"<Character | nil>"

	^self stream peek ifNotNil: [:int | int asCharacter]
]

{ #category : #'stream access' }
PtParser >> position [
	"<Integer>"

	^self stream position
]

{ #category : #'stream access' }
PtParser >> position: anInteger [
	self stream position: anInteger
]

{ #category : #'reading objects' }
PtParser >> readHexString [
	"<PDFString>"

	^(PtHexStringEncoder decoded: (self upTo: $>)) asPDF
]

{ #category : #'reading objects' }
PtParser >> readName [
	"<PDF.Name>"

	^self nextNameSymbol asPDF
]

{ #category : #'reading objects' }
PtParser >> readNumber: token [
	^(Number readPDFSyntaxFrom: token readStream) asPDF
]

{ #category : #'reading objects' }
PtParser >> readString [
	"<PDF.String>"

	^self readStringCharacters asPDF
]

{ #category : #'reading objects' }
PtParser >> readStringCharacters [
	"<String>"

	^PtStringEncoder decoded: self nextEncodedString
]

{ #category : #'initialize-release' }
PtParser >> release [
	self stream ifNotNil: [:aStream |
		aStream close.
		stream := nil].
	super release
]

{ #category : #'stream access' }
PtParser >> skip: anInteger [
	self stream skip: anInteger
]

{ #category : #'stream access' }
PtParser >> skipToEol [
	"skip all characters up to and including EndOfLine"

	[self atEnd] whileFalse: [
		| int |
		int := self stream next.
		(#(10 13) includes: int) ifTrue: [
			(int == 13 and: [
			self stream peek = 10]) ifTrue: [
					self stream next].
			^self]]
]

{ #category : #reading }
PtParser >> skipWhitespace [
	[self atEnd] whileFalse: [
		| char |
		char := self peek.
		(self isWhitespace: char)
			ifTrue: [self next]
			ifFalse: [
			char = $%
				ifTrue: [self skipToEol]
				ifFalse: [
				^self]]]
]

{ #category : #accessing }
PtParser >> stream [
	"<Stream>
	a byte read stream"

	^stream
]

{ #category : #accessing }
PtParser >> tokenActions [
	"blocks to read a PDF object with a reader.
	true, false and null answer the identical object (for each file)"

	^tokenActions ifNil: [tokenActions := self initialTokenActions]
]

{ #category : #'stream access' }
PtParser >> upTo: aCharacter [
	"<String>
	answers all characters up to aCharacter as string.
	aCharacter is consumed.
	If aCharacter does not occur, upToEnd is answered"

	| wst |
	wst := String new writeStream.
	[self atEnd] whileFalse: [
		| char |
		char := self next.
		char = aCharacter ifTrue: [
			^wst contents].
		wst nextPut: char].
	^wst contents
]

{ #category : #reading }
PtParser >> whenNext: aCharacter do: trueZeroArgumentBlock ifNot: falseOneArgumentBlock [
	"read aCharacter as next from the aStream.
	If aCharacter is the next one, leave the position after aCharacter.
	If aCharacter is not the next, leave the position before aCharacter"

	| char |
	char := self next.
	^char == aCharacter
		ifTrue: [trueZeroArgumentBlock value]
		ifFalse: [
		self skip: -1.
		falseOneArgumentBlock value: char]
]
