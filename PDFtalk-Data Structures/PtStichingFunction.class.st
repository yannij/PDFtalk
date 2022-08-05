"
PDF Function as defined in PDF 32000_2008.pdf pp. 96.

Type 3 functions define a stitching of the subdomains of several 1-input functions to produce a single new 1-input function.
Since the resulting stitching function is a 1-input function, the domain is given by a two-element array, [Domain0 Domain1].
"
Class {
	#name : #PtStichingFunction,
	#superclass : #PtFunctionDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtStichingFunction class >> functionType [
	^3
]

{ #category : #accessing }
PtStichingFunction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #StichingFunction
		supertype: #Function
		version: #(1 3)
		section: '7.10.4'
		documentation: 'Type 3 functions define a stitching of the subdomains of several 1-input functions to produce a single new 1-input function.
Since the resulting stitching function is a 1-input function, the domain is given by a two-element array, [Domain0 Domain1].'
]

{ #category : #'accessing entries' }
PtStichingFunction >> Bounds [
	<typeArrayOf: #Number>
	<required>
	<attribute: 2 documentation: 'An array of k - 1 numbers that, in combination with Domain, shall define the intervals to which each function from the Functions array shall apply.
Bounds elements shall be in order of increasing value, and each value shall be within the domain defined by Domain.'>
	^self objectAt: #Bounds
]

{ #category : #'accessing entries' }
PtStichingFunction >> Encode [
	<typeArrayOf: #Number>
	<required>
	<attribute: 3 documentation: 'An array of 2 × k numbers that, taken in pairs, shall map each subset of the domain defined by Domain and the Bounds array to the domain of the corresponding function.'>
	^self objectAt: #Encode
]

{ #category : #'accessing entries' }
PtStichingFunction >> Functions [
	<typeArrayOf: #Function>
	<required>
	<attribute: 1 documentation: 'An array of k 1-input functions that shall make up the stitching function.
The output dimensionality of all functions shall be the same, and compatible with the value of Range if Range is present.'>
	^self objectAt: #Functions
]
