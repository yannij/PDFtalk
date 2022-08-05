"
PostScript error
"
Class {
	#name : #PSPostScriptError,
	#superclass : #Error,
	#category : #PostScript
}

{ #category : #signalling }
PSPostScriptError class >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PSPostScriptError class >> raiseSignal: aString [
	^self signal: aString
]

{ #category : #signalling }
PSPostScriptError >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PSPostScriptError >> raiseSignal: aString [
	^self signal: aString
]
