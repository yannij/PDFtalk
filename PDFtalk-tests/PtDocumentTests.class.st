Class {
	#name : #PtDocumentTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtDocumentTests >> testAddPDFRaws [
	| doc bytes docNew |
	doc := PtDocument new.
	doc appendAllRawPagesFrom: PtFile example.
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleByteArray2 readStream).
	doc appendAllRawPagesFrom: PtFile exampleHelloWorld.
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleMinimalByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleMinimalByteArrayWithFreeReference readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleObjectStreamByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleUpdate1ByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleUpdate2ByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleUpdate3ByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleUpdate4ByteArray readStream).
	doc appendAllRawPagesFrom: (PtFile readFrom: PtFile exampleWithReferenceToReference readStream).
	doc appendAllRawPagesFrom: PtFile exampleWithTypeMismatch.
	self should: [doc root pages] raise: MessageNotUnderstood.
	self assert: ((doc root at: #Pages) pdfObject at: #Count) = 12 asPDF.
	bytes := doc bytesForFile: 'test.pdf'.
	docNew := PtFile readFrom: bytes readStream.
	self assert: docNew root pages size = 12.
	self assert: docNew root Pages Count = 12 asPDF.
]

{ #category : #tests }
PtDocumentTests >> testAddPDFs [
	| doc bytes docNew docDouble |
	doc := PtDocument new.
	doc appendAllPagesFrom: PtFile example.
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleByteArray2 readStream).
	doc appendAllPagesFrom: PtFile exampleHelloWorld.
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleMinimalByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleMinimalByteArrayWithFreeReference readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleObjectStreamByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleUpdate1ByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleUpdate2ByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleUpdate3ByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleUpdate4ByteArray readStream).
	doc appendAllPagesFrom: (PtFile readFrom: PtFile exampleWithReferenceToReference readStream).
	doc appendAllPagesFrom: PtFile exampleWithTypeMismatch.
	self assert: doc root pages size = 12.
	self assert: doc root Pages Count = 12 asPDF.
	bytes := doc bytesForFile: 'test.pdf'.
	docNew := PtFile readFrom: bytes readStream.
	self assert: docNew root pages size = 12.
	self assert: docNew root Pages Count = 12 asPDF.
	docDouble := PtDocument new.
	docDouble appendAllPagesFrom: (PtFile readFrom: bytes readStream).
	docDouble appendAllPagesFrom: (PtFile readFrom: bytes readStream).
	self assert: docDouble root pages size = 24.
	self assert: docDouble root Pages Count = 24 asPDF.
]

{ #category : #tests }
PtDocumentTests >> testAppendPages [
	| doc |
	doc := PtDocument new.
	doc appendPages: (PtFile example root at: #Pages).
	self assert: doc root Pages class = (PtPDF classAt: #Pages).
	self assert: doc root Pages Kids size = 1.
	self assert: doc root Pages Kids first class = (PtPDF classAt: #Pages).
	self assert: doc root Pages Kids first Kids size = 1.
	doc appendPages: (PtFile exampleHelloWorld root at: #Pages).
	self assert: doc root Pages Kids size = 2.
	self assert: doc root Pages Kids first class = (PtPDF classAt: #Pages).
	self assert: doc root Pages Kids last class = (PtPDF classAt: #Pages).
	self assert: doc root Pages Kids first Kids size = 1.
	self assert: doc root Pages Kids first Kids first class = PtPDF Page.
	self assert: doc root Pages Kids last Kids size = 1.
	self assert: doc root Pages Kids last Kids first class = PtPDF Page
]

{ #category : #tests }
PtDocumentTests >> testAppendRawPages [
	| doc file1 file2 |
	doc := PtDocument new.
	file1 := PtFile example.
	(file1 root at: #Pages) readAllRawObjects.
	doc appendRawPages: (file1 root at: #Pages).
	self assert: doc root Pages class = PtPDF Dictionary.
	self assert: (doc root Pages at: #Kids) size = 1.
	self assert: ((doc root Pages at: #Kids) first at: #Type) = #Pages asPDF.
	self assert: (doc root Pages at: #Kids) first class = PtPDF Dictionary.
	self assert: ((doc root Pages at: #Kids) first at: #Kids) size = 1.
	self assert: (((doc root Pages at: #Kids) first at: #Kids) first at: #Type) = #Page asPDF.
	self assert: ((doc root Pages at: #Kids) first at: #Kids) first class = PtPDF Dictionary.
	file2 := PtFile exampleHelloWorld.
	(file2 root at: #Pages) readAllRawObjects.
	doc appendRawPages: (file2 root at: #Pages).
	self assert: doc root Pages class = PtPDF Dictionary.
	self assert: (doc root Pages at: #Kids) size = 2.
	self assert: ((doc root Pages at: #Kids) first at: #Type) = #Pages asPDF.
	self assert: (doc root Pages at: #Kids) first class = PtPDF Dictionary.
	self assert: ((doc root Pages at: #Kids) last at: #Type) = #Pages asPDF.
	self assert: (doc root Pages at: #Kids) last class = PtPDF Dictionary.
	self assert: ((doc root Pages at: #Kids) first at: #Kids) size = 1.
	self assert: (((doc root Pages at: #Kids) first at: #Kids) first at: #Type) = #Page asPDF.
	self assert: ((doc root Pages at: #Kids) first at: #Kids) first class = PtPDF Dictionary.
	self assert: ((doc root Pages at: #Kids) last at: #Kids) size = 1.
	self assert: (((doc root Pages at: #Kids) last at: #Kids) first at: #Type) = #Page asPDF.
	self assert: ((doc root Pages at: #Kids) last at: #Kids) first class = PtPDF Dictionary
]

{ #category : #tests }
PtDocumentTests >> testVersionUpdate [
	| doc |
	doc := PtDocument new.
	self assert: doc version isNil.
	self assert: (doc updateVersion: PtVersion pdf1_4) = PtVersion pdf1_4.
	self assert: doc version = PtVersion pdf1_4.
	self assert: (doc updateVersion: PtVersion pdf1_7) = PtVersion pdf1_7.
	self assert: doc version = PtVersion pdf1_7.
	self assert: (doc updateVersion: PtVersion pdf1_3) = PtVersion pdf1_7.
	self assert: doc version = PtVersion pdf1_7.
]
