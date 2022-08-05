"
The definition of a PDF type represented by a Smalltalk class

A Smalltalk class representing a PDF type declares the type with an object of this class.
The type definition is accessed by the #pdfTypeDefinition class method which returns a PDFTypeDefinition instance.

The PDF type hierarchy is a tree similar to but independent of the Smalltalk class hierarchy.
"
Class {
	#name : #PDFTypeDefinition,
	#superclass : #Value,
	#instVars : [
		'name',
		'supertype',
		'version',
		'section',
		'documentation'
	],
	#category : #'PDFtalk-Typing'
}

{ #category : #specification }
PDFTypeDefinition class >> localSpecification [
	<constant: #name class: #Symbol comment: 'The name of the PDF type.
	It is used in the type declarations of attributes.
	The name should be identical or close to the name in the PDF specification.
	A name should begin with a capital letter.'>
	<constant: #supertype class: #Symbol comment: 'The type name of the PDF supertype.
	The supertype of top level types is nil.'>
	<sequence: #version comment: 'The version in which the type was introduced in PDF.
	Array with two integers: major and minor, i.e. #(1 6) is PDF version 1.6.'>
	<constant: #section class: #String comment: 'The section of the PDF specification where the type is defined.
	A string with numbers separated by a period: like ''12.5.6.19'' or ''7.3.2''.
	This allows the PDF specification to be opened on the documentation of the type.'>
	<constant: #documentation class: #String comment: 'A short description of the type.
	Usually derived from the first paragraph from the PDF specification.'>
]

{ #category : #'instance creation optional' }
PDFTypeDefinition class >> name: nameSymbol supertype: supertypeSymbol section: sectionString documentation: documentationString [
	^self
		name: nameSymbol
		supertype: supertypeSymbol
		version: nil
		section: sectionString
		documentation: documentationString
]

{ #category : #'instance creation' }
PDFTypeDefinition class >> name: nameSymbol supertype: supertypeSymbol version: versionArray section: sectionString documentation: documentationString [
	| inst |
	inst := self new.
	inst
		initializeName: nameSymbol
		supertype: supertypeSymbol
		version: versionArray
		section: sectionString
		documentation: documentationString.
	^inst
]

{ #category : #accessing }
PDFTypeDefinition >> documentation [
	"<ByteString>
	A short description of the type.
	Usually derived from the first paragraph from the PDF specification."

	^documentation
]

{ #category : #'initialize-release' }
PDFTypeDefinition >> initializeName: nameSymbol supertype: supertypeSymbol version: versionArray section: sectionString documentation: documentationString [
	name := nameSymbol.
	supertype := supertypeSymbol.
	(versionArray notNil and: [
	versionArray notEmpty]) ifTrue: [
			version := (Array withAll: versionArray) beImmutable].
	section := sectionString.
	documentation := documentationString.
	self beImmutable
]

{ #category : #accessing }
PDFTypeDefinition >> name [
	"<Symbol>
	The name of the PDF type.
	It is used in the type declarations of attributes.
	The name should be identical or close to the name in the PDF specification.
	A name should begin with a capital letter."

	^name
]

{ #category : #accessing }
PDFTypeDefinition >> pdfVersion [
	self version isEmpty ifTrue: [
		^PtVersion pdf1_0].
	^PtVersion major: self version first minor: self version last
]

{ #category : #printing }
PDFTypeDefinition >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'supertype' value: self supertype).
	args add: (printer array: 'version' value: self version).
	args add: (printer constant: 'section' value: self section).
	args add: (printer constant: 'documentation' value: self documentation).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PDFTypeDefinition >> section [
	"<ByteString>
	The section of the PDF specification where the type is defined.
	A string with numbers separated by a period: like '12.5.6.19' or '7.3.2'.
	This allows the PDF specification to be opened on the documentation of the type."

	^section
]

{ #category : #accessing }
PDFTypeDefinition >> supertype [
	"<Symbol>
	The type name of the PDF supertype.
	The supertype of top level types is nil."

	^supertype
]

{ #category : #accessing }
PDFTypeDefinition >> version [
	"<Array>
	The version in which the type was introduced in PDF.
	Array with two integers: major and minor, i.e. #(1 6) is PDF version 1.6."

	^version ifNil: [#()]
]
