Class {
	#name : #PSPostScriptTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #testing }
PSPostScriptTests >> testAddDiv [
	self assert: (PSInterpreter run: '40 60 add 2 div') printString = '|| 50 <'
]

{ #category : #testing }
PSPostScriptTests >> testAverage [
	self assert: (PSInterpreter run: '
	/average {add 2 div} def
	40 60 average') printString = '|| 50 <'
]

{ #category : #testing }
PSPostScriptTests >> testPrintRadix [
	self assert: (0 printPostScriptRadix: 16) = '0'.
	self assert: (10 printPostScriptRadix: 16) = 'A'.
	self assert: (20 printPostScriptRadix: 32) = 'K'.
	self assert: (10 printPostScriptRadix: 8) = '12'.
	self assert: (9999 printPostScriptRadix: 16) = '270F'.
]
