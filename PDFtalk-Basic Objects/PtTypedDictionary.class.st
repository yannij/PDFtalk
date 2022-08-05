"
Super class of all dictionaries with a 'Type' key
"
Class {
	#name : #PtTypedDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtTypedDictionary class >> empty [
	| inst |
	inst := super empty.
	inst at: #Type put: self type.
	^inst
]

{ #category : #testing }
PtTypedDictionary class >> isClassForDictionary: aDictionary [
	| typeEntry |
	typeEntry := aDictionary at: #Type ifAbsent: [
		^false].
	^self type asPDF = typeEntry
]

{ #category : #'accessing entries' }
PtTypedDictionary >> Type [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.

The value of the Type entry can almost always be inferred from context.
The value of an entry in a page''s font resource dictionary, for example, shall be a font object;
therefore, the Type entry in a font dictionary serves primarily as documentation and as information for error checking.
The Type entry shall not be required unless so stated in its description; however, if the entry is present, it shall have the correct value.
In addition, the value of the Type entry in any dictionary, even in private data, shall be either a name defined in this standard or a registered name.'>
	^self objectAt: #Type
]

{ #category : #accessing }
PtTypedDictionary >> attributesRequired [
	^self sortedAttributePragmas select: [:pragma |
		pragma selector == #Type or: [
		self attributeIsRequired: pragma]]
]

{ #category : #accessing }
PtTypedDictionary >> topClassLevel [
	^4
]
