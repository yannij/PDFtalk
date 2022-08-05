"
PDF Contents stream as defined in PDF 32000_2008.pdf pp. 81.

Content streams are the primary means for describing the appearance of pages and other graphical elements.
A content stream depends on information contained in an associated resource dictionary; in combination, these two objects form a self-contained entity.
"
Class {
	#name : #PtContents,
	#superclass : #PDFStream,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtContents class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Contents
		supertype: #Stream
		section: '7.8'
		documentation: 'Content streams are the primary means for describing the appearance of pages and other graphical elements.
A content stream depends on information contained in an associated resource dictionary; in combination, these two objects form a self-contained entity.'
]
