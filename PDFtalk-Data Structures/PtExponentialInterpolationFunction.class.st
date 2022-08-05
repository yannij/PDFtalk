"
PDF Function as defined in PDF 32000_2008.pdf pp. 96.

Type 2 functions include a set of parameters that define an exponential interpolation of one input value and n output values:
	f(x) = y0, ..., yn-1
"
Class {
	#name : #PtExponentialInterpolationFunction,
	#superclass : #PtFunctionDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtExponentialInterpolationFunction class >> functionType [
	^2
]

{ #category : #accessing }
PtExponentialInterpolationFunction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ExponentialInterpolationFunction
		supertype: #Function
		version: #(1 3)
		section: '7.10.3'
		documentation: 'Type 2 functions include a set of parameters that define an exponential interpolation of one input value and n output values:
	f(x) = y0, ..., yn-1'
]

{ #category : #'accessing entries' }
PtExponentialInterpolationFunction >> C0 [
	<typeArrayOf: #Number>
	<attribute: 1 documentation: 'An array of n numbers that shall define the function result when x = 0.0.
Default value: [0.0].'>
	^self objectAt: #C0 ifAbsent: [#(0.0) asPDF]
]

{ #category : #'accessing entries' }
PtExponentialInterpolationFunction >> C1 [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of n numbers that shall define the function result when x = 1.0.
Default value: [1.0].'>
	^self objectAt: #C1 ifAbsent: [#(1.0) asPDF]
]

{ #category : #'accessing entries' }
PtExponentialInterpolationFunction >> N [
	<type: #Number>
	<required>
	<attribute: 3 documentation: 'The interpolation exponent.
Each input value x shall return n values, given by yj = C0j + xN x (C1j - C0j), for 0 <= j < n.'>
	^self objectAt: #N
]
