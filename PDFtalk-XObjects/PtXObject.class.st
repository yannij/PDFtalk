"
PDF External Objects as defined in PDF 32000_2008.pdf, section 8.8, pp. 201.

An external object (commonly called an XObject) is a graphics object whose contents are defined by a self-contained stream, 
separate from the content stream in which it is used. 
There are three types of external objects:
	•	An image XObject represents a sampled visual image such as a photograph.
	•	A form XObject is a self-contained description of an arbitrary sequence of graphics objects.
	•	A PostScript XObject contains a fragment of code expressed in the PostScript page description language. 
		PostScript XObjects should not be used.

Two further categories of external objects, group XObjects and reference XObjects (both PDF 1.4), 
are actually specialized types of form XObjects with additional properties.

Any XObject can be painted as part of another content stream by means of the Do operator. 
This operator applies to any type of XObject—image, form, or PostScript. 
The syntax is the same in all cases, although details of the operator’s behaviour differ depending on the type.
"
Class {
	#name : #PtXObject,
	#superclass : #PDFStream,
	#category : #'PDFtalk-XObjects'
}

{ #category : #'instance creation' }
PtXObject class >> empty [
	| inst |
	inst := self new.
	inst at: #Subtype put: self subtype.
	^inst
]

{ #category : #testing }
PtXObject class >> isClassForStream: aStream [
	| subtypeEntry |
	self == (PtPDF classAt: #XObject) ifTrue: [
		^super isClassForStream: aStream].
	subtypeEntry := aStream at: #Subtype ifAbsent: [
		^false].
	^self subtype asPDF = subtypeEntry
]

{ #category : #accessing }
PtXObject class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #XObject
		supertype: #Stream
		section: '8.8'
		documentation: 'An external object (commonly called an XObject) is a graphics object whose contents are defined by a self-contained stream, 
separate from the content stream in which it is used. 
There are three types of external objects:
	•	An image XObject represents a sampled visual image such as a photograph.
	•	A form XObject is a self-contained description of an arbitrary sequence of graphics objects.
	•	A PostScript XObject contains a fragment of code expressed in the PostScript page description language. 
		PostScript XObjects should not be used.

Two further categories of external objects, group XObjects and reference XObjects (both PDF 1.4), 
are actually specialized types of form XObjects with additional properties.

Any XObject can be painted as part of another content stream by means of the Do operator. 
This operator applies to any type of XObject—image, form, or PostScript. 
The syntax is the same in all cases, although details of the operator’s behaviour differ depending on the type.'
]

{ #category : #accessing }
PtXObject class >> resourcePrefix [
	"<String>
	the prefix for ids in /Resources"

	^self subclassResponsibility
]

{ #category : #accessing }
PtXObject class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#XObject
]

{ #category : #accessing }
PtXObject class >> subtype [
	"<Symbol>
	subtype entry"

	^self name
]

{ #category : #accessing }
PtXObject class >> type [
	^#XObject
]

{ #category : #'accessing entries' }
PtXObject >> Subtype [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'The type of XObject that this dictionary describes.'>
	^self objectAt: #Subtype ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtXObject >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes; if present, shall be XObject.'>
	^self objectAt: #Type ifAbsent: [#XObject asPDF]
]

{ #category : #actions }
PtXObject >> addProcSetTo: aRenderer [
	"do nothing"
]
