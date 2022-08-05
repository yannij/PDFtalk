Class {
	#name : #CFFCFFTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #tests }
CFFCFFTests >> testDictIntegers [
	self assert: (CFFDict integerFrom: #[16r8B] readStream) = 0.
	self assert: (CFFDict integerFrom: #[16rEF] readStream) = 100.
	self assert: (CFFDict integerFrom: #[16r27] readStream) = -100.
	self assert: (CFFDict integerFrom: #[16rFA 16r7C] readStream) = 1000.
	self assert: (CFFDict integerFrom: #[16rFE 16r7C] readStream) = -1000.
	self assert: (CFFDict integerFrom: #[16r1C 16r27 16r10] readStream) = 10000.
	self assert: (CFFDict integerFrom: #[16r1C 16rD8 16rF0] readStream) = -10000.
	self assert: (CFFDict integerFrom: #[16r1D 16r00 16r01 16r86 16rA0] readStream) = 100000.
	self assert: (CFFDict integerFrom: #[16r1D 16rFF 16rFE 16r79 16r60] readStream) = -100000.
]

{ #category : #tests }
CFFCFFTests >> testDictReals [
	self assert: (CFFDict realStringFrom: #[16r1E 16rE2 16rA2 16r5F] readStream) = '-2.25'.
	self assert: (CFFDict realFrom: #[16r1E 16rE2 16rA2 16r5F] readStream) = -2.25.
	self assert: (CFFDict realStringFrom: #[16r1E 16r0A 16r14 16r05 16r41 16rC3 16rFF] readStream) = '0.140541e-3'.
	self assert: (CFFDict realFrom: #[16r1E 16r0A 16r14 16r05 16r41 16rC3 16rFF] readStream) = 0.140541e-3.
]
