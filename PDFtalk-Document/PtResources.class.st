"
PDF Catalog as defined in PDF 32000_2008.pdf pp. 82.

The operands supplied to operators in a content stream shall only be direct objects; indirect objects and object references shall not be permitted.
In some cases, an operator shall refer to a PDF object that is defined outside the content stream, such as a font dictionary or a stream containing image data.
This shall be accomplished by defining such objects as named resources and referring to them by name from within the content stream.

Named resources shall be meaningful only in the context of a content stream.
The scope of a resource name shall be local to a particular content stream and shall be unrelated to externally known identifiers for objects such as fonts.
References from one object outside of content streams to another outside of content streams shall be made by means of indirect object references rather than named resources.

A content stream’s named resources shall be defined by a resource dictionary, which shall enumerate the named resources needed by the operators in the content stream and the names by which they can be referred to.
"
Class {
	#name : #PtResources,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtResources class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Resources
		supertype: #Dictionary
		section: '7.8.3'
		documentation: 'The operands supplied to operators in a content stream shall only be direct objects; indirect objects and object references shall not be permitted.
In some cases, an operator shall refer to a PDF object that is defined outside the content stream, such as a font dictionary or a stream containing image data.
This shall be accomplished by defining such objects as named resources and referring to them by name from within the content stream.

Named resources shall be meaningful only in the context of a content stream.
The scope of a resource name shall be local to a particular content stream and shall be unrelated to externally known identifiers for objects such as fonts.
References from one object outside of content streams to another outside of content streams shall be made by means of indirect object references rather than named resources.

A content stream’s named resources shall be defined by a resource dictionary, which shall enumerate the named resources needed by the operators in the content stream and the names by which they can be referred to.'
]

{ #category : #'accessing entries' }
PtResources >> ColorSpace [
	<typeDictionaryOf: #ColourSpace>
	<attribute: 2 documentation: 'A dictionary that maps each resource name to either the name of a device-dependent colour space or an array describing a colour space.'>
	^self objectAt: #ColorSpace ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtResources >> ExtGState [
	<typeDictionaryOf: #ExtGState>
	<attribute: 1 documentation: 'A dictionary that maps resource names to graphics state parameter dictionaries.'>
	^self objectAt: #ExtGState ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtResources >> Font [
	<typeDictionaryOf: #Font>
	<attribute: 6 documentation: 'A dictionary that maps resource names to font dictionaries.'>
	^self objectAt: #Font ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtResources >> Pattern [
	<type: #Dictionary>
	<attribute: 3 documentation: 'A dictionary that maps resource names to pattern objects.'>
	^self objectAt: #Pattern ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtResources >> ProcSet [
	<typeArrayOf: #Name>
	<attribute: 7 documentation: 'An array of predefined procedure set names.'>
	^self objectAt: #ProcSet ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtResources >> Properties [
	"<typeDictionaryOf: #OptionalContentGroup>"
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 8 documentation: 'A dictionary that maps resource names to property list dictionaries for marked content.'>
	^self objectAt: #Properties ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtResources >> Shading [
	<typeDictionaryOf: #Shading>
	<version: 1 dot: 3>
	<attribute: 4 documentation: 'A dictionary that maps resource names to shading dictionaries.'>
	^self objectAt: #Shading ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtResources >> XObject [
	<typeDictionaryOf: #XObject>
	<attribute: 5 documentation: 'A dictionary that maps resource names to external objects.'>
	^self objectAt: #XObject ifAbsent: [PtPDF Dictionary new]
]

{ #category : #accessing }
PtResources >> fonts [
	"<Dictionary of: Fonts>"

	^self at: #Font ifAbsentPut: [PtPDF Dictionary empty]
]

{ #category : #accessing }
PtResources >> idFor: aResourceObject [
	"<Symbol>
	find the resource ID for aResourceObject.
	If it is not there, add a reference to aResourceObject with a new ID.
	aResourceObject knows which resource directory to use and how to name the IDs"

	| resourceDictionary newId |
	resourceDictionary := self resourceDictionaryFor: aResourceObject.
	resourceDictionary keysAndValuesDo: [:key :value |
		value pdfObject = aResourceObject ifTrue: [
			^key]].
	newId := self newIdFor: aResourceObject in: resourceDictionary.
	resourceDictionary at: newId put: aResourceObject newReference.
	^newId
]

{ #category : #accessing }
PtResources >> newIdFor: aResourceObject in: aResourceDictionary [
	"<Symbol>
	our IDs start with 1 (not with 0 like Illustrator)"

	| prefix existingObjects |
	prefix := aResourceObject class resourcePrefix.
	existingObjects := aResourceDictionary keys select: [:key |
		prefix , '*' match: key ignoreCase: false].
	^(prefix , (existingObjects size + 1) printString) asSymbol
]

{ #category : #accessing }
PtResources >> resourceDictionaryFor: aResourceObject [
	"<Dictionary>"

	^(self at: aResourceObject class resourceType ifAbsentPut: [PtPDF Dictionary empty]) pdfObject
]
