"
The kerning between two characters

The KerningPairs table need not be present in a PFM file for a Type-1 font, if it exists it contains etmKernPairs (from the EXTTEXTMETRIC structure) entries. Each of these entries looks as follows:

BYTE kpFirst
This field contains the first (left) character of the kerning pair.

BYTE kpSecond
This field contains the second (right) character of the kerning pair.

short kpKernAmount
This field contains the kerning amount in font units, the value is mostly negative. 


The array of KERNPAIR structures is sorted in increasing order by the kpPair.both field.
kpPair.both
Specifies a WORD in which the first character in the kerning pair is in the low-order byte and the second character is in the high-order byte
"
Class {
	#name : #PtFPairKern,
	#superclass : #Value,
	#instVars : [
		'first',
		'second',
		'kernAmount'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFPairKern class >> first: firstInteger second: secondInteger kernAmount: kernAmountInteger [
	| inst |
	inst := self new.
	inst initializeFirst: firstInteger second: secondInteger kernAmount: kernAmountInteger.
	^inst
]

{ #category : #'instance creation' }
PtFPairKern class >> fromBytes: aByteArray4 [
	| rst |
	rst := ByteReadStream littleEndianOn: aByteArray4.
	^self first: rst next second: rst next kernAmount: rst nextShort
]

{ #category : #specification }
PtFPairKern class >> localSpecification [
	<constant: #first class: #Integer comment: 'BYTE: the first (left) character of the kerning pair'>
	<constant: #second class: #Integer comment: 'BYTE: the second (right) character of the kerning pair'>
	<constant: #kernAmount class: #Integer comment: 'short: the kerning amount in font units, the value is mostly negative'>
]

{ #category : #'instance creation' }
PtFPairKern class >> readKernPairs: numberOfKernPairs from: byteReadstream at: kernTableOffset [
	"<SequenceableCollection of: PairKern>"

	| kernPairs |
	numberOfKernPairs isZero ifTrue: [
		^#()].
	byteReadstream position: kernTableOffset.
	kernPairs := (ByteReadStream littleEndianOn: (byteReadstream next: 2)) nextUnsignedShort.
	numberOfKernPairs = kernPairs ifFalse: [
		self error: 'the number of kerning pairs is not correct'].
	^(1 to: numberOfKernPairs) collect: [:i | self fromBytes: (byteReadstream next: 4)]
]

{ #category : #'instance creation' }
PtFPairKern class >> tableFromBytes: aByteArray [
	"<SequenceableCollection of: PairKern>"

	| rst numberOfKernPairs |
	rst := aByteArray readStream.
	numberOfKernPairs := (ByteReadStream littleEndianOn: (rst next: 2)) nextUnsignedShort.
	^(1 to: numberOfKernPairs) collect: [:i | self fromBytes: (rst next: 4)]
]

{ #category : #converting }
PtFPairKern >> asBytes [
	"<ByteArray[4]>
	ByteArray suited to be written to a PFM file"

	| wst |
	wst := ByteWriteStream littleEndianOn: (ByteArray new: 4).
	wst
		nextPut: self first;
		nextPut: self second;
		nextPutShort: self kernAmount.
	^wst contents
]

{ #category : #accessing }
PtFPairKern >> first [
	"<Integer>
	BYTE: the first (left) character of the kerning pair"

	^first
]

{ #category : #'initialize-release' }
PtFPairKern >> initializeFirst: firstInteger second: secondInteger kernAmount: kernAmountInteger [
	first := firstInteger.
	second := secondInteger.
	kernAmount := kernAmountInteger.
	self beImmutable
]

{ #category : #accessing }
PtFPairKern >> kernAmount [
	"<Integer>
	short: the kerning amount in font units, the value is mostly negative"

	^kernAmount
]

{ #category : #printing }
PtFPairKern >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'first' value: self first).
	args add: (printer constant: 'second' value: self second).
	args add: (printer constant: 'kernAmount' value: self kernAmount).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtFPairKern >> second [
	"<Integer>
	BYTE: the second (right) character of the kerning pair"

	^second
]
