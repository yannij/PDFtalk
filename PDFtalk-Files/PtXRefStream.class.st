"
PDF Cross-reference Stream as defined in PDF 32000_2008.pdf pp. 49.

Beginning with PDF 1.5, cross-reference information may be stored in a cross-reference stream instead of in a cross-reference table. Cross-reference streams provide the following advantages:
•	A more compact representation of cross-reference information
•	The ability to access compressed objects that are stored in object streams and to allow new cross-reference entry types to be added in the future
Cross-reference streams are stream objects, and contain a dictionary and a data stream. Each cross-reference stream contains the information equivalent to the cross-reference table and trailer for one cross-reference section.
"
Class {
	#name : #PtXRefStream,
	#superclass : #PtTypedStream,
	#instVars : [
		'previous',
		'subsections'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtXRefStream class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #XRefStream
		supertype: #Stream
		version: #(1 5)
		section: '7.5.8'
		documentation: 'Beginning with PDF 1.5, cross-reference information may be stored in a cross-reference stream instead of in a cross-reference table. Cross-reference streams provide the following advantages:
•	A more compact representation of cross-reference information
•	The ability to access compressed objects that are stored in object streams and to allow new cross-reference entry types to be added in the future
Cross-reference streams are stream objects, and contain a dictionary and a data stream. Each cross-reference stream contains the information equivalent to the cross-reference table and trailer for one cross-reference section.'
]

