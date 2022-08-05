"
PDF Object Stream as defined in PDF 32000_2008.pdf pp. 45.

An object stream, is a stream object in which a sequence of indirect objects may be stored, as an alternative to their being stored at the outermost file level.
"
Class {
	#name : #PtObjectStream,
	#superclass : #PtTypedStream,
	#instVars : [
		'parser',
		'offsets'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtObjectStream class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ObjectStream
		supertype: #Stream
		version: #(1 5)
		section: '7.6.3.2'
		documentation: 'An object stream, is a stream object in which a sequence of indirect objects may be stored, as an alternative to their being stored at the outermost file level.'
]

{ #category : #accessing }
PtObjectStream class >> type [
	^#ObjStm
]

{ #category : #'accessing entries' }
PtObjectStream >> Extends [
	<typeIndirect: #ObjectStream>
	<attribute: 3 documentation: 'A reference to another object stream, of which the current object stream shall be considered an extension.
Both streams are considered part of a collection of object streams.
A given collection consists of a set of streams whose Extends links form a directed acyclic graph.'>
	^self objectAt: #Extends ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtObjectStream >> First [
	<type: #Integer>
	<required>
	<attribute: 2 documentation: 'The byte offset in the decoded stream of the first compressed object.'>
	^self objectAt: #First
]

{ #category : #'accessing entries' }
PtObjectStream >> N [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of indirect objects stored in the stream.'>
	^self objectAt: #N
]

{ #category : #accessing }
PtObjectStream >> offsetAt: zeroBasedIndex [
	"<Integer>"

	^(self offsets atIndex: zeroBasedIndex + 1) value
]

{ #category : #accessing }
PtObjectStream >> offsets [
	"<OrderedDictionary key: Integer value: Integer>
	The key is the object number n refered by 'n 0 R'
	The value is the offset from the beginning of the internal stream"

	^offsets ifNil: [
		parser := nil.
		offsets := self readOffsets]
]

{ #category : #accessing }
PtObjectStream >> parser [
	^parser ifNil: [parser := PtObjectStreamParser onString: self internal]
]

{ #category : #reading }
PtObjectStream >> readAt: zeroBasedIndex with: aFile [
	"<PDFObject>"

	self encrypted ifTrue: [
		^nil].
	^self parser pickObjectAt: (self offsetAt: zeroBasedIndex) with: aFile
]

{ #category : #reading }
PtObjectStream >> readOffsets [
	| dict first |
	dict := Valuemap new.
	first := self First asSmalltalkValue.
	self N asSmalltalkValue timesRepeat: [
		| objectNumber offset |
		objectNumber := self parser nextInteger.
		offset := self parser nextInteger.
		dict at: objectNumber put: first + offset].
	^dict
]
