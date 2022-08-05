"
PDF Filter as defined in PDF 32000_2008.pdf pp. 22.

A de-/en-coder for the contents of PDF Streams.

A filter has two buffers:
	external: 	The encoded contents as read from an external source.
				This is written to a file or used as #internal to the next filter.
	internal: 	The decoded contents as used internally by the system or as #external by the next filter.

A new filter is created with either the external or the internal content.
The other buffer is filled lazy on demand.
Any error is stored in the corresponding buffer.
"
Class {
	#name : #PtFilter,
	#superclass : #PtEntity,
	#instVars : [
		'internal',
		'external'
	],
	#category : #'PDFtalk-Streams'
}

{ #category : #'instance creation' }
PtFilter class >> external: externalByteString [
	^self external: externalByteString with: Dictionary new
]

{ #category : #'instance creation' }
PtFilter class >> external: externalByteString with: aDecodeParms [
	| inst |
	inst := self new.
	inst initializeInternal: nil external: externalByteString from: aDecodeParms.
	^inst
]

{ #category : #'instance creation' }
PtFilter class >> internal: internalByteString [
	^self internal: internalByteString with: Dictionary new
]

{ #category : #'instance creation' }
PtFilter class >> internal: internalByteString with: aDecodeParms [
	| inst |
	inst := self new.
	inst initializeInternal: internalByteString external: nil from: aDecodeParms.
	^inst
]

{ #category : #accessing }
PtFilter class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Filter
		supertype: #Object
		section: '7.4'
		documentation: 'An option when reading stream data is to decode it using a filter to produce the original non-encoded data.
		Whether to do so and which decoding filter or filters to use may be specified in the stream dictionary.'
]

{ #category : #accessing }
PtFilter class >> subclassNamed: aSymbol [
	"<Filter class>"

	^self allSubclasses detect: [:subclass | subclass name = aSymbol]
]

{ #category : #accessing }
PtFilter >> decoded [
	"<ByteString>"

	^PtUnsupported raiseSignal: self class name asString, ' is not supported (yet)'
]

{ #category : #accessing }
PtFilter >> encoded [
	"<ByteString>"

	^PtUnsupported raiseSignal: self class name asString, ' is not supported (yet)'
]

{ #category : #accessing }
PtFilter >> external [
	^external ifNil: [
		internal ifNotNil: [external := [self encoded] on: PtError do: [:ex | ex return: ex]]]
]

{ #category : #testing }
PtFilter >> externalIsError [
	^self external isKindOf: Exception
]

{ #category : #'initialize-release' }
PtFilter >> initializeInternal: internalByteString external: externalByteString from: aDecodeParmsOrNil [
	"initialize the filter with either internal or external content.
	Use the parameters in aDecodeParmsOrNil"

	((internalByteString isNil and: [
	externalByteString isNil]) or: [
		internalByteString notNil and: [
		externalByteString notNil]]) ifTrue: [
			^PtError raiseSignal: 'A filter can only be created with EITHER the internal OR the external bytes'].
	internal := internalByteString.
	external := externalByteString.
	aDecodeParmsOrNil ifNotNil: [self initializeParameters: aDecodeParmsOrNil]
]

{ #category : #'initialize-release' }
PtFilter >> initializeParameters: aDecodeParms [
	"don't do anything by default.
	Subclasses may redefine this"
]

{ #category : #accessing }
PtFilter >> internal [
	^internal ifNil: [external ifNotNil: [internal := [self decoded] on: PtError do: [:ex | ex return: ex]]]
]

{ #category : #testing }
PtFilter >> internalIsError [
	^self internal isKindOf: Exception
]

{ #category : #writing }
PtFilter >> writePDFOn: aWriter indent: anInteger [
	self class name asPDF writePDFOn: aWriter indent: anInteger
]
