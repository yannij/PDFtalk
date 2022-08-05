"
5. INDEX Data, pp.10

An INDEX is an array of variable-sized objects. It comprises a header, an offset array, and object data. 
The offset array specifies offsets within the object data. 
An object is retrieved by indexing the offset array and fetching the object at the specified offset. 
The object’s length can be determined by subtracting its offset from the next offset in the offset array. 
An additional offset is added at the end of the offset array so the length of the last object may be determined. 
"
Class {
	#name : #CFFIndex,
	#superclass : #Value,
	#instVars : [
		'count',
		'offSize',
		'offset',
		'data'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation optional' }
CFFIndex class >> count: countInteger offSize: offSizeInteger [
	| inst |
	inst := self new.
	inst initializeCount: countInteger offSize: offSizeInteger offset: nil data: nil.
	^inst
]

{ #category : #'instance creation optional' }
CFFIndex class >> count: countInteger offSize: offSizeInteger data: dataArray [
	| inst |
	inst := self new.
	inst initializeCount: countInteger offSize: offSizeInteger offset: nil data: dataArray.
	^inst
]

{ #category : #'instance creation optional' }
CFFIndex class >> count: countInteger offSize: offSizeInteger offset: offsetArray [
	| inst |
	inst := self new.
	inst initializeCount: countInteger offSize: offSizeInteger offset: offsetArray data: nil.
	^inst
]

{ #category : #'instance creation' }
CFFIndex class >> count: countInteger offSize: offSizeInteger offset: offsetArray data: dataArray [
	| inst |
	inst := self new.
	inst
		initializeCount: countInteger
		offSize: offSizeInteger
		offset: offsetArray
		data: dataArray.
	^inst
]

{ #category : #'instance creation' }
CFFIndex class >> fromBytes: aByteStream [
	| count offSize offsets objectData data |
	count := (ByteReadStream bigEndianOn: (aByteStream next: 2)) nextUnsignedShort.
	count isZero ifTrue: [
		^self new].
	offSize := aByteStream next.
	offsets := OrderedCollection new: count + 1.
	count + 1 timesRepeat: [
		| bytes |
		bytes := aByteStream next: offSize.
		offsets add: (ByteReadStream bigEndianOn: (ByteArray new: 4 - bytes size withAll: 0) , bytes) nextUnsignedLong].
	objectData := aByteStream next: offsets last - 1.
	data := OrderedCollection new: count.
	offsets inject: nil into: [:last :next |
		last ifNotNil: [data add: (objectData copyFrom: last to: next - 1)].
		next].
	^self count: count offSize: offSize offset: offsets data: data
]

{ #category : #'instance creation' }
CFFIndex class >> fromBytes: aByteStream collect: block [
	^(self fromBytes: aByteStream) data collect: block
]

{ #category : #specification }
CFFIndex class >> localSpecification [
	<constant: #count class: #Integer comment: 'Card16. Number of objects stored in INDEX'>
	<constant: #offSize class: #Integer comment: 'OffSize. Offset array element size'>
	<sequence: #offset comment: 'Offset. [count+1] Offset array (from byte preceding object data)'>
	<sequence: #data comment: 'Card8. [<varies>] Object data'>
]

{ #category : #'instance creation' }
CFFIndex class >> stringsFromBytes: aByteStream [
	^self fromBytes: aByteStream collect: #asString
]

{ #category : #accessing }
CFFIndex >> count [
	"<Integer>
	Card16. Number of objects stored in INDEX"

	^count
]

{ #category : #accessing }
CFFIndex >> data [
	"<Array>
	Card8. [<varies>] Object data"

	^data ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFIndex >> initializeCount: countInteger offSize: offSizeInteger offset: offsetArray data: dataArray [
	count := countInteger.
	offSize := offSizeInteger.
	(offsetArray notNil and: [
	offsetArray notEmpty]) ifTrue: [
			offset := (Array withAll: offsetArray) beImmutable].
	(dataArray notNil and: [
	dataArray notEmpty]) ifTrue: [
			data := (Array withAll: dataArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
CFFIndex >> offSize [
	"<Integer>
	OffSize. Offset array element size"

	^offSize
]

{ #category : #accessing }
CFFIndex >> offset [
	"<Array>
	Offset. [count+1] Offset array (from byte preceding object data)"

	^offset ifNil: [#()]
]

{ #category : #printing }
CFFIndex >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'count' value: self count).
	args add: (printer constant: 'offSize' value: self offSize).
	args add: (printer array: 'offset' value: self offset).
	args add: (printer array: 'data' value: self data).
	^printer printvalue: self arguments: args
]
