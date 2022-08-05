"
Maps a source (Code or Range) to a destination code

The source must be in the defined codespace
"
Class {
	#name : #PSMapping,
	#superclass : #Value,
	#instVars : [
		'source',
		'destination'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #specification }
PSMapping class >> localSpecification [
	<constant: #source class: #PSMappingSource comment: 'The source of the mapping. A Code or Range'>
	<constant: #destination class: #Integer comment: 'The destination of the mapping. A Unicode or CID'>
]

{ #category : #'instance creation' }
PSMapping class >> source: sourceMappingSource destination: destinationInteger [
	| inst |
	inst := self new.
	inst initializeSource: sourceMappingSource destination: destinationInteger.
	^inst
]

{ #category : #comparing }
PSMapping >> <= aRange [
	^self source <= aRange source
]

{ #category : #converting }
PSMapping >> appendedToCode: aCodeMapping [
	^self subclassResponsibility
]

{ #category : #converting }
PSMapping >> appendedToRange: aRange [
	^self subclassResponsibility
]

{ #category : #converting }
PSMapping >> asSimplestMapping [
	"<Mapping>
	convert a range mapping with one code to char mapping"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> characterAt: aCode [
	"<Character>
	interpreting the destination as character code(s) (unicode or PS name)"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> characters [
	"<String>
	interpreting the destination as character codes (unicode or PS name)"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> codeLength [
	^self source length
]

{ #category : #accessing }
PSMapping >> codes [
	"<Array of: Code>"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> destination [
	"<Integer>
	The destination of the mapping. A Unicode or CID"

	^destination
]

{ #category : #accessing }
PSMapping >> destinationAt: aCode [
	"<Integer>
	the receiver is a CID or notdef mapping"

	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PSMapping >> initializeSource: sourceMappingSource destination: destinationInteger [
	source := sourceMappingSource.
	destination := destinationInteger.
	self beImmutable
]

{ #category : #testing }
PSMapping >> isAfterAndNotAttaching: aMapping [
	^(aMapping source isBefore: self source) and: [
	(aMapping isNext: self) not]
]

{ #category : #testing }
PSMapping >> isBeforeAndNotAttaching: aMapping [
	^(self source isBefore: aMapping source) and: [
	(self isNext: aMapping) not]
]

{ #category : #testing }
PSMapping >> isNext: aMapping [ 
	"assumption: the receiver is before aMapping"

	^self subclassResponsibility
]

{ #category : #converting }
PSMapping >> joined: aMapping [
	"<RangeMapping | nil>"

	(self isNext: aMapping) ifTrue: [
		^self rangeWith: aMapping].
	^nil
]

{ #category : #accessing }
PSMapping >> mappingsOverwrittenBy: aMapping [
	"<Array of: Mapping>
	the mappings resulting from overwriting the receiver:
		one mapping when the receiver is fully contained by aMapping or when it can attach
		two mappings when the receiver is split"

	^self subclassResponsibility
]

{ #category : #testing }
PSMapping >> maps: aCode [
	"true, if the receiver can map aCode"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> numberOfChars [
	"<Integer>
	the number of char mappings"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> numberOfCodes [
	"<Integer>
	the number of source codes"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> numberOfRanges [
	"<Integer>
	the number of range mappings"
	
	^self subclassResponsibility
]

{ #category : #printing }
PSMapping >> printDestinationOn: aStream [
	self destination printOn: aStream
]

{ #category : #printing }
PSMapping >> printOn: aStream [
	self printSourceOn: aStream.
	aStream nextPutAll: ' --> '.
	self printDestinationOn: aStream
]

{ #category : #printing }
PSMapping >> printSourceOn: aStream [
	self source printOn: aStream
]

{ #category : #printing }
PSMapping >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'source' value: self source).
	args add: (printer constant: 'destination' value: self destination).
	^printer printvalue: self arguments: args
]

{ #category : #converting }
PSMapping >> rangeWith: aCharMapping [
	"<RangeMapping>"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMapping >> source [
	"<Value>
	The source of the mapping. A Code or Range"

	^source
]

{ #category : #printing }
PSMapping >> sourceString [
	| wst |
	wst := String new writeStream.
	self printSourceOn: wst.
	^wst contents
]

{ #category : #converting }
PSMapping >> withoutFirstByte [
	^self class source: self source withoutFirstByte destination: self destination
]
