Class {
	#name : #PtLibraryTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtLibraryTests >> testVersion [
	self assert: PtPDF libraryVersionString = '2.5'
]
