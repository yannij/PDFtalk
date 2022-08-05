Extension { #name : #PtStichingFunction }

{ #category : #'*PDFtalk-test resources-test instances' }
PtStichingFunction class >> example [

	| function1 function2 stichingFunction |
	function1 := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
	function1 at: #Domain put: #(0 1.0).
	function1 at: #N put: 0.5.
	function1 at: #C0 put: (CmykColor cyan: 0 magenta: 0.36 yellow: 0.6 black: 0) asPDFArray.
	function1 at: #C1 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
	function2 := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
	function2 at: #Domain put: #(0 1.0).
	function2 at: #N put: 2.
	function2 at: #C0 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
	function2 at: #C1 put: (CmykColor cyan: 0.6 magenta: 0.36 yellow: 0 black: 0) asPDFArray.
	stichingFunction := (PtPDF classAt: #StichingFunction) empty.
	stichingFunction at: #Domain put: #(0 1.0).
	stichingFunction at: #Functions put: (Array
		with: function1 newReference
		with: function2 newReference).
	stichingFunction at: #Bounds put: #(0.5).
	stichingFunction at: #Encode put: #(0 1.0 0 1.0).
	^stichingFunction
]
