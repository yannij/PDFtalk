"
PDF Filter as defined in PDF 32000_2008.pdf pp. 29.

Decompresses data encoded using a byte-oriented run-length encoding algorithm, reproducing the original text or binary data
(typically monochrome image data, or any data that contains frequent long runs of a single byte value).
"
Class {
	#name : #PtRunLengthDecode,
	#superclass : #PtFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtRunLengthDecode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #RunLengthDecode
		supertype: #Filter
		section: '7.4.5'
		documentation: 'Decompresses data encoded using a byte-oriented run-length encoding algorithm, reproducing the original text or binary data (typically monochrome image data, or any data that contains frequent long runs of a single byte value).'
]
