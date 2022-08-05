"
PDF Dictionary object as defined in PDF 32000_2008.pdf pp. 18.

Dictionaries use PDFNames as keys. Internally the implementation uses Symbols as keys for efficency.
The keys must be symbols.
Dictionaries hold PDF objects only. Any object put into it will be converted to its corresponding PDF object.
Dictionaries always answer PDF objects.
"
Class {
	#name : #PDFDictionary,
	#superclass : #PDFObject,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PDFDictionary class >> empty [
	^self new
]

{ #category : #testing }
PDFDictionary class >> isClassForDictionary: aDictionary [
	^true
]

{ #category : #accessing }
PDFDictionary class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Dictionary
		supertype: #Object
		section: '7.3.7'
		documentation: 'A dictionary object is an associative table containing pairs of objects, known as the dictionary’s entries.
The first element of each entry is the key and the second element is the value.
The key shall be a name.
The value may be any kind of object, including another dictionary.
A dictionary entry whose value is null shall be treated the same as if the entry does not exist.
A dictionary may have zero entries.'
]

{ #category : #'instance creation' }
PDFDictionary class >> subclassFor: aDictionary [
	"<Dictionary class | nil>"

	self subclasses do: [:subclass | 
		(subclass subclassFor: aDictionary) ifNotNil: [:sc |
			^sc]].
	(self isClassForDictionary: aDictionary) ifTrue: [
		^self].
	^nil
]

{ #category : #accessing }
PDFDictionary class >> type [
	"<Symbol>
	type entry"

	^self name
]

{ #category : #'instance creation' }
PDFDictionary class >> with: aPDFObject [
	^self on: (Valuemap with: aPDFObject)
]

{ #category : #'instance creation' }
PDFDictionary class >> with: firstPDFObject with: secondPDFObject [
	^self on: (Valuemap
		with: firstPDFObject
		with: secondPDFObject)
]

{ #category : #'instance creation' }
PDFDictionary class >> with: firstPDFObject with: secondPDFObject with: thirdPDFObject [
	^self on: (Valuemap
		with: firstPDFObject
		with: secondPDFObject
		with: thirdPDFObject)
]

{ #category : #'instance creation' }
PDFDictionary class >> with: firstPDFObject with: secondPDFObject with: thirdPDFObject with: fourthPDFObject [
	^self on: (Valuemap
		with: firstPDFObject
		with: secondPDFObject
		with: thirdPDFObject
		with: fourthPDFObject)
]

{ #category : #converting }
PDFDictionary >> asSmalltalkValue [
	| dict |
	dict := Valuemap new.
	self content keysAndValuesDo: [:key :aValue | dict at: key put: aValue asSmalltalkValue].
	^dict
]

{ #category : #converting }
PDFDictionary >> asType: aType [
	^aType specializedDictionary: self
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol [
	"<PDFObject>
	returns the object stored in a slot (PDF.Object or Reference).
	A value of null is treated as non existant entry"

	^self content at: aSymbol
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol ifAbsent: aBlock [
	"<PDF.Object>
	it is not possible to return a null, since null erases the entry"

	^self content at: aSymbol ifAbsent: aBlock
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol ifAbsentPut: valueBlock [
	"<PDFObject>
	Answer the value at aSymbol.  If aSymbol is not found, create a new
	entry for aSymbol, set its value to be the result of evaluating
	valueBlock, and answer that value."

	^self at: aSymbol ifAbsent: [self at: aSymbol put: valueBlock value]
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol ifAbsentPutPlain: valueBlock [
	"<PDFObject>
	Answer the value at aSymbol.  If aSymbol is not found, create a new
	entry for aSymbol, set its value to be the result of evaluating
	valueBlock, and answer that value."

	^self at: aSymbol ifAbsent: [self at: aSymbol putPlain: valueBlock value]
]

{ #category : #accessing }
PDFDictionary >> at: key ifPresent: aBlock [ 
	"Answer the value at key.  If key is found, evaluate aBlock with the corresponding value."

	| found value |
	found := true.
	value := self at: key ifAbsent: [found := false].
	^found
		ifTrue: [aBlock value: value]
		ifFalse: [nil]
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol put: anObject [
	"<PDFObject>
	A null removes any existant entry at aSymbol.
	anObject is added as its most specific version"
	aSymbol isSymbol ifFalse: [
		^PtError raiseSignal: 'PDF dictionaries use only symbols as keys'].
	anObject ifNil: [
		self content removeKey: aSymbol ifAbsent: [nil].
		^nil].
	^self content at: aSymbol put: (anObject asPDF typed: (self attributeTypesAt: aSymbol))
]

{ #category : #accessing }
PDFDictionary >> at: aSymbol putPlain: anObject [
	"<PDFObject>
	A null removes any existant entry at aSymbol.
	anObject is added as is. No typing is performed"

	aSymbol isSymbol ifFalse: [
		^PtError raiseSignal: 'PDF dictionaries use only symbols as keys'].
	anObject ifNil: [
		self content removeKey: aSymbol ifAbsent: [nil].
		^nil].
	^self content at: aSymbol put: anObject asPDF
]

{ #category : #'accessing attributes' }
PDFDictionary >> attributeHasValue: anAttributePragma [
	"<Boolean>"

	^self keys includes: anAttributePragma selector
]

{ #category : #typing }
PDFDictionary >> attributeTypesAt: anAttributeSymbol [

	| implementingClass method |
	implementingClass := self class whichClassIncludesSelector: anAttributeSymbol.
	implementingClass ifNil: [
		^#()].
	method := implementingClass compiledMethodAt: anAttributeSymbol.
	^PtAttributeType allInMethod: method
]

{ #category : #'accessing attributes' }
PDFDictionary >> attributesPresent [
	"<Collection of: Pragma>"

	| keys |
	keys := self keys asSet.
	^self sortedAttributePragmas select: [:pragma | keys includes: pragma selector]
]

{ #category : #testing }
PDFDictionary >> canBeExemplarOf: aType [
	^aType implementingClass isClassForDictionary: self
]

{ #category : #accessing }
PDFDictionary >> classesForAttributes [
	"<SequenceableCollection of: Dictionary class>
	all super classes which may have attributes from the top to self"

	^(self class allSuperclasses allButLast: self topClassLevel) reverse , (Array with: self class)
]

{ #category : #testing }
PDFDictionary >> compliesTo: anAttributeType [
	^anAttributeType specifiesDictionary: self
]

{ #category : #accessing }
PDFDictionary >> content [
	^content ifNil: [content := Valuemap new]
]

{ #category : #accessing }
PDFDictionary >> contentWithoutCycles [
	"<OrderedDictionary>
	a copy of content with entries removed which create a circular structure"

	^self content copy
]

{ #category : #tracing }
PDFDictionary >> copyWithNewReferencesIn: visited [
	| newDict inst |
	newDict := Valuemap new: self size.
	self content keysAndValuesDo: [:key :pdfObject |
		newDict at: key put: (pdfObject copyWithNewReferencesIn: visited)].
	inst := self class new.
	inst initializeDirectWithContent: newDict.
	^inst
]

{ #category : #testing }
PDFDictionary >> hasKey: aSymbol [
	^self keys asSet includes: aSymbol
]

{ #category : #testing }
PDFDictionary >> hasRequiredAttributes [
	| keys |
	keys := self keys asSet.
	^self attributesRequired allSatisfy: [:pragma | keys includes: pragma selector]
]

{ #category : #'initialize-release' }
PDFDictionary >> initializeContent: aDictionary [
	"we need to use the official #at:put: to convert all non-PDF objects to PDFs"

	content := Valuemap new: aDictionary size.
	aDictionary associations do: [:assoc | self at: assoc key put: assoc value]
]

{ #category : #'initialize-release' }
PDFDictionary >> initializeDirectWithContent: aValuemap [
	"low level initialization without typing"

	content := aValuemap
]

{ #category : #accessing }
PDFDictionary >> keys [
	"<Array of: Symbol>"

	^self content keys
]

{ #category : #enumerating }
PDFDictionary >> keysAndValuesDo: aBlockClosure [
	self content keysAndValuesDo: aBlockClosure
]

{ #category : #accessing }
PDFDictionary >> objectAt: aSymbol ifAbsent: aBlock [
	"<PDF.Object>
	returns the object stored in a slot or the value of a Reference"

	| pdf |
	pdf := self content at: aSymbol ifAbsent: [
		^aBlock value].
	^pdf pdfObject
]

{ #category : #accessing }
PDFDictionary >> pdfVersion [
	"<Version>
	the highest version of the class and its attributes.
	Does not follow the objects contained as values of attributes."

	^self attributesPresent inject: self class pdfVersion into: [:maxVersion :pragma |
		| conditional maxCond attributes |
		attributes := self tagsIn: pragma method withSelector: #version:dot:ifValue:.
		conditional := attributes isEmpty
			ifTrue: [#()]
			ifFalse: [attributes].
		maxCond := conditional inject: maxVersion into: [:max1 :pragma1 |
			pragma1 arguments last = (self perform: pragma selector) content
				ifTrue: [
				max1 max: (PtVersion major: pragma1 arguments first minor: (pragma1 arguments at: 2))]
				ifFalse: [
				max1]].
		maxVersion max: ((self pdfVersionOf: pragma method) max: maxCond)]
]

{ #category : #accessing }
PDFDictionary >> size [
	"<Integer>"

	^self content size
]

{ #category : #'accessing attributes' }
PDFDictionary >> sort: aAttributePragma before: bAttributePragma [
	"<Boolean>"

	| aClass bClass aRequired bRequired aValue bValue aVersion bVersion |
	aRequired := self attributeIsRequired: aAttributePragma.
	bRequired := self attributeIsRequired: bAttributePragma.
	(aRequired and: [
	bRequired not]) ifTrue: [
			^true].
	(aRequired not and: [
	bRequired]) ifTrue: [
			^false].
	aValue := self attributeHasValue: aAttributePragma.
	bValue := self attributeHasValue: bAttributePragma.
	(aValue and: [
	bValue not]) ifTrue: [
			^true].
	(aValue not and: [
	bValue]) ifTrue: [
			^false].
	aClass := aAttributePragma methodClass.
	bClass := bAttributePragma methodClass.
	(aClass inheritsFrom: bClass) ifTrue: [
		^false].
	(bClass inheritsFrom: aClass) ifTrue: [
		^true].
	"same class"
	aVersion := self attributeVersion: aAttributePragma.
	bVersion := self attributeVersion: bAttributePragma.
	aVersion = bVersion ifTrue: [
		^aAttributePragma arguments first < bAttributePragma arguments first].
	^aVersion < bVersion
]

{ #category : #'accessing attributes' }
PDFDictionary >> sortedAttributeKeys [
	"<SequenceableCollection of: Symbol>
	The attributes are sorted by the specified order.
	Unspecified attribute are ordered by appearance"

	| keys known sortedKeys otherKeys |
	keys := self keys asSet.
	sortedKeys := self sortedAttributePragmas collect: #selector.
	known := sortedKeys select: [:key | keys includes: key].
	otherKeys := self keys asOrderedCollection.
	sortedKeys do: [:key | otherKeys remove: key ifAbsent: []].
	^known , otherKeys
]

{ #category : #'accessing attributes' }
PDFDictionary >> sortedAttributePragmas [
	"If there are attributes with the same selector, the most specific is returned.
	The order is from the specific class up the hierarchy"

	| dict |
	dict := Valuemap new.
	self classesForAttributes do: [:class |
		(Pragma allNamed: #attribute:documentation: in: class sortedByArgument: 1) do: [:pragma |
			dict at: pragma methodSelector put: pragma]].
	^dict values
]

{ #category : #accessing }
PDFDictionary >> topClassLevel [
	"<Integer>
	the level of the receiver's topmost relevant superclass in the class hierarchy"

	^3
]

{ #category : #tracing }
PDFDictionary >> tracedReferences: visited do: oneArgumentBlock [
	self values do: [:pdfObject | pdfObject tracedReferences: visited do: oneArgumentBlock]
]

{ #category : #typing }
PDFDictionary >> typed: listOfAttributeTypes [
	"<PDF.Dictionary>
	a copy of the receiver with the values specialized according to the listOfTypes"

	| types |
	types := listOfAttributeTypes select: #isForDictionary.
	types isEmpty ifTrue: [
		^super typed: listOfAttributeTypes].
	types size > 1 ifTrue: [
		PtError raiseSignal: 'Only one #typeDictionaryOf: or #typeNameTreeOf: pragma is allowed'.
		^super typed: listOfAttributeTypes].
	^types first typedDictionary: self
]

{ #category : #accessing }
PDFDictionary >> unresolvedReferences [
	"<OrderedCollection>
	without duplicates: the first one is used.
	Comparison uses equal #="

	| allWithDuplicates used |
	allWithDuplicates := self values inject: OrderedCollection new into: [:new :value |
		new addAll: value unresolvedReferences.
		new].
	used := Set new.
	^allWithDuplicates select: [:element |
		(used includes: element)
			ifTrue: [false]
			ifFalse: [
			used add: element.
			true]]
]

{ #category : #'accessing attributes' }
PDFDictionary >> unspecifiedAttributes [
	"<SequenceableCollection of: (Association key: Symbol value: PDF.Object)>"

	| keys |
	keys := self keys asOrderedCollection.
	self sortedAttributePragmas do: [:pragma | keys remove: pragma selector ifAbsent: []].
	^keys collect: [:key | key -> (self at: key)]
]

{ #category : #accessing }
PDFDictionary >> values [
	"<Array of: PDF.Object>"

	^self content values
]

{ #category : #writing }
PDFDictionary >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutAll: '<<' asByteArray.
	(anInteger > 0 and: [
	self size > 1]) ifTrue: [
			aWriter cr].
	self content associations
		do: [:assoc |
		anInteger + 1 timesRepeat: [aWriter tab].
		assoc key asPDF writePDFOn: aWriter indent: anInteger.
		aWriter space.
		assoc value writePDFOn: aWriter indent: anInteger + 1]
		separatedBy: [
		aWriter cr].
	aWriter
		tab;
		nextPutAll: '>>' asByteArray
]
