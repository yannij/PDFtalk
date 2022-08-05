"
a Mapping is the superclass of several unrelated but similar structures used for mapping
"
Class {
	#name : #CFFMapping,
	#superclass : #Value,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFMapping class >> sidFrom: aByteStream [
	"<Number>
	0 – 64999
	2-byte string identifier"

	^(ByteReadStream bigEndianOn: (aByteStream next: 2)) nextUnsignedShort
]
