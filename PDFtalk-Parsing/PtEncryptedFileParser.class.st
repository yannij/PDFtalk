"
This parser reads PDF objects from an encrypted file.
"
Class {
	#name : #PtEncryptedFileParser,
	#superclass : #PtFileParser,
	#category : #'PDFtalk-Parsing'
}

{ #category : #testing }
PtEncryptedFileParser >> isForEncrypted [
	^true
]

{ #category : #'reading objects' }
PtEncryptedFileParser >> readStreamWith: anOrderedDictionary [
	| length |
	length := anOrderedDictionary at: #Length ifAbsent: [
		^PtReadError raiseSignal: 'The stream dictonary has no Length entry'].
	^PtPDF Stream
		on: anOrderedDictionary
		external: (self readStreamContents: length pdfObject asSmalltalkValue)
		encrypted: true
]

{ #category : #'reading objects' }
PtEncryptedFileParser >> readString [

	^PtPDF String fromEncryptedPdf: self readStringCharacters
]
