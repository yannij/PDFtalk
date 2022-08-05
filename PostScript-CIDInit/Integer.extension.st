Extension { #name : #Integer }

{ #category : #'*PostScript-CIDInit-converting' }
Integer >> mappingFrom: aMappingSource [
	^aMappingSource mappingToInteger: self
]

{ #category : #'*PostScript-CIDInit-converting' }
Integer >> mappingsFrom: aMappingSource [
	^Array with: (self mappingFrom: aMappingSource)
]

{ #category : #'*PostScript-CIDInit-accessing' }
Integer >> psMappedCharacter [
	"<Character>"

	^self asCharacter
]
