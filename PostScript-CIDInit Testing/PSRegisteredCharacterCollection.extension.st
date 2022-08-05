Extension { #name : #PSRegisteredCharacterCollection }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSRegisteredCharacterCollection class >> example [
	^PSRegisteredCharacterCollection registry: 'Adobe' ordering: 'Japan1' supplement: 1
]
