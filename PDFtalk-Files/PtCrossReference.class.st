"
A Cross-Reference Entry in a subsection of a section of the cross-reference table as defined in PDF 32000_2008.pdf pp. 40.

Each cross-reference entry shall be exactly 20 bytes long, including the end-of-line marker. There are two kinds of cross-reference entries: one for objects that are in use and another for objects that have been deleted and therefore are free. Both types of entries have similar basic formats, distinguished by the keyword n (for an in-use entry) or f (for a free entry).
"
Class {
	#name : #PtCrossReference,
	#superclass : #Value,
	#instVars : [
		'id',
		'value'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtCrossReference class >> asInteger: aByteArray [
	"<Integer>"

	^aByteArray inject: 0 into: [:int :byte | int * 256 + byte]
]

{ #category : #'instance creation' }
PtCrossReference class >> id: idObjectId value: valueInteger [
	| inst |
	inst := self new.
	inst initializeId: idObjectId value: valueInteger.
	^inst
]

{ #category : #specification }
PtCrossReference class >> localSpecification [
	<constant: #id class: #PtObjectId comment: 'the object id'>
	<constant: #value class: #Integer comment: 'offset or object number. 10-digit number in PDF'>
]

{ #category : #'instance creation' }
PtCrossReference class >> number: numberInteger field1: field1ByteArray field2: field2ByteArray field3: field3ByteArray [
	"this is called when creating an instance from a cross-reference stream"

	| aType0To2 subclass |
	aType0To2 := self asInteger: field1ByteArray.
	subclass := self subclassTyped: aType0To2.
	^subclass
		id: (PtObjectId number: numberInteger generation: (self asInteger: field3ByteArray))
		value: (self asInteger: field2ByteArray)
]

{ #category : #reading }
PtCrossReference class >> permittedLineEnds [
	"<Collection of: String>"

	^Set
		with: (String
			with: Character space
			with: Character cr)
		with: (String
			with: Character space
			with: Character lf)
		with: (String
			with: Character cr
			with: Character lf)
]

{ #category : #reading }
PtCrossReference class >> read: number from: aParser [
	"<CrossReference>"

	| value generation subclass |
	value := (aParser next: 10) asNumber.
	aParser next = Character space ifFalse: [
		PtReadError raiseSignal: 'Wrong format of cross-reference'].
	generation := (aParser next: 5) asNumber.
	aParser next = Character space ifFalse: [
		PtReadError raiseSignal: 'Wrong format of cross-reference'].
	subclass := self subclassFor: aParser next.
	value isZero ifTrue: [
		subclass := PtFreeReference].
	(self permittedLineEnds includes: (aParser next: 2)) ifFalse: [
		PtReadError raiseSignal: 'Wrong format of cross-reference'].
	^subclass id: (PtObjectId number: number generation: generation) value: value
]

{ #category : #'instance creation' }
PtCrossReference class >> subclassFor: aCharacter [
	"<CrossReference class>"

	aCharacter == $n ifTrue: [
		^PtUsedReference].
	aCharacter == $f ifTrue: [
		^PtFreeReference].
	PtFileError raiseSignal: 'Wrong format of cross-reference'
]

{ #category : #'instance creation' }
PtCrossReference class >> subclassTyped: aType0To2 [
	^(Array
		with: PtFreeReference
		with: PtUsedReference
		with: PtStreamReference) at: aType0To2 + 1
]

{ #category : #accessing }
PtCrossReference class >> type [
	"<Integer>
	Each entry in a cross-reference stream shall have one or more fields, the first of which designates the entry’s type.
	In PDF 1.5 through PDF 1.7, only types 0, 1, and 2 are allowed. Any other value shall be interpreted as a reference to the null object, thus permitting new entry types to be defined in the future."

	^self subclassResponsibility
]

{ #category : #accessing }
PtCrossReference >> generation [
	"<Integer>
	generation number. 5-digit number in PDF"

	^self id generation
]

{ #category : #accessing }
PtCrossReference >> generationString [
	"<String>
	5 digits padded with $0 at the beginning"

	^'00000' , self generation printString last: 5
]

{ #category : #accessing }
PtCrossReference >> id [
	"<ObjectId>
	the object id"

	^id
]

{ #category : #'initialize-release' }
PtCrossReference >> initializeId: idObjectId value: valueInteger [
	id := idObjectId.
	value := valueInteger.
	self beImmutable
]

{ #category : #accessing }
PtCrossReference >> keyword [
	"<String>"

	^self subclassResponsibility
]

{ #category : #comparing }
PtCrossReference >> matches: anObjectId [
	^self number = anObjectId number
]

{ #category : #accessing }
PtCrossReference >> number [
	"<Integer>
	the object number"

	^self id number
]

{ #category : #printing }
PtCrossReference >> printOn: aStream [
	aStream
		nextPutAll: self valueString;
		space;
		nextPutAll: self generationString;
		space;
		nextPutAll: self keyword
]

{ #category : #printing }
PtCrossReference >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'id' value: self id).
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
PtCrossReference >> readIndirectObjectWith: aFile [
	"<PDFObject | nil>"

	^nil
]

{ #category : #accessing }
PtCrossReference >> type [
	^self class type
]

{ #category : #accessing }
PtCrossReference >> value [
	"<Integer>
	offset or object number. 10-digit number in PDF"

	^value
]

{ #category : #accessing }
PtCrossReference >> valueString [
	"<String>
	10 digits padded with $0 at the beginning"

	^'0000000000' , self value printString last: 10
]

{ #category : #writing }
PtCrossReference >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutAll: self valueString asByteArray;
		space;
		nextPutAll: self generationString asByteArray;
		space;
		nextPutAll: self keyword asByteArray;
		space;
		cr
]
