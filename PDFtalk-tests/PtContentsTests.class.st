Class {
	#name : #PtContentsTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtContentsTests >> test [
	self assert: (PtContentParser onString: (PtPDF classAt: #Contents) example internal) readOperations size = 24.
	self assert: (PtContentParser onString: (PtPDF classAt: #Contents) example internal) readOperations first printString = '2 J'.
	self assert: ((PtContentParser onString: (PtPDF classAt: #Contents) example internal) readOperations first isKindOf: PtOperation).
	self assert: (PtContentParser onString: (PtPDF classAt: #Contents) example internal) readOperations first operands = (Array with: 2 asPDF)
]
