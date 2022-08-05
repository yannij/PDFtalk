Extension { #name : #Rectangle }

{ #category : #'*Values-printing' }
Rectangle >> printvalueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (self origin asSourceFor: printer target);
		nextPutAll: ' corner: ';
		nextPutAll: (self corner asSourceFor: printer target);
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]
