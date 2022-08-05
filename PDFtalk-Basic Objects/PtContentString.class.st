"
PDF String in a stream as defined in PDF 32000_2008.pdf pp. 650.

Strings in contents streams have the implementation limit of 32767 bytes
"
Class {
	#name : #PtContentString,
	#superclass : #PDFString,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtContentString class >> content: aByteArray encrypted: encryptedBoolean [
	aByteArray size <= self maxSize ifTrue: [
		^super content: aByteArray encrypted: encryptedBoolean].
	^PtError raiseSignal: 'the string is too big for PDF strings in content streams'
]

{ #category : #'implementation limits' }
PtContentString class >> maxSize [
	"Maximum length of a string, in bytes.
This restriction applies only to strings in content streams.
There is no effective restriction on other strings in PDF files."

	^32767
]
