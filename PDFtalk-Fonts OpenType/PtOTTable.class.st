"
holds the contents of just one tabel of an OpenType font

"
Class {
	#name : #PtOTTable,
	#superclass : #Object,
	#instVars : [
		'tag',
		'contents',
		'file'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #'instance creation' }
PtOTTable class >> newFor: aOpenTypeFile from: aReadStream [
	| bytes tagString pos |
	tagString := (aReadStream next: 4) asString.
	bytes := ByteReadStream bigEndianOn: (aReadStream next: 12).
	bytes nextUnsignedLong.	"UNUSED:	checkSum"
	pos := aReadStream position.
	^[
	aReadStream position: bytes nextUnsignedLong.
	(self subclassFor: tagString)
		tag: tagString
		file: aOpenTypeFile
		contents: (aReadStream next: bytes nextUnsignedLong)] ensure: [
			aReadStream position: pos]
]

{ #category : #accessing }
PtOTTable class >> platformID [
	"0  	Unicode
	1 	Macintosh
	2 	ISO [deprecated]
	3 	Windows
	4 	Custom"

	^(#(#unix #mac #ignore #win32 #ignore) indexOf: OSHandle currentOS) - 1
]

{ #category : #'instance creation' }
PtOTTable class >> subclassFor: tagString [
	^self subclasses detect: [:cl | cl tag = tagString] ifNone: [self]
]

{ #category : #accessing }
PtOTTable class >> tag [
	"<ByteString4>"

	^self subclassResponsibility
]

{ #category : #'instance creation optional' }
PtOTTable class >> tag: tagString [
	| inst |
	inst := self new.
	inst initializeTag: tagString file: nil contents: nil.
	^inst
]

{ #category : #'instance creation' }
PtOTTable class >> tag: tagString file: aOpenTypeFile contents: contentsByteArray [
	| inst |
	inst := self new.
	inst initializeTag: tagString file: aOpenTypeFile contents: contentsByteArray.
	^inst
]

{ #category : #accessing }
PtOTTable >> bytes [
	^ByteReadStream bigEndianOn: self contents
]

{ #category : #accessing }
PtOTTable >> contents [
	"<ByteArray>"

	^contents ifNil: [#[]]
]

{ #category : #accessing }
PtOTTable >> file [
	"<OpenType.File>"

	^file
]

{ #category : #'initialize-release' }
PtOTTable >> initializeTag: tagString file: aOpenTypeFile contents: contentsByteArray [
	tag := tagString.
	file := aOpenTypeFile.
	contents := contentsByteArray
]

{ #category : #accessing }
PtOTTable >> platformID [
	^self class platformID
]

{ #category : #printing }
PtOTTable >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'tag' value: self tag).
	args add: (printer optional: 'contents' value: contents).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTTable >> tag [
	"<String> (ULONG)
	4 -byte identifier.
	ULONG interpreted as ASCII characters"

	^tag
]
