"
PDF Encryption as defined in PDF 32000_2008.pdf pp. 55.

A PDF document can be encrypted to protect its contents from unauthorized access.
Encryption applies to all strings and streams in the document's PDF file, with the following exceptions:
	• The values for the ID entry in the trailer
	• Any strings in an Encrypt dictionary
	• Any strings that are inside streams such as content streams and compressed object streams, which themselves are encrypted

Encryption is not applied to other object types such as integers and boolean values, which are used primarily to convey information about the document's structure rather than its contents.
Leaving these values unencrypted allows random access to the objects within a document, whereas encrypting the strings and streams protects the document's contents.

When a PDF stream object refers to an external file, the stream’s contents shall not be encrypted, since they are not part of the PDF file itself.
However, if the contents of the stream are embedded within the PDF file, they shall be encrypted like any other stream in the file.
Beginning with PDF 1.5, embedded files can be encrypted in an otherwise unencrypted document.

Encryption-related information shall be stored in a document’s encryption dictionary, which shall be the value of the Encrypt entry in the document’s trailer dictionary.
The absence of this entry from the trailer dictionary means that a conforming reader shall consider the document to be not encrypted.
"
Class {
	#name : #PtEncryption,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtEncryption class >> on: aDictionary [
	(aDictionary at: #Filter) = #Standard asPDF ifTrue: [
		^(PtPDF classAt: #StandardEncryption) content: aDictionary].
	^self content: aDictionary
]

{ #category : #accessing }
PtEncryption class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Encryption
		supertype: #Dictionary
		version: #(1 1)
		section: '7.6'
		documentation: 'A PDF document can be encrypted to protect its contents from unauthorized access.
Encryption applies to all strings and streams in the documents PDF file, with the following exceptions:
	• The values for the ID entry in the trailer
	• Any strings in an Encrypt dictionary
	• Any strings that are inside streams such as content streams and compressed object streams, which themselves are encrypted

Encryption is not applied to other object types such as integers and boolean values, which are used primarily to convey information about the documents structure rather than its contents.
Leaving these values unencrypted allows random access to the objects within a document, whereas encrypting the strings and streams protects the documents contents.

When a PDF stream object refers to an external file, the stream’s contents shall not be encrypted, since they are not part of the PDF file itself.
However, if the contents of the stream are embedded within the PDF file, they shall be encrypted like any other stream in the file.
Beginning with PDF 1.5, embedded files can be encrypted in an otherwise unencrypted document.

Encryption-related information shall be stored in a document’s encryption dictionary, which shall be the value of the Encrypt entry in the document’s trailer dictionary.
The absence of this entry from the trailer dictionary means that a conforming reader shall consider the document to be not encrypted.'
]

{ #category : #'accessing entries' }
PtEncryption >> CF [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 5 documentation: '(meaningful only when the value of V is 4)
A dictionary whose keys shall be crypt filter names and whose values shall be the corresponding crypt filter dictionaries.
Every crypt filter used in the document shall have an entry in this dictionary, except for the standard crypt filter names.

The conforming reader shall ignore entries in CF dictionary with the keys equal to those listed in Table 26 and use properties of the respective standard crypt filters.'>
	^self objectAt: #CF ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtEncryption >> EFF [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 8 documentation: '(meaningful only when the value of V is 4)
The name of the crypt filter that shall be used when encrypting embedded file streams that do not have their own crypt filter specifier; it shall correspond to a key in the CFdictionary or a standard crypt filter name.

This entry shall be provided by the security handler.
Conforming writers shall respect this value when encrypting embedded files, except for embedded file streams that have their own crypt filter specifier.
If this entry is not present, and the embedded file stream does not contain a crypt filter specifier, the stream shall be encrypted using the default stream crypt filter specified by StmF.'>
	^self objectAt: #EFF ifAbsent: [#Identity asPDF]
]

{ #category : #'accessing entries' }
PtEncryption >> Filter [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The name of the preferred security handler for this document.
It shall be the name of the security handler that was used to encrypt the document.
If SubFilter is not present, only this security handler shall be used when opening the document.
If it is present, a conforming reader can use any security handler that implements the format specified by SubFilter.

Standard shall be the name of the built-in password-based security handler.
Names for other security handlers may be registered.'>
	^self objectAt: #Filter
]

{ #category : #'accessing entries' }
PtEncryption >> Length [
	<type: #Integer>
	<version: 1 dot: 4>
	<attribute: 4 documentation: 'The length of the encryption key, in bits.
The value shall be a multiple of 8, in the range 40 to 128.
Default value: 40.'>
	^self objectAt: #Length ifAbsent: [40 asPDF]
]

{ #category : #'accessing entries' }
PtEncryption >> StmF [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 6 documentation: '(meaningful only when the value of V is 4)
The name of the crypt filter that shall be used by default when decrypting streams.
The name shall be a key in the CF dictionary or a standard crypt filter name.
All streams in the document, except for cross-reference streams or streams that have a Crypt entry in their Filterarray, shall be decrypted by the security handler, using this crypt filter.
Default value: Identity.'>
	^self objectAt: #StmF ifAbsent: [#Identity asPDF]
]

{ #category : #'accessing entries' }
PtEncryption >> StrF [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 7 documentation: '(meaningful only when the value of V is 4)
The name of the crypt filter that shall be used when decrypting all strings in the document.
The name shall be a key in the CF dictionary or a standard crypt filter name.
Default value: Identity.'>
	^self objectAt: #StrF ifAbsent: [#Identity asPDF]
]

{ #category : #'accessing entries' }
PtEncryption >> SubFilter [
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 2 documentation: 'A name that completely specifies the format and interpretation of the contents of the encryption dictionary.
It allows security handlers other than the one specified by Filter to decrypt the document.
If this entry is absent, other security handlers shall not decrypt the document.
NOTE
This entry was introduced in PDF 1.3 to support the use of public-key cryptography in PDF files;
however, it was not incorporated into the PDF Reference until the fourth edition (PDF 1.5).'>
	^self objectAt: #SubFilter ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEncryption >> V [
	<type: #Integer>
	<version: 1 dot: 4 ifValue: 2>
	<version: 1 dot: 4 ifValue: 3>
	<version: 1 dot: 5 ifValue: 4>
	<attribute: 3 documentation: 'A code specifying the algorithm to be used in encrypting and decrypting the document:
	0	An algorithm that is undocumented. This value shall not be used.
	1	"Algorithm 1: Encryption of data using the RC4 or AES algorithms" in 7.6.2, "General Encryption Algorithm," with an encryption key length of 40 bits.
	2	(PDF 1.4) "Algorithm 1: Encryption of data using the RC4 or AES algorithms"in 7.6.2, "General Encryption Algorithm," but permitting encryption key lengths greater than 40 bits.
	3	(PDF 1.4) An unpublished algorithm that permits encryption key lengths ranging from 40 to 128 bits. This value shall not appear in a conforming PDF file.
	4	(PDF 1.5) The security handler defines the use of encryption and decryption in the document, using the rules specified by the CF, StmF, and StrF entries.
The default value if this entry is omitted shall be 0, but when present should be a value of 1 or greater.'>
	^self objectAt: #V ifAbsent: [0 asPDF]
]
