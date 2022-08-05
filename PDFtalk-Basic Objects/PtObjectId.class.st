"
The ID of an indirect object

Consists of a number and a generation
"
Class {
	#name : #PtObjectId,
	#superclass : #Value,
	#instVars : [
		'number',
		'generation'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #specification }
PtObjectId class >> localSpecification [
	<constant: #number class: #PtInteger comment: 'A positive integer object number.
	Indirect objects may be numbered sequentially within a PDF file, but this is not required; 
	object numbers may be assigned in any arbitrary order'>
	<optional: #generation class: #PtInteger default: '0' comment: 'A non-negative integer generation number.
	In a newly created file, all indirect objects shall have generation numbers of 0. 
	Nonzero generation numbers may be introduced when the file is later updated'>
]

{ #category : #'instance creation optional' }
PtObjectId class >> number: numberInteger [
	^self number: numberInteger generation: nil
]

{ #category : #'instance creation' }
PtObjectId class >> number: numberInteger generation: generationInteger [
	| inst |
	inst := self new.
	inst initializeNumber: numberInteger generation: generationInteger.
	^inst
]

{ #category : #accessing }
PtObjectId >> generation [
	"<Integer>
	A non-negative integer generation number.
	In a newly created file, all indirect objects shall have generation numbers of 0. 
	Nonzero generation numbers may be introduced when the file is later updated"

	^generation ifNil: [0]
]

{ #category : #'initialize-release' }
PtObjectId >> initializeNumber: numberInteger generation: generationInteger [
	number := numberInteger.
	(generationInteger notNil and: [
	self generation ~= generationInteger]) ifTrue: [
			generation := generationInteger].
	self beImmutable
]

{ #category : #accessing }
PtObjectId >> number [
	"<Integer>
	A positive integer object number.
	Indirect objects may be numbered sequentially within a PDF file, but this is not required; 
	object numbers may be assigned in any arbitrary order"

	^number
]

{ #category : #printing }
PtObjectId >> printOn: aStream [
	aStream
		nextPutAll: self number printString;
		space;
		nextPutAll: self generation printString
]

{ #category : #printing }
PtObjectId >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'number' value: self number).
	args add: (printer optional: 'generation' value: generation).
	^printer printvalue: self arguments: args
]
