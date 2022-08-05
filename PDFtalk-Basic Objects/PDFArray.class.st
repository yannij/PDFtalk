"
PDF Array object as defined in PDF 32000_2008.pdf, section 7.3.6, pp. 18.

An array object is a one-dimensional collection of objects arranged sequentially.
Unlike arrays in many other computer languages, PDF arrays may be heterogeneous; that is, an array’s elements may be any combination of numbers, strings, dictionaries, or any other objects, including other arrays.
An array may have zero elements.

"
Class {
	#name : #PDFArray,
	#superclass : #PDFObject,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #accessing }
PDFArray class >> attributesIntervalString [
	| numString |
	numString := self numberOfAttributes printString.
	self numberOfAttributes = self maxNumberOfAttributes ifFalse: [
		^numString , '-' , self maxNumberOfAttributes printString].
	^numString
]

{ #category : #'instance creation' }
PDFArray class >> empty [
	self class == PtPDF Array ifTrue: [
		^self new].
	^self new: self maxNumberOfAttributes
]

{ #category : #testing }
PDFArray class >> isClassForArray: anArray [

	^anArray size between: self numberOfAttributes
		and: self maxNumberOfAttributes
]

{ #category : #testing }
PDFArray class >> isValidNumberOfElements: anInteger [
	^self == PtPDF Array or: [
	anInteger between: self numberOfAttributes and: self maxNumberOfAttributes]
]

{ #category : #accessing }
PDFArray class >> maxNumberOfAttributes [
	^self numberOfAttributes
]

{ #category : #'instance creation' }
PDFArray class >> new: numberOfElements [
	^self content: (Array new: numberOfElements withAll: nil)
]

{ #category : #accessing }
PDFArray class >> numberOfAttributes [
	"<Integer>
	the fixed number of attributes in specialized subclasses"

	^self subclassResponsibility
]

{ #category : #'instance creation' }
PDFArray class >> on: anArray [
	| inst |
	inst := self new: anArray size.
	anArray withIndexDo: [:element :index | inst at: index put: element].
	inst hasValidNumberOfElements ifFalse: [
		inst raiseTypeError].
	^inst
]

{ #category : #accessing }
PDFArray class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Array
		supertype: #Object
		section: '7.3.6'
		documentation: 'An array object is a one-dimensional collection of objects arranged sequentially.
Unlike arrays in many other computer languages, PDF arrays may be heterogeneous; that is, an array’s elements may be any combination of numbers, strings, dictionaries, or any other objects, including other arrays.
An array may have zero elements.'
]

{ #category : #'instance creation' }
PDFArray class >> with: aPDFObject [
	^self on: (Array with: aPDFObject)
]

{ #category : #'instance creation' }
PDFArray class >> with: firstPDFObject with: secondPDFObject [
	^self on: (Array
		with: firstPDFObject
		with: secondPDFObject)
]

{ #category : #'instance creation' }
PDFArray class >> with: firstPDFObject with: secondPDFObject with: thirdPDFObject [
	^self on: (Array
		with: firstPDFObject
		with: secondPDFObject
		with: thirdPDFObject)
]

{ #category : #'instance creation' }
PDFArray class >> with: firstPDFObject with: secondPDFObject with: thirdPDFObject with: fourthPDFObject [
	^self on: (Array
		with: firstPDFObject
		with: secondPDFObject
		with: thirdPDFObject
		with: fourthPDFObject)
]

{ #category : #'instance creation' }
PDFArray class >> withAll: somePDFObjects [
	^self on: (Array withAll: somePDFObjects)
]

{ #category : #copying }
PDFArray >> , anArray [
	^self class on: self content , anArray content
]

{ #category : #converting }
PDFArray >> asSmalltalkValue [
	^self content collect: #asSmalltalkValue
]

{ #category : #converting }
PDFArray >> asType: aType [
	^aType specializedArray: self
]

{ #category : #accessing }
PDFArray >> at: index [
	^self content at: index
]

{ #category : #accessing }
PDFArray >> at: anInteger put: anObject [
	"<PDFObject>
	anObject is added as its most specific version"

	anInteger isInteger ifFalse: [
		^PtError raiseSignal: 'PDF arrays have integers as keys'].
	^self content at: anInteger put: (anObject asPDF typed: (self attributeTypesAt: anInteger))
]

{ #category : #accessing }
PDFArray >> at: anInteger putPlain: anObject [
	"<PDFObject>
	anObject is added as is. No typing is performed"

	anInteger isInteger ifFalse: [
		^PtError raiseSignal: 'PDF arrays have integers as keys'].
	^self content at: anInteger put: anObject asPDF
]

{ #category : #typing }
PDFArray >> attributeTypesAt: index [

	| indexPragmas pragmaForSlot |
	indexPragmas := Pragma allNamed: #attribute:documentation: in: self class.
	indexPragmas isEmpty ifTrue: [^#()].
	pragmaForSlot := indexPragmas
				detect: [:pragma | pragma arguments first = index]
				ifNone: [^#()].
	^PtAttributeType allInMethod: pragmaForSlot method
]

{ #category : #testing }
PDFArray >> canBeExemplarOf: aType [
	
	^aType implementingClass isClassForArray: self
]

{ #category : #testing }
PDFArray >> compliesTo: anAttributeType [
	^anAttributeType specifiesArray: self
]

{ #category : #accessing }
PDFArray >> content [
	"<Array of: PDF.Object>"

	^super content ifNil: [#()]
]

{ #category : #tracing }
PDFArray >> copyWithNewReferencesIn: visited [
	^self class content: (self content collect: [:pdfObject |
		pdfObject copyWithNewReferencesIn: visited])
]

{ #category : #enumerating }
PDFArray >> do: aBlockClosure [
	self content do: aBlockClosure
]

{ #category : #accessing }
PDFArray >> first [
	^self content first pdfObject
]

{ #category : #testing }
PDFArray >> hasKey: anInteger [
	^anInteger between: 1 and: self size
]

{ #category : #testing }
PDFArray >> hasRequiredAttributes [
	^self attributesRequired allSatisfy: [:pragma |
		pragma arguments first between: 1 and: self size]
]

{ #category : #testing }
PDFArray >> hasValidNumberOfElements [
	^self class isValidNumberOfElements: self size
]

{ #category : #accessing }
PDFArray >> last [
	^self content last pdfObject
]

{ #category : #accessing }
PDFArray >> objectAt: index ifNil: aBlock [
	"<PDF.Object>
	returns the object stored in a slot or the value of a Reference"

	((1 to: self content size) includes: index) ifFalse: [
		^aBlock value].
	(self content at: index) ifNotNil: [:pdf |
		^pdf pdfObject].
	^aBlock value
]

{ #category : #accessing }
PDFArray >> objects [
	"<Core.Array of: PDF.Object>
	resolved objects"

	^self content collect: #pdfObject
]

{ #category : #printing }
PDFArray >> printvalueWith: printer [
	"Value protocol to print the object literally"

	^LiteralPrintvalue string: self asSmalltalkValue asSource
]

{ #category : #'instance creation' }
PDFArray >> raiseTypeError [
	PtTypeError raiseSignal: 'the size of the argument (' , self size printString , ') does not match the required number of attributes (' , self class attributesIntervalString , ')'
]

{ #category : #accessing }
PDFArray >> size [
	^self content size
]

{ #category : #'accessing attributes' }
PDFArray >> sortedAttributePragmas [
	^((Pragma
		allNamed: #attribute:documentation:
		from: self class
		to: PtPDF Array
		sortedByArgument: 1) first: self size) asOrderedCollection
]

{ #category : #tracing }
PDFArray >> tracedReferences: visited do: oneArgumentBlock [
	self do: [:pdfObject | pdfObject tracedReferences: visited do: oneArgumentBlock]
]

{ #category : #typing }
PDFArray >> typed: listOfAttributeTypes [
	"<PDFArray>
	a copy of the receiver with the values specialized according to the listOfTypes"

	| types elementTypes contentCopy |
	types := listOfAttributeTypes select: #isForArray.
	types isEmpty ifTrue: [
		^super typed: listOfAttributeTypes].
	types size > 1 ifTrue: [
		PtError raiseSignal: 'Only one #typeArrayOf: pragma is allowed'.
		^super typed: listOfAttributeTypes].
	elementTypes := Array with: types first asObjectType.
	contentCopy := self content collect: [:value | value typed: elementTypes].
	^self class on: contentCopy
]

{ #category : #accessing }
PDFArray >> unresolvedReferences [
	"<OrderedCollection>
	without duplicates: the first one is used.
	Comparison uses equal #="

	| allWithDuplicates used |
	allWithDuplicates := self content inject: OrderedCollection new into: [:new :value |
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

{ #category : #copying }
PDFArray >> with: aPDFObject [
	^(self content, (Array with: aPDFObject)) asPDF
]

{ #category : #writing }
PDFArray >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutByte: $[ asInteger.
	self content do: [:element | element writePDFOn: aWriter indent: anInteger] separatedBy: [
		aWriter space].
	aWriter nextPutByte: $] asInteger
]
