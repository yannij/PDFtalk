Extension { #name : #Time }

{ #category : #'*Values-instance creation' }
Time class >> h: hoursInteger [
	^self h: hoursInteger m: 0 s: 0
]

{ #category : #'*Values-instance creation' }
Time class >> h: hoursInteger m: minutesInteger [
	^self h: hoursInteger m: minutesInteger s: 0
]

{ #category : #'*Values-instance creation' }
Time class >> h: hoursInteger m: minutesInteger s: secondsInteger [
	^self hour: hoursInteger minute: minutesInteger second: secondsInteger
]

{ #category : #'*Values-printing' }
Time >> printvalueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 25).
	(self hours isZero and: [
	self minutes isZero and: [
	self seconds isZero]]) ifTrue: [
			wst
				nextPutAll: (printer classnameOf: self);
				nextPutAll: ' zero'.
			^LiteralPrintvalue string: wst contents].
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' h: ';
		nextPutAll: self hours printString.
	(self minutes isZero and: [
	self seconds isZero]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' m: ';
		nextPutAll: self minutes printString.
	self seconds isZero ifTrue: [
		wst nextPut: $).
		^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' s: ';
		nextPutAll: self seconds printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]

{ #category : #'*Values-instance creation' }
Time class >> zero [
	^self h: 0
]
