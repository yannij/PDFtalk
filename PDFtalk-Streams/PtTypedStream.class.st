"
Super class of all streams with a /Type key
"
Class {
	#name : #PtTypedStream,
	#superclass : #PDFStream,
	#category : #'PDFtalk-Streams'
}

{ #category : #'instance creation' }
PtTypedStream class >> empty [
	| inst |
	inst := self new.
	inst at: #Type put: self type.
	^inst
]

{ #category : #'accessing entries' }
PtTypedStream >> Type [
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
PtTypedStream >> attributesRequired [
	^self sortedAttributePragmas select: [:pragma |
		pragma selector == #Type or: [
		self attributeIsRequired: pragma]]
]
