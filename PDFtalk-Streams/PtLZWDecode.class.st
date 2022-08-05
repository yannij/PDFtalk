"
PDF Filter as defined in PDF 32000_2008.pdf pp. 25.

Decompresses data encoded using the LZW (Lempel-Ziv-Welch) adaptive compression method, reproducing the original text or binary data.

This filter is depreciated and not (initially implemented).
"
Class {
	#name : #PtLZWDecode,
	#superclass : #PtZipFilter,
	#instVars : [
		'earlyChange'
	],
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtLZWDecode class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #LZWDecode
		supertype: #Filter
		section: '7.4.4'
		documentation: 'Decompresses data encoded using the LZW (Lempel-Ziv-Welch) adaptive compression method, reproducing the original text or binary data.

This filter is depreciated and not (initially implemented).'
]

{ #category : #filtering }
PtLZWDecode >> compressed: aByteString [
	^self notYetImplemented
]

{ #category : #filtering }
PtLZWDecode >> decompressed: aByteString [
	^self notYetImplemented
]

{ #category : #accessing }
PtLZWDecode >> earlyChange [
	"<Integer>
	An indication of when to increase the code length.
	If the value of this entry is 0, code length increases shall be postponed as long as possible.
	If the value is 1, code length increases shall occur one code early.
	This parameter is included because LZW sample code distributed by some vendors increases the code length one code earlier than necessary.
	Default value: 1."

	^earlyChange ifNil: [1]
]

{ #category : #'initialize-release' }
PtLZWDecode >> initializeParameters: aDecodeParms [
	super initializeParameters: aDecodeParms.
	earlyChange := (aDecodeParms at: #EarlyChange ifAbsent: [nil]) value
]
