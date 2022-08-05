"
PDF Shading Pattern as defined in PDF 32000_2008.pdf, section 8.7.4, pp. 181

Shading patterns (PDF 1.3) provide a smooth transition between colours across an area to be painted, independent of the resolution of any particular output device and without specifying the number of steps in the colour transition. Patterns of this type shall be described by pattern dictionaries with a pattern type of 2.
"
Class {
	#name : #PtShading,
	#superclass : #PtObjecttype,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtShading class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Shading
		supertype: #Object
		version: #(1 3)
		section: '8.7.4'
		documentation: 'Shading patterns (PDF 1.3) provide a smooth transition between colours across an area to be painted, independent of the resolution of any particular output device and without specifying the number of steps in the colour transition. Patterns of this type shall be described by pattern dictionaries with a pattern type of 2.'
]
