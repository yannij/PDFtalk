"
Combines one cross-reference section and one trailer.
Previous sections and trailers are collected and accessible with #previous.

PDF Cross-Reference Table as defined in PDF 32000_2008.pdf pp. 40.

The cross-reference table contains information that permits random access to indirect objects within the file so that the entire file need not be read to locate any particular object. The table shall contain a one-line entry for each indirect object, specifying the byte offset of that object within the body of the file. (Beginning with PDF 1.5, some or all of the cross-reference information may alternatively be contained in cross-reference streams).

NOTE 1		The cross-reference table is the only part of a PDF file with a fixed format, which permits entries in the table to be accessed randomly.

The table comprises one or more cross-reference sections. Initially, the entire table consists of a single section (or two sections if the file is linearized). One additional section shall be added each time the file is incrementally updated.


Shares the access protocol with CrossReferenceStream:
	#at:
	#at:ifAbsent:
	#atNumber:
	#atNumber:ifAbsent:
	#freeReferences
	#trailer
"
Class {
	#name : #PtCrossReferences,
	#superclass : #PtFileEntity,
	#instVars : [
		'crossReferenceSection',
		'trailer',
		'previous',
		'stream'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtCrossReferences class >> crossReferenceSection: aCrossReferenceSection trailer: aTrailer [
	^self
		crossReferenceSection: aCrossReferenceSection
		trailer: aTrailer
		previous: nil
		stream: nil
]

{ #category : #'instance creation' }
PtCrossReferences class >> crossReferenceSection: aCrossReferenceSection trailer: aTrailer previous: previousCrossReferences [
	^self
		crossReferenceSection: aCrossReferenceSection
		trailer: aTrailer
		previous: previousCrossReferences
		stream: nil
]

{ #category : #'instance creation' }
PtCrossReferences class >> crossReferenceSection: aCrossReferenceSection trailer: aTrailer previous: previousCrossReferences stream: aCrossReferenceStream [
	| inst |
	inst := self new.
	inst
		initializeCrossReferenceSection: aCrossReferenceSection
		trailer: aTrailer
		previous: previousCrossReferences
		stream: aCrossReferenceStream.
	^inst
]

{ #category : #reading }
PtCrossReferences class >> readWith: aFile [
	| crossReferenceSection trailer previous stream |
	crossReferenceSection := PtCrossReferenceSection readFrom: aFile parser.
	trailer := (PtPDF classAt: #Trailer) readWith: aFile from: aFile parser.
	previous := trailer Prev asSmalltalkValue ifNotNil: [:prevNumber |
		prevNumber isZero ifFalse: [		"some stupid writer put a (/Prev 0) into the Trailer"
			aFile parser position: prevNumber.
			self readWith: aFile]].
	stream := trailer XRefStm asSmalltalkValue ifNotNil: [:xRefStmNumber |
		aFile parser position: xRefStmNumber.
		(PtPDF classAt: #XRefStream) readWith: aFile].
	^self
		crossReferenceSection: crossReferenceSection
		trailer: trailer
		previous: previous
		stream: stream
]

{ #category : #comparing }
PtCrossReferences >> = anObject [
	^self class == anObject class and: [
	self crossReferenceSection = anObject crossReferenceSection and: [
	self trailer = anObject trailer and: [
	self previous = anObject previous and: [
	self stream = anObject stream]]]]
]

{ #category : #accessing }
PtCrossReferences >> atNumber: anInteger [
	"<CrossReference>"

	^self atNumber: anInteger ifAbsent: [
		PtFileError raiseSignal: 'Reference with number ' , anInteger printString , ' not found']
]

{ #category : #accessing }
PtCrossReferences >> atNumber: anInteger ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	^self crossReferenceSection atNumber: anInteger ifAbsent: [
		self stream
			ifNotNil: [
			self stream atNumber: anInteger ifAbsent: [
				self previous
					ifNotNil: [
					self previous atNumber: anInteger ifAbsent: zeroArgumentBlock]
					ifNil: [
					zeroArgumentBlock value]]]
			ifNil: [
			self previous
				ifNotNil: [
				self previous atNumber: anInteger ifAbsent: zeroArgumentBlock]
				ifNil: [
				zeroArgumentBlock value]]]
]

{ #category : #accessing }
PtCrossReferences >> crossReferenceAt: anObjectId [
	"<CrossReference | nil>"

	^self crossReferenceAt: anObjectId ifAbsent: [nil]
]

{ #category : #accessing }
PtCrossReferences >> crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	| unique1 cr unique2 |
	unique1 := 'unique1'.
	cr := self crossReferenceSection crossReferenceAt: anObjectId ifAbsent: [unique1].
	cr == unique1 ifFalse: [
		^cr].
	unique2 := 'unique2'.
	cr := self streamCrossReferenceAt: anObjectId ifAbsent: [unique2].
	cr == unique2 ifFalse: [
		^cr].
	^self previousCrossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock
]

{ #category : #accessing }
PtCrossReferences >> crossReferenceSection [
	"<CrossReferenceSection>"

	^crossReferenceSection
]

{ #category : #accessing }
PtCrossReferences >> freeReferences [
	| ref freeReferences |
	ref := self atNumber: 0.
	freeReferences := OrderedCollection with: ref.
	[ref value isZero] whileFalse: [
		ref := self atNumber: ref value.
		freeReferences add: ref].
	^freeReferences
]

{ #category : #comparing }
PtCrossReferences >> hash [
	^self crossReferenceSection hash bitXor: (self trailer hash bitXor: (self previous hash bitXor: self stream hash))
]

{ #category : #'initialize-release' }
PtCrossReferences >> initializeCrossReferenceSection: aCrossReferenceSection trailer: aTrailer previous: previousCrossReferences stream: aCrossReferenceStream [
	crossReferenceSection := aCrossReferenceSection.
	trailer := aTrailer.
	previous := previousCrossReferences.
	stream := aCrossReferenceStream
]

{ #category : #accessing }
PtCrossReferences >> previous [
	"<CrossReferences | XRefStream | nil>
	can be a CrossReferenceStream in a hybid file (see PDF 32000_2008.pdf pp. 51)"

	^previous
]

{ #category : #accessing }
PtCrossReferences >> previousCrossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	self previous ifNil: [
		^zeroArgumentBlock value].
	^self previous crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock
]

{ #category : #accessing }
PtCrossReferences >> references [
	"<SequenceableCollection of: CrossReference>"

	| list |
	list := OrderedCollection new.
	self referencesDo: [:ref | list add: ref].
	^list
]

{ #category : #enumerating }
PtCrossReferences >> referencesDo: oneArgumentBlock [
	self crossReferenceSection referencesDo: oneArgumentBlock.
	self stream ifNotNil: [self stream referencesDo: oneArgumentBlock].
	self previous ifNotNil: [self previous referencesDo: oneArgumentBlock]
]

{ #category : #accessing }
PtCrossReferences >> stream [
	"<XRefStream | nil>
	a CrossReferenceStream in a hybid file (see PDF 32000_2008.pdf pp. 51)"

	^stream
]

{ #category : #accessing }
PtCrossReferences >> streamCrossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	self stream ifNil: [
		^zeroArgumentBlock value].
	^self stream crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock
]

{ #category : #accessing }
PtCrossReferences >> trailer [
	"<Trailer>"

	^trailer
]

{ #category : #accessing }
PtCrossReferences >> usedReferences [
	"<SequenceableCollection of: UsedReference>"

	| list |
	list := OrderedCollection new.
	self referencesDo: [:ref |
		(ref isKindOf: PtUsedReference) ifTrue: [
			list add: ref]].
	^list
]

{ #category : #writing }
PtCrossReferences >> writePDFOn: aWriter indent: anInteger [
	self crossReferenceSection writePDFOn: aWriter indent: anInteger.
	aWriter cr.
	self trailer writePDFOn: aWriter indent: anInteger
]
