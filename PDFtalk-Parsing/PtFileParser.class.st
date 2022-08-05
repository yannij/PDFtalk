"
This parser reads PDF objects from a file.
Indirect objects are expected to have number, generation and #obj and #endobj tags.
Only the file parser knows about streams
"
Class {
	#name : #PtFileParser,
	#superclass : #PtObjectParser,
	#category : #'PDFtalk-Parsing'
}

{ #category : #reading }
PtFileParser >> expectEndstream [
	"read the token >endstream< off the aStream.
	If not found at the expected position (after reading whitespaces), skip one byte, raise a proceedable error and try again.
	This is a special treatment for streams with a length entry too small by 1"

	[self expectToken: #endstream] on: PtReadError do: [:ex |
		(PtExtraCharacterInStreamError newWith: self next message: 'Extra character in stream') raiseSignal.
		self expectToken: #endstream]
]

{ #category : #converting }
PtFileParser >> forEncryption [
	"<EncryptedFileParser>
	answer a new parser on the same stream without closing it"

	| newParser |
	newParser := PtEncryptedFileParser onStream: self stream.
	stream := nil.
	^newParser
]

{ #category : #reading }
PtFileParser >> peekToken [
	"<String | Symbol | nil>
	read a token off the aStream.
	Answer the token string.
	Reset the stream to where we found it"

	^self keepPositionAfter: [self nextToken]
]

{ #category : #'reading objects' }
PtFileParser >> pickObjectFor: aReference with: aFile [
	"read an object at top level from the file.
	Set the position and reset it to the original after reading, so that calls can be nested."

	^self keepPositionAfter: [
		| result |
		self position: aReference value.
		self expectInteger: aReference number.
		self expectInteger: aReference generation.
		self expectToken: #obj.
		result := aFile indirectObjectFrom: self.
		self expectToken: #endobj.
		result]
]

{ #category : #'stream access' }
PtFileParser >> prev [
	"<Character>
	Reads the character before the current position.
	Leaves the position before the read character."

	self skip: -1.
	^self peek asCharacter
]

{ #category : #'stream access' }
PtFileParser >> prev: count [
	"<String>
	Reads the characters before the current position.
	Leaves the position before the read characters.
	Throughs an PositionOutOfBoundsError when there are not enought characters available"

	| target |
	target := self position - count.
	self position: target.
	^[(self next: count) asString] ensure: [self position: target]
]

{ #category : #'reading objects' }
PtFileParser >> readCrossReferenceStreamWith: aFile [
	| object |
	self nextInteger.
	self nextInteger.
	self expectToken: #obj.
	object := self readObjectWith: aFile.
	self expectToken: #endobj.
	^object
]

{ #category : #'reading objects' }
PtFileParser >> readDictionaryOrStreamWith: aFile [
	"<PDF.Dictionary | PDF.Stream>"

	| dict |
	dict := self readOrderedDictionaryWith: aFile.
	self peekToken == #stream ifTrue: [
		^self readStreamWith: dict].
	^PtPDF Dictionary on: dict
]

{ #category : #reading }
PtFileParser >> readHeaderVersion [
	| first5 major minor |
	self reset.
	first5 := self next: 5.
	first5 = '%PDF-' ifFalse: [
		PtReadError raiseSignal: '"' , first5 , '" is no PDF header! "%PDF-" expected.'].
	major := self nextInteger.
	self next = $. ifFalse: [
		PtReadError raiseSignal: 'invalid version. "." expected.'].
	minor := self nextInteger.
	^PtVersion major: major minor: minor
]

{ #category : #'reading objects' }
PtFileParser >> readStreamContents: numberOfBytes [
	"<ByteString>"

	| contents |
	self expectToken: #stream.
	self expectLfPrecededByWhitespace.
	contents := self next: numberOfBytes.
	self expectEndstream.
	^contents
]

{ #category : #'reading objects' }
PtFileParser >> readStreamWith: anOrderedDictionary [
	| length |
	length := anOrderedDictionary at: #Length ifAbsent: [
		^PtReadError raiseSignal: 'The stream dictonary has no Length entry'].
	^PtPDF Stream on: anOrderedDictionary external: (self readStreamContents: length pdfObject asSmalltalkValue)
]

{ #category : #'stream access' }
PtFileParser >> reset [
	^self stream reset
]

{ #category : #'initialize-release' }
PtFileParser >> setPositionToXRef [
	"set the stream to the begin of the last cross-reference section"

	self stream setToEnd.
	self skipBackAfterAll: 'startxref'.
	self position: self nextInteger
]

{ #category : #'stream access' }
PtFileParser >> skipBackAfterAll: aString [
	"search back from here for aString and leave the position after the occurence.
	If aString was not found, the position is at the beginning"

	| pattern size search |
	pattern := aString reverse.
	size := pattern size.
	search := (self prev: size) reverse.
	[pattern = search] whileFalse: [
		search := (search allButFirst: 1) copyWith: self prev].
	pattern = search ifTrue: [
		self skip: size]
]
