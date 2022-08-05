"
VisualWorks class
"
Class {
	#name : #Timestamp,
	#superclass : #DateAndTime,
	#category : #Values
}

{ #category : #'*Values-instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger [
	^self d: dayInteger m: monthInteger y: yearInteger h: 0 m: 0 s: 0
]

{ #category : #'*Values-instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger [
	^self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: 0 s: 0
]

{ #category : #'*Values-instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger [
	^self d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: 0
]

{ #category : #'*Values-instance creation' }
Timestamp class >> d: dayInteger m: monthInteger y: yearInteger h: hoursInteger m: minutesInteger s: secondsInteger [
	^self
		year: yearInteger
		month: monthInteger
		day: dayInteger
		hour: hoursInteger
		minute: minutesInteger
		second: secondsInteger
]

{ #category : #'*Values-instance creation' }
Timestamp class >> fromDate: aDate andTime: aTime [
	^self date: aDate time: aTime
]

{ #category : #'*Values-printing' }
Timestamp >> printvalueWith: printer [
	| wst |
	wst := WriteStream on: (String new: 50).
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' d: ';
		nextPutAll: self dayOfMonth printString;
		nextPutAll: ' m: ';
		nextPutAll: self month printString;
		nextPutAll: ' y: ';
		nextPutAll: self year printString.
	(self hour isZero and: [
	self minute isZero and: [
	self second isZero]]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' h: ';
		nextPutAll: self hour printString.
	(self minute isZero and: [
	self second isZero]) ifTrue: [
			wst nextPut: $).
			^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' m: ';
		nextPutAll: self minute printString.
	self second isZero ifTrue: [
		wst nextPut: $).
		^LiteralPrintvalue string: wst contents].
	wst
		nextPutAll: ' s: ';
		nextPutAll: self second printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]
