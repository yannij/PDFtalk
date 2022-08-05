Extension { #name : #PSRangeMapping }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSRangeMapping class >> example [
	^(PSRange first: (PSCode bytes: #[0 0]) last: (PSCode bytes: #[0 55])) --> 42
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSRangeMapping class >> exampleNames [
	^(PSRange first: (PSCode bytes: #[0 50]) last: (PSCode bytes: #[0 55])) --> #(#yen #one #two #a #A #quotesingle)
]
