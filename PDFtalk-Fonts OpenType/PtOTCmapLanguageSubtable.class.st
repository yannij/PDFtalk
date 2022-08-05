"
A cmap Subtable with a language id
"
Class {
	#name : #PtOTCmapLanguageSubtable,
	#superclass : #PtOTCmapSubtable,
	#instVars : [
		'language'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #specification }
PtOTCmapLanguageSubtable class >> localSpecification [
	<constant: #language class: #Integer comment: 'Please see “Note on the language field in ''cmap'' subtables“ in this document'>
]

{ #category : #'instance creation' }
PtOTCmapLanguageSubtable class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger.
	^inst
]

{ #category : #'initialize-release' }
PtOTCmapLanguageSubtable >> initializePlatform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger [
	platform := platformInteger.
	encoding := encodingInteger.
	contents := contentsByteArray.
	language := languageInteger.
	self beImmutable
]

{ #category : #accessing }
PtOTCmapLanguageSubtable >> language [
	"<Integer>
	Please see “Note on the language field in 'cmap' subtables“ in this document"

	^language
]

{ #category : #printing }
PtOTCmapLanguageSubtable >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'platform' value: self platform).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'contents' value: self contents).
	args add: (printer constant: 'language' value: self language).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
PtOTCmapLanguageSubtable >> readFrom: bytes at: offset [
	"Type  	Name  	Description
USHORT 	format 	Format number is set to 0.
USHORT 	length 	This is the length in bytes of the subtable.
USHORT 	language 	Please see “Note on the language field in 'cmap' subtables“ in this document."

	| aLength aLanguage uBytes |
	uBytes := ByteReadStream bigEndianOn: (bytes copyFrom: offset + 1 to: offset + 6).
	uBytes nextUnsignedShort = self formatNumber ifFalse: [
		^self error: 'wrong format'].
	aLength := uBytes nextUnsignedShort.
	aLanguage := uBytes nextUnsignedShort.
	^self class
		platform: self platform
		encoding: self encoding
		contents: (bytes copyFrom: offset + 1 to: offset + aLength)
		language: aLanguage
]
