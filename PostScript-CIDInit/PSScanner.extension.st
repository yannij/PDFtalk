Extension { #name : #PSScanner }

{ #category : #'*PostScript-CIDInit-actions' }
PSScanner >> cidLessAction [
	^[
	self peek = $~
		ifTrue: [
		self next.
		self readAsciiBase85ByteString]
		ifFalse: [
		self peek = $<
			ifTrue: [
			self next.
			#<<]
			ifFalse: [self readHexadecimalCode]]]
]

{ #category : #'*PostScript-CIDInit-reading' }
PSScanner >> readHexadecimalCode [
	"<Code>"

	^PSCode bytes: self readHexadecimalByteString asByteArray
]

{ #category : #'*PostScript-CIDInit-actions' }
PSScanner >> takeHexAsCode [
	self specialActionsByCharacter at: $< put: self cidLessAction
]

{ #category : #'*PostScript-CIDInit-actions' }
PSScanner >> takeHexAsString [
	self specialActionsByCharacter at: $< put: self defaultLessAction
]
