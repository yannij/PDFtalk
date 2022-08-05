"
PDF File Identifier as defined in PDF 32000_2008.pdf, section 14.4, pp. 551.

PDF files may contain references to other PDF files. 
Simply storing a file name, however, even in a platform-independent format, does not guarantee that the file can be found.
Even if the file still exists and its name has not been changed, different server software applications may identify it in different ways.
Servers running on DOS platforms convert all file names to 8 characters and a 3-character extension.
Different servers may use different strategies for converting longer file names to this format.

External file references may be made more reliable by including a file identifier (PDF 1.1) in the file and using it in addition to the normal platform-based file designation.
Matching the identifier in the file reference with the one in the file confirms whether the correct file was found.

File identifiers shall be defined by the optional ID entry in a PDF file’s trailer dictionary (see Trailer).
The ID entry is optional but should be used.
The value of this entry shall be an array of two byte strings.
The first byte string shall be a permanent identifier based on the contents of the file at the time it was originally created and shall not change when the file is incrementally updated.
The second byte string shall be a changing identifier based on the file’s contents at the time it was last updated.
When a file is first written, both identifiers shall be set to the same value.
If both identifiers match when a file reference is resolved, it is very likely that the correct and unchanged file has been found.
If only the first identifier matches, a different version of the correct file has been found.

To help ensure the uniqueness of file identifiers, they should be computed by means of a message digest algorithm such as MD5, using the following information:
	• The current time
	• A string representation of the file’s location, usually a pathname
	• The size of the file in bytes
	• The values of all entries in the file’s document information dictionary

NOTE
The calculation of the file identifier need not be reproducible; all that matters is that the identifier is likely to be unique.
For example, two implementations of the preceding algorithm might use different formats for the current time, causing them to produce different file identifiers for the same file created at the same time, but the uniqueness of the identifier is not affected.

"
Class {
	#name : #PtFileIdentifier,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtFileIdentifier class >> numberOfAttributes [
	^2
]

{ #category : #accessing }
PtFileIdentifier class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FileIdentifier
		supertype: #Object
		version: #(1 1)
		section: '14.4'
		documentation: '
PDF files may contain references to other PDF files. 
Simply storing a file name, however, even in a platform-independent format, does not guarantee that the file can be found.
Even if the file still exists and its name has not been changed, different server software applications may identify it in different ways.
Servers running on DOS platforms convert all file names to 8 characters and a 3-character extension.
Different servers may use different strategies for converting longer file names to this format.

External file references may be made more reliable by including a file identifier (PDF 1.1) in the file and using it in addition to the normal platform-based file designation.
Matching the identifier in the file reference with the one in the file confirms whether the correct file was found.

File identifiers shall be defined by the optional ID entry in a PDF file’s trailer dictionary (see Trailer).
The ID entry is optional but should be used.
The value of this entry shall be an array of two byte strings.
The first byte string shall be a permanent identifier based on the contents of the file at the time it was originally created and shall not change when the file is incrementally updated.
The second byte string shall be a changing identifier based on the file’s contents at the time it was last updated.
When a file is first written, both identifiers shall be set to the same value.
If both identifiers match when a file reference is resolved, it is very likely that the correct and unchanged file has been found.
If only the first identifier matches, a different version of the correct file has been found.

To help ensure the uniqueness of file identifiers, they should be computed by means of a message digest algorithm such as MD5, using the following information:
	• The current time
	• A string representation of the file’s location, usually a pathname
	• The size of the file in bytes
	• The values of all entries in the file’s document information dictionary

NOTE
The calculation of the file identifier need not be reproducible; all that matters is that the identifier is likely to be unique.
For example, two implementations of the preceding algorithm might use different formats for the current time, causing them to produce different file identifiers for the same file created at the same time, but the uniqueness of the identifier is not affected.
'
]

{ #category : #'accessing entries' }
PtFileIdentifier >> changingID [
	<type: #String>
	<required>
	<attribute: 2 documentation: 'The second byte string shall be a changing identifier based on the file’s contents at the time it was last updated'>
	^self objectAt: 2
]

{ #category : #'accessing entries' }
PtFileIdentifier >> permanentID [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'The first byte string shall be a permanent identifier based on the contents of the file at the time it was originally created and shall not change when the file is incrementally updated'>
	^self objectAt: 1
]

{ #category : #writing }
PtFileIdentifier >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutByte: $[ asInteger;
		tab.
	self content do: [:element | aWriter nextPutHexString: element] separatedBy: [
		aWriter cr.
		anInteger + 1 timesRepeat: [aWriter tab]].
	aWriter nextPutByte: $] asInteger
]
