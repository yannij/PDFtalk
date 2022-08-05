"
Testvalue is a resource class for testing values
"
Class {
	#name : #Testvalue,
	#superclass : #Value,
	#instVars : [
		'constant',
		'optional',
		'array',
		'dictionary'
	],
	#category : #'Values-Testing'
}

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol [
	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: nil array: nil dictionary: nil.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol array: arrayArray [
	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: nil array: arrayArray dictionary: nil.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol array: arrayArray dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: nil
		array: arrayArray
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: nil
		array: nil
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol optional: optionalSymbol [
	| inst |
	inst := self new.
	inst initializeConstant: constantSymbol optional: optionalSymbol array: nil dictionary: nil.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol optional: optionalSymbol array: arrayArray [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: arrayArray
		dictionary: nil.
	^inst
]

{ #category : #'instance creation' }
Testvalue class >> constant: constantSymbol optional: optionalSymbol array: arrayArray dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: arrayArray
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'instance creation optional' }
Testvalue class >> constant: constantSymbol optional: optionalSymbol dictionary: dictionaryDictionary [
	| inst |
	inst := self new.
	inst
		initializeConstant: constantSymbol
		optional: optionalSymbol
		array: nil
		dictionary: dictionaryDictionary.
	^inst
]

{ #category : #'test instances' }
Testvalue class >> example [
	^Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x 'name')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> 'string')
]

{ #category : #specification }
Testvalue class >> localSpecification [
	<constant: #constant class: #Symbol>
	<optional: #optional class: #Symbol default: '#none'>
	<sequence: #array>
	<map: #dictionary>
]

{ #category : #accessing }
Testvalue >> array [
	"<Array>"

	^array ifNil: [#()]
]

{ #category : #accessing }
Testvalue >> constant [
	"<Symbol>"

	^constant
]

{ #category : #accessing }
Testvalue >> dictionary [
	"<Dictionary>"

	^dictionary ifNil: [Dictionary new beImmutable]
]

{ #category : #'initialize-release' }
Testvalue >> initializeConstant: constantSymbol optional: optionalSymbol array: arrayArray dictionary: dictionaryDictionary [
	constant := constantSymbol.
	(optionalSymbol notNil and: [
	self optional ~= optionalSymbol]) ifTrue: [
			optional := optionalSymbol].
	(arrayArray notNil and: [
	arrayArray notEmpty]) ifTrue: [
			array := (Array withAll: arrayArray) beImmutable].
	(dictionaryDictionary notNil and: [
	dictionaryDictionary notEmpty]) ifTrue: [
			dictionary := (Valuemap withAll: dictionaryDictionary) beImmutable].
	self beImmutable
]

{ #category : #accessing }
Testvalue >> optional [
	"<Symbol>"

	^optional ifNil: [#none]
]

{ #category : #marshaling }
Testvalue >> passInstVars [
	"for OpenTalk StSt"

	^#(#default #default #default #value)
]

{ #category : #printing }
Testvalue >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'constant' value: self constant).
	args add: (printer optional: 'optional' value: optional).
	args add: (printer array: 'array' value: self array).
	args add: (printer dictionary: 'dictionary' value: self dictionary).
	^printer printvalue: self arguments: args
]
