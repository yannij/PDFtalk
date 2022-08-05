Extension { #name : #Class }

{ #category : #'*Values-accessing' }
Class >> nameRelativeTo: targetClass [
	"<String>"
	"self nameRelativeTo: Object"
	"there are no namespaces in Pharo"

	^self name asString
]
