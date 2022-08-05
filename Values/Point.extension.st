Extension { #name : #Point }

{ #category : #'*Values-printing' }
Point >> printvalueWith: printer [
	| string |
	string := (self x asSourceFor: printer target) , ' @ ' , (self y asSourceFor: printer target).
	^LiteralPrintvalue string: string
]
