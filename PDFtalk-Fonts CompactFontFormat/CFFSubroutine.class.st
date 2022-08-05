"
Both Type 1 and Type 2 charstrings support the notion of subroutines or subrs.
A subr is typically a sequence of charstring bytes representing a sub-program that occurs in more than one place in a font’s charstring data.
This subr may be stored once but referenced many times from within one or more charstrings by the use of the callsubr operator whose operand is the number of the subr to be called.
The subrs are local to a particular font and cannot be shared between fonts.
Type 2 charstrings also permit global subrs which function in the same way but are called by the callgsubr operator and may be shared across fonts.
"
Class {
	#name : #CFFSubroutine,
	#superclass : #Value,
	#instVars : [
		'bytes'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFSubroutine class >> bytes: bytesArray [
	| inst |
	inst := self new.
	inst initializeBytes: bytesArray.
	^inst
]

{ #category : #specification }
CFFSubroutine class >> localSpecification [
	<sequence: #bytes>
]

{ #category : #accessing }
CFFSubroutine >> bytes [
	"<Array>"

	^bytes ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFSubroutine >> initializeBytes: bytesArray [
	(bytesArray notNil and: [
	bytesArray notEmpty]) ifTrue: [
			bytes := (Array withAll: bytesArray) beImmutable].
	self beImmutable
]

{ #category : #printing }
CFFSubroutine >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'bytes' value: self bytes).
	^printer printvalue: self arguments: args
]
