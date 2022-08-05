"
Each segment is described by a startCode and endCode, along with an idDelta and an idRangeOffset, which are used for mapping the character codes in the segment. The segments are sorted in order of increasing endCode values, and the segment values are specified in four parallel arrays. You search for the first endCode that is greater than or equal to the character code you want to map. If the corresponding startCode is less than or equal to the character code, then you use the corresponding idDelta and idRangeOffset to map the character code to a glyph index (otherwise, the missingGlyph is returned). For the search to terminate, the final endCode value must be 0xFFFF. This segment need not contain any valid mappings. (It can just map the single character code 0xFFFF to missingGlyph). However, the segment must be present.

If the idRangeOffset value for the segment is not 0, the mapping of character codes relies on glyphIdArray. The character code offset from startCode is added to the idRangeOffset value. This sum is used as an offset from the current location within idRangeOffset itself to index out the correct glyphIdArray value. This obscure indexing trick works because glyphIdArray immediately follows idRangeOffset in the font file. The C expression that yields the glyph index is:

	* (idRangeOffset[i] / 2 
	+ (c - startCount[i]) 
	+ &idRangeOffset[i])

The value c is the character code in question, and i is the segment index in which c appears. If the value obtained from the indexing operation is not 0 (which indicates missingGlyph), idDelta[i] is added to it to get the glyph index. The idDelta arithmetic is modulo 65536.

If the idRangeOffset is 0, the idDelta value is added directly to the character code offset (i.e. idDelta[i] + c) to get the corresponding glyph index. Again, the idDelta arithmetic is modulo 65536.

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTSegment,
	#superclass : #Value,
	#instVars : [
		'startCode',
		'endCode',
		'delta'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #specification }
PtOTSegment class >> localSpecification [
	<constant: #startCode class: #Integer comment: 'Start character code'>
	<constant: #endCode class: #Integer comment: 'End characterCode, last=0xFFFF'>
	<constant: #delta class: #Integer comment: 'Delta for all character codes'>
]

{ #category : #'instance creation' }
PtOTSegment class >> startCode: startCodeInteger endCode: endCodeInteger delta: deltaInteger [
	| inst |
	inst := self new.
	inst initializeStartCode: startCodeInteger endCode: endCodeInteger delta: deltaInteger.
	^inst
]

{ #category : #accessing }
PtOTSegment >> characterCodes [
	^self startCode to: self endCode
]

{ #category : #accessing }
PtOTSegment >> codes [
	"<ByteArray>"

	^(self startCode to: self endCode) collect: [:code |
		self glyphIndexAtCode: code glyphs: #()]
]

{ #category : #accessing }
PtOTSegment >> delta [
	"<Integer>
	Delta for all character codes"

	^delta
]

{ #category : #accessing }
PtOTSegment >> endCode [
	"<Integer>
	End characterCode, last=0xFFFF"

	^endCode
]

{ #category : #accessing }
PtOTSegment >> glyphIndexAtCode: aCharacterCode glyphs: glyphIdArray [
	"<Integer | nil>"

	(self isEndsegment or: [
	self startCode > aCharacterCode]) ifTrue: [
			^nil].
	^aCharacterCode + self delta bitAnd: 16rFFFF
]

{ #category : #'initialize-release' }
PtOTSegment >> initializeStartCode: startCodeInteger endCode: endCodeInteger delta: deltaInteger [
	startCode := startCodeInteger.
	endCode := endCodeInteger.
	delta := deltaInteger.
	self beImmutable
]

{ #category : #testing }
PtOTSegment >> isEndsegment [
	^self endCode = Character illegalCode
]

{ #category : #accessing }
PtOTSegment >> numberOfCodes [
	"<Integer>"

	^self endCode - self startCode + 1
]

{ #category : #printing }
PtOTSegment >> printOn: stream [
	self isEndsegment ifTrue: [
		stream nextPutAll: 'Endsegment'.
		^self].
	stream
		nextPutAll: self class name asString;
		nextPutAll: ' start: ';
		nextPutAll: self startCode printString;
		nextPutAll: ' [';
		nextPutAll: self numberOfCodes printString;
		nextPutAll: '] ';
		nextPutAll: self codes printString
]

{ #category : #printing }
PtOTSegment >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'startCode' value: self startCode).
	args add: (printer constant: 'endCode' value: self endCode).
	args add: (printer constant: 'delta' value: self delta).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTSegment >> startCode [
	"<Integer>
	Start character code"

	^startCode
]
