Class {
	#name : #PSObjectTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #tests }
PSObjectTests >> testProcedures [
	self assert: (PSProcedure source: 'pop pop') printString = '{pop pop}'.
	self assert: 'pop pop' asProcedure printString = '{pop pop}'
]
