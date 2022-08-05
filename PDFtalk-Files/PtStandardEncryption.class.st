"
PDF Standard Encryption as defined in PDF 32000_2008.pdf pp. 60.

PDF’s standard security handler shall allow access permissions and up to two passwords to be specified for a document: an owner password and a user password.
An application’s decision to encrypt a document shall be based on whether the user creating the document specifies any passwords or access restrictions.
"
Class {
	#name : #PtStandardEncryption,
	#superclass : #PtEncryption,
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtStandardEncryption class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #StandardEncryption
		supertype: #Dictionary
		version: #(1 1)
		section: '7.6.3.2'
		documentation: 'PDF’s standard security handler shall allow access permissions and up to two passwords to be specified for a document: an owner password and a user password.
An application’s decision to encrypt a document shall be based on whether the user creating the document specifies any passwords or access restrictions.'
]

{ #category : #'accessing entries' }
PtStandardEncryption >> EncryptMetadata [
	<type: #Boolean>
	<version: 1 dot: 5>
	<attribute: 5 documentation: '(meaningful only when the value of V is 4)
Indicates whether the document-level metadata stream shall be encrypted.
Conforming products should respect this value.
Default value: true.'>
	^self objectAt: #EncryptMetadata ifAbsent: [true]
]

{ #category : #'accessing entries' }
PtStandardEncryption >> O [
	<typeDirect: #String>
	<required>
	<attribute: 2 documentation: 'A 32-byte string, based on both the owner and user passwords, that shall be used in computing the encryption key and in determining whether a valid owner password was entered.'>
	^self objectAt: #O
]

{ #category : #'accessing entries' }
PtStandardEncryption >> P [
	<type: #Integer>
	<required>
	<attribute: 4 documentation: 'A set of flags specifying which operations shall be permitted when the document is opened with user access.'>
	^self objectAt: #P
]

{ #category : #'accessing entries' }
PtStandardEncryption >> R [
	<type: #Number>
	<required>
	<attribute: 1 documentation: 'A number specifying which revision of the standard security handler shall be used to interpret this dictionary:
	2	if the document is encrypted with a V value less than 2 and does not have any of the access permissions set to 0 (by means of the P entry, below) that are designated “Security handlers of revision 3 or greater”
	3	if the document is encrypted with a V value of 2 or 3, or has any “Security handlers of revision 3 or greater” access permissions set to 0
	4	if the document is encrypted with a V value of 4'>
	^self objectAt: #R
]

{ #category : #'accessing entries' }
PtStandardEncryption >> U [
	<typeDirect: #String>
	<required>
	<attribute: 3 documentation: 'A 32-byte string, based on the user password, that shall be used in determining whether to prompt the user for a password and, if so, whether a valid user or owner password was entered.'>
	^self objectAt: #U
]
