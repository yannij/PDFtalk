"
A byte string with a specific encoder
"
Class {
	#name : #PtEncodedString,
	#superclass : #PDFString,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #accessing }
PtEncodedString class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #EncodedString
		supertype: #String
		section: '7.9.2.4'
		documentation: 'The byte string type shall be used for binary data that shall be represented as a series of bytes, where each byte may be any value representable in 8 bits. Byte string type is a subtype of string type.

NOTE The string may represent characters but the encoding is not known. The bytes of the string may not represent characters.'
]

{ #category : #'instance creation' }
PtEncodedString class >> string: aString [
	| wst encoder |
	wst := ByteArray new writeStream.
	encoder := PtPDF winAnsiEncoder.
	aString do: [:char |
		| code |
		code := encoder encode: char.
		code = Character illegalCode
			ifTrue: [
			char asInteger < 256 ifTrue: [
				wst nextPut: char asInteger]]
			ifFalse: [
			wst nextPut: code]].
	^self content: wst contents
]

{ #category : #converting }
PtEncodedString >> asString [
	| wst encoder |
	wst := String new writeStream.
	encoder := PtPDF winAnsiEncoder.
	self content do: [:code | wst nextPut: (encoder decode: code)].
	^wst contents
]
