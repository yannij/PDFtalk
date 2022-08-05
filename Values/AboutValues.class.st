"
Values are simple immutable literal objects.

Runtime support for Values.

Defines the root class Value and provides
- printing instances
- equality
- an example.

Specifies the responsibilities of subclasses to define the #localSpecification
"
Class {
	#name : #AboutValues,
	#superclass : #Object,
	#category : #Values
}

{ #category : #properties }
AboutValues class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutValues class >> creationTime [
	^'21.06.2022 08:32:06'
]

{ #category : #properties }
AboutValues class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutValues class >> notice [
	^'The MIT License

Copyright © 2009-2018 Christian Haider

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
AboutValues class >> parcelName [
	^'Values'
]

{ #category : #properties }
AboutValues class >> source [
	^'Package [Values](3.0.2.0,chaider)'
]

{ #category : #properties }
AboutValues class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutValues class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutValues class >> sourceTime [
	^'21.06.2022 04:25:42'
]

{ #category : #properties }
AboutValues class >> targetSmalltalk [
	^'Pharo 10.0'
]
