"
Format 2 differs from format 1 only in the size of the nLeft field in each range.
This format is most suitable for fonts with a large well-ordered charset — for example, for Asian CIDFonts.
"
Class {
	#name : #CFFCharset2,
	#superclass : #CFFCharset1,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFCharset2 class >> nLeftFrom: aByteStream [
	^(ByteReadStream bigEndianOn: (aByteStream next: 2)) nextUnsignedShort
]
