"
PDF Reference to an indirect object as defined in PDF 32000_2008.pdf section 7.3.10, pp. 21.
"
Class {
	#name : #PtReference,
	#superclass : #PtEntity,
	#instVars : [
		'id',
		'referent'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtReference class >> id: idObjectId [
	| inst |
	inst := self new.
	inst initializeId: idObjectId referent: nil.
	^inst
]

{ #category : #'instance creation' }
PtReference class >> id: idObjectId referent: aPDFObject [
	| inst |
	inst := self new.
	inst initializeId: idObjectId referent: aPDFObject.
	^inst
]

{ #category : #accessing }
PtReference class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Reference
		supertype: #Object
		section: '7.3.10'
		documentation: 'Any object in a PDF file may be labelled as an indirect object.
This gives the object a unique object identifier by which other objects can refer to it (for example, as an element of an array or as the value of a dictionary entry).'
]

{ #category : #'instance creation' }
PtReference class >> referent: aPDFObject [
	^self id: nil referent: aPDFObject
]

{ #category : #comparing }
PtReference >> = anObject [
	^self class == anObject class and: [
	self isResolved = anObject isResolved and: [
	self id = anObject id and: [
	(self isResolved and: [
	self referent == anObject referent]) or: [
		self isResolved not]]]]
]

{ #category : #converting }
PtReference >> asMissingObject [
	"<MissingObject>"

	^PtMissingObject at: self id expected: self referent types asArray
]

{ #category : #converting }
PtReference >> asSmalltalkValue [
	^self referent asSmalltalkValue
]

{ #category : #converting }
PtReference >> asType: aType [
	"<Reference | nil>"

	^aType specializedReference: self
]

{ #category : #accessing }
PtReference >> assignNewNumber: anInteger [
	"set the object number with generation 0 for writing"

	self isNew ifFalse: [
		self error: 'used reference'].
	id := PtObjectId number: anInteger
]

{ #category : #accessing }
PtReference >> baseObject [
	"<PDFObject>
	read the object from the file without typing"

	self isResolved ifFalse: [
		referent := self readIndirectObject].
	^referent
]

{ #category : #testing }
PtReference >> compliesTo: anAttributeType [
	^anAttributeType specifiesReference: self
]

{ #category : #accessing }
PtReference >> content [
	^self referent
]

{ #category : #tracing }
PtReference >> copyWithNewReferences [
	^self copyWithNewReferencesIn: IdentityDictionary new
]

{ #category : #tracing }
PtReference >> copyWithNewReferencesIn: visited [
	"<SequenceableCollection of: Reference>"

	| newReference |
	visited at: self ifPresent: [:value |
		^value].
	newReference := self class new.
	visited at: self put: newReference.
	^newReference referent: (self referent copyWithNewReferencesIn: visited)
]

{ #category : #copying }
PtReference >> copyWithReferent: aPDFObject [
	^self class id: self id referent: aPDFObject
]

{ #category : #accessing }
PtReference >> generation [
	"<Integer>"

	^self id generation
]

{ #category : #comparing }
PtReference >> hash [
	| hash |
	hash := self id hash.
	(self isNew and: [
	self isResolved]) ifTrue: [
			^self referent hash bitXor: hash].
	^hash
]

{ #category : #accessing }
PtReference >> id [
	"<ObjectId>"

	^id ifNil: [PtObjectId number: 0]
]

{ #category : #'initialize-release' }
PtReference >> initializeId: idObjectId referent: aPDFObject [
	id := idObjectId.
	referent := aPDFObject
]

{ #category : #testing }
PtReference >> isDirect [
	^false
]

{ #category : #testing }
PtReference >> isNew [
	"the object does not come from an existing PDF"

	^id isNil
]

{ #category : #testing }
PtReference >> isReferencedBy: aCrossReference [
	^aCrossReference refersTo: self
]

{ #category : #testing }
PtReference >> isResolved [
	"<Boolean>
	the object has been read from the file"

	^referent isResolvedPDFObject
]

{ #category : #testing }
PtReference >> isSameReference: anObject [
	^self = anObject or: [
	anObject refersTo: self]
]

{ #category : #accessing }
PtReference >> number [
	"<Integer>"

	^self id number
]

{ #category : #accessing }
PtReference >> pdfObject [
	^self referent ifNil: [self]
]

{ #category : #printing }
PtReference >> printOn: aStream [

	super printOn: aStream.
	self isResolved ifFalse: [^aStream nextPut: $*].
	aStream
		nextPutAll: ' (';
		nextPutAll: self referent printString;
		nextPutAll: ')'
]

{ #category : #printing }
PtReference >> printvalueWith: printer [
	"Value protocol to print the object literally"

	^LiteralPrintvalue string: self referent asSource, ' newReference'
]

{ #category : #reading }
PtReference >> readIndirectObject [
	"<PDFObject>
	the referent must be unresolved"

	^referent readIndirectObject
]

{ #category : #accessing }
PtReference >> referent [
	"<PDF.Object>
	lazy reading the object from the file.
	Initially, value stores a block which reads the object"

	self isResolved ifFalse: [
		referent := referent object].
	^referent
]

{ #category : #accessing }
PtReference >> referent: aPDFObject [
	referent := aPDFObject
]

{ #category : #tracing }
PtReference >> tracedReferences: visited do: oneArgumentBlock [
	"<SequenceableCollection of: Reference>"

	(visited includes: self) ifTrue: [
		^self].
	visited add: self.
	oneArgumentBlock value: self.
	self referent tracedReferences: visited do: oneArgumentBlock
]

{ #category : #typing }
PtReference >> typed: listOfAttributeTypes [
	"<PDFObject>
	a more specialized version copy of the receiver or the receiver itself.
	Dont resolve an object if it is not resolved yet (this would read in all referenced objects),
	instead, wrap the object reading block in another block to convert the object after it was read.
	This casting will globally effect the file, so that each holder of the receiver sees the new object.
	Beware of multiple users of the object!!"

	| specialized referentTypes |
	(listOfAttributeTypes anySatisfy: #specifiesReference) ifTrue: [
		^self].
	(listOfAttributeTypes anySatisfy: #isDirectType) ifTrue: [
		^self errorWrongTypes: listOfAttributeTypes].
	referentTypes := (listOfAttributeTypes select: #appliesToReference) collect: #asDirectType.
	referentTypes isEmpty ifTrue: [
		^self].
	self isResolved ifFalse: [
		referent ifNil: [
			^PtFileError raiseSignal: 'Illegal reference - References must be created by a PDF.File'].
		referent addTypes: referentTypes.
		^self].
	specialized := self referent typed: referentTypes.
	self referent == specialized ifFalse: [
		self referent: specialized].
	^self
]

{ #category : #accessing }
PtReference >> unresolvedReferences [
	self isResolved ifFalse: [
		^Array with: self].
	^#()
]

{ #category : #writing }
PtReference >> writeIndirectObjectOn: aWriter indent: integer [
	aWriter
		nextPutAll: self id printString asByteArray;
		space;
		nextPutAll: 'obj' asByteArray;
		cr.
	self referent writePDFOn: aWriter indent: 0.
	aWriter
		cr;
		nextPutAll: 'endobj' asByteArray
]

{ #category : #writing }
PtReference >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutAll: self id printString asByteArray;
		space;
		nextPutByte: $R asInteger
]
