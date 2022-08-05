"
6. Header, pp.11

The binary data begins with a header
"
Class {
	#name : #CFFHeader,
	#superclass : #Value,
	#instVars : [
		'major',
		'minor',
		'hdrSize',
		'offSize'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFHeader class >> fromBytes: aByteStream [
	^self
		major: aByteStream next
		minor: aByteStream next
		hdrSize: aByteStream next
		offSize: aByteStream next
]

{ #category : #specification }
CFFHeader class >> localSpecification [
	<constant: #major class: #Integer comment: 'Card8. Format major version (starting at 1)'>
	<constant: #minor class: #Integer comment: 'Card8. Format minor version (starting at 0)'>
	<constant: #hdrSize class: #Integer comment: 'Card8. Header size (bytes)'>
	<constant: #offSize class: #Integer comment: 'OffSize. Absolute offset (0) size'>
]

{ #category : #'instance creation' }
CFFHeader class >> major: majorInteger minor: minorInteger hdrSize: hdrSizeInteger offSize: offSizeInteger [
	| inst |
	inst := self new.
	inst
		initializeMajor: majorInteger
		minor: minorInteger
		hdrSize: hdrSizeInteger
		offSize: offSizeInteger.
	^inst
]

{ #category : #accessing }
CFFHeader >> hdrSize [
	"<Integer>
	Card8. Header size (bytes)"

	^hdrSize
]

{ #category : #'initialize-release' }
CFFHeader >> initializeMajor: majorInteger minor: minorInteger hdrSize: hdrSizeInteger offSize: offSizeInteger [
	major := majorInteger.
	minor := minorInteger.
	hdrSize := hdrSizeInteger.
	offSize := offSizeInteger.
	self beImmutable
]

{ #category : #accessing }
CFFHeader >> major [
	"<Integer>
	Card8. Format major version (starting at 1)"

	^major
]

{ #category : #accessing }
CFFHeader >> minor [
	"<Integer>
	Card8. Format minor version (starting at 0)"

	^minor
]

{ #category : #accessing }
CFFHeader >> offSize [
	"<Integer>
	OffSize. Absolute offset (0) size"

	^offSize
]

{ #category : #printing }
CFFHeader >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'major' value: self major).
	args add: (printer constant: 'minor' value: self minor).
	args add: (printer constant: 'hdrSize' value: self hdrSize).
	args add: (printer constant: 'offSize' value: self offSize).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFHeader >> version [
	"<Float>"

	^self major + (self minor / 10)
]
