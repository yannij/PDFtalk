Extension { #name : #PSNotdefMappings }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSNotdefMappings class >> example [
	^self
		fromMappings: (Array
			with: (PSCode bytes: #[255]) --> 1
			with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[31])) --> 1)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))
]
