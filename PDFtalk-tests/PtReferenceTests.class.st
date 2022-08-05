Class {
	#name : #PtReferenceTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtReferenceTests >> testMinimalFile [
	| file |
	file := PtFile readFrom: PtFile exampleMinimalByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer = ((PtPDF classAt: #Trailer) on: (Valuemap
		with: #Size -> 7
		with: #Root -> (file referenceAt: (PtObjectId number: 1)))).
	self assert: (file trailer content at: #Root) = (file referenceAt: (PtObjectId number: 1)).
	self assert: (file trailer content at: #Root) isResolved not.
	self assert: (file trailer content at: #Root) content = ((PtPDF classAt: #Catalog) on: (Valuemap
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3)))).
	self assert: (file trailer content at: #Root) isResolved.
	self assert: (file trailer content at: #Root) pdfObject = ((PtPDF classAt: #Catalog) on: (Valuemap
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3)))).
	self assert: file trailer Size = 7 asPDF.
	self assert: file trailer Size pdfObject = 7 asPDF.
	self assert: (file crossReferenceAtId: (file referenceAt: (PtObjectId number: 1))) = (PtUsedReference id: (PtObjectId number: 1) value: 9).
	self assert: (file referenceAt: (PtObjectId number: 1)) = (file referenceAt: (PtObjectId number: 1)).
	self assert: (file referenceAt: (PtObjectId number: 1)) baseObject = ((PtPDF classAt: #Catalog)
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3))).
	self assert: (file referenceAt: (PtObjectId number: 1)) referent = ((PtPDF classAt: #Catalog)
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3)))
]

{ #category : #tests }
PtReferenceTests >> testMissingObject [
	| file object doc bytes newFile outlines |
	file := PtFile readFrom: PtFile exampleMinimalByteArrayWithFreeReference readStream.
	self assert: (file trailer content at: #Root) pdfObject = ((PtPDF classAt: #Catalog) on: (Valuemap
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3)))).
	self assert: (file crossReferenceAtId: (file referenceAt: (PtObjectId number: 1))) = (PtUsedReference id: (PtObjectId number: 1) value: 9).
	self assert: (file referenceAt: (PtObjectId number: 1)) = (file referenceAt: (PtObjectId number: 1)).
	self should: [(file referenceAt: (PtObjectId number: 2)) baseObject] raise: PtFileError.
	object := [(file referenceAt: (PtObjectId number: 2)) baseObject] on: PtFileError do: [:ex |
		ex resume].
	self assert: object printString = 'MissingObject(2 0/!Outlines)'.
	self assert: object myObject = (PtObjectId number: 2).
	self assert: object types = (Array with: (PtDirectType onSymbol: #Outlines)).
	doc := file asDocument.
	bytes := doc bytesForFile: 'test.pdf'.
	newFile := PtFile readFrom: bytes readStream.
	outlines := [newFile root Outlines] on: PtTypeError do: [:ex | ex resume].
	self assert: outlines printString = 'TypeMismatch(AsciiString/!Outlines)'.
	self assert: outlines myObject printString = '(The original object is missing. It should have been a !Outlines)'
]

{ #category : #tests }
PtReferenceTests >> testReferences [
	| file |
	file := PtFile readFrom: PtFile exampleWithReferenceToReference readStream.
	self assert: (file referenceAt: (PtObjectId number: 7)) isResolved not.
	self should: [(file referenceAt: (PtObjectId number: 7)) referent] raise: PtTypeError.
	[(file referenceAt: (PtObjectId number: 7)) referent] on: PtTypeError do: [:ex |
		self assert: ex description = 'References to References are not permitted.']
]
