"
PDF Filter as defined in PDF 32000_2008.pdf pp. 30.

Decompresses data encoded using the CCITT facsimile standard, reproducing the original data (typically monochrome image data at 1 bit per pixel).
"
Class {
	#name : #PtCCITTFaxDecode,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtCCITTFaxDecode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #CCITTFaxDecode
		supertype: #Filter
		section: '7.4.6'
		documentation: 'Decompresses data encoded using the CCITT facsimile standard, reproducing the original data (typically monochrome image data at 1 bit per pixel).'
]
