"
PDF File Trailer as defined in PDF 32000_2008.pdf pp. 42.
"
Class {
	#name : #PtTrailer,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtTrailer class >> keys [
	"<SequenceableCollection of: String>
	possible keys of the Trailer dictionary"

	^#(#Size #Prev #Root #Encrypt #Info #ID #XRefStm)
]

{ #category : #accessing }
PtTrailer class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Trailer
		supertype: #Dictionary
		section: '7.5.5'
		documentation: 'The trailer of a PDF file enables a conforming reader to quickly find the cross-reference table and certain special objects. Conforming readers should read a PDF file from its end. The last line of the file shall contain only the end-of-file marker, %%EOF. The two preceding lines shall contain, one per line and in order, the keyword startxref and the byte offset in the decoded stream from the beginning of the file to the beginning of the xref keyword in the last cross-reference section. The startxref line shall be preceded by the trailer dictionary, consisting of the keyword trailer followed by a series of key-value pairs enclosed in double angle brackets (<<…>>) (using LESS-THAN SIGNs (3Ch) and GREATER-THAN SIGNs (3Eh)).'
]

{ #category : #'instance creation' }
PtTrailer class >> readWith: aFile from: aParser [
	"<Trailer>"

	aParser expectToken: #trailer.
	aParser expectToken: '<<'.
	^super readWith: aFile from: aParser
]

{ #category : #'accessing entries' }
PtTrailer >> Encrypt [
	<type: #Encryption>
	<version: 1 dot: 1>
	<attribute: 4 documentation: '(Required if document is encrypted)
The document’s encryption dictionary.'>
	^self objectAt: #Encrypt ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtTrailer >> ID [
	<type: #FileIdentifier>
	<requiredIf: #Encrypt>
	<version: 1 dot: 1>
	<attribute: 6 documentation: 'An array of two byte-strings constituting a file identifier for the file.
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
PtTrailer >> Info [
	<typeIndirect: #DocumentInformation>
	<attribute: 5 documentation: 'The document’s information dictionary.'>
	^self objectAt: #Info ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtTrailer >> Prev [
	<typeDirect: #Integer>
	<attribute: 2 documentation: '(Present only if the file has more than one cross-reference section)
The byte offset in the decoded stream from the beginning of the file to the beginning of the previous cross-reference section.

*** there is a typo in the spec, I think: according to the spec the value should be indirect ***'>
	^self objectAt: #Prev ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtTrailer >> Root [
	<typeIndirect: #Catalog>
	<required>
	<attribute: 3 documentation: 'The catalog dictionary for the PDF document contained in the file.'>
	^self objectAt: #Root
]

{ #category : #'accessing entries' }
PtTrailer >> Size [
	<typeDirect: #Integer>
	<required>
	<attribute: 1 documentation: 'The total number of entries in the file’s cross-reference table, as defined by the combination of the original section and all update sections.
Equivalently, this value shall be 1 greater than the highest object number defined in the file.
Any object in a cross-reference section whose number is greater than this value shall be ignored and defined to be missing by a conforming reader.'>
	^self objectAt: #Size
]

{ #category : #'accessing entries' }
PtTrailer >> XRefStm [
	<type: #Integer>
	<attribute: 7 documentation: 'The byte offset in the decoded stream from the beginning of the file of a cross-reference stream.'>
	<version: 1 dot: 5>
	^self objectAt: #XRefStm ifAbsent: [nil]
]

{ #category : #writing }
PtTrailer >> addFileIdentifierWithFile: aFilenameString andSize: anInteger id: previousFileIdentifierOrNil [
	(self hashForFilename: aFilenameString andSize: anInteger) ifNotNil: [:hashString |
		| previousID |
		previousID := previousFileIdentifierOrNil ifNotNil: [:id | id permanentID].
		self
			at: #ID
			put: ((PtPDF classAt: #FileIdentifier) on: (Array
				with: (previousID ifNil: [
					hashString])
				with: hashString))]
]

{ #category : #tracing }
PtTrailer >> allReferencesDo: oneArgumentBlock [
	"executes oneArgumentBlock with all unique reachable references"

	self tracedReferences: IdentitySet new do: oneArgumentBlock
]

{ #category : #accessing }
PtTrailer >> firstPage [
	"<Page>"

	^self Root firstPage
]

{ #category : #writing }
PtTrailer >> hashForFilename: aFilenameString andSize: filesizeSoFar [
	"<PDF.String | nil>"

	| wst |
	self Info CreationDate ifNil: [
		^nil].
	wst := PtWriter new.
	self Info CreationDate writePDFOn: wst indent: 0.
	wst cr.
	aFilenameString asPDF writePDFOn: wst indent: 0.
	wst
		cr;
		nextPutAll: filesizeSoFar printString asByteArray;
		cr.
	self Info writePDFOn: wst indent: 0.
	^PtPDF String content: (self md5HashOf: wst contents)
]

{ #category : #writing }
PtTrailer >> md5HashOf: aByteString [
	"<ByteArray[16]>"
	
	^MD5 hash: aByteString
]

{ #category : #printing }
PtTrailer >> printOn: aStream [
	aStream
		nextPutAll: self class name asString;
		nextPutAll: ' << ';
		nextPutAll: self size printString;
		nextPutAll: ' >>'
]
