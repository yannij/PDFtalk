Class {
	#name : #PtMatrixTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtMatrixTests >> test [
	| a b |
	self assert: (PtPDF classAt: #Matrix) identity printString = '[1 0 0 1 0 0]'.
	self assert: (PtPDF classAt: #Matrix) empty printString = '[1 0 0 1 0 0]'.
	a := (PtPDF classAt: #Matrix) on: #(3 5 2 6 9 8).
	self assert: a printString = '[3 5 2 6 9 8]'.
	b := (PtPDF classAt: #Matrix) on: #(2 5 3 4 9 5).
	self assert: b printString = '[2 5 3 4 9 5]'.
	self assert: (a concatenatedWith: b) = ((PtPDF classAt: #Matrix) on: #(21 35 22 34 51 82)).
	self assert: ((PtPDF classAt: #Matrix) translation: 10 @ 26) printString = '[1 0 0 1 10 26]'.
	self assert: (((PtPDF classAt: #Matrix) translation: 10 @ 26) concatenatedWith: (PtPDF classAt: #Matrix) identity) printString = '[1 0 0 1 10 26]'.
	self assert: ((PtPDF classAt: #Matrix) identity concatenatedWith: ((PtPDF classAt: #Matrix) translation: 10 @ 26)) printString = '[1 0 0 1 10 26]'.
	self assert: (((PtPDF classAt: #Matrix) translation: 10 @ 26) concatenatedWith: ((PtPDF classAt: #Matrix) translation: 200 @ 300)) printString = '[1 0 0 1 210 326]'.
	self assert: ((PtPDF classAt: #Matrix) scaling: 10 @ 26) printString = '[10 0 0 26 0 0]'.
	self assert: (((PtPDF classAt: #Matrix) scaling: 10 @ 26) concatenatedWith: ((PtPDF classAt: #Matrix) scaling: 200 @ 300)) printString = '[2000 0 0 7800 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) xFrom: 10 @ 10 to: 200 @ 200) printString = '[190 190 -190 190 10 10]'.
	self assert: ((PtPDF classAt: #Matrix) rotation: 0) printString = '[1 0 0 1 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) rotation: 90 degreesToRadians) printString = '[0 1 -1 0 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) rotationDegrees: -90) printString = '[0 -1 1 0 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) rotationDegrees: 180) printString = '[-1 0 0 -1 0 0]'.
	self assert: (((PtPDF classAt: #Matrix) rotationDegrees: 90) concatenatedWith: ((PtPDF classAt: #Matrix) scaling: 20 @ 30)) printString = '[0 30 -20 0 0 0]'.
	self assert: (((PtPDF classAt: #Matrix) rotationDegrees: 90) scaledBy: 20 @ 30) printString = '[0 30 -20 0 0 0]'.
	self assert: (((PtPDF classAt: #Matrix) rotationDegrees: 90) concatenatedWith: ((PtPDF classAt: #Matrix) translation: 20 @ 30)) printString = '[0 1 -1 0 20 30]'.
	self assert: (((PtPDF classAt: #Matrix) rotationDegrees: 90) translatedBy: 20 @ 30) printString = '[0 1 -1 0 20 30]'.
	self assert: ((((PtPDF classAt: #Matrix) rotationDegrees: 90) scaledBy: 20 @ 30) translatedBy: 20 @ 30) printString = '[0 30 -20 0 20 30]'.
]

{ #category : #tests }
PtMatrixTests >> testFloats [
	self assert: ((PtPDF classAt: #Matrix) rotationDegrees: 45) printString = '[0.70711 0.70711 -0.70711 0.70711 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) rotationDegrees: 30) printString = '[0.86603 0.5 -0.5 0.86603 0 0]'.
	self assert: ((PtPDF classAt: #Matrix) rotationDegrees: 60) printString = '[0.5 0.86603 -0.86603 0.5 0 0]'.
]
