Extension { #name : #Array }

{ #category : #'*PostScript-testing' }
Array >> postScriptEqual: otherCollection [ 
	"Other composite objects (arrays and dictionaries) are equal only if they share the same value.
	Separate values are considered unequal, even if all the components of those values are the same."

	^self == otherCollection
]
