Extension { #name : #Object }

{ #category : #'*PostScript-converting' }
Object >> asPostScriptExecutable [
	^self
]

{ #category : #'*PostScript-converting' }
Object >> asPostScriptLiteral [
	^self
]

{ #category : #'*PostScript-converting' }
Object >> asPostScriptString [
	^'--nostringval--'
]

{ #category : #'*PostScript-actions' }
Object >> doIn: aPostScriptInterpreter [
	"execute if executable"

	self processIn: aPostScriptInterpreter
]

{ #category : #'*PostScript-comparing' }
Object >> postScriptEqual: anObject [
	^self = anObject
]

{ #category : #'*PostScript-accessing' }
Object >> postScriptKey [
	^self
]

{ #category : #'*PostScript-accessing' }
Object >> postScriptType [
	^self error: 'no known PostScript type'
]

{ #category : #'*PostScript-printing' }
Object >> prettyPrintPSOn: aStream indent: anInteger [
	"write the receiver as PostScript to aStream"

	self printOn: aStream
]

{ #category : #'*PostScript-printing' }
Object >> prettyPrintString [
	"<String>
	the object as PostScript source with propper indentation"

	| wst |
	wst := String new writeStream.
	self prettyPrintPSOn: wst indent: 0.
	^wst contents
]

{ #category : #'*PostScript-printing' }
Object >> printPostScript [
	"<String>"

	| aStream |
	aStream := WriteStream on: (String new: 16).
	self printPostScriptOn: aStream.
	^aStream contents
]

{ #category : #'*PostScript-printing' }
Object >> printPostScriptOn: aStream [
	self printOn: aStream
]

{ #category : #'*PostScript-actions' }
Object >> processIn: aPostScriptInterpreter [
	aPostScriptInterpreter push: self.
	aPostScriptInterpreter hasMark ifFalse: [
		aPostScriptInterpreter trace: self]
]
