"
PDF String object as defined in PDF 32000_2008.pdf pp. 15.

The value of a String is a ByteArray where each byte represents one character (2 byte per character for UTF16Textstring) in a specific encoding (if any).
The encodings are specific to the subclasses:
- ASCII 				for AsciiString
- PDFDocEncoding 	for Textstring
- UTF-16BE			for UTF16Textstring
- specified			for EncodedString

The class String is abstract and is used as interface. All conversions are done automatically.

The bytes are written as they are (with escaping non-ASCII characters) to the PDF source and read from it.
The methods #pdfSource and (class)#fromPdf: are used for writing and reading.

When Strings are created programatically, the characters have to be encoded in a specific way and the encoding has to be remembered for later reencoding.
Creation of a String should be done with: (class)#on:encoded: with a Smalltalk ByteString and an encoding. An error is signalled when the string cannot be encoded.
For direct creation, use (class)#value: with a ByteArray

To get a Smalltalk String from a PDF.String, use #asString.

In a Contents stream, strings exist only in text object with a specific font. The interpretation of Strings uses the encoding of the selected font.

Strings can be represented as Bytestring (in ()) or as hexadecimal string (in <>).
"
Class {
	#name : #PDFString,
	#superclass : #PtNativeValue,
	#instVars : [
		'encrypted'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PDFString class >> asPDFEndOfLines: aByteString [
	"<PDF.String>
	replace EOL to LF"

	| rst wst |
	rst := aByteString readStream.
	wst := String new writeStream.
	[rst atEnd] whileFalse: [
		| char |
		char := rst next.
		char == Character cr ifTrue: [
			char := rst peek == Character lf
				ifTrue: [rst next]
				ifFalse: [Character lf]].
		wst nextPut: char].
	^wst contents
]

{ #category : #'instance creation optional' }
PDFString class >> content: contentValue [
	^self content: contentValue encrypted: nil
]

{ #category : #'instance creation' }
PDFString class >> content: contentValue encrypted: encryptedBoolean [
	| inst |
	inst := self new.
	inst initializeContent: contentValue encrypted: encryptedBoolean.
	^inst
]

{ #category : #'instance creation' }
PDFString class >> fromEncryptedPdf: aByteString [
	"<PDF.String>
	aByteString is an uninterpreted encrypted string of bytes"

	^PtPDF String content: aByteString asByteArray encrypted: true
]

{ #category : #'instance creation' }
PDFString class >> fromPdf: aString [
	"<PDFString | PDFDate>
	called from the parser after escaped octals are converted to bytes.
	aByteString is an uninterpreted string of bytes"

	| string |
	(self isDateString: aString) ifTrue: [
		^(PtPDF classAt: #Date) fromPdf: aString].
	(aString size >= 2 and: [
	(aString first: 2) = self utf16Header]) ifTrue: [
			| text |
			text := PtUTF16Textstring fromPdf: aString.
			^(self isDateString: text asString)
				ifTrue: [
				(PtPDF classAt: #Date) fromPdf: text asString]
				ifFalse: [
				text]].
	string := self asPDFEndOfLines: aString.
	(string allSatisfy: #isAscii) ifTrue: [
		^(PtPDF classAt: #AsciiString) content: string asByteArray].
	^(PtPDF classAt: #EncodedString) string: string
]

{ #category : #testing }
PDFString class >> isDateString: aSmalltalkString [
	"<Boolean>"

	^aSmalltalkString size >= 6 and: [
	(aSmalltalkString first: 2) = 'D:' and: [
	(aSmalltalkString copyFrom: 3 to: 6) allSatisfy: #isDigit]]
]

{ #category : #specification }
PDFString class >> localSpecification [
	<optional: #encrypted class: #Boolean default: 'false' comment: 'true, iff the string is encrypted'>
]

{ #category : #'implementation limits' }
PDFString class >> maxSize [
	"Maximum length of a string, in bytes.
This restriction applies only to strings in content streams.
There is no effective restriction on other strings in PDF files."

	^nil
]

{ #category : #'instance creation' }
PDFString class >> newFrom: aPDFObject [

	^self content: aPDFObject content encrypted: aPDFObject encrypted
]

{ #category : #accessing }
PDFString class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #String
		supertype: #Object
		section: '7.3.4'
		documentation: 'A string object shall consist of a series of zero or more bytes. String objects are not integer objects, but are stored in a more compact format.'
]

{ #category : #accessing }
PDFString class >> utf16Header [
	^String
		with: 254 asCharacter
		with: 255 asCharacter
]

{ #category : #converting }
PDFString >> asByteArray [
	"<ByteArray>"

	^self content
]

{ #category : #converting }
PDFString >> asSmalltalkValue [
	^self asString
]

{ #category : #converting }
PDFString >> asString [
	"<ByteString>
	the equivalent Smalltalk string"

	^self content asString
]

{ #category : #accessing }
PDFString >> encrypted [
	"<Boolean>
	true, iff the string is encrypted"

	^encrypted ifNil: [false]
]

{ #category : #'initialize-release' }
PDFString >> initializeContent: contentValue encrypted: encryptedBoolean [
	content := contentValue.
	(encryptedBoolean notNil and: [
	self encrypted ~= encryptedBoolean]) ifTrue: [
			encrypted := encryptedBoolean].
	self beImmutable
]

{ #category : #testing }
PDFString >> isEmpty [
	^super isEmpty or: [
	self content isEmpty]
]

{ #category : #accessing }
PDFString >> numberOfSpaces [
	"<Integer>"

	^(self asString select: [:c | c codePoint = 32]) size
]

{ #category : #writing }
PDFString >> pdfHexSource [
	"<String>
	the object as PDF source"

	| wst |
	wst := PtWriter new.
	wst nextPutHexString: self.
	^wst contents asString
]

{ #category : #printing }
PDFString >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'content' value: self content).
	args add: (printer optional: 'encrypted' value: encrypted).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PDFString >> size [
	^self content size
]

{ #category : #writing }
PDFString >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutString: self
]
