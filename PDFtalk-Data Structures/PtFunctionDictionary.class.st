"
PDF Function Dictionary as defined in PDF 32000_2008.pdf section 7.10, pp. 92.

PDF is not a programming language, and a PDF file is not a program.
However, PDF provides several types of function objects (PDF 1.2) that represent parameterized classes of functions, including mathematical formulas and sampled representations with arbitrary resolution.

"
Class {
	#name : #PtFunctionDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'instance creation' }
PtFunctionDictionary class >> empty [
	| inst |
	inst := self new.
	inst at: #FunctionType put: self functionType.
	^inst
]

{ #category : #accessing }
PtFunctionDictionary class >> functionType [
	"<Integer>
	-1 never matches"

	^-1
]

{ #category : #testing }
PtFunctionDictionary class >> isClassForDictionary: aDictionary [
	| typeEntry |
	typeEntry := aDictionary at: #FunctionType ifAbsent: [
		^false].
	^self functionType asPDF = typeEntry
]

{ #category : #'accessing entries' }
PtFunctionDictionary >> Domain [
	<typeArrayOf: #Number>
	<required>
	<attribute: 2 documentation: 'An array of 2 x m numbers, where m shall be the number of input values.
For each i from 0 to m-1, Domain2i shall be less than or equal to Domain2i+1, and the ith input value, xi, shall lie in the interval Domain2i <= xi <= Domain2i+1.
Input values outside the declared domain shall be clipped to the nearest boundary value.'>
	^self objectAt: #Domain
]

{ #category : #'accessing entries' }
PtFunctionDictionary >> FunctionType [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The function type:
	0 Sampled function
	2 Exponential interpolation function
	3 Stitching function
	4 PostScript calculator function'>
	^self objectAt: #FunctionType
]

{ #category : #'accessing entries' }
PtFunctionDictionary >> Range [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: '(Required for type 0 and type 4 functions, optional otherwise)
An array of 2 x n numbers, where n shall be the number of output values.
For each j from 0 to n-1, Range2j shall be less than or equal to Range2j+1, and the jth output value, yj , shall lie in the interval Range2j <= yj <= Range2j+1.
Output values outside the declared range shall be clipped to the nearest boundary value.
If this entry is absent, no clipping shall be done.'>
	^self objectAt: #Range ifAbsent: [#() asPDF]
]
