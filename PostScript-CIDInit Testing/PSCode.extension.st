Extension { #name : #PSCode }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCode class >> example [
	^PSCode bytes: #[42]
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCode class >> example2 [
	^PSCode bytes: #[00 42]
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCode class >> example3 [
	^PSCode bytes: #[12 00 42]
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCode class >> example4 [
	^PSCode bytes: #[255 12 00 42]
]
