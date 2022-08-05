"
Any object which can appear in a PDF file.

Such entity can be read by or with a PDF reader and
can be written to a PDF writer.

The sister hierarchy for immutable PDF objects is PdfValue.

"
Class {
	#name : #PtEntity,
	#superclass : #Object,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #printing }
PtEntity >> printOn: aStream [
	aStream nextPutAll: self pdfSource
]
