Class {
	#name : #PtFFontProgramTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #tests }
PtFFontProgramTests >> testCharstringDecoding [
	self assert: (PtFFontProgram charstringDecoded: #[0 1 71 18 0 0 67 111]) = #[16 217 17 218 108 81 169 133].
	self assert: (PtFFontProgram charstringEncoded: #[16 217 17 218 108 81 169 133]) = #[0 1 71 18 0 0 67 111].
	self assert: (PtFFontProgram charstringDecoded: #[0 0 0 0 0 0 0 0]) = #[16 216 136 237 216 32 160 19].
	self assert: (PtFFontProgram charstringEncoded: #[16 216 136 237 216 32 160 19]) = #[0 0 0 0 0 0 0 0].
]

{ #category : #tests }
PtFFontProgramTests >> testEexecDecoding [
	self assert: (PtFFontProgram eexecDecoded: #[0 1 71 18 0 0 67 111]) = #[217 218 140 33 182 145 148 117].
	self assert: (PtFFontProgram eexecEncoded: #[217 218 140 33 182 145 148 117]) = #[0 1 71 18 0 0 67 111].
	self assert: (PtFFontProgram eexecDecoded: #[0 0 0 0 0 0 0 0]) = #[217 219 253 89 34 97 140 67].
	self assert: (PtFFontProgram eexecEncoded: #[217 219 253 89 34 97 140 67]) = #[0 0 0 0 0 0 0 0].
]

{ #category : #tests }
PtFFontProgramTests >> testPfa [
	self assert: (PtFFontProgram fromPfa: PtFFontProgram example asPfa) = PtFFontProgram example
]
