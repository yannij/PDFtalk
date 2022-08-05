Extension { #name : #String }

{ #category : #'*PostScript-converting' }
String >> asASCII85 [
	"<String>"

	| wst rem last rst |
	wst := (String new: (self size * 5 / 4) ceiling + 2) writeStream.
	rem := self size rem: 4.
	last := rem isZero
		ifTrue: [self class new]
		ifFalse: [self last: rem].
	rst := (self allButLast: rem) readStream.
	[rst atEnd] whileFalse: [wst nextPutAll: (rst next: 4) encodedASCII85Group].
	last isEmpty ifFalse: [
		| input output |
		input := last , (self class new: 4 - last size withAll: 0 asCharacter).
		output := input encodedASCII85Group.
		output = 'z' ifTrue: [
			output := '!!!!!'].
		wst nextPutAll: (output first: last size + 1)].
	wst
		nextPut: 16r7E asCharacter;
		nextPut: 16r3E asCharacter.
	^wst contents
]

{ #category : #'*PostScript-converting' }
String >> asOctalString: char [
	| numberString |
	numberString := char asInteger printStringRadix: 8.
	^'\' , (self class new: 3 - numberString size withAll: $0) , numberString
]

{ #category : #'*PostScript-converting' }
String >> asPostScripName [
	"<Symbol | LiteralName | nil>"

	^PSLiteralName on: self asSymbol
]

{ #category : #'*PostScript-converting' }
String >> asPostScriptExecutable [
	^PSExecutableString on: self
]

{ #category : #'*PostScript-converting' }
String >> asPostScriptInteger [
	"<Integer | nil>"

	^[(PSScanner on: self) nextPostScriptObject truncated] on: PSEndOfTokenStreamNotification do: [:ex |
		ex return: nil]
]

{ #category : #'*PostScript-converting' }
String >> asPostScriptReal [
	"<Number | nil>"

	^[(PSScanner on: self) nextPostScriptObject] on: PSEndOfTokenStreamNotification do: [:ex |
		ex return: nil]
]

{ #category : #'*PostScript-converting' }
String >> asPostScriptString [
	^self printPostScript
]

{ #category : #'*PostScript-converting' }
String >> asProcedure [
	"<Procedure>"

	^PSProcedure source: self
]

{ #category : #'*PostScript-double dispatching' }
String >> copyFor: aPostScriptInterpreter [
	aPostScriptInterpreter pop withIndexDo: [:char :i | self at: i put: char].
	aPostScriptInterpreter push: self
]

{ #category : #'*PostScript-instance creation' }
String class >> decodeASCII85Group: inputString [
	"<ByteString[4]>"

	| encodedString number wst |
	inputString = 'z' ifTrue: [
		^self new: 4 withAll: 0 asCharacter].
	inputString size = 1 ifTrue: [
		^ASCII85DecodeError raiseSignal: 'Decoding error in ASCII85 encoded string'].
	encodedString := inputString.
	inputString size < 5 ifTrue: [
		encodedString := encodedString , (self new: 5 - inputString size withAll: $u)].
	number := encodedString inject: 0 into: [:num :char |
		| int |
		int := char asInteger.
		(int between: 33 and: 117) ifFalse: [
			^ASCII85DecodeError raiseSignal: 'Illegal character in ASCII85 encoded string'].
		num * 85 + (int - 33)].
	(number > 16rFFFFFFFF and: [
	inputString size = 5]) ifTrue: [
			^ASCII85DecodeError raiseSignal: 'Decoding error in ASCII85 encoded string'].
	wst := (self new: 4) writeStream.
	4 timesRepeat: [
		wst nextPut: (number rem: 256) asCharacter.
		number := number quo: 256].
	^wst contents reverse first: (inputString size - 1 max: 0)
]

{ #category : #'*PostScript-converting' }
String >> encodedASCII85Group [
	"<ByteString[5]>
	the receiver is a fourByteString"

	| number wst |
	number := self inject: 0 into: [:num :char | num * 256 + char asInteger].
	number isZero ifTrue: [
		^'z'].
	wst := (self class new: 5) writeStream.
	5 timesRepeat: [
		wst nextPut: ((number rem: 85) + 33) asCharacter.
		number := number quo: 85].
	^wst contents reverse
]

{ #category : #'*PostScript-double dispatching' }
String >> forAllDo: proc for: aPostScriptInterpreter [
	self do: [:char |
		aPostScriptInterpreter push: char asInteger.
		proc doIn: aPostScriptInterpreter]
]

{ #category : #'*PostScript-instance creation' }
String class >> fromASCII85: anASCII85String [
	| wst rst |
	wst := (self new: (anASCII85String size * 4 / 5) ceiling) writeStream.
	rst := anASCII85String readStream.
	[rst atEnd] whileFalse: [
		wst nextPutAll: (self decodeASCII85Group: (self nextEncodedASCII85GroupFrom: rst))].
	^wst contents
]

{ #category : #'*PostScript-double dispatching' }
String >> get: index for: aPostScriptInterpreter [
	"<Integer>"

	^(self at: index + 1) asInteger
]

{ #category : #'*PostScript-instance creation' }
String class >> nextEncodedASCII85GroupFrom: aReadStream [
	"<String>"

	| wst |
	[aReadStream peek isPostScriptWhitespace] whileTrue: [aReadStream next].
	aReadStream peek == $z ifTrue: [
		^self with: aReadStream next].
	wst := (self new: 5) writeStream.
	[
	aReadStream atEnd not and: [
	wst position < 5]] whileTrue: [
			| char |
			char := aReadStream next.
			(char = 16r7E asCharacter and: [
			[aReadStream peek isPostScriptWhitespace] whileTrue: [aReadStream next].
			aReadStream peek = 16r3E asCharacter]) ifTrue: [
					aReadStream setToEnd.
					^wst contents].
			char isPostScriptWhitespace ifFalse: [
				wst nextPut: char]].
	^wst contents
]

{ #category : #'*PostScript-comparing' }
String >> postScriptGreaterEqual: aString [
	"<Boolean>
	the strings are compared element by element, treating the elements as integers in the range 0 to 255."

	| rst |
	rst := aString readStream.
	self do: [:char |
		| char2 |
		rst atEnd ifTrue: [
			^true].
		char2 := rst next.
		char > char2
			ifTrue: [
			^true]
			ifFalse: [
			char < char2 ifTrue: [
				^false]]].
	^true
]

{ #category : #'*PostScript-comparing' }
String >> postScriptGreaterThan: aString [
	"<Boolean>
	the strings are compared element by element, treating the elements as integers in the range 0 to 255."

	| rst |
	rst := aString readStream.
	self do: [:char |
		| char2 |
		rst atEnd ifTrue: [
			^(self size = aString size) not].
		char2 := rst next.
		char > char2
			ifTrue: [
			^true]
			ifFalse: [
			char < char2 ifTrue: [
				^false]]].
	^false
]

{ #category : #'*PostScript-comparing' }
String >> postScriptLessEqual: aString [
	"<Boolean>
	the strings are compared element by element, treating the elements as integers in the range 0 to 255."

	| rst |
	rst := aString readStream.
	self do: [:char |
		| char2 |
		rst atEnd ifTrue: [
			^self size = aString size].
		char2 := rst next.
		char < char2
			ifTrue: [
			^true]
			ifFalse: [
			char > char2 ifTrue: [
				^false]]].
	^true
]

{ #category : #'*PostScript-comparing' }
String >> postScriptLessThan: aString [
	"<Boolean>
	the strings are compared element by element, treating the elements as integers in the range 0 to 255."

	| rst |
	rst := aString readStream.
	self do: [:char |
		| char2 |
		rst atEnd ifTrue: [
			^false].
		char2 := rst next.
		char < char2
			ifTrue: [
			^true]
			ifFalse: [
			char > char2 ifTrue: [
				^false]]].
	^false
]

{ #category : #'*PostScript-accessing' }
String >> postScriptType [
	^#stringtype
]

{ #category : #'*PostScript-printing' }
String >> printPostScriptOn: aStream [
	aStream nextPutAll: '('.
	self do: [:char |
		(char asInteger between: Character space asInteger and: 126)
			ifTrue: [
			aStream nextPut: char]
			ifFalse: [
			aStream nextPutAll: (self asOctalString: char)]].
	aStream nextPutAll: ')'
]

{ #category : #'*PostScript-double dispatching' }
String >> put: int at: index [
	"string index int put –
	Put int into string at index"

	self at: index + 1 put: int asCharacter
]
