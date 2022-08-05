"
Paired advance width and left side bearing values for a glyph.
"
Class {
	#name : #PtOTHorMetric,
	#superclass : #Value,
	#instVars : [
		'advanceWidth',
		'lsb'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #'instance creation' }
PtOTHorMetric class >> advanceWidth: advanceWidthInteger lsb: lsbInteger [
	| inst |
	inst := self new.
	inst initializeAdvanceWidth: advanceWidthInteger lsb: lsbInteger.
	^inst
]

{ #category : #specification }
PtOTHorMetric class >> localSpecification [
	<constant: #advanceWidth class: #Integer>
	<constant: #lsb class: #Integer>
]

{ #category : #accessing }
PtOTHorMetric >> advanceWidth [
	"<Integer>"

	^advanceWidth
]

{ #category : #'initialize-release' }
PtOTHorMetric >> initializeAdvanceWidth: advanceWidthInteger lsb: lsbInteger [
	advanceWidth := advanceWidthInteger.
	lsb := lsbInteger.
	self beImmutable
]

{ #category : #accessing }
PtOTHorMetric >> lsb [
	"<Integer>"

	^lsb
]

{ #category : #printing }
PtOTHorMetric >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'advanceWidth' value: self advanceWidth).
	args add: (printer constant: 'lsb' value: self lsb).
	^printer printvalue: self arguments: args
]
