Extension { #name : #ColorValue }

{ #category : #'*Values-testing' }
ColorValue >> isEmpty [
	^self privateRGB isNil
]
