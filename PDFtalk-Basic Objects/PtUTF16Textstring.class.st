"
PDF Text String object as defined in PDF 32000_2008.pdf pp. 86.

For text strings encoded in Unicode, the first two bytes shall be 254 followed by 255.
These two bytes represent the Unicode byte order marker, U+FEFF, indicating that the string is encoded in the UTF-16BE (big-endian) encoding scheme specified in the Unicode standard.

The value should be shown with UTF-16BEEncoding
"
Class {
	#name : #PtUTF16Textstring,
	#superclass : #PtTextstring,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtUTF16Textstring class >> fromPdf: aByteString [
	"aByteString has the 2 UTF16 header bytes - strip them"

	^self content: (aByteString allButFirst: 2) asByteArray
]

{ #category : #converting }
PtUTF16Textstring >> asString [
	^ZnUTF16Encoder new decodeBytes: self content
]

{ #category : #writing }
PtUTF16Textstring >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutByte: $( asInteger;
		nextPutAll: self class utf16Header asByteArray;
		nextPutAll: self content;
		nextPutByte: $) asInteger
]
