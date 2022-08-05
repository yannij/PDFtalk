"
The PDF version of a specific feature

Each released version is represented by named instances (class methods) for easier referencing and testing

Note: May need to be extended for sub versions like addendums and patches 
"
Class {
	#name : #PtVersion,
	#superclass : #Magnitude,
	#instVars : [
		'major',
		'minor'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #services }
PtVersion class >> highestVersionIn: someReferences [
	"<Version>
	the highest version of the objects references by someReferences"

	^someReferences inject: self pdf1_0 into: [:highestVersion :reference |
		highestVersion max: reference referent pdfVersion]
]

{ #category : #'instance creation' }
PtVersion class >> major: majorInteger minor: minorInteger [
	| inst |
	inst := self new.
	inst initializeMajor: majorInteger minor: minorInteger.
	^inst
]

{ #category : #instances }
PtVersion class >> pdf1_0 [
	^self major: 1 minor: 0
]

{ #category : #instances }
PtVersion class >> pdf1_1 [
	^self major: 1 minor: 1
]

{ #category : #instances }
PtVersion class >> pdf1_2 [
	^self major: 1 minor: 2
]

{ #category : #instances }
PtVersion class >> pdf1_3 [
	^self major: 1 minor: 3
]

{ #category : #instances }
PtVersion class >> pdf1_4 [
	^self major: 1 minor: 4
]

{ #category : #instances }
PtVersion class >> pdf1_5 [
	^self major: 1 minor: 5
]

{ #category : #instances }
PtVersion class >> pdf1_6 [
	^self major: 1 minor: 6
]

{ #category : #instances }
PtVersion class >> pdf1_7 [
	^self major: 1 minor: 7
]

{ #category : #instances }
PtVersion class >> pdf1_8 [
	^self major: 1 minor: 8
]

{ #category : #instances }
PtVersion class >> pdf2_0 [
	^self major: 2 minor: 0
]

{ #category : #comparing }
PtVersion >> < aVersion [
	self major = aVersion major ifTrue: [
		^self minor < aVersion minor].
	^self major < aVersion major
]

{ #category : #comparing }
PtVersion >> = aVersion [
	^self class == aVersion class and: [
	self major = aVersion major and: [
	self minor = aVersion minor]]
]

{ #category : #comparing }
PtVersion >> hash [
	^(self major bitShift: 10) bitXor: self minor
]

{ #category : #'initialize-release' }
PtVersion >> initializeMajor: majorInteger minor: minorInteger [
	major := majorInteger.
	minor := minorInteger.
	self beImmutable
]

{ #category : #accessing }
PtVersion >> major [
	"<Integer>"

	^major
]

{ #category : #accessing }
PtVersion >> minor [
	"<Integer>"

	^minor
]

{ #category : #writing }
PtVersion >> numberString [
	"<String>"

	^self major printString , '.' , self minor printString
]

{ #category : #printing }
PtVersion >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		nextPutAll: ' major: ';
		nextPutAll: self major printString;
		nextPutAll: ' minor: ';
		nextPutAll: self minor printString
]

{ #category : #writing }
PtVersion >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutAll: ('PDF-' , self numberString) asByteArray
]
