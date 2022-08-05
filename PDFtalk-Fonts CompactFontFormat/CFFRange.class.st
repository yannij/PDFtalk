"
A Range encodes consecutive numbers.

For example, the codes 51 52 53 54 55 could be represented by the Range: 51 4, and a perfectly ordered encoding of 256 codes can be described with the Range: 0 255.
"
Class {
	#name : #CFFRange,
	#superclass : #Value,
	#instVars : [
		'first',
		'nLeft'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFRange class >> first: firstSmallInteger nLeft: nLeftSmallInteger [
	| inst |
	inst := self new.
	inst initializeFirst: firstSmallInteger nLeft: nLeftSmallInteger.
	^inst
]

{ #category : #specification }
CFFRange class >> localSpecification [
	<constant: #first class: #SmallInteger>
	<constant: #nLeft class: #SmallInteger>
]

{ #category : #accessing }
CFFRange >> first [
	"<SmallInteger>"

	^first
]

{ #category : #'initialize-release' }
CFFRange >> initializeFirst: firstSmallInteger nLeft: nLeftSmallInteger [
	first := firstSmallInteger.
	nLeft := nLeftSmallInteger.
	self beImmutable
]

{ #category : #accessing }
CFFRange >> nLeft [
	"<SmallInteger>"

	^nLeft
]

{ #category : #printing }
CFFRange >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'first' value: self first).
	args add: (printer constant: 'nLeft' value: self nLeft).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFRange >> values [
	"<Array of: Number>"

	^(self first to: self first + self nLeft) asArray
]
