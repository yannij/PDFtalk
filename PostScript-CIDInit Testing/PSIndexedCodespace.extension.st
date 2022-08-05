Extension { #name : #PSIndexedCodespace }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSIndexedCodespace class >> example [
	^PSIndexedCodespace
		range: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255]))
		codespaces: ((Array new: 256)
			at: 172 put: PSByteCodespace example;
			yourself)
]
