Extension { #name : #SequenceableCollection }

{ #category : #'*Values-printing' }
SequenceableCollection >> printvalueWith: printer [
	self isLiteral ifTrue: [
		^LiteralPrintvalue string: self printString].
	^ArrayPrintvalue arguments: (self collect: [:item | item printvalueWith: printer])
]
