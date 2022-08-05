Extension { #name : #Duration }

{ #category : #'*Values-converting' }
Duration >> asNanoseconds [
	^self asNanoSeconds
]

{ #category : #'*Values-instance creation' }
Duration class >> nanoseconds: aNumber [
	^self nanoSeconds: aNumber
]

{ #category : #'*Values-printing' }
Duration >> printvalueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' nanoseconds: ';
		nextPutAll: self asNanoseconds printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]
