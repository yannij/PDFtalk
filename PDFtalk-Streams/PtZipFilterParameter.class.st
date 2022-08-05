"
PDF Image Dictionaries as defined in PDF 32000_2008.pdf, section 7.4.4.3, pp. 27.

The LZWDecode and FlateDecode filters shall accept optional parameters to control the decoding process.
NOTE
	Most of these parameters are related to techniques that reduce the size of compressed sampled images (rectangular arrays of colour values).
For example, image data typically changes very little from sample to sample.
Therefore, subtracting the values of adjacent samples (a process called differencing), and encoding the differences rather than the raw sample values, can reduce the size of the output data.
Furthermore, when the image data contains several colour components (red-green-blue or cyan-magenta-yellow-black) per sample, taking the difference between the values of corresponding components in adjacent samples, rather than between different colour components in the same sample, often reduces the output data size
"
Class {
	#name : #PtZipFilterParameter,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtZipFilterParameter class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #ZipFilterParameter
		supertype: #Dictionary
		section: '7.4.4.3'
		documentation: 'The LZWDecode and FlateDecode filters shall accept optional parameters to control the decoding process.
NOTE
	Most of these parameters are related to techniques that reduce the size of compressed sampled images (rectangular arrays of colour values).
For example, image data typically changes very little from sample to sample.
Therefore, subtracting the values of adjacent samples (a process called differencing), and encoding the differences rather than the raw sample values, can reduce the size of the output data.
Furthermore, when the image data contains several colour components (red-green-blue or cyan-magenta-yellow-black) per sample, taking the difference between the values of corresponding components in adjacent samples, rather than between different colour components in the same sample, often reduces the output data size'
]

{ #category : #'accessing entries' }
PtZipFilterParameter >> BitsPerComponent [
	<type: #Integer>
	<attribute: 3 documentation: '(May be used only if Predictor is greater than 1)
The number of bits used to represent each colour component in a sample.
Valid values are 1, 2, 4, 8, and (PDF 1.5) 16'>
	^self objectAt: #BitsPerComponent ifAbsent: [8 asPDF]
]

{ #category : #'accessing entries' }
PtZipFilterParameter >> Colors [
	<type: #Integer>
	<attribute: 2 documentation: '(May be used only if Predictor is greater than 1)
The number of interleaved colour components per sample.
Valid values are 1 to 4 (PDF 1.0) and 1 or greater (PDF 1.3)'>
	^self objectAt: #Colors ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtZipFilterParameter >> Columns [
	<type: #Integer>
	<attribute: 4 documentation: '(May be used only if Predictor is greater than 1)
The number of samples in each row'>
	^self objectAt: #Columns ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtZipFilterParameter >> Predictor [
	<type: #Integer>
	<attribute: 1 documentation: 'A code that selects the predictor algorithm, if any.
If the value of this entry is 1, the filter shall assume that the normal algorithm was used to encode the data, without prediction.
If the value is greater than 1, the filter shall assume that the data was differenced before being encoded, and Predictor selects the predictor algorithm'>
	^self objectAt: #Predictor ifAbsent: [1 asPDF]
]
