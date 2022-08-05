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
	#name : #PtLZWFilterParameter,
	#superclass : #PtZipFilterParameter,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtLZWFilterParameter class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #LZWFilterParameter
		supertype: #Dictionary
		section: '7.4.4.3'
		documentation: 'The LZWDecode and FlateDecode filters shall accept optional parameters to control the decoding process.
NOTE
	Most of these parameters are related to techniques that reduce the size of compressed sampled images (rectangular arrays of colour values).
For example, image data typically changes very little from sample to sample.
Therefore, subtracting the values of adjacent samples (a process called differencing), and encoding the differences rather than the raw sample values, can reduce the size of the output data.
Furthermore, when the image data contains several colour components (red-green-blue or cyan-magenta-yellow-black) per sample, taking the difference between the values of corresponding components in adjacent samples, rather than between different colour components in the same sample, often reduces the output data size.'
]

{ #category : #'accessing entries' }
PtLZWFilterParameter >> EarlyChange [
	<type: #Integer>
	<attribute: 1 documentation: 'An indication of when to increase the code length.
If the value of this entry is 0, code length increases shall be postponed as long as possible.
If the value is 1, code length increases shall occur one code early.
This parameter is included because LZW sample code distributed by some vendors increases the code length one code earlier than necessary'>
	^self objectAt: #EarlyChange ifAbsent: [1 asPDF]
]
