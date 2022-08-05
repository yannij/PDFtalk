"
Scanner reads PostScript objects from a PostScript source stream
"
Class {
	#name : #PSScanner,
	#superclass : #Object,
	#instVars : [
		'stream',
		'specialActionsByCharacter'
	],
	#category : #PostScript
}

{ #category : #'instance creation' }
PSScanner class >> on: postScriptSourceString [
	^self onStream: postScriptSourceString readStream
]

{ #category : #'instance creation' }
PSScanner class >> onStream: aReadStream [
	| inst |
	inst := self new.
	inst initializeStream: aReadStream.
	^inst
]

{ #category : #testing }
PSScanner >> atEnd [
	"<Boolean>"

	^self stream atEnd
]

{ #category : #actions }
PSScanner >> defaultLessAction [
	^[
	self peek = $~
		ifTrue: [
		self next.
		self readAsciiBase85ByteString]
		ifFalse: [
		self peek = $<
			ifTrue: [
			self next.
			#<<]
			ifFalse: [
			self readHexadecimalByteString]]]
]

{ #category : #actions }
PSScanner >> escapeActions [
	| dict |
	dict := Dictionary new.
	dict at: $n put: [:wst | wst cr].
	dict at: $r put: [:wst | wst cr].
	dict at: $t put: [:wst | wst tab].
	dict at: $b put: [:wst | wst skip: -1	"no way"].
	dict at: $f put: [:wst | wst cr].
	dict at: $\ put: [:wst | wst nextPut: $\].
	dict at: $/ put: [:wst | wst nextPut: $/].
	dict at: $( put: [:wst | wst nextPut: $(].
	dict at: $) put: [:wst | wst nextPut: $)].
	^dict
]

{ #category : #'reading hexadecimal' }
PSScanner >> hexByteStringFrom: aString [
	"<ByteString>"

	| wst |
	wst := (String new: (aString size + 1) // 2) writeStream.
	self withHexCharsIn: aString do: [:char1 :char2 |
		wst nextPut: (((self nibbleFor: char1) bitShift: 4) bitOr: (self nibbleFor: char2)) asCharacter].
	^wst contents
]

{ #category : #'initialize-release' }
PSScanner >> initializeStream: aReadStream [
	stream := aReadStream
]

{ #category : #testing }
PSScanner >> isDelimiter: aCharacter [
	"<Boolean>
	true, if aCharacter delimits a token"

	^(self isWhitespace: aCharacter) or: [
	self isSpecial: aCharacter]
]

{ #category : #testing }
PSScanner >> isInteger: string [
	^(string allSatisfy: #isDigit) or: [
	string size > 1 and: [
	('+-' includes: string first) and: [
	(string allButFirst: 1) allSatisfy: #isDigit]]]
]

{ #category : #testing }
PSScanner >> isNewline: aCharacterOrNil [
	^aCharacterOrNil notNil and: [
	#(10 13) includes: aCharacterOrNil asInteger]
]

{ #category : #testing }
PSScanner >> isRadix: string [
	| numberToken base |
	(string includes: $#) ifFalse: [
		^false].
	numberToken := string substrings: (String with: $#).
	base := numberToken first asNumber.
	^(base between: 2 and: 36) and: [
	numberToken last allSatisfy: [:c |
		c isDigit or: [
		c asUppercase asInteger between: $A asInteger and: $A asInteger - 1 + (base - 10)]]]
]

{ #category : #testing }
PSScanner >> isReal: string [
	| rst number exponent |
	(string anySatisfy: [:c | '.eE' includes: c]) ifFalse: [^false].
	rst := string readStream.
	number := String new.
	('+-' includes: rst peek) ifTrue: [rst next].
	[rst atEnd or: ['eE' includes: rst peek]] whileFalse: [
		number := (String with: rst next), number].
	(number anySatisfy: #isDigit) ifFalse: [^false].
	(number allSatisfy: [:c | c isDigit or: [c = $.]]) ifFalse: [^false].
	exponent := String new.
	('eE' includes: rst peek) ifTrue: [
		rst next.
		('+-' includes: rst peek) ifTrue: [rst next].
		exponent := rst upToEnd.
		(exponent allSatisfy: #isDigit) ifFalse: [^false]].
	^true
]

{ #category : #testing }
PSScanner >> isSpecial: aCharacter [
	^'()<>[]{}/%' includes: aCharacter
]

{ #category : #testing }
PSScanner >> isWhitespace: aCharacter [
	^#(0 9 10 12 13 32) includes: aCharacter asInteger
]

{ #category : #delegating }
PSScanner >> next [
	"<Character>"

	^self stream next
]

{ #category : #reading }
PSScanner >> nextPostScriptObject [
	"<Object>
	Skips comments.
	Raises an exception if atEnd of the token stream"

	self readWhitespace.
	(self isSpecial: self peek) ifTrue: [
		^self readSpecialObject ifNil: [self nextPostScriptObject]].
	^self readNumberOrName ifNil: [PSEndOfTokenStreamNotification raiseSignal]
]

{ #category : #'reading hexadecimal' }
PSScanner >> nibbleFor: aCharacter [
	"<Integer [0..15] | nil>
	the hexadecimal code of aCharacter.
	Throws error when aCharacter is not a hex character"

	| code values |
	code := aCharacter asInteger.
	values := #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 0 1 2 3 4 5 6 7 8 9 nil nil nil nil nil nil nil 10 11 12 13 14 15 nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 10 11 12 13 14 15).
	(code between: 1 and: values size) ifTrue: [
		(values at: code) ifNotNil: [:value |
			^value]].
	PSSyntaxerror raiseSignal: 'no hexadecimal string'
]

{ #category : #delegating }
PSScanner >> peek [
	"<Character>"

	^self stream peek
]

{ #category : #reading }
PSScanner >> readAsciiBase85ByteString [
	"<ByteString>"

	| asciiString |
	asciiString := self upTo: $~.
	self next = $> ifFalse: [
		PSSyntaxerror raiseSignal: 'closing angle bracket expected'].
	^String fromASCII85: asciiString
]

{ #category : #reading }
PSScanner >> readComment [
	"<nil>"

	[
	self atEnd or: [
	self isNewline: self peek]] whileFalse: [self next].
	^nil
]

{ #category : #reading }
PSScanner >> readEscapeTo: aWriteStream [
	"<String>
	the $\ was read"

	| char |
	char := self next.
	(self isNewline: char) ifTrue: [
		^nil].
	self escapeActions at: char ifPresent: [:block |
		^block value: aWriteStream].
	(char between: $0 and: $7) ifTrue: [
		^aWriteStream nextPut: (self readOctCodeStartingWith: char)].
	PSSyntaxerror raiseSignal: 'special character not recognized'
]

{ #category : #'reading hexadecimal' }
PSScanner >> readHexadecimalByteString [
	"<ByteString>"

	^self hexByteStringFrom: ((self stream upTo: $>) reject: #isSeparator)
]

{ #category : #reading }
PSScanner >> readNumberOrName [
	"<Number | Symbol>"

	| token |
	token := self readToken.
	token isEmpty ifTrue: [
		^nil].
	(Number readPostScriptSyntaxFrom: token readStream) ifNotNil: [:number |
		^number].
	^token asSymbol
]

{ #category : #reading }
PSScanner >> readOctCodeStartingWith: digit [
	"<Character>"

	| oct code |
	oct := WriteStream on: (String new: 3).
	oct nextPut: digit.
	(self peek between: $0 and: $7) ifTrue: [
		oct nextPut: self next.
		(self peek between: $0 and: $7) ifTrue: [
			oct nextPut: self next]].
	code := ('8r' , oct contents) asNumber.
	^code asCharacter
]

{ #category : #reading }
PSScanner >> readProcedure [
	"<Procedure>"
	"the opening curly bracket has been read"

	| ops |
	ops := OrderedCollection new.
	[self atEnd] whileFalse: [
		| next |
		next := self nextPostScriptObject.
		next = #'}' ifTrue: [
			^PSProcedure withAll: ops].
		ops add: next].
	PSSyntaxerror raiseSignal: 'closing curly bracket expected'
]

{ #category : #reading }
PSScanner >> readSpecialObject [
	"<Object>"

	^(self specialActionsByCharacter at: self next) value
]

{ #category : #reading }
PSScanner >> readString [
	"<String>"
	"the opening bracket has been read"

	| wst |
	wst := WriteStream on: (String new: 20).
	[self atEnd] whileFalse: [
		| next |
		next := self next.
		next = $) ifTrue: [^wst contents].
		next = $( ifTrue: [wst nextPutAll: '(', self readString, ')'] ifFalse: [
		next = $\ ifTrue: [self readEscapeTo: wst] ifFalse: [
		wst nextPut: next]]].
	PSSyntaxerror raiseSignal: 'closing bracket expected'
]

{ #category : #reading }
PSScanner >> readToken [
	"<String>"

	| wst |
	wst := WriteStream on: (String new: 10).
	[self peek ifNotNil: [:char | self isDelimiter: char] ifNil: [true]] whileFalse: [
		wst nextPut: self next].
	^wst contents
]

{ #category : #reading }
PSScanner >> readWhitespace [
	[self peek ifNotNil: [:char | self isWhitespace: char] ifNil: [false]] whileTrue: [
		self next]
]

{ #category : #delegating }
PSScanner >> reset [
	self stream reset
]

{ #category : #actions }
PSScanner >> specialActionsByCharacter [
	"<Dictionary key: Character value: Block>"

	^specialActionsByCharacter ifNil: [
		| dict |
		dict := Dictionary new.
		dict at: $% put: [self readComment].
		dict at: $/ put: [PSLiteralName on: self readToken asSymbol].
		dict at: $( put: [self readString].
		dict at: $[ put: [#'['].
		dict at: $] put: [#']'].
		dict at: ${ put: [self readProcedure].
		dict at: $} put: [#'}'].
		dict at: $< put: self defaultLessAction.
		dict at: $> put: [
			self peek = $> ifTrue: [
				self next.
				#>>]].
		specialActionsByCharacter := dict]
]

{ #category : #accessing }
PSScanner >> stream [
	"<ReadStream on: String>"

	^stream
]

{ #category : #delegating }
PSScanner >> upTo: aCharacter [
	"<String>"

	^self stream upTo: aCharacter
]

{ #category : #delegating }
PSScanner >> upToEnd [
	"<String>"

	^self stream upToEnd
]

{ #category : #'reading hexadecimal' }
PSScanner >> withHexCharsIn: aString do: aTwoArgumentBlock [
	| rst |
	rst := aString readStream.
	[rst atEnd] whileFalse: [
		aTwoArgumentBlock
			value: rst next
			value: (rst atEnd
				ifTrue: [$0]
				ifFalse: [
				rst next])]
]
