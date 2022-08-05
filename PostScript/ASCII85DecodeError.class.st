"
Error during ASCII85 decoding
"
Class {
	#name : #ASCII85DecodeError,
	#superclass : #Error,
	#category : #PostScript
}

{ #category : #signalling }
ASCII85DecodeError class >> raiseSignal [
	^self signal
]

{ #category : #signalling }
ASCII85DecodeError class >> raiseSignal: aString [
	^self signal: aString
]

{ #category : #signalling }
ASCII85DecodeError >> raiseSignal [
	^self signal
]

{ #category : #signalling }
ASCII85DecodeError >> raiseSignal: aString [
	^self signal: aString
]
