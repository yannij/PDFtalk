Extension { #name : #PtInlineImage }

{ #category : #'*PDFtalk-Images-converting' }
PtInlineImage >> imageXObject [
	"<ImageXObject>"

	| dict bytes rst |
	dict := Valuemap new.
	rst := (self operations at: 2) operands readStream.
	[rst atEnd] whileFalse: [
		dict at: (self keyForAbbreviation: rst next) put: (self valueForAbbreviation: rst next)].
	"should check for forbidden keys and values"
	dict at: #Type put: #XObject.
	dict at: #Subtype put: #Image.
	bytes := ByteArray withAll: self operations last operands first asSmalltalkValue.
	^PtImageXObject on: dict externalBytes: bytes
]
