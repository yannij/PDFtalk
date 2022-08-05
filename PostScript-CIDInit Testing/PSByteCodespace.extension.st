Extension { #name : #PSByteCodespace }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSByteCodespace class >> example [
	^PSByteCodespace
		range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
		mappings: (Array
			with: (PSCode bytes: #[31]) --> 10
			with: ((PSCode bytes: #[32]) to: (PSCode bytes: #[126])) --> 32)
]
