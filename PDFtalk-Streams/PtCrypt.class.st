"
PDF Filter as defined in PDF 32000_2008.pdf pp. 38.

Decrypts data encrypted by a security handler, reproducing the data as it was before encryption.
"
Class {
	#name : #PtCrypt,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtCrypt class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Crypt
		supertype: #Filter
		version: #(1 5)
		section: '7.4.10'
		documentation: 'Decrypts data encrypted by a security handler, reproducing the data as it was before encryption.'
]
