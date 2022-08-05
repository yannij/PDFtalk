Extension { #name : #PtExponentialInterpolationFunction }

{ #category : #'*PDFtalk-test resources-test instances' }
PtExponentialInterpolationFunction class >> example [

	| function |
	function := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
	function at: #Domain put: #(0 1.0).
	function at: #N put: 1.
	function at: #C0 put: (CmykColor cyan: 0 magenta: 0.36 yellow: 0.6 black: 0) asPDFArray.
	function at: #C1 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
	^function
]
