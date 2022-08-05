"
Super class of PDF tests.
Useful for switching between SUnit and SUnitToo.
"
Class {
	#name : #PtTests,
	#superclass : #TestCase,
	#category : #'PDFtalk-test resources'
}

{ #category : #evaluating }
PtTests >> evaluate: sourceString [
	^Compiler evaluate: sourceString for: nil in: self class environment notifying: nil logged: false
]

{ #category : #accessing }
PtTests >> stringLf [
	^String with: Character lf
]
