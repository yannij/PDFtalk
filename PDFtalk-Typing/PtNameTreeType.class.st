"
This type matches a NameTree with values of a specific type.

The elements of the NameTree are checked and specialized with the type

"
Class {
	#name : #PtNameTreeType,
	#superclass : #PtDictionaryType,
	#category : #'PDFtalk-Typing'
}

{ #category : #accessing }
PtNameTreeType >> name [
	^'NameTree(' , self type name asString , ')'
]

{ #category : #testing }
PtNameTreeType >> specifiesDictionary: aPDFDictionary [

	| elementType |
	elementType := self asObjectType.
	^(aPDFDictionary elements collect: #value)
		allSatisfy: [:element | element compliesTo: elementType]
]

{ #category : #typing }
PtNameTreeType >> typedDictionary: aPDFDictionary [
	| contentCopy isValue |
	contentCopy := aPDFDictionary content copy.
	(aPDFDictionary hasKey: #Kids) ifTrue: [
		contentCopy
			at: #Kids
			put: ((aPDFDictionary at: #Kids) content collect: [:element |
				element typed: (Array with: self)]).
		^(PtPDF classAt: #NameTree) nodeClass on: contentCopy].
	isValue := false.
	contentCopy
		at: #Names
		put: ((aPDFDictionary at: #Names) content collect: [:element |
			| e |
			e := isValue
				ifTrue: [element typed: (Array with: self asObjectType)]
				ifFalse: [element].
			isValue := isValue not.
			e]).
	^(PtPDF classAt: #NameTree) leafClass on: contentCopy
]
