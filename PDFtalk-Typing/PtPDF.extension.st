Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> allObjectClasses [
	^Object allSubclasses reject: #isMeta
]

{ #category : #'*PDFtalk-Typing-accessing type classes' }
PtPDF class >> classAt: aSymbol [
	"<PDFType implementation class | nil>"
	
	^(self typeAt: aSymbol) ifNotNil: [:type | type implementingClass]
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> newTypeHierarchy [
	"<IdentityDictionary key: Symbol value: Type>"

	| typesDict |
	typesDict := self newTypesDictionary.
	typesDict values do: [:type |
		type supertypeName ifNotNil: [:supertypeName |
			| supertype |
			supertype := typesDict at: supertypeName ifAbsent: [
				^self error: 'PDF type /' , supertypeName , ' is not defined'].
			type supertype: supertype]].
	^typesDict
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> newTypesDictionary [
	"<IdentityDictionary key: Symbol value: Type>"

	| typesDict |
	typesDict := self typesDictionaryClass new.
	((self allObjectClasses select: #isPDFType) collect: #newPDFTypeOfClass) do: [:type |
		typesDict at: type name put: type].
	^typesDict
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> pdfTypeDefinition [
	"Defines the PDF type of a Smalltalk class.
	#pdfType is a special method used to construct the PDF type hierarchy.
	ALL #pdfType methods shall only construct and return a PDFType object.
	In order to do so, ALL implementers of #pdfType are collected, evaluated and sorted into the type hierarchy.
	Therefore, none of the #pdfType methods shall have any side effects.
	This allows to define a PDF object class independent of the Smalltalk class hierarchy."

	^PDFTypeDefinition
		name: #Object
		supertype: nil
		section: '7.3'
		documentation: 'PDF includes eight basic types of objects: Boolean values, Integer and Real numbers, Strings, Names, Arrays, Dictionaries, Streams, and the null object.'
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> typeAt: aSymbol [
	"<Type | nil>"

	^self types at: aSymbol ifAbsent: [nil]
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> types [
	"<IdentityDictionary key: Symbol value: Type>
	all classes representing a type of pdf object"

	^types ifNil: [types := self newTypeHierarchy]
]

{ #category : #'*PDFtalk-Typing-accessing' }
PtPDF class >> typesDictionaryClass [
	"refactored out to replace it in Gemstone"

	^IdentityDictionary
]
