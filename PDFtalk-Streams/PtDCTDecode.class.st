"
PDF Filter as defined in PDF 32000_2008.pdf pp. 34.

Decompresses data encoded using a DCT (discrete cosine transform) technique based on the JPEG standard, reproducing image sample data that approximates the original data.
"
Class {
	#name : #PtDCTDecode,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtDCTDecode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #DCTDecode
		supertype: #Filter
		section: '7.4.8'
		documentation: 'Decompresses data encoded using a DCT (discrete cosine transform) technique based on the JPEG standard, reproducing image sample data that approximates the original data.'
]
