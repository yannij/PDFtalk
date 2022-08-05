Extension { #name : #Character }

{ #category : #'*PostScript-testing' }
Character >> isPostScriptWhitespace [
	^#(0 9 10 12 13 32) includes: self asInteger
]
