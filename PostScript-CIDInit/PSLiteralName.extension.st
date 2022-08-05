Extension { #name : #PSLiteralName }

{ #category : #'*PostScript-CIDInit-converting' }
PSLiteralName >> mappingFrom: aCode [
	^aCode mappingToName: self
]

{ #category : #'*PostScript-CIDInit-converting' }
PSLiteralName >> mappingsFrom: aMappingSource [
	^Array with: (self mappingFrom: aMappingSource)
]

{ #category : #'*PostScript-CIDInit-accessing' }
PSLiteralName >> psMappedCharacter [
	"<Character>"

	^self psUnicode asCharacter
]

{ #category : #'*PostScript-CIDInit-accessing' }
PSLiteralName >> psUnicode [
	"<Integer | nil>"

	^PSCharacterNames unicodeNamed: self object
]
