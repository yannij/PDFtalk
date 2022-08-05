Extension { #name : #Point }

{ #category : #'*PDFtalk-Rendering-converting' }
Point >> asPDFArray [
	^Array with: self x with: self y
]
