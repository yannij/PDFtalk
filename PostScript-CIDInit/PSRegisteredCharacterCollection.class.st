"
The character collection for a CMap specifying character selectors that are CIDs
"
Class {
	#name : #PSRegisteredCharacterCollection,
	#superclass : #Value,
	#instVars : [
		'registry',
		'ordering',
		'supplement'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #specification }
PSRegisteredCharacterCollection class >> localSpecification [
	<constant: #registry class: #String comment: 'issuer of the character collection'>
	<constant: #ordering class: #String comment: 'the unique name for a character collection in the registry'>
	<constant: #supplement class: #Integer comment: 'The supplement number of the character collection. An original character collection has a supplement number of 0. Whenever additional CIDs are assigned in a character collection, the supplement number is increased. Supplements do not alter the ordering of existing CIDs in the character collection.'>
]

{ #category : #'instance creation' }
PSRegisteredCharacterCollection class >> newWith: aDictionary [
	aDictionary isEmpty ifTrue: [
		^self new].
	^self
		registry: (aDictionary at: #Registry)
		ordering: (aDictionary at: #Ordering)
		supplement: (aDictionary at: #Supplement)
]

{ #category : #'instance creation' }
PSRegisteredCharacterCollection class >> registry: registryString ordering: orderingString supplement: supplementInteger [
	| inst |
	inst := self new.
	inst
		initializeRegistry: registryString
		ordering: orderingString
		supplement: supplementInteger.
	^inst
]

{ #category : #'initialize-release' }
PSRegisteredCharacterCollection >> initializeRegistry: registryString ordering: orderingString supplement: supplementInteger [
	registry := registryString.
	ordering := orderingString.
	supplement := supplementInteger.
	self beImmutable
]

{ #category : #testing }
PSRegisteredCharacterCollection >> isKnownOrdering [
	^self knownOrderings includes: self ordering
]

{ #category : #accessing }
PSRegisteredCharacterCollection >> knownOrderings [
	"orderings from Adobe"
	
	^#('CNS1' 'GB1' 'Japan1' 'Japan2' 'Korea1' 'KR' 'Identity' 'UCS')
]

{ #category : #accessing }
PSRegisteredCharacterCollection >> ordering [
	"<String>
	the unique name for a character collection in the registry"

	^ordering
]

{ #category : #printing }
PSRegisteredCharacterCollection >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'registry' value: self registry).
	args add: (printer constant: 'ordering' value: self ordering).
	args add: (printer constant: 'supplement' value: self supplement).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PSRegisteredCharacterCollection >> registry [
	"<String>
	issuer of the character collection"

	^registry
]

{ #category : #accessing }
PSRegisteredCharacterCollection >> supplement [
	"<Integer>
	The supplement number of the character collection. An original character collection has a supplement number of 0. Whenever additional CIDs are assigned in a character collection, the supplement number is increased. Supplements do not alter the ordering of existing CIDs in the character collection."

	^supplement
]
