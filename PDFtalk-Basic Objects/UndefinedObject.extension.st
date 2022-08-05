Extension { #name : #UndefinedObject }

{ #category : #'*PDFtalk-Basic Objects-testing' }
UndefinedObject >> canBeExemplarOf: aType [ 
	^false
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
UndefinedObject class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Null
		supertype: #Object
		section: '7.3.9'
		documentation: 'The null object has a type and value that are unequal to those of any other object.
There shall be only one object of type null, denoted by the keyword null.
An indirect object reference to a nonexistent object shall be treated the same as a null object.
Specifying the null object as the value of a dictionary entry shall be equivalent to omitting the entry entirely.'
]

{ #category : #'*PDFtalk-Basic Objects-typing' }
UndefinedObject >> typed: listOfAttributeTypes [
	"<nil | TypeMismatch>
	when there are no arguments, nil is returned,
	otherwise, nil does not match any types"

	(listOfAttributeTypes isEmpty or: [
	listOfAttributeTypes anySatisfy: [:type | self compliesTo: type]]) ifTrue: [
			^self].
	^self errorWrongTypes: listOfAttributeTypes
]

{ #category : #'*PDFtalk-Basic Objects-writing' }
UndefinedObject >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutAll: 'null' asByteArray
]
