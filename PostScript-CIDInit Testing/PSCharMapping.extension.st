Extension { #name : #PSCharMapping }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCharMapping class >> example [
	^(PSCode bytes: #[42]) --> 86
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCharMapping class >> exampleName [
	^(PSCode bytes: #[42]) --> #yen
]
