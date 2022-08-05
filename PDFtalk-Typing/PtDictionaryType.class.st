"
This type matches a uniform dictionary of attribute values of the same type.

The values of the dictionary are checked and specialized with the type

"
Class {
	#name : #PtDictionaryType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #testing }
PtDictionaryType >> isForDictionary [
	^true
]

{ #category : #accessing }
PtDictionaryType >> name [
	^'<<' , self type name asString , '>>'
]

{ #category : #typing }
PtDictionaryType >> specializedDictionary: aPDFDictionary [
	| elementType dict |
	elementType := self asObjectType.
	dict := PtPDF Dictionary new.
	aPDFDictionary keys do: [:key |
		dict
			at: key
			put: (((aPDFDictionary at: key) asType: elementType) ifNil: [
				^nil])].
	^dict
]

{ #category : #testing }
PtDictionaryType >> specifiesDictionary: aPDFDictionary [
	"elements can be direct or indirect"

	| elementType |
	elementType := self asObjectType.
	^aPDFDictionary values allSatisfy: [:element | element compliesTo: elementType]
]

{ #category : #testing }
PtDictionaryType >> specifiesReference: aPDFReference [
	^aPDFReference referent compliesTo: self
]

{ #category : #typing }
PtDictionaryType >> typedDictionary: aPDFDictionary [
	"<PDF.Dictionary>
	a copy of aPDFDictionary with the values specialized according to the pdfType"

	| contentCopy |
	contentCopy := Valuemap new: aPDFDictionary size.
	aPDFDictionary content keysAndValuesDo: [:key :value |
		contentCopy at: key put: (value typed: (Array with: self asObjectType))].
	^aPDFDictionary class on: contentCopy
]
