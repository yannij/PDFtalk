"
A Valuemap is an ordered dictionary preserving the order in which entries are added.

Instances are also used as ordered volatile dictionary, not just as value.

In VisualWorks, Valuemap is subclassed from Dictionary to inherit the dictionary API.

Instance Variables:
	order	<SequenceableCollection of: Object>		the ordered keys


The class used to be named OrderedDictionary, but was renamed for dialect compatibility with Pharo, which has a class named OrderedDictionary with different semantics.
"
Class {
	#name : #Valuemap,
	#superclass : #Dictionary,
	#type : #variable,
	#instVars : [
		'order'
	],
	#category : #Values
}

{ #category : #comparing }
Valuemap >> = otherOrderedDictionary [
	^self class == otherOrderedDictionary class and: [
	self size = otherOrderedDictionary size and: [
	(1 to: self size) allSatisfy: [:i |
		(self atIndex: i) = (otherOrderedDictionary atIndex: i)]]]
]

{ #category : #'dictionary enumerating' }
Valuemap >> associationsDo: aBlock [
	"Note: do not use the keys to access anything.
	This method is used by #changeCapacityTo: and #rehash where key access is not working"

	| assocs |
	assocs := Array new: self order size.
	super associationsDo: [:assoc | assocs at: (self order indexOf: assoc key) put: assoc].
	assocs do: aBlock
]

{ #category : #accessing }
Valuemap >> atIndex: index [
	"<Association>"

	^self associationAt: (self order at: index)
]

{ #category : #private }
Valuemap >> atNewIndex: index put: anObject [
	array at: index put: anObject.
	tally := tally + 1.
	self order addLast: anObject key.
	self fullCheck
]

{ #category : #enumerating }
Valuemap >> collect: oneArgumentBlock [
	| newCollection |
	newCollection := self species new: self size.
	self keysAndValuesDo: [:eachKey :eachValue | 
		newCollection at: eachKey put: (oneArgumentBlock value: eachValue)].
	^newCollection
]

{ #category : #copying }
Valuemap >> copyWith: anAssociation [ 
	"Answer a copy of the receiver with anAssociation added"

	| copy |
	copy := self copy.
	copy add: anAssociation.
	^copy
]

{ #category : #copying }
Valuemap >> copyWithAll: aDictionary [
	"Answer a copy of the receiver with all associations from aDictionary added"

	| copy |
	copy := self copy.
	copy addAll: aDictionary.
	^copy
]

{ #category : #accessing }
Valuemap >> first [
	"<Association>"

	^self associationAt: self keys first
]

{ #category : #initialization }
Valuemap >> grow [
	"Grow the elements array and reinsert the old elements"

	| oldElements oldOrder |
	oldElements := array.
	array := Array new: (HashTableSizes atLeast: oldElements size * 2).
	tally := 0.
	oldOrder := order.
	order := nil.
	oldElements do: [:each | each ifNotNil: [self noCheckAdd: each]].
	order := oldOrder
]

{ #category : #comparing }
Valuemap >> hash [
	^(1 to: self size) inject: self class hash into: [:hash :index |
		| assoc |
		assoc := self atIndex: index.
		hash bitXor: (assoc key hash bitXor: assoc value hash)]
]

{ #category : #accessing }
Valuemap >> indexOf: aKey [
	"<Integer>"

	^self order indexOf: aKey
]

{ #category : #initialization }
Valuemap >> initialize: n [
	super initialize: n.
	order := nil
]

{ #category : #accessing }
Valuemap >> keys [
	"<SequenceableCollection of: Object>"

	^self order copy
]

{ #category : #enumerating }
Valuemap >> keysAndValuesDo: oneArgumentBlock [
	self order do: [:key |
		oneArgumentBlock value: key value: (self at: key)]
]

{ #category : #printing }
Valuemap >> keysForPrinting [
	^self keys
]

{ #category : #accessing }
Valuemap >> last [
	"<Association>"

	^self associationAt: self keys last
]

{ #category : #private }
Valuemap >> noCheckAdd: anAssociation [
	super noCheckAdd: anAssociation.
	self order addLast: anAssociation key
]

{ #category : #accessing }
Valuemap >> order [
	"<SequenceableCollection of: Object>
	the order of the keys"

	^order ifNil: [order := OrderedCollection new]
]

{ #category : #copying }
Valuemap >> postCopy [

	super postCopy.
	order := self order copy
]

{ #category : #printing }
Valuemap >> printvalueWith: printer [
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer) isOrdered: true
]

{ #category : #'dictionary removing' }
Valuemap >> removeKey: key ifAbsent: aBlock [
	| index assoc |
	index := self findElementOrNil: key.
	assoc := array at: index.
	assoc isNil ifTrue: [
		^aBlock value].
	self order remove: assoc key.
	array at: index put: nil.
	tally := tally - 1.
	self fixCollisionsFrom: index.
	^assoc value
]

{ #category : #enumerating }
Valuemap >> valuesDo: oneArgumentBlock [
	self order do: [:key | oneArgumentBlock value: (self at: key)]
]
