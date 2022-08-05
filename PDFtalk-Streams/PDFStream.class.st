"
PDF Stream object as defined in PDF 32000_2008.pdf pp. 19.
"
Class {
	#name : #PDFStream,
	#superclass : #PDFDictionary,
	#instVars : [
		'filter',
		'internal',
		'external',
		'encrypted'
	],
	#category : #'PDFtalk-Streams'
}

{ #category : #testing }
PDFStream class >> isClassForDictionary: aDictionary [
	^false
]

{ #category : #testing }
PDFStream class >> isClassForStream: aStream [
	^true
]

{ #category : #'instance creation' }
PDFStream class >> newFrom: aPDFObject [

	^self
		on: aPDFObject content
		external: aPDFObject external
		encrypted: aPDFObject encrypted
]

{ #category : #'instance creation' }
PDFStream class >> on: anOrderedDictionary external: externalByteString [
	^self on: anOrderedDictionary external: externalByteString encrypted: false
]

{ #category : #'instance creation' }
PDFStream class >> on: anOrderedDictionary external: externalByteString encrypted: encryptedBoolean [
	| inst |
	inst := self new.
	inst
		initializeContent: anOrderedDictionary
		external: externalByteString
		encrypted: encryptedBoolean.
	^inst
]

{ #category : #'instance creation' }
PDFStream class >> on: anOrderedDictionary externalBytes: externalByteArray [
	^self on: anOrderedDictionary external: externalByteArray asString encrypted: false
]

{ #category : #'instance creation' }
PDFStream class >> on: anOrderedDictionary internal: internalByteString [
	^self on: anOrderedDictionary internal: internalByteString encrypted: false
]

{ #category : #'instance creation' }
PDFStream class >> on: anOrderedDictionary internal: internalByteString encrypted: encryptedBoolean [
	| inst |
	inst := self new.
	inst
		initializeContent: anOrderedDictionary
		internal: internalByteString
		encrypted: encryptedBoolean.
	^inst
]

{ #category : #accessing }
PDFStream class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Stream
		supertype: #Object
		section: '7.3.8'
		documentation: 'A stream object, like a string object, is a sequence of bytes.
Furthermore, a stream may be of unlimited length, whereas a string shall be subject to an implementation limit.
For this reason, objects with potentially large amounts of data, such as images and page descriptions, shall be represented as streams.'
]

{ #category : #comparing }
PDFStream >> = anObject [
	^super = anObject and: [
	self internal = anObject internal and: [
	self external = anObject external]]
]

{ #category : #'accessing entries' }
PDFStream >> DL [
	<type: #Integer>
	<version: 1 dot: 5>
	<attribute: 7 documentation: 'A non-negative integer representing the number of bytes in the decoded (defiltered) stream.
It can be used to determine, for example, whether enough disk space is available to write a stream to a file.
This value shall be considered a hint only; for some stream filters, it may not be possible to determine this value precisely.'>
	^self objectAt: #DL ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PDFStream >> DecodeParms [
	<type: #ZipFilterParameter>
	<type: #Array>
	<attribute: 3 documentation: 'A parameter dictionary or an array of such dictionaries, used by the filters specified by Filter.
If there is only one filter and that filter has parameters, DecodeParms shall be set to the filter’s parameter dictionary unless all the filter’s parameters have their default values, in which case the DecodeParms entry may be omitted.
If there are multiple filters and any of the filters has parameters set to nondefault values, DecodeParms shall be an array with one entry for each filter: either the parameter dictionary for that filter, or the null object if that filter has no parameters (or if all of its parameters have their default values).
If none of the filters have parameters, or if all their parameters have default values, the DecodeParms entry may be omitted.'>
	^self objectAt: #DecodeParms ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PDFStream >> F [
	"<#fileSpecification | nil>"

	<type: #String>
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 4 documentation: 'The file containing the stream data.
If this entry is present, the bytes between stream and endstreamshall be ignored.
However, the Length entry should still specify the number of those bytes (usually, there are no bytes and Length is 0).
The filters that are applied to the file data shall be specified by FFilter and the filter parameters shall be specified by FDecodeParms.'>
	^self objectAt: #F ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PDFStream >> FDecodeParms [
	<type: #Dictionary>
	<typeArrayOf: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 6 documentation: 'A parameter dictionary, or an array of such dictionaries, used by the filters specified by FFilter.
The same rules apply as for DecodeParms.'>
	^self objectAt: #FDecodeParms ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PDFStream >> FFilter [
	<type: #Name>
	<typeArrayOf: #Name>
	<version: 1 dot: 2>
	<attribute: 5 documentation: 'The name of a filter to be applied in processing the data found in the stream’s external file, or an array of zero, one or several such names.
The same rules apply as for Filter.'>
	^self objectAt: #FFilter ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PDFStream >> Filter [
	<type: #Name>
	<typeArrayOf: #Name>
	<attribute: 2 documentation: 'The name of a filter that shall be applied in processing the stream data found between the keywords stream and endstream, or an array of zero, one or several names.
Multiple filters shall be specified in the order in which they are to be applied.'>
	^self objectAt: #Filter ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PDFStream >> Length [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of bytes from the beginning of the line following the keyword stream to the last byte just before the keyword endstream.
(There may be an additional EOL marker, preceding endstream, that is not included in the count and is not logically part of the stream data.)'>
	^self objectAt: #Length
]

{ #category : #accessing }
PDFStream >> addFilter: aSymbol [
	"Filters are added in front as the outer filter.
		aStream addFilter: #FlateDecode.
		aStream addFilter: #ASCIIHexDecode.
	result in [/ASCIIHexDecode /FlateDecode].
	This encodes the internal contents first with /FlateDecode followed by /ASCIIHexDecode to produce the external representation.
	Decoding first applies /ASCIIHexDecode and on the result /FlateDecode to yield the unfiltered internal contents."

	| oldFilter |
	(self hasKey: #Filter) ifFalse: [
		^self filter: aSymbol].
	oldFilter := (self at: #Filter) asSmalltalkValue.
	oldFilter isSymbol ifTrue: [
		^self filter: (Array
			with: aSymbol
			with: oldFilter)].
	self filter: (Array with: aSymbol) , oldFilter
]

{ #category : #converting }
PDFStream >> asByteArray [
	"<ByteArray>"

	^self internal asByteArray
]

{ #category : #converting }
PDFStream >> asDictionary [
	"<Dictionary>
	plain Dictionary without the stream"

	| dict |
	dict := PtPDF Dictionary new.
	self keysAndValuesDo: [:key :value | dict at: key put: value].
	^dict
]

{ #category : #testing }
PDFStream >> canBeExemplarOf: aType [
	^aType implementingClass isClassForStream: self
]

{ #category : #accessing }
PDFStream >> contents: internalByteString [
	internal := internalByteString.
	self resetExternal
]

{ #category : #copying }
PDFStream >> copy [
	^self class on: self content internal: self internal
]

{ #category : #tracing }
PDFStream >> copyWithNewReferencesIn: visited [
	| newDict |
	newDict := Valuemap new: self size.
	self content keysAndValuesDo: [:key :pdfObject |
		newDict at: key put: (pdfObject copyWithNewReferencesIn: visited)].
	^self class on: newDict external: self external encrypted: self encrypted
]

{ #category : #accessing }
PDFStream >> encrypted [
	"<Boolean>
	true, iff the string is encrypted"

	^encrypted ifNil: [false]
]

{ #category : #accessing }
PDFStream >> external [
	"<ByteString>
	the internal decoded contents"

	^external ifNil: [internal ifNotNil: [external := self externalValue]]
]

{ #category : #accessing }
PDFStream >> externalValue [
	"<ByteString>"

	self filter isEmpty ifTrue: [
		^self internal].
	^self filter first external
]

{ #category : #accessing }
PDFStream >> filter [
	"<SequenceableCollection of: Filter>"

	^filter ifNil: [
		filter := internal ifNil: [self newFiltersFromExternal] ifNotNil: [
			self newFiltersFromInternal]]
]

{ #category : #accessing }
PDFStream >> filter: aSymbolOrArrayOfSymbol [
	self at: #Filter put: aSymbolOrArrayOfSymbol.
	internal ifNotNil: [self resetExternal]
]

{ #category : #accessing }
PDFStream >> filterClasses [
	^self filterNames collect: [:filterName |
		((PtPDF typeAt: #Filter) subtypes detect: [:type | type name = filterName asSmalltalkValue]) implementingClass]
]

{ #category : #accessing }
PDFStream >> filterNames [
	"<Array of: Name>"

	| filterAttr |
	filterAttr := self Filter.
	(filterAttr isKindOf: PtPDF Array) ifTrue: [
		^filterAttr content].
	^Array with: filterAttr
]

{ #category : #comparing }
PDFStream >> hash [
	^super hash bitXor: (self internal hash bitXor: self external hash)
]

{ #category : #'initialize-release' }
PDFStream >> initializeContent: anOrderedDictionary external: externalByteString encrypted: encryptedBoolean [
	self initializeContent: anOrderedDictionary.
	internal := nil.
	external := externalByteString.
	encrypted := encryptedBoolean.
	self at: #Length put: self external size
]

{ #category : #'initialize-release' }
PDFStream >> initializeContent: anOrderedDictionary internal: internalByteString encrypted: encryptedBoolean [
	self initializeContent: anOrderedDictionary.
	internal := internalByteString.
	external := nil.
	encrypted := encryptedBoolean.
	self at: #Length put: self external size
]

{ #category : #accessing }
PDFStream >> internal [
	"<ByteString>
	the internal decoded contents"

	^internal ifNil: [external ifNotNil: [internal := self internalValue]]
]

{ #category : #accessing }
PDFStream >> internalValue [
	"<ByteString | PDF.Error>"

	self encrypted ifTrue: [
		^'*** Encrypted ***'].
	self filter isEmpty ifTrue: [
		^self external].
	^self filter last internal
]

{ #category : #accessing }
PDFStream >> newFiltersFromExternal [
	| filterClasses decodeParams decodeParamsReadStream filters |
	filterClasses := self filterClasses.
	filterClasses isEmpty ifTrue: [
		^#()].
	filterClasses size = 1 ifTrue: [
		^Array with: (filterClasses first external: self external with: self DecodeParms)].
	decodeParams := self objectAt: #DecodeParms ifAbsent: [
		(Array new: filterClasses size withAll: nil) asPDF].
	decodeParamsReadStream := (decodeParams content collect: #pdfObject) readStream.
	filters := OrderedCollection new.
	filterClasses inject: self external into: [:input :filterClass |
		| aFilter |
		aFilter := filterClass external: input with: decodeParamsReadStream next.
		filters add: aFilter.
		aFilter internal].
	^filters
]

{ #category : #accessing }
PDFStream >> newFiltersFromInternal [
	| filters |
	filters := OrderedCollection new.
	self filterClasses reverse inject: self internal into: [:input :filterClass |
		| aFilter |
		aFilter := filterClass internal: input with: self DecodeParms.
		filters add: aFilter.
		[aFilter external] on: PtError do: [:ex |
			^filters reverse]].
	^filters reverse
]

{ #category : #accessing }
PDFStream >> readStream [
	"<ReadStream on: Byte>"

	^self asByteArray readStream
]

{ #category : #'initialize-release' }
PDFStream >> resetExternal [
	"internal has changed. Force external to be recomputed"

	external := nil.
	filter := nil.
	self at: #Length put: self external size
]

{ #category : #accessing }
PDFStream >> topClassLevel [
	^4
]

{ #category : #writing }
PDFStream >> writePDFOn: aWriter indent: anInteger [
	super writePDFOn: aWriter indent: anInteger.
	aWriter
		cr;
		nextPutAll: 'stream' asByteArray;
		cr;
		nextPutAll: (self external asByteArray ifNil: [ByteArray new]);
		cr;
		nextPutAll: 'endstream' asByteArray
]