{ #category : #reading }
PtXRefStream class >> readWith: aFile [
	"<CrossReferenceStream>"

	| inst |
	inst := self newFrom: (aFile parser readCrossReferenceStreamWith: aFile).
	(inst at: #Prev ifAbsent: [nil]) ifNotNil: [:previousPosition |
		aFile parser position: previousPosition asSmalltalkValue.
		inst previous: (self readWith: aFile)].
	^inst
]

{ #category : #accessing }
PtXRefStream class >> type [
	^#XRef
]

{ #category : #'accessing entries' }
PtXRefStream >> ID [
	<typeDirect: #FileIdentifier>
	<version: 1 dot: 1>
	<attribute: 7 documentation: 'An array of two byte-strings constituting a file identifier for the file.
If there is an Encrypt entry this array and the two byte-strings shall be direct objects and shall be unencrypted.

NOTE 1
	Because the ID entries are not encrypted it is possible to check the ID key to assure that the correct file is being accessed without decrypting the file.
	The restrictions that the string be a direct object and not be encrypted assure that this is possible.
NOTE 2
	Although this entry is optional, its absence might prevent the file from functioning in some workflows that depend on files being uniquely identified.
NOTE 3
	The values of the ID strings are used as input to the encryption algorithm.
	If these strings were indirect, or if the ID array were indirect, these strings would be encrypted when written.
	This would result in a circular condition for a reader: the ID strings must be decrypted in order to use them to decrypt strings, including the ID strings themselves.
	The preceding restriction prevents this circular condition.'>
	^self objectAt: #ID ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtXRefStream >> Index [
	<typeArrayOf: #Integer>
	<attribute: 2 documentation: 'An array containing a pair of integers for each subsection in this section.
The first integer shall be the first object number in the subsection; the second integer shall be the number of entries in the subsection
The array shall be sorted in ascending order by object number. Subsections cannot overlap; an object number may have at most one entry in a section.
Default value: [0 Size].'>
	^self objectAt: #Index ifAbsent: [
		(Array
			with: 0
			with: self Size) asPDF]
]

{ #category : #'accessing entries' }
PtXRefStream >> Info [
	<typeIndirect: #Dictionary>
	<attribute: 6 documentation: 'The document’s information dictionary.'>
	^self objectAt: #Info ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtXRefStream >> Prev [
	<type: #Integer>
	<attribute: 3 documentation: '(Present only if the file has more than one cross-reference stream; not meaningful in hybrid-reference files)
The byte offset in the decoded stream from the beginning of the file to the beginning of the previous cross-reference stream.
This entry has the same function as the Prev entry in the trailer dictionary.'>
	^self objectAt: #Prev ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtXRefStream >> Root [
	<typeIndirect: #Catalog>
	<required>
	<attribute: 5 documentation: 'The catalog dictionary for the PDF document contained in the file.'>
	^self objectAt: #Root
]

{ #category : #'accessing entries' }
PtXRefStream >> Size [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number one greater than the highest object number used in this section or in any section for which this shall be an update.
It shall be equivalent to the Size entry in a trailer dictionary.'>
	^self objectAt: #Size
]

{ #category : #'accessing entries' }
PtXRefStream >> W [
	<typeArrayOf: #Integer>
	<required>
	<attribute: 4 documentation: 'An array of integers representing the size of the fields in a single cross-reference entry.
For PDF 1.5, W always contains three integers; the value of each integer shall be the number of bytes (in the decoded stream) of the corresponding field.
	EXAMPLE[1 2 1] means that the fields are one byte, two bytes, and one byte, respectively.
A value of zero for an element in the W array indicates that the corresponding field shall not be present in the stream, and the default value shall be used, if there is one.
If the first element is zero, the type field shall not be present, and shall default to type 1.

The sum of the items shall be the total length of each entry; it can be used with the Index array to determine the starting position of each subsection.
Different cross-reference streams in a PDF file may use different values for W.'>
	^self objectAt: #W
]

{ #category : #accessing }
PtXRefStream >> atNumber: anInteger [
	"<CrossReference>"

	^self atNumber: anInteger ifAbsent: [
		PtFileError raiseSignal: 'Reference with number ' , anInteger printString , ' not found']
]

{ #category : #accessing }
PtXRefStream >> atNumber: anInteger ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	self subsections do: [:subsection |
		(subsection atNumber: anInteger ifAbsent: [nil]) ifNotNil: [:ref |
			^ref]].
	self previous ifNotNil: [
		^self previous atNumber: anInteger ifAbsent: zeroArgumentBlock].
	^zeroArgumentBlock value
]

{ #category : #'initialize-release' }
PtXRefStream >> createSubsections [
	| ssections ssrst contentsStream wBytes |
	ssections := OrderedCollection new.
	ssrst := self Index asSmalltalkValue readStream.
	contentsStream := self internal asByteArray readStream.
	wBytes := self W content collect: #asSmalltalkValue.
	[ssrst atEnd] whileFalse: [
		| firstNumber count entries |
		firstNumber := ssrst next asSmalltalkValue.
		count := ssrst next asSmalltalkValue.
		entries := (1 to: count) collect: [:i |
			PtCrossReference
				number: firstNumber + i - 1
				field1: (contentsStream next: wBytes first)
				field2: (contentsStream next: (wBytes at: 2))
				field3: (contentsStream next: wBytes last)].
		ssections add: (PtCrossReferenceSubsection firstNumber: firstNumber entries: entries)].
	^ssections
]

{ #category : #accessing }
PtXRefStream >> crossReferenceAt: anObjectId [
	"<CrossReference | nil>"

	^self crossReferenceAt: anObjectId ifAbsent: [nil]
]

{ #category : #accessing }
PtXRefStream >> crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	| uniqueObject |
	uniqueObject := 'unique'.
	self subsections do: [:subsection |
		| cr |
		cr := subsection crossReferenceAt: anObjectId ifAbsent: [uniqueObject].
		cr == uniqueObject ifFalse: [
			^cr]].
	self previous ifNotNil: [
		^self previous crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock].
	^zeroArgumentBlock value
]

{ #category : #accessing }
PtXRefStream >> freeReferences [
	| ref freeReferences |
	ref := self atNumber: 0.
	freeReferences := OrderedCollection with: ref.
	[ref value isZero] whileFalse: [
		ref := self atNumber: ref value.
		freeReferences add: ref].
	^freeReferences
]

{ #category : #accessing }
PtXRefStream >> previous [
	"<XRefStream | nil>"

	^previous
]

{ #category : #accessing }
PtXRefStream >> previous: aXRefStream [
	previous := aXRefStream
]

{ #category : #enumerating }
PtXRefStream >> referencesDo: oneArgumentBlock [
	self subsections do: [:subsection | subsection referencesDo: oneArgumentBlock].
	self previous ifNotNil: [self previous referencesDo: oneArgumentBlock]
]

{ #category : #accessing }
PtXRefStream >> subsections [
	"<SequenceableCollection of: CrossReferenceSubsection>"

	^subsections ifNil: [subsections := self createSubsections]
]

{ #category : #accessing }
PtXRefStream >> trailer [
	"<Trailer>"

	| newDict |
	newDict := Valuemap new.
	(PtPDF classAt: #Trailer) keys do: [:key |
		(self content at: key ifAbsent: [nil]) ifNotNil: [:aValue | newDict at: key put: aValue]].
	^(PtPDF classAt: #Trailer) on: newDict
]

{ #category : #accessing }
PtXRefStream >> usedReferences [
	"<SequenceableCollection of: UsedReference>"

	| list |
	list := OrderedCollection new.
	self referencesDo: [:ref |
		(ref isKindOf: PtUsedReference) ifTrue: [
			list add: ref]].
	^list
]
