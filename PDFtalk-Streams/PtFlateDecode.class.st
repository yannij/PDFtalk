"
PDF Filter as defined in PDF 32000_2008.pdf pp. 25.

Decompresses data encoded using the zlib/deflate compression method, reproducing the original text or binary data.
"
Class {
	#name : #PtFlateDecode,
	#superclass : #PtZipFilter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtFlateDecode class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FlateDecode
		supertype: #Filter
		version: #(1 2)
		section: '7.4.4'
		documentation: 'Decompresses data encoded using the zlib/deflate compression method, reproducing the original text or binary data.'
]

{ #category : #filtering }
PtFlateDecode >> compressed: aByteString [
	"<ByteString>"

	^(self compressedBytes: aByteString asByteArray) asString
]

{ #category : #filtering }
PtFlateDecode >> compressedBytes: aByteArray [
	"<ByteArray>"

	| wst |
	wst := (aByteArray class new: aByteArray size * 3) writeStream.
	(PtFlateEncodeStream bestCompressionOn: wst)
		nextPutAll: aByteArray;
		close.
	^wst contents
]

{ #category : #filtering }
PtFlateDecode >> decompressed: aByteString [
	"<ByteString>"

	^(self decompressedBytes: aByteString asByteArray) asString
]

{ #category : #filtering }
PtFlateDecode >> decompressedBytes: aByteArray [
	"<ByteArray>"

	^(PtFlateDecodeStream on: aByteArray) contents
]

{ #category : #accessing }
PtFlateDecode >> minPdfVersion [
	^PtVersion pdf1_2
]
