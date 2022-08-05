Extension { #name : #ByteWriteStream }

{ #category : #'*PDFtalk-Fonts OpenType-accessing' }
ByteWriteStream >> nextPutOpenTypeFixed: aNumber [
	self nextPutLong: (aNumber * 16r10000) rounded
]

{ #category : #'*PDFtalk-Fonts OpenType-accessing' }
ByteWriteStream >> nextPutOpenTypeFixedVersion: aNumber [
	self nextPutUnsignedShort: aNumber truncated.
	self nextPutUnsignedShort: ('16r' , (aNumber asFloat fractionPart printString allButFirst: 2)) asNumber rounded
]

{ #category : #'*PDFtalk-Fonts OpenType-accessing' }
ByteWriteStream >> nextPutOpenTypeLongDateTime: aTimestamp [
	self nextPutLongLong: aTimestamp asOpenTypeLongDateTime
]
