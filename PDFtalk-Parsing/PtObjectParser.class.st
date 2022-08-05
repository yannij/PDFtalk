"
This parser reads PDF objects from a file or from an object stream.
"
Class {
	#name : #PtObjectParser,
	#superclass : #PtParser,
	#instVars : [
		'peekPositions',
		'accessLock'
	],
	#category : #'PDFtalk-Parsing'
}

{ #category : #accessing }
PtObjectParser >> initialTokenActions [
	^(Dictionary new)
		at: #null put: [:aFile | nil];
		at: #true put: [:aFile | true];
		at: #false put: [:aFile | false];
		at: '(' put: [:aFile | self readString];
		at: '<' put: [:aFile | self readHexString];
		at: '/' put: [:aFile | self readName];
		at: '[' put: [:aFile | self readArrayWith: aFile];
		at: '<<' put: [:aFile | self readDictionaryOrStreamWith: aFile];
		yourself
]

{ #category : #'initialize-release' }
PtObjectParser >> initializeStream: aBinaryStream [
	super initializeStream: aBinaryStream.
	accessLock := Mutex new
]

{ #category : #actions }
PtObjectParser >> keepPositionAfter: zeroArgumentBlock [
	self savePosition.
	^accessLock critical: [zeroArgumentBlock ensure: [self restorePosition]]
]

{ #category : #accessing }
PtObjectParser >> peekPositions [
	"<SequenceableCollection of: Integer>
	the stack for the peek positions"

	^peekPositions ifNil: [peekPositions := OrderedCollection new]
]

{ #category : #'reading objects' }
PtObjectParser >> readArrayWith: aFile [
	"<PDF.Array of: PDFObject>"

	| objects done |
	done := false.
	objects := OrderedCollection new.
	[done] whileFalse: [
		self skipWhitespace.
		self atEnd
			ifTrue: [
			PtReadError raiseSignal: 'End of Array (]) expected'.
			done := true]
			ifFalse: [
			self peek == $]
				ifTrue: [
				self next.
				done := true]
				ifFalse: [
				objects add: (self readObjectWith: aFile)]]].
	^objects asPDF
]

{ #category : #'reading objects' }
PtObjectParser >> readDictionaryOrStreamWith: aFile [
	"<PDF.Dictionary>
	no streams allowed in object or contents streams"

	^PtPDF Dictionary on: (self readOrderedDictionaryWith: aFile)
]

{ #category : #reading }
PtObjectParser >> readNumberOrReference: numericToken with: aFile [
	| number pos |
	number := self readNumber: numericToken.
	pos := self position.
	^(self readReferenceOrNilStartingWith: number with: aFile) ifNil: [
		self position: pos.
		number]
]

{ #category : #'reading objects' }
PtObjectParser >> readObjectWith: aFile [
	"<PDFObject | nil>
	read a PDF object off the aStream.
	Answer the PDF object"

	| token action |
	token := self nextToken ifNil: [
		^nil].
	action := self tokenActions at: token ifAbsent: [
		token first isPdfNumeric ifTrue: [
			^self readNumberOrReference: token with: aFile].
		PtReadError raiseSignal: 'Token "' , token asString , '" not recognized'.
		^token asPDF].
	^action value: aFile
]

{ #category : #'reading objects' }
PtObjectParser >> readOrderedDictionaryWith: aFile [
	| done dict |
	done := false.
	dict := Valuemap new.
	[done] whileFalse: [
		self skipWhitespace.
		self
			whenNext: $/
			do: [
			dict at: self nextNameSymbol put: (self readObjectWith: aFile)]
			ifNot: [:char |
			char == $>
				ifTrue: [
				self next.
				self whenNext: $> do: [done := true] ifNot: [:char1 |
					PtReadError raiseSignal: 'Read ' , char1 asSource , ' but end of Dictionary (>>) expected']]
				ifFalse: [
				PtReadError raiseSignal: 'Read ' , char asSource , ' but $/ or $> expected']]].
	^dict
]

{ #category : #reading }
PtObjectParser >> readReferenceOrNilStartingWith: aNumber with: aFile [
	"<Reference | nil>"

	| number2 nextToken |
	aNumber isPositiveInteger ifFalse: [
		^nil].
	nextToken := self nextToken ifNil: [
		^nil].
	nextToken first isPdfNumeric ifFalse: [
		^nil].
	number2 := self readNumber: nextToken.
	number2 nonNegativeInteger ifFalse: [
		^nil].
	self nextToken = #R ifTrue: [
		^aFile referenceAt: (PtObjectId number: aNumber asSmalltalkValue generation: number2 asSmalltalkValue)].
	^nil
]

{ #category : #actions }
PtObjectParser >> restorePosition [
	"throws Error when the stack is empty"

	self position: self peekPositions removeLast
]

{ #category : #actions }
PtObjectParser >> savePosition [
	"push the current position onto the stack"

	self peekPositions addLast: self position
]
