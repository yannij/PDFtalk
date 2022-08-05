"
This parser reads PDF content streams.
Special restrictions apply.

From PDF 32000_2008.pdf pp.81:

A content stream, after decoding with any specified filters, shall be interpreted according to the PDF syntax rules.
It consists of PDF objects denoting operands and operators.
The operands needed by an operator shall precede it in the stream.

An operand is a direct object belonging to any of the basic PDF data types except a stream.
Dictionaries shall be permitted as operands only by certain specific operators.
Indirect objects and object references shall not be permitted at all.

An operator is a PDF keyword specifying some action that shall be performed, such as painting a graphical shape on the page.
An operator keyword shall be distinguished from a name object by the absence of an initial SOLIDUS character (2Fh) (/).
Operators shall be meaningful only inside a content stream.

NOTE 
This postfix notation, in which an operator is preceded by its operands, is superficially the same as in the PostScript language.
However, PDF has no concept of an operand stack as PostScript has.

In PDF, all of the operands needed by an operator shall immediately precede that operator.
Operators do not return results, and operands shall not be left over when an operator finishes execution.
"
Class {
	#name : #PtContentParser,
	#superclass : #PtParser,
	#category : #'PDFtalk-Graphics'
}

{ #category : #accessing }
PtContentParser >> initialTokenActions [
	^(Dictionary new)
		at: #null put: [nil];
		at: #true put: [true];
		at: #false put: [false];
		at: '(' put: [self readString];
		at: '<' put: [self readHexString];
		at: '/' put: [self readName];
		at: '[' put: [self readArray];
		at: '<<' put: [self readDictionary];
		yourself
]

{ #category : #'reading objects' }
PtContentParser >> readArray [
	"<PDFArray of: PDFObject>"

	| objects done |
	objects := OrderedCollection new.
	done := false.
	[done] whileFalse: [
		self skipWhitespace.
		self atEnd
			ifTrue: [
			PtReadError raiseSignal: 'End of Array (]) expected'.
			done := true]
			ifFalse: [
			self peek = $]
				ifTrue: [
				self next.
				done := true]
				ifFalse: [
				objects add: self readObject]]].
	^objects asPDF
]

{ #category : #'reading objects' }
PtContentParser >> readDictionary [
	"<PDF.Dictionary>"

	^PtPDF Dictionary on: self readOrderedDictionary
]

{ #category : #reading }
PtContentParser >> readImageData [
	| wst |
	(self isWhitespace: self next) ifFalse: [
		self error: 'whitespace expected'].
	wst := String new writeStream.
	[self atEnd] whileFalse: [
		| char |
		char := self next.
		(char = $E and: [
		self peek = $I]) ifTrue: [
				self skip: -2.
				wst skip: -1.
				^wst contents asByteArray].
		wst nextPut: char].
	self error: 'no EI (EndImage) found'
]

{ #category : #'reading objects' }
PtContentParser >> readObject [
	"<PDFObject | nil>
	read a PDF object off the aStream.
	Answer the PDF object"

	| token action |
	token := self nextToken ifNil: [
		^nil].
	action := self tokenActions at: token ifAbsent: [
		token first isPdfNumeric ifTrue: [
			^self readNumber: token].
		^PtOperation on: token].
	^action value
]

{ #category : #'reading objects' }
PtContentParser >> readOperations [
	| operators operands |
	self stream reset.
	operators := OrderedCollection new.
	operands := #().
	[self atEnd] whileFalse: [
		| object |
		object := self readObject.
		(object isNil and: [
		self atEnd]) ifTrue: [
				^operators].
		operands := object addAsContentTokenWith: operands to: operators inParser: self].
	^operators
]

{ #category : #'reading objects' }
PtContentParser >> readOrderedDictionary [
	| dict done |
	dict := Valuemap new.
	done := false.
	[done] whileFalse: [
		self skipWhitespace.
		self whenNext: $/ do: [dict at: self nextNameSymbol put: self readObject] ifNot: [:char |
			char = $>
				ifTrue: [
				self next.
				self whenNext: $> do: [done := true] ifNot: [:char1 |
					PtReadError raiseSignal: 'Read ' , char1 asSource , ' but end of Dictionary (>>) expected']]
				ifFalse: [
				PtReadError raiseSignal: 'Read ' , char asSource , ' but $/ or $> expected']]].
	^dict
]

{ #category : #'reading objects' }
PtContentParser >> readString [

	^PtContentString content: (PtPDF String asPDFEndOfLines: self readStringCharacters) asByteArray
]
