"
PDF Function Dictionary as defined in PDF 32000_2008.pdf pp. 92.

PDF is not a programming language, and a PDF file is not a program.
However, PDF provides several types of function objects (PDF 1.2) that represent parameterized classes of functions, including mathematical formulas and sampled representations with arbitrary resolution.

"
Class {
	#name : #PtFunction,
	#superclass : #PtObjecttype,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtFunction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Function
		supertype: #Object
		version: #(1 2)
		section: '7.10.1'
		documentation: 'PDF is not a programming language, and a PDF file is not a program.
However, PDF provides several types of function objects that represent parameterized classes of functions, including mathematical formulas and sampled representations with arbitrary resolution.'
]
