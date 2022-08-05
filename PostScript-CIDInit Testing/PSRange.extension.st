Extension { #name : #PSRange }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSRange class >> example [
	^PSRange first: (PSCode bytes: #[0 0]) last: (PSCode bytes: #[255 255])
]
