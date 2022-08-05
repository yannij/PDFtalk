"
The concrete type object used as node in the PDF type hierarchy

Includes the PDFTypeDefinition, the implementing Smalltalk class and the subtypes which are collected when the hierarchy is assembled.

Type should be isomorph to Class in order to show the hierarchy in the browser.
"
Class {
	#name : #PtType,
	#superclass : #Object,
	#instVars : [
		'typeDefinition',
		'implementingClass',
		'supertype',
		'subtypes'
	],
	#category : #'PDFtalk-Typing'
}

{ #category : #'instance creation' }
PtType class >> newFromClass: aClass [
	"<PDFtalk.Type>
	returns a new Type instance - only used for constructing the type hierarchy"

	^self typeDefinition: aClass pdfTypeDefinition implementingClass: aClass
]

{ #category : #'instance creation' }
PtType class >> typeDefinition: aPDFTypeDefinition implementingClass: aClass [

	| inst |
	inst := self new.
	inst initializeTypeDefinition: aPDFTypeDefinition implementingClass: aClass.
	^inst
]

{ #category : #comparing }
PtType >> = anObject [

	^self == anObject or: 
			[self class == anObject class and: 
					[self typeDefinition = anObject typeDefinition
						and: [self implementingClass = anObject implementingClass]]]
]

{ #category : #accessing }
PtType >> allSubtypes [
	"<SequenceableCollection of: Type>
	returns all sub types of the receiver"

	self subtypes isEmpty ifTrue: [
		^#()].
	^self subtypes inject: OrderedCollection new into: [:all :type |
		all add: type.
		all addAll: type allSubtypes.
		all]
]

{ #category : #accessing }
PtType >> allTerminalSubtypes [
	"<SequenceableCollection of: Type>
	returns all sub types of the receiver which do not have subtypes, including the receiver"

	self subtypes isEmpty ifTrue: [^Array with: self].
	^self subtypes inject: (OrderedCollection new)
		into: 
			[:all :type |
			all addAll: type allTerminalSubtypes.
			all]
]

{ #category : #comparing }
PtType >> hash [

	^self typeDefinition hash bitXor: self implementingClass hash
]

{ #category : #accessing }
PtType >> implementingClass [
	"<Class>
	subclass of Object.
	Implements #pdfType as class method"

	^implementingClass
]

{ #category : #'initialize-release' }
PtType >> initializeTypeDefinition: aPDFTypeDefinition implementingClass: aClass [

	typeDefinition := aPDFTypeDefinition.
	implementingClass := aClass
]

{ #category : #testing }
PtType >> isExemplar: aPDFObject [
	"<Boolean>
	true, iff aPDFObject is an examplar of the receiver"
	
	aPDFObject pdfType ifNotNil: [:objectType | 
		^objectType isTypeOf: self].
	^false
]

{ #category : #testing }
PtType >> isSubtypeOf: aType [

	self supertype ifNil: [^false].		"Object does not have a supertype"
	^self supertype = aType or: [		"I am not a subtype of myself"
	self supertype isSubtypeOf: aType]
]

{ #category : #testing }
PtType >> isTypeOf: aType [
	"true iff the receiver is aType or aType is a supertype"
	^self = aType or: [self isSubtypeOf: aType]
]

{ #category : #accessing }
PtType >> name [
	"<Symbol>"
	
	^self typeDefinition name
]

{ #category : #printing }
PtType >> printOn: stream [

	stream
		nextPutAll: self name asString;
		nextPutAll: '(';
		nextPutAll: self implementingClass name asString;
		nextPutAll: ')'
]

{ #category : #typing }
PtType >> specialized: aPDFObject [
	"<PDFObject | nil>
	returns a new instance of the receiver with the contents of aPDFObject"

	| matchingTypes mostSpecialTypes |
	(aPDFObject pdfType isTypeOf: self) ifTrue: [
		^aPDFObject].
	matchingTypes := self withAllSubtypes select: [:type | aPDFObject canBeExemplarOf: type].
	matchingTypes isEmpty ifTrue: [
		^nil].
	matchingTypes size = 1 ifTrue: [
		^matchingTypes first implementingClass newFrom: aPDFObject].
	mostSpecialTypes := matchingTypes select: [:type |
		| allSubtypes |
		allSubtypes := type allSubtypes asSet.
		(matchingTypes anySatisfy: [:otherType | allSubtypes includes: otherType]) not].
	mostSpecialTypes size = 1 ifTrue: [
		^mostSpecialTypes first implementingClass newFrom: aPDFObject].
	^self error: 'more than one type is matching the object'
]

{ #category : #accessing }
PtType >> subtypes [
	"<SeqenceableCollection of: Type>"

	^subtypes ifNil: [subtypes := OrderedCollection new]
]

{ #category : #accessing }
PtType >> supertype [
	"<Type | nil>
	The PDF supertype.
	The supertype of top level types is nil."

	^supertype
]

{ #category : #'initialize-release' }
PtType >> supertype: aType [

	supertype := aType.
	aType subtypes add: self
]

{ #category : #accessing }
PtType >> supertypeName [
	"<Symbol | nil>
	The type name of the PDF supertype.
	The supertype of top level types is nil."

	^self typeDefinition supertype
]

{ #category : #accessing }
PtType >> supertypes [
	"<SequenceableCollection of: Type>
	The PDF supertypes.
	The supertype of top level types is nil."

	self supertype ifNotNil: [:st |
		^(Array with: st) , st supertypes].
	^#()
]

{ #category : #accessing }
PtType >> typeDefinition [
	"<PDFTypeDefinition>"

	^typeDefinition
]

{ #category : #accessing }
PtType >> withAllSubtypes [
	"<SequenceableCollection of: Type>
	returns the receiver and all sub types of the receiver"

	self subtypes isEmpty ifTrue: [
		^Array with: self].
	^self subtypes inject: (OrderedCollection with: self) into: [:all :type |
		all addAll: type withAllSubtypes.
		all]
]
