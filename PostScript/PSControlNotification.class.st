"
Notifies the PostScript interpreter about the flow of control
"
Class {
	#name : #PSControlNotification,
	#superclass : #Notification,
	#category : #PostScript
}

{ #category : #signalling }
PSControlNotification class >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PSControlNotification class >> raiseSignal: aString [
	^self signal: aString
]

{ #category : #signalling }
PSControlNotification >> raiseSignal [
	^self signal
]

{ #category : #signalling }
PSControlNotification >> raiseSignal: aString [
	^self signal: aString
]
