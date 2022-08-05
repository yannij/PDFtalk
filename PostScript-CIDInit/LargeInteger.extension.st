Extension { #name : #LargeInteger }

{ #category : #'*PostScript-CIDInit-accessing' }
LargeInteger >> psMappedCharacter [
	"LargeIntegers cannot be mapped to Characters"

	^Character illegalCode asCharacter
]
