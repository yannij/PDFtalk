Extension { #name : #Array }

{ #category : #'*PostScript-converting' }
Array >> asPostScriptExecutable [
	^PSProcedure withAll: self
]

{ #category : #'*PostScript-double dispatching' }
Array >> copyFor: aPostScriptInterpreter [
	aPostScriptInterpreter pop withIndexDo: [:value :i | self at: i put: value copy].
	aPostScriptInterpreter push: self
]

{ #category : #'*PostScript-double dispatching' }
Array >> forAllDo: proc for: aPostScriptInterpreter [
	self do: [:value |
		aPostScriptInterpreter push: value.
		proc doIn: aPostScriptInterpreter]
]

{ #category : #'*PostScript-double dispatching' }
Array >> get: index for: aPostScriptInterpreter [
	^self at: index + 1
]

{ #category : #'*PostScript-accessing' }
Array >> postScriptType [
	^#arraytype
]

{ #category : #'*PostScript-double dispatching' }
Array >> put: any at: index [
	"array index any put –
	Put any into array at index"

	self at: index + 1 put: any
]
