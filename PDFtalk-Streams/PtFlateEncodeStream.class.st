"
A simple zlib deflate stream without header or checksum used by PDF as defined in PDF 32000_2008.pdf pp. 25.
"
Class {
	#name : #PtFlateEncodeStream,
	#superclass : #DeflateStream,
	#category : #'PDFtalk-Streams'
}

{ #category : #private }
PtFlateEncodeStream >> finishOutput [
	"do nothing - the library does it all for us"
]

{ #category : #private }
PtFlateEncodeStream >> windowBits [
	^interface MAX_WBITS
]

{ #category : #private }
PtFlateEncodeStream >> writeHeader [
	"do nothing - the library does it all for us"
]
