"
The runtime code for writing and reading PDF files
"
Class {
	#name : #AboutPDFtalkBundle,
	#superclass : #Object,
	#category : #'PDFtalk-Bundle'
}

{ #category : #properties }
AboutPDFtalkBundle class >> components [
	^(OrderedCollection new: 19)
		add: #Package -> 'PostScript';
		add: #Package -> 'PDFtalk Basics';
		add: #Package -> 'PDFtalk Typing';
		add: #Package -> 'PDFtalk Basic Objects';
		add: #Package -> 'PDFtalk Streams';
		add: #Package -> 'PDFtalk Data Structures';
		add: #Package -> 'PDFtalk Parsing';
		add: #Package -> 'PDFtalk Colour';
		add: #Bundle -> 'PDFtalk Fonts';
		add: #Package -> 'PDFtalk Graphics';
		add: #Package -> 'PDFtalk Graphics Operations';
		add: #Package -> 'PDFtalk XObjects';
		add: #Package -> 'PDFtalk Images';
		add: #Package -> 'PDFtalk Files';
		add: #Package -> 'PDFtalk Document';
		add: #Package -> 'PDFtalk Rendering';
		add: #Package -> 'PDFtalk Shading';
		add: #Package -> 'PDFtalk Interactive Features';
		add: #Package -> 'PDFtalk Deploying';
		yourself
]

{ #category : #properties }
AboutPDFtalkBundle class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkBundle class >> creationTime [
	^'21.06.2022 08:32:16'
]

{ #category : #properties }
AboutPDFtalkBundle class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkBundle class >> developmentPrerequisites [
	^#(#(#any 'Compression-ZLib' '') #(#any 'MD5' '') #(#any 'Values' ''))
]

{ #category : #properties }
AboutPDFtalkBundle class >> notice [
	^'The MIT License

Copyright © 2011-2018 Christian Haider

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.'
]

{ #category : #properties }
AboutPDFtalkBundle class >> packageName [
	^'PDFtalk'
]

{ #category : #properties }
AboutPDFtalkBundle class >> parcelName [
	^'PDFtalk'
]

{ #category : #properties }
AboutPDFtalkBundle class >> prerequisiteDescriptions [
	^#(#(#name 'Compression-ZLib') #(#name 'MD5') #(#name 'Values' #componentType #package))
]

{ #category : #properties }
AboutPDFtalkBundle class >> prerequisiteParcels [
	^#(#('Compression-ZLib' '') #('MD5' '') #('Values' ''))
]

{ #category : #properties }
AboutPDFtalkBundle class >> source [
	^'Bundle {PDFtalk}(2.5.5.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkBundle class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkBundle class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkBundle class >> sourceTime [
	^'21.06.2022 04:50:24'
]

{ #category : #properties }
AboutPDFtalkBundle class >> targetSmalltalk [
	^'Pharo 10.0'
]

{ #category : #properties }
AboutPDFtalkBundle class >> versionSelectionBlock [
	^'[:parcelName :versionString :requiredVersionString |
	parcelName ~= ''Values'' or: [
	versionString = ''image'' or: [
	(versionString readStream upTo: $.) asNumber >= 3]]]'
]
