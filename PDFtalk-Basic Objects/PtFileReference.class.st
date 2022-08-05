"
Holds a cross reference pointing to an object in a file

The object is not present yet and must be read from the file to be used
"
Class {
	#name : #PtFileReference,
	#superclass : #Object,
	#instVars : [
		'id',
		'file',
		'types'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'test instances' }
PtFileReference class >> example [
	^self id: (PtObjectId number: 42) file: nil
]

{ #category : #'instance creation' }
PtFileReference class >> id: anObjectId file: aPDFFile [
	| inst |
	inst := self new.
	inst initializeId: anObjectId file: aPDFFile.
	^inst
]

{ #category : #adding }
PtFileReference >> addTypes: someAttributeTypes [
	| new notMoreGeneralThanAnyExisting notMoreGeneralThanNewOnes |
	new := someAttributeTypes reject: [:at | self types includes: at].
	notMoreGeneralThanAnyExisting := new reject: [:at |
		self types anySatisfy: [:myType | myType isMoreSpecificThan: at]].
	notMoreGeneralThanNewOnes := self types reject: [:myType |
		notMoreGeneralThanAnyExisting anySatisfy: [:newType | newType isMoreSpecificThan: myType]].
	types := notMoreGeneralThanNewOnes , notMoreGeneralThanAnyExisting
]

{ #category : #accessing }
PtFileReference >> crossReference [
	"<CrossReference | nil>
	pointer to the object in the file or stream"

	^self file crossReferenceAtId: self id
]

{ #category : #accessing }
PtFileReference >> file [
	"<PDFtalk.File>"
	
	^file
]

{ #category : #accessing }
PtFileReference >> id [
	"<ObjectId>
	ID of the object in the file or stream"

	^id
]

{ #category : #'initialize-release' }
PtFileReference >> initializeId: anObjectId file: aPDFFile [
	id := anObjectId.
	file := aPDFFile
]

{ #category : #testing }
PtFileReference >> isResolvedPDFObject [
	^false
]

{ #category : #accessing }
PtFileReference >> object [
	"<PDFObject>
	specialized by the types"

	^self readIndirectObject typed: self types
]

{ #category : #printing }
PtFileReference >> printOn: aStream [
	aStream
		nextPutAll: self id printString;
		nextPutAll: ' in ';
		nextPutAll: self file printString
]

{ #category : #reading }
PtFileReference >> readIndirectObject [
	"<PDFObject>"

	(self file crossReferenceAtId: self id) ifNotNil: [:xref |
		| object |
		object := xref readIndirectObjectWith: self file.
		self file announce: (PtObjectRead reference: self id object: object).
		^object].
	^PtMissingObject at: self id expected: self types asArray
]

{ #category : #accessing }
PtFileReference >> types [
	"<Array of: AttributeType>"
	
	^types ifNil: [types := OrderedCollection new]
]
