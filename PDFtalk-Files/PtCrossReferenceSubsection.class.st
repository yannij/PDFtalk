"
A Cross-Reference Subsection in a section of the cross-reference table as defined in PDF 32000_2008.pdf pp. 40.

Each cross-reference subsection shall contain entries for a contiguous range of object numbers. The subsection shall begin with a line containing two numbers separated by a SPACE (20h), denoting the object number of the first object in this subsection and the number of entries in the subsection.
"
Class {
	#name : #PtCrossReferenceSubsection,
	#superclass : #PtFileEntity,
	#instVars : [
		'firstNumber',
		'entries'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtCrossReferenceSubsection class >> firstNumber: firstNumberInteger entries: entriesArray [
	| inst |
	inst := self new.
	inst initializeFirstNumber: firstNumberInteger entries: entriesArray.
	^inst
]

{ #category : #'instance creation' }
PtCrossReferenceSubsection class >> initialOn: someCrossReferences [
	"<CrossReferenceSubsection>
	For a PDF that holds all references in only one CrossReferenceSection in only one CrossReferenceSubsection"

	^self
		firstNumber: 0
		entries: (Array with: PtFreeReference initial) , someCrossReferences
]

{ #category : #reading }
PtCrossReferenceSubsection class >> readFrom: aParser [
	"<CrossReferenceSubsection>"

	| firstObjectNumber count |
	firstObjectNumber := aParser nextInteger.
	count := aParser nextInteger.
	aParser skipWhitespace.
	^self
		firstNumber: firstObjectNumber
		entries: ((1 to: count) collect: [:i |
			PtCrossReference read: firstObjectNumber + i - 1 from: aParser]) asArray
]

{ #category : #comparing }
PtCrossReferenceSubsection >> = anObject [
	^self class == anObject class and: [
	self firstNumber = anObject firstNumber and: [
	self entries isSameSequenceAs: anObject entries]]
]

{ #category : #accessing }
PtCrossReferenceSubsection >> atNumber: anInteger ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	(anInteger between: self firstNumber and: self lastNumber) ifFalse: [
		^zeroArgumentBlock value].
	^self entries at: anInteger - self firstNumber + 1
]

{ #category : #accessing }
PtCrossReferenceSubsection >> crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	| entry |
	(anObjectId number between: self firstNumber and: self lastNumber) ifFalse: [
		^zeroArgumentBlock value].
	entry := self entries at: anObjectId number - self firstNumber + 1.
	(entry matches: anObjectId) ifTrue: [
		^entry].
	^zeroArgumentBlock value
]

{ #category : #accessing }
PtCrossReferenceSubsection >> entries [
	"<SequenceableCollection of: CrossReference>"

	^entries ifNil: [entries := OrderedCollection new]
]

{ #category : #comparing }
PtCrossReferenceSubsection >> entriesHash [
	^self entries inject: 0 into: [:hash :entry | hash bitXor: entry hash]
]

{ #category : #accessing }
PtCrossReferenceSubsection >> firstNumber [
	"<Integer>
	the object number of the first object in this subsection"

	^firstNumber
]

{ #category : #comparing }
PtCrossReferenceSubsection >> hash [
	^self firstNumber hash bitXor: self entriesHash
]

{ #category : #'initialize-release' }
PtCrossReferenceSubsection >> initializeFirstNumber: firstNumberInteger entries: entriesArray [
	firstNumber := firstNumberInteger.
	entries := entriesArray
]

{ #category : #accessing }
PtCrossReferenceSubsection >> lastNumber [
	^self firstNumber + self entries size - 1
]

{ #category : #printing }
PtCrossReferenceSubsection >> printOn: aStream [
	aStream
		nextPutAll: self class name asString;
		nextPut: $(;
		nextPutAll: self firstNumber printString;
		space;
		nextPutAll: self entries size printString;
		nextPut: $)
]

{ #category : #enumerating }
PtCrossReferenceSubsection >> referencesDo: oneArgumentBlock [
	self entries do: [:entry | oneArgumentBlock value: entry]
]

{ #category : #writing }
PtCrossReferenceSubsection >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutAll: self firstNumber printString asByteArray;
		space;
		nextPutAll: self entries size printString asByteArray;
		cr.
	self entries do: [:entry | entry writePDFOn: aWriter indent: anInteger]
]
