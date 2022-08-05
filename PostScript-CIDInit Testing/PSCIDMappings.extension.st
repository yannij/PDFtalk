Extension { #name : #PSCIDMappings }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCIDMappings class >> example [
	^self
		fromMappings: (Array
			with: (PSCode bytes: #[0 0 0 160]) --> 1
			with: (PSCode bytes: #[0 0 0 161]) --> 22480
			with: (PSCode bytes: #[0 0 0 169]) --> 100
			with: (PSCode bytes: #[0 0 0 170]) --> 22484) , (Array
				with: (PSRange first: (PSCode bytes: #[0 0 0 32]) last: (PSCode bytes: #[0 0 0 126])) --> 1
				with: (PSRange first: (PSCode bytes: #[0 0 0 162]) last: (PSCode bytes: #[0 0 0 165])) --> 96
				with: (PSRange first: (PSCode bytes: #[0 0 0 166]) last: (PSCode bytes: #[0 0 0 168])) --> 22481
				with: (PSRange first: (PSCode bytes: #[0 0 0 171]) last: (PSCode bytes: #[0 0 0 172])) --> 11878)
		in: (Array with: ((PSCode bytes: #[0 0 0 0]) to: (PSCode bytes: #[255 255 255 255])))
]
