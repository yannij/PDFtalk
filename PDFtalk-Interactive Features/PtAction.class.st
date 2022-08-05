"
PDF Action dictionary as defined in PDF 32000_2008.pdf, section 12.6, pp. 414.

An action dictionary defines the characteristics and behaviour of an action.
"
Class {
	#name : #PtAction,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #'instance creation' }
PtAction class >> empty [
	| inst |
	inst := super empty.
	inst at: #S put: self subtype.
	^inst
]

{ #category : #testing }
PtAction class >> isClassForDictionary: aDictionary [
	| subtypeEntry |
	subtypeEntry := aDictionary at: #S ifAbsent: [
		^false].
	self == (PtPDF classAt: #Action) ifTrue: [
		^super isClassForDictionary: aDictionary].
	^self subtype asPDF = subtypeEntry asPDF
]

{ #category : #accessing }
PtAction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Action
		supertype: #Dictionary
		version: #(1 1)
		section: '12.6'
		documentation: 'An action dictionary defines the characteristics and behaviour of an action.'
]

{ #category : #accessing }
PtAction class >> subtype [
	"<Symbol>
	subtype entry"

	^self name
]

{ #category : #accessing }
PtAction class >> type [
	^#Action
]

{ #category : #'accessing entries' }
PtAction >> Next [
	<type: #Action>
	<typeDictionaryOf: #Action>
	<version: 1 dot: 2>
	<attribute: 3 documentation: 'The next action or sequence of actions that shall be performed after the action represented by this dictionary.
The value is either a single action dictionary or an array of action dictionaries that shall be performed in order'>
	^self objectAt: #Next ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtAction >> S [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'The type of action that this dictionary describes'>
	^self objectAt: #S
]

{ #category : #'accessing entries' }
PtAction >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Action asPDF]
]
