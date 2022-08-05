"
PDF Filter as defined in PDF 32000_2008.pdf pp. 35.

Decompresses data encoded using the wavelet-based JPEG2000 standard, reproducing the original image data.
"
Class {
	#name : #PtJPXDecode,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtJPXDecode class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #JPXDecode
		supertype: #Filter
		version: #(1 5)
		section: '7.4.9'
		documentation: 'The JPXDecode filter decodes data that has been encoded using the JPEG2000 compression method, an ISO standard for the compression and packaging of image data.'
]
