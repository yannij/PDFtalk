"
Super class of all PDF objects defined in PDF 32000_2008.pdf pp. 14.

All PDFObjects are defined in the PDF namespace and use their proper name from the specification.
Many PDFObjects have the same class name as normal Smalltalk objects - Do not confuse them!

The creation of these objects is done by a PDF.File with a PDF.Reader.
"
Class {
	#name : #PDFObject,
	#superclass : #PtEntity,
	#instVars : [
		'content'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PDFObject class >> content: anObject [
	"<PDFObject>
	A new PDF object on anObject.
	The low level object creation - no type checking and no conversions are done!"

	| inst |
	inst := self new.
	inst initializeContent: anObject.
	^inst
]

{ #category : #'instance creation' }
PDFObject class >> newFrom: aPDFObject [
	"<PDF.Object>
	A new PDF object from aPDFObject.
	Needed for specialization 
		where aPDFObject is an instance of a superclass like Dictionary or Array 
		which gets copied as an instance of the receiver"

	^self on: aPDFObject content
]

{ #category : #'instance creation' }
PDFObject class >> on: anObject [
	"<PDF.Object>
	A new PDF object on anObject"

	^self content: anObject
]

{ #category : #accessing }
PDFObject class >> pragmas [
	<pragmas: #instance>
	^self pragmasForType , self pragmasForRequired , self pragmasForVersion , self pragmasForDocumentation
]

{ #category : #accessing }
PDFObject class >> pragmasForDocumentation [
	^#(#attribute:documentation:)
]

{ #category : #accessing }
PDFObject class >> pragmasForRequired [
	^#(#required #requiredIf: #inheritable)
]

{ #category : #accessing }
PDFObject class >> pragmasForType [
	^PtAttributeType pragmaKeywords asArray
]

{ #category : #accessing }
PDFObject class >> pragmasForVersion [
	^#(#version:dot: #version:dot:ifValue:)
]

{ #category : #accessing }
PDFObject class >> undefinedTypes [
	"<Collection of: Symbol>"
	"self undefinedTypes"

	| typesReferenced |
	typesReferenced := Set new.
	(PtPDF types collect: #implementingClass) do: [:class |
		self pragmasForType do: [:pragmaSelector |
			(Pragma allNamed: pragmaSelector in: class) do: [:pragma |
				typesReferenced add: pragma message arguments first]]].
	^typesReferenced select: [:type | (PtPDF typeAt: type) isNil]
]

{ #category : #comparing }
PDFObject >> = anObject [
	^self class == anObject class and: [
	self content = anObject content]
]

{ #category : #'accessing attributes' }
PDFObject >> attributeCanInherit: anAttributePragma [
	^self hasTag: #inheritable in: anAttributePragma method
]

{ #category : #'accessing attributes' }
PDFObject >> attributeDocumentation: aMethod [
	| attributes |
	attributes := self tagsIn: aMethod withSelector: #attribute:documentation:.
	attributes isEmpty ifTrue: [
		^String new].
	^attributes first arguments last
]

{ #category : #'accessing attributes' }
PDFObject >> attributeHighestConditionalVersion: anAttributePragma [
	"<Integer>
	minor pdf version"

	| attrValue attributes |
	attributes := self tagsIn: anAttributePragma method withSelector: #version:dot:ifValue:.
	attributes isEmpty ifTrue: [
		^PtVersion pdf1_0].
	attrValue := (self perform: anAttributePragma selector) content.
	^attributes inject: PtVersion pdf1_0 into: [:maxVersion :attributeMessage |
		attributeMessage arguments last = attrValue
			ifTrue: [
			maxVersion max: (PtVersion
				major: attributeMessage arguments first
				minor: (attributeMessage arguments at: 2))]
			ifFalse: [
			maxVersion]]
]

{ #category : #'accessing attributes' }
PDFObject >> attributeIsRequired: anAttributePragma [
	^(self attributeIsRequiredIf: anAttributePragma) or: [
	self attributeIsUnconditionallyRequired: anAttributePragma]
]

{ #category : #'accessing attributes' }
PDFObject >> attributeIsRequiredIf: anAttributePragma [
	"<Boolean>
	true if the attribute argument is present"

	^(self tagsIn: anAttributePragma method withSelector: #requiredIf:) anySatisfy: [:attribute |
		self hasKey: attribute arguments first]
]

{ #category : #'accessing attributes' }
PDFObject >> attributeIsUnconditionallyRequired: anAttributePragma [
	^self hasTag: #required in: anAttributePragma method
]

{ #category : #typing }
PDFObject >> attributeTypesAt: anAttributeSymbol [
	"<Array of: AttributeType>
	the declared types of attribute anAttributeSymbol"

	^self subclassResponsibility
]

{ #category : #'accessing attributes' }
PDFObject >> attributeVersion: anAttributePragma [
	"<Version>"

	^self class pdfVersion max: ((self pdfVersionOf: anAttributePragma method) max: (self attributeHighestConditionalVersion: anAttributePragma))
]

{ #category : #'accessing attributes' }
PDFObject >> attributesRequired [
	"<Collection of: Pragma>"

	^self sortedAttributePragmas select: [:pragma | self attributeIsRequired: pragma]
]

{ #category : #accessing }
PDFObject >> content [
	"<Core.Object>
	the Smalltalk object for the value I represent"

	^content
]

{ #category : #copying }
PDFObject >> copy [
	^self class on: self content
]

{ #category : #tracing }
PDFObject >> copyWithNewReferences [
	"<PDFObject>"

	^self copyWithNewReferencesIn: IdentityDictionary new
]

{ #category : #testing }
PDFObject >> hasKey: aSymbolOrInteger [
	"<Boolean>
	true, if the receiver has aSymbolOrInteger as accessor for #at:"

	^self subclassResponsibility
]

{ #category : #testing }
PDFObject >> hasRequiredAttributes [
	"<Boolean>"

	^self subclassResponsibility
]

{ #category : #'accessing attributes' }
PDFObject >> hasTag: aSymbol in: aMethod [
	aMethod attributeMessages ifNotNil: [:messages |
		^messages anySatisfy: [:message | message selector = aSymbol]].
	^false
]

{ #category : #comparing }
PDFObject >> hash [
	^self content hash
]

{ #category : #'initialize-release' }
PDFObject >> initializeContent: aSmalltalkObject [
	content := aSmalltalkObject
]

{ #category : #testing }
PDFObject >> isEmpty [
	^self content isEmpty
]

{ #category : #testing }
PDFObject >> notEmpty [
	^self isEmpty not
]

{ #category : #accessing }
PDFObject >> objectAt: aSymbolOrInteger [
	"<PDF.Object>
	returns the object stored in a slot or the value of a Reference"

	^(self at: aSymbolOrInteger) pdfObject
]

{ #category : #'accessing attributes' }
PDFObject >> pdfVersionOf: aMethod [
	"<Version>"

	| tag |
	tag := self tagAt: #version:dot: in: aMethod ifAbsent: [
		^PtVersion pdf1_0].
	^PtVersion major: tag arguments first minor: tag arguments last
]

{ #category : #'accessing attributes' }
PDFObject >> sortedAttributePragmas [
	"<OrderedCollection of: Pragma>"

	^self subclassResponsibility
]

{ #category : #'accessing attributes' }
PDFObject >> tagAt: aSymbol in: aMethod ifAbsent: aBlock [
	"<Message>"

	^aMethod attributeMessages detect: [:message | message selector = aSymbol] ifNone: aBlock
]

{ #category : #'accessing attributes' }
PDFObject >> tagsIn: aMethod withSelector: aSymbol [
	^aMethod attributeMessages select: [:attribute | attribute selector = aSymbol]
]

{ #category : #tracing }
PDFObject >> tracedReferences [
	"<Array of: Reference>
	The set is used for fast detection of already visited references.
	The list collects all references depth-first in a reproducible order"

	| set list |
	set := IdentitySet new.
	list := OrderedCollection new.
	self tracedReferences: set do: [:ref | list add: ref].
	^list asArray
]
