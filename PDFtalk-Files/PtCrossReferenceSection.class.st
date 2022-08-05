"
A Cross-Reference Section of the cross-reference table as defined in PDF 32000_2008.pdf pp. 40.

Each cross-reference section shall begin with a line containing the keyword xref. Following this line shall be one or more cross-reference subsections, which may appear in any order. For a file that has never been incrementally updated, the cross-reference section shall contain only one subsection, whose object numbering begins at 0.
"
Class {
	#name : #PtCrossReferenceSection,
	#superclass : #PtFileEntity,
	#instVars : [
		'subsections'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtCrossReferenceSection class >> initialOn: someCrossReferences [
	"<CrossReferenceSection>
	For a PDF that holds all references in only one CrossReferenceSection in only one CrossReferenceSubsection"

	^self subsections: (Array with: (PtCrossReferenceSubsection initialOn: someCrossReferences))
]

{ #category : #reading }
PtCrossReferenceSection class >> readFrom: aParser [
	"<CrossReferenceSection>"

	| subsections |
	subsections := OrderedCollection new.
	aParser expectToken: #xref.
	aParser skipWhitespace.
	[
	| char |
	char := aParser peek.
	char notNil and: [
	char isDigit]] whileTrue: [
			subsections add: (PtCrossReferenceSubsection readFrom: aParser)].
	^self subsections: subsections asArray
]

{ #category : #'instance creation' }
PtCrossReferenceSection class >> subsections: subsectionsArray [
	| inst |
	inst := self new.
	inst initializeSubsections: subsectionsArray.
	^inst
]

{ #category : #comparing }
PtCrossReferenceSection >> = anObject [
	^self class == anObject class and: [
	self subsections isSameSequenceAs: anObject subsections]
]

{ #category : #accessing }
PtCrossReferenceSection >> atNumber: anInteger ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	self subsections do: [:subsection |
		(subsection atNumber: anInteger ifAbsent: [nil]) ifNotNil: [:ref |
			^ref]].
	^zeroArgumentBlock value
]

{ #category : #accessing }
PtCrossReferenceSection >> crossReferenceAt: anObjectId ifAbsent: zeroArgumentBlock [
	"<CrossReference>"

	| uniqueObject |
	uniqueObject := 'unique'.
	self subsections do: [:subsection |
		| cr |
		cr := subsection crossReferenceAt: anObjectId ifAbsent: [uniqueObject].
		cr == uniqueObject ifFalse: [
			^cr]].
	^zeroArgumentBlock value
]

{ #category : #comparing }
PtCrossReferenceSection >> hash [
	^self subsections inject: 0 into: [:hash :subsection | hash bitXor: subsection hash]
]

{ #category : #'initialize-release' }
PtCrossReferenceSection >> initializeSubsections: subsectionsArray [
	subsections := subsectionsArray
]

{ #category : #printing }
PtCrossReferenceSection >> printOn: aStream [
	aStream
		nextPutAll: self class name asString;
		nextPut: $(;
		nextPutAll: self subsections size printString;
		nextPut: $)
]

{ #category : #enumerating }
PtCrossReferenceSection >> referencesDo: oneArgumentBlock [
	self subsections do: [:subsection | subsection referencesDo: oneArgumentBlock]
]

{ #category : #accessing }
PtCrossReferenceSection >> subsections [
	"<SequenceableCollection of: CrossReferenceSubsection>"

	^subsections ifNil: [subsections := OrderedCollection new]
]

{ #category : #writing }
PtCrossReferenceSection >> writePDFOn: aPDFWritestream indent: integer [
	self subsections do: [:subsection | subsection writePDFOn: aPDFWritestream indent: integer]
]
