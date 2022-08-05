"
PDF File as defined in PDF 32000_2008.pdf pp. 38.
"
Class {
	#name : #PtFile,
	#superclass : #PtFileEntity,
	#instVars : [
		'subscriptionRegistry',
		'objects',
		'parser',
		'header',
		'crossReferences',
		'trailer',
		'objectStreams'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #reading }
PtFile class >> binaryReadStreamOn: aFilename [
	^(aFilename withEncoding: #binary) readStream
]

{ #category : #'implementation limits' }
PtFile class >> defaultMillimetersForUserSpaceUnit [
	"The minimum page size should be 3 by 3 units in default user space; the maximum should be 14,400 by 14,400 units. In versions of PDF earlier than 1.6, the size of the default user space unit was fixed at 1.72 inch, yielding a minimum of approximately 0.04 by 0.04 inch and a maximum of 200 by 200 inches. Beginning with PDF 1.6, the size of the unit may be set on a page-by-page basis; the default remains at 1/72 inch."

	^25.4 / 72
]

{ #category : #'implementation limits' }
PtFile class >> defaultThumbnailScale [
	"Thumbnail images should be no larger than 106 by 106 samples, and should be created at one-eighth scale for 8.5-by-11-inch and A4-size pages."

	^1 / 8
]

{ #category : #'implementation limits' }
PtFile class >> maxCID [
	"Maximum value of a CID (character identifier)."

	^65535
]

{ #category : #'implementation limits' }
PtFile class >> maxDeviceNComponents [
	"Maximum number of colorants or tint components in a DeviceNcolour space."

	^32
]

{ #category : #'implementation limits' }
PtFile class >> maxMagnificationPercent [
	"The magnification factor of a view should be constrained to be between approximately 8 percent and 6400 percent."

	^6400
]

{ #category : #'implementation limits' }
PtFile class >> maxObjects [
	"Maximum number of indirect objects in a PDF file."

	^8388607
]

{ #category : #'implementation limits' }
PtFile class >> maxPageExtent [
	"The minimum page size should be 3 by 3 units in default user space; the maximum should be 14,400 by 14,400 units. In versions of PDF earlier than 1.6, the size of the default user space unit was fixed at 1.72 inch, yielding a minimum of approximately 0.04 by 0.04 inch and a maximum of 200 by 200 inches. Beginning with PDF 1.6, the size of the unit may be set on a page-by-page basis; the default remains at 1/72 inch."

	^14400 @ 14400
]

{ #category : #'implementation limits' }
PtFile class >> maxThumbnailExtent [
	"Thumbnail images should be no larger than 106 by 106 samples, and should be created at one-eighth scale for 8.5-by-11-inch and A4-size pages."

	^106 @ 106
]

{ #category : #'implementation limits' }
PtFile class >> minMagnificationPercent [
	"The magnification factor of a view should be constrained to be between approximately 8 percent and 6400 percent."

	^8
]

{ #category : #'implementation limits' }
PtFile class >> minPageExtent [
	"The minimum page size should be 3 by 3 units in default user space; the maximum should be 14,400 by 14,400 units. In versions of PDF earlier than 1.6, the size of the default user space unit was fixed at 1.72 inch, yielding a minimum of approximately 0.04 by 0.04 inch and a maximum of 200 by 200 inches. Beginning with PDF 1.6, the size of the unit may be set on a page-by-page basis; the default remains at 1/72 inch."

	^3 @ 3
]

{ #category : #'implementation limits' }
PtFile class >> qNestingLimit [
	"NOTE
Maximum depth of graphics state nesting by q and Q operators.
This is not a limit as such, but arises from the fact that q and Q are implemented by the PostScript gsave and grestore operators when generating PostScript output."

	^28
]

{ #category : #reading }
PtFile class >> read: aFilename [
	"<File>"

	| stream |
	stream := self binaryReadStreamOn: aFilename.
	^[self readFrom: stream] ensure: [stream close]
]

{ #category : #reading }
PtFile class >> readFrom: aBinaryReadStream [
	"<File>"

	| inst |
	inst := self new.
	inst initializeFrom: aBinaryReadStream.
	^inst
]

{ #category : #reading }
PtFile >> crossReferenceAtId: anObjectId [
	"<CrossReference | nil>
	pointer to the object in the file or stream"

	^self crossReferences crossReferenceAt: anObjectId
]

{ #category : #accessing }
PtFile >> crossReferences [
	"<CrossReferences | CrossReferenceStream>"

	^crossReferences
]

{ #category : #accessing }
PtFile >> declaredVersion [
	"<Version>"

	| versionName numbers |
	versionName := self root Version content ifNil: [
		^self header version].
	numbers := (versionName content substrings: (String with: $.)) collect: #asNumber.
	^self header version max: (Version major: numbers first minor: numbers last)
]

{ #category : #accessing }
PtFile >> firstPage [
	"<Page>"

	^self trailer firstPage
]

{ #category : #accessing }
PtFile >> header [
	"<PDFHeader>"

	^header
]

{ #category : #reading }
PtFile >> indirectObjectFrom: aParser [
	"<PDFObject | nil>
	read a PDF object off the aStream.
	Answer the PDF object.
	The top level call to read an indirect object.
	A Reference only is not allowed"

	| object |
	object := aParser readObjectWith: self.
	object isDirect ifFalse: [
		PtTypeError raiseSignal: 'References to References are not permitted.'].
	^object
]

{ #category : #'initialize-release' }
PtFile >> initializeFrom: aBinaryReadStream [
	parser := PtFileParser onStream: aBinaryReadStream.
	header := PtHeader version: self parser readHeaderVersion.
	crossReferences := self readCrossReferences.
	trailer := self crossReferences trailer.
	self trailer Encrypt notEmpty ifTrue: [
		parser := self parser forEncryption]
]

{ #category : #testing }
PtFile >> isEncrypted [
	^self parser isForEncrypted
]

{ #category : #reading }
PtFile >> objectStreamAt: aStreamId [
	"<ObjectStream>"

	^self objectStreams at: aStreamId ifAbsentPut: [
		(PtPDF classAt: #ObjectStream) newFrom: (self referenceAt: (PtObjectId number: aStreamId)) referent]
]

{ #category : #reading }
PtFile >> objectStreams [
	"<Dictionary key: Integer value: ObjectStream>"

	^objectStreams ifNil: [objectStreams := Dictionary new]
]

{ #category : #accessing }
PtFile >> objects [
	"<Dictionary key: Point value: Reference>"

	^objects ifNil: [objects := Dictionary new]
]

{ #category : #accessing }
PtFile >> parser [
	"<Parser>"

	^parser
]

{ #category : #private }
PtFile >> postCopy [
	super postCopy.
	subscriptionRegistry := nil
]

{ #category : #printing }
PtFile >> printOn: aStream [
	aStream
		nextPutAll: self header printString;
		nextPut: $[;
		nextPutAll: self trailer Size printString;
		nextPut: $]
]

{ #category : #reading }
PtFile >> readCrossReferences [
	self parser setPositionToXRef.
	self parser peek isDigit ifTrue: [
		^(PtPDF classAt: #XRefStream) readWith: self].
	^PtCrossReferences readWith: self
]

{ #category : #reading }
PtFile >> readObject [
	"<PDFObject | nil>
	read a PDF object off the aStream.
	Answer the PDF object"

	^self parser readObjectWith: self
]

{ #category : #accessing }
PtFile >> referenceAt: anObjectId [
	"<Reference>
	used when reading"

	^self objects at: anObjectId ifAbsentPut: [
		(PtPDF classAt: #Reference) id: anObjectId referent: (PtFileReference id: anObjectId file: self)]
]

{ #category : #'initialize-release' }
PtFile >> release [
	subscriptionRegistry release.
	subscriptionRegistry := nil.
	self parser ifNotNil: [:aParser |
		aParser release.
		parser := nil].
	super release
]

{ #category : #accessing }
PtFile >> root [
	"<Catalog>"

	^self trailer Root
]

{ #category : #private }
PtFile >> subscriptionRegistry: aSubscriptionRegistry [
	subscriptionRegistry := aSubscriptionRegistry
]

{ #category : #announcements }
PtFile >> subscriptionRegistryOrNil [
	^subscriptionRegistry
]

{ #category : #accessing }
PtFile >> trailer [
	"<Trailer>"

	^trailer
]

{ #category : #accessing }
PtFile >> usedReferences [
	"<SequenceableCollection of: UsedReference>"

	^self crossReferences usedReferences
]
