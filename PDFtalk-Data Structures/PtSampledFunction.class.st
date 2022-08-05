"
PDF Function as defined in PDF 32000_2008.pdf pp. 93.

Type 0 functions use a sequence of sample values (contained in a stream) to provide an approximation for functions whose domains and ranges are bounded.
The samples are organized as an m-dimensional table in which each entry has n components.
"
Class {
	#name : #PtSampledFunction,
	#superclass : #PtFunctionStream,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtSampledFunction class >> functionType [
	^0
]

{ #category : #accessing }
PtSampledFunction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #SampledFunction
		supertype: #Function
		version: #(1 2)
		section: '7.10.2'
		documentation: 'Type 0 functions use a sequence of sample values (contained in a stream) to provide an approximation for functions whose domains and ranges are bounded.
The samples are organized as an m-dimensional table in which each entry has n components.'
]

{ #category : #'accessing entries' }
PtSampledFunction >> BitsPerSample [
	<type: #Integer>
	<required>
	<attribute: 3 documentation: 'The number of bits that shall represent each sample. (If the function has multiple output values, each one shall occupy BitsPerSample bits.)
Valid values shall be 1, 2, 4, 8, 12, 16, 24, and 32.'>
	^self objectAt: #BitsPerSample
]

{ #category : #'accessing entries' }
PtSampledFunction >> Decode [
	<typeArrayOf: #Number>
	<attribute: 6 documentation: 'An array of 2 × n numbers specifying the linear mapping of sample values into the range appropriate for the function’s output values.
Default value: same as the value of Range.'>
	^self objectAt: #Decode ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtSampledFunction >> Encode [
	<typeArrayOf: #Number>
	<attribute: 5 documentation: 'An array of 2 × m numbers specifying the linear mapping of input values into the domain of the function’s sample table.
Default value: [0 (Size0 - 1) 0 (Size1 - 1) …].'>
	^self objectAt: #Encode ifAbsent: [
		| list |
		list := OrderedCollection new.
		self Size asSmalltalkValue do: [:s |
			list add: 0.
			list add: s value - 1].
		list asPDF]
]

{ #category : #'accessing entries' }
PtSampledFunction >> Order [
	<type: #Integer>
	<attribute: 4 documentation: 'The order of interpolation between samples.
Valid values shall be 1 and 3, specifying linear and cubic spline interpolation, respectively.
Default value: 1.'>
	^self objectAt: #Order ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtSampledFunction >> Size [
	<typeArrayOf: #Integer>
	<required>
	<attribute: 2 documentation: 'An array of m positive integers that shall specify the number of samples in each input dimension of the sample table.'>
	^self objectAt: #Size
]
