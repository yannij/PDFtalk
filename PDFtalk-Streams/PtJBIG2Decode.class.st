"
PDF Filter as defined in PDF 32000_2008.pdf pp. 31.

Decompresses data encoded using the JBIG2 standard, reproducing the original monochrome (1 bit per pixel) image data (or an approximation of that data).
"
Class {
	#name : #PtJBIG2Decode,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtJBIG2Decode class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #JBIG2Decode
		supertype: #Filter
		version: #(1 4)
		section: '7.4.7'
		documentation: 'Decompresses data encoded using the JBIG2 standard, reproducing the original monochrome (1 bit per pixel) image data (or an approximation of that data).'
]
