Class {
	#name : #PtPDFObjectTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtPDFObjectTests >> testRectangleNormalization [
	| refRect |
	self assert: ((PtPDF classAt: #Rectangle) on: #(1 2 13 14)) printString = '[1 2 13 14]'.
	self assert: ((PtPDF classAt: #Rectangle) on: #(1 2 13 14)) normalized printString = '[1 2 13 14]'.
	self assert: ((PtPDF classAt: #Rectangle) on: #(13 14 1 2)) printString = '[13 14 1 2]'.
	self assert: ((PtPDF classAt: #Rectangle) on: #(13 14 1 2)) normalized printString = '[1 2 13 14]'.
	refRect := (PtPDF classAt: #Rectangle) on: (Array
		with: 1 asPDF newReference
		with: 2 asPDF newReference
		with: 13 asPDF newReference
		with: 14 asPDF newReference).
	self assert: refRect printString = '[0 0 R 0 0 R 0 0 R 0 0 R]'.
	self assert: (refRect content collect: #asSmalltalkValue) asSource = '#(1 2 13 14)'.
	refRect := (PtPDF classAt: #Rectangle) on: (Array
		with: 13 asPDF newReference
		with: 14 asPDF newReference
		with: 1 asPDF newReference
		with: 2 asPDF newReference).
	self assert: refRect printString = '[0 0 R 0 0 R 0 0 R 0 0 R]'.
	self assert: (refRect content collect: #asSmalltalkValue) asSource = '#(13 14 1 2)'.
	self assert: refRect normalized printString = '[0 0 R 0 0 R 0 0 R 0 0 R]'.
	self assert: (refRect normalized content collect: #asSmalltalkValue) asSource = '#(1 2 13 14)'
]
