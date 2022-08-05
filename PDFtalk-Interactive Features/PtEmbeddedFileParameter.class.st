"
PDF embedded file parameter object as defined in PDF 32000_2008.pdf, section 7.11.4.1, p. 104.

An embedded file parameter dictionary that shall contain additional file-specific information
"
Class {
	#name : #PtEmbeddedFileParameter,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtEmbeddedFileParameter class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #EmbeddedFileParameter
		supertype: #Dictionary
		section: '7.11.4.1'
		documentation: 'An embedded file parameter dictionary that shall contain additional file-specific information'
]

{ #category : #'accessing entries' }
PtEmbeddedFileParameter >> CheckSum [
	<type: #String>
	<attribute: 5 documentation: 'A 16-byte string that is the checksum of the bytes of the uncompressed embedded file. The checksum shall be calculated by applying the standard MD5 message-digest algorithm (described in Internet RFC 1321, The MD5 Message-Digest Algorithm) to the bytes of the embedded file stream'>
	^self objectAt: #CheckSum ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEmbeddedFileParameter >> CreationDate [
	<type: #Date>
	<attribute: 2 documentation: 'The date and time when the embedded file was created'>
	^self objectAt: #CreationDate ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEmbeddedFileParameter >> Mac [
	<type: #MacOSFileInformation>
	<attribute: 4 documentation: 'A subdictionary containing additional information specific to Mac OS files'>
	^self objectAt: #Mac ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEmbeddedFileParameter >> ModDate [
	<type: #Date>
	<attribute: 3 documentation: 'The date and time when the embedded file was last modified'>
	^self objectAt: #ModDate ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEmbeddedFileParameter >> Size [
	<type: #Integer>
	<attribute: 1 documentation: 'The size of the uncompressed embedded file, in bytes'>
	^self objectAt: #Size ifAbsent: [0 asPDF]
]
