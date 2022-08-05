Extension { #name : #Color }

{ #category : #'*Values-converting' }
Color >> asColorValue [
	^ColorValue red: self red green: self green blue: self blue
]
