Class {
	#name : #ValueTest,
	#superclass : #TestCase,
	#category : #'Values-Testing'
}

{ #category : #testing }
ValueTest >> testIsEmpty [
	self
		assert: Value new isEmpty;
		deny: Value new notEmpty
]

{ #category : #testing }
ValueTest >> testIsEqualValue [
	self
		assert: (1 isEqualValue: 1);
		assert: (1 isEqualValue: 1.0);
		assert: (ColorValue red isEqualValue: (ColorValue fromBytesRed: 255 green: 0 blue: 0));
		assert: ((Dictionary with: #a -> $a with: #b -> $b) isEqualValue: (Dictionary with: #b -> $b with: #a -> $a));
		deny: ((Valuemap with: #a -> $a with: #b -> $b) isEqualValue: (Valuemap with: #b -> $b with: #a -> $a))
]
