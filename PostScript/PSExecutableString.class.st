"
PostScript string with the executable attribute = true
"
Class {
	#name : #PSExecutableString,
	#superclass : #PSObjectWrapper,
	#category : #PostScript
}

{ #category : #converting }
PSExecutableString >> asPostScripName [
	"<Symbol | nil>"

	^self object asSymbol
]

{ #category : #converting }
PSExecutableString >> asPostScriptLiteral [
	^self object
]

{ #category : #actions }
PSExecutableString >> doIn: aPostScriptInterpreter [
	| scanner |
	aPostScriptInterpreter executionStack push: self.
	scanner := PSScanner on: self object.
	[scanner atEnd] whileFalse: [
		scanner nextPostScriptObject processIn: aPostScriptInterpreter].
	aPostScriptInterpreter executionStack pop
]

{ #category : #accessing }
PSExecutableString >> postScriptType [
	^#stringtype
]

{ #category : #printing }
PSExecutableString >> printOn: stream [
	self object printOn: stream
]
