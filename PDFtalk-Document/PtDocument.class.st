"
A PDF Document represents a sequence of PDF objects for generating a PDF file.

The Document shall be created programatically by adding PDF objects to it.
A Document writes its objects to a PDF file and takes care of cross references and the file structure.
"
Class {
	#name : #PtDocument,
	#superclass : #Object,
	#instVars : [
		'root',
		'info',
		'version',
		'previousId'
	],
	#category : #'PDFtalk-Document'
}

{ #category : #'instance creation' }
PtDocument class >> version: aVersion [
	| inst |
	inst := self new.
	inst initializeVersion: aVersion.
	^inst
]

{ #category : #actions }
PtDocument >> appendAllPagesFrom: aPDFFile [
	"appends all pages from aPDFFile after the last page of the receiver"

	[(aPDFFile root at: #Pages) resolveAllReferences] on: PtTypeError , PtFileError do: [:ex |
		ex resume].
	self appendPages: (aPDFFile root at: #Pages)
]

{ #category : #actions }
PtDocument >> appendAllRawPagesFrom: aPDFFile [
	"appends all pages from aPDFFile after the last page of the receiver.
	The objects from aPDFFile are read raw without typing.
	The receiver should be saved only and not further processed"

	self updateVersion: aPDFFile header version.	"set the version, because it cannot be derrived from the raw objects"
	[(aPDFFile root at: #Pages) readAllRawObjects] on: PtFileError do: [:ex | ex resume].
	self appendRawPages: (aPDFFile root at: #Pages)
]

{ #category : #actions }
PtDocument >> appendPages: aPagesReference [
	"appends a copy of the aPages object after the last page of the receiver.
	Attention: this works fine when aPages is the root of the pages hierarchy and
	when aPages does not have inheritable attributes in its parent pages.
	To do: copy down inheritable attributes when appending single pages or subtrees of pages"

	| pagesToAppendRef parent rootPagesRef |
	pagesToAppendRef := aPagesReference copyWithNewReferences.
	rootPagesRef := self root at: #Pages.
	parent := rootPagesRef referent.
	pagesToAppendRef referent at: #Parent put: rootPagesRef.
	parent at: #Kids put: ((parent at: #Kids) with: pagesToAppendRef).
	parent
		at: #Count
		put: (parent at: #Count) asSmalltalkValue + (pagesToAppendRef referent at: #Count) asSmalltalkValue
]

{ #category : #actions }
PtDocument >> appendRawPages: aPagesReference [
	"appends a copy of the aPages object after the last page of the receiver.
	Attention: this works fine when aPages is the root of the pages hierarchy and
	when aPages does not have inheritable attributes in its parent pages.
	To do: copy down inheritable attributes when appending single pages or subtrees of pages"

	| pagesToAppendRef parent rootPagesRef |
	pagesToAppendRef := aPagesReference copyWithNewReferences.
	rootPagesRef := self root at: #Pages.
	"a new generic Pages object has to be made to avoid typing"
	rootPagesRef referent: (PtPDF Dictionary new initializeDirectWithContent: rootPagesRef referent content).
	parent := rootPagesRef referent.
	pagesToAppendRef referent at: #Parent put: rootPagesRef.
	parent at: #Kids put: ((parent at: #Kids) with: pagesToAppendRef).
	parent
		at: #Count
		put: (parent at: #Count) asSmalltalkValue + (pagesToAppendRef referent at: #Count) asSmalltalkValue
]

{ #category : #writing }
PtDocument >> binaryWriteStreamOn: aFilenameString [
	^(aFilenameString asFilename withEncoding: #binary) writeStream
]

{ #category : #writing }
PtDocument >> bytesForFile: aFilenameString [
	"<ByteArray>
	the bytes of the complete PDF"

	| trailer references writer xrefs startxref |
	trailer := (PDF classAt: #Trailer) new.
	trailer at: #Info put: self info newReference.
	trailer at: #Root put: self root newReference.
	references := trailer tracedReferences.
	trailer at: #Size put: references size + 1.
	references withIndexDo: [:reference :id | reference assignNewNumber: id].
	writer := Writer new.
	writer writeVersionHeader: (self version ifNil: [
		Version highestVersionIn: references]).
	xrefs := writer writeObjects: references.
	startxref := writer position.
	writer writeCrossReferenceSection: xrefs.
	trailer
		addFileIdentifierWithFile: aFilenameString
		andSize: writer position
		id: self previousId.
	writer writeTrailer: trailer.
	writer writeStartxref: startxref.
	^writer contents
]

{ #category : #accessing }
PtDocument >> info [
	"<DocumentInformation>"

	^info ifNil: [info := (PtPDF classAt: #DocumentInformation) empty]
]

{ #category : #accessing }
PtDocument >> info: aDocumentInformation [
	info := aDocumentInformation
]

{ #category : #'initialize-release' }
PtDocument >> initializeVersion: aPDFVersion [
	version := aPDFVersion
]

{ #category : #accessing }
PtDocument >> previousId [
	"<FileIdentifier | nil>
	the /ID of the PDF from which the receiver is derrived from.
	When the receiver is independently created, this is nil"

	^previousId
]

{ #category : #accessing }
PtDocument >> previousId: aFileIdentifierOrNil [
	previousId := aFileIdentifierOrNil
]

{ #category : #accessing }
PtDocument >> root [
	"<Catalog>"

	^root ifNil: [root := (PtPDF classAt: #Catalog) empty]
]

{ #category : #accessing }
PtDocument >> root: aCatalog [
	root := aCatalog
]

{ #category : #writing }
PtDocument >> saveAs: aFilenameString [
	| bytes filestream |
	bytes := self bytesForFile: aFilenameString.
	filestream := self binaryWriteStreamOn: aFilenameString.
	[filestream nextPutAll: bytes] ensure: [filestream close]
]

{ #category : #'initialize-release' }
PtDocument >> updateVersion: aPDFVersion [
	"<Version>
	set the version to the max of the current and aPDFVersion"

	version ifNil: [
		^version := aPDFVersion].
	^version := self version max: aPDFVersion
]

{ #category : #accessing }
PtDocument >> version [
	"<Version | nil>
	explicitly sets the version of the PDF.
	If nil, the objects are traced for the highest version when writing out"

	^version
]
