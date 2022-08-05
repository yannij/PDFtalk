"
A zlib inflate stream with header and checksum used by PDF as defined in PDF 32000_2008.pdf pp. 25.
"
Class {
	#name : #PtFlateDecodeStream,
	#superclass : #InflateStream,
	#category : #'PDFtalk-Streams'
}

{ #category : #private }
PtFlateDecodeStream >> checkHeader [
	"do nothing - the library does it all for us"
]

{ #category : #private }
PtFlateDecodeStream >> windowBits [
	^interface MAX_WBITS
]
