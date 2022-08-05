"
Encoders user by the PDF Parser.

Inspired by VW StreamEncoder
"
Class {
	#name : #PDFEncoder,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #'instance creation' }
PDFEncoder class >> asEncoder [
	^self new
]

{ #category : #encoding }
PDFEncoder class >> decoded: aString [
	"<ByteString>"

	^self new decoded: aString
]

{ #category : #encoding }
PDFEncoder class >> encoded: aString [
	"<ByteArray>"

	^self new encoded: aString
]

{ #category : #reading }
PDFEncoder >> decoded: aString [
	"<ByteString>"

	| wst |
	stream := aString readStream.
	wst := String new writeStream.
	[stream atEnd] whileFalse: [
		self nextCharacter ifNotNil: [:character | wst nextPut: character]].
	^wst contents
]

{ #category : #writing }
PDFEncoder >> encoded: aString [
	"<ByteArray>"

	self setupWriteStreamFor: aString.
	aString do: [:character | self nextPutCharacter: character].
	^stream contents
]

{ #category : #reading }
PDFEncoder >> integerFrom: aString radix: anInteger [
	"<Integer>"

	^Integer readFrom: aString base: anInteger
]

{ #category : #reading }
PDFEncoder >> nextCharacter [
	"<Character | nil>
	read a string character from aStream.
	Answer the equivalent PDF character"

	self subclassResponsibility
]

{ #category : #writing }
PDFEncoder >> nextPut: aCharacter [
	"Encode aCharacter and write it to the stream."

	self subclassResponsibility
]

{ #category : #writing }
PDFEncoder >> nextPutCharacter: aCharacter [
	aCharacter == Character cr ifTrue: [
		^self nextPut: Character lf].
	self nextPut: aCharacter
]

{ #category : #writing }
PDFEncoder >> setupWriteStreamFor: aString [
	stream := ByteArray new writeStream
]
