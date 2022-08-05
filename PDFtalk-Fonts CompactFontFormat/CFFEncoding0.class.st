"
Encoding Format 0

Each element of the code array represents the encoding for the corresponding glyph.
This format should be used when the codes are in a fairly random order.
"
Class {
	#name : #CFFEncoding0,
	#superclass : #CFFEncoding,
	#instVars : [
		'codes',
		'supplement'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation optional' }
CFFEncoding0 class >> codes: codesArray [
	| inst |
	inst := self new.
	inst initializeCodes: codesArray supplement: nil.
	^inst
]

{ #category : #'instance creation' }
CFFEncoding0 class >> codes: codesArray supplement: supplementEncodingSupplement [
	| inst |
	inst := self new.
	inst initializeCodes: codesArray supplement: supplementEncodingSupplement.
	^inst
]

{ #category : #'instance creation' }
CFFEncoding0 class >> fromBytes: aByteStream [
	| formatByte hasSupplement nCodes codes |
	formatByte := aByteStream next.
	hasSupplement := (formatByte bitAnd: 16r80) isZero not.
	nCodes := aByteStream next.
	codes := aByteStream next: nCodes.
	hasSupplement ifFalse: [
		^self codes: codes].
	^self codes: codes supplement: (CFFEncodingSupplement fromBytes: aByteStream)
]

{ #category : #specification }
CFFEncoding0 class >> localSpecification [
	<sequence: #codes>
	<optional: #supplement class: #CFFEncodingSupplement default: 'EncodingSupplement new'>
]

{ #category : #'instance creation optional' }
CFFEncoding0 class >> supplement: supplementEncodingSupplement [
	| inst |
	inst := self new.
	inst initializeCodes: nil supplement: supplementEncodingSupplement.
	^inst
]

{ #category : #accessing }
CFFEncoding0 >> codes [
	"<Array>"

	^codes ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFEncoding0 >> initializeCodes: codesArray supplement: supplementEncodingSupplement [
	(codesArray notNil and: [
	codesArray notEmpty]) ifTrue: [
			codes := (Array withAll: codesArray) beImmutable].
	(supplementEncodingSupplement notNil and: [
	self supplement ~= supplementEncodingSupplement]) ifTrue: [
			supplement := supplementEncodingSupplement].
	self beImmutable
]

{ #category : #printing }
CFFEncoding0 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'codes' value: self codes).
	args add: (printer optional: 'supplement' value: supplement).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFEncoding0 >> supplement [
	"<EncodingSupplement>"

	^supplement ifNil: [CFFEncodingSupplement new]
]
