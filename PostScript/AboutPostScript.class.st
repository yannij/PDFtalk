"
PostScript language interpreter

The central class is PostScript.Interpreter. 
You can send #run: with a PostScript code string to the class or an instance which returns an instance which consumed and processed the code given.

Example:
| ps |
ps := PostScript.Interpreter run: '3 4 add'.
ps run: 'dup mul'.
ps stack top. ""is 49""

The interpreter provides access to its state:
the 3 stacks: #stack (or #operandStack), #dictionaryStack and #executionStack,
the #resources and the #scanner

Restrictions:
- no support for graphics operators
- local / global differentiation is not implemented

See https://wiki.pdftalk.de/doku.php?id=postscript for more information
"
Class {
	#name : #AboutPostScript,
	#superclass : #Object,
	#category : #PostScript
}

{ #category : #properties }
AboutPostScript class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPostScript class >> creationTime [
	^'21.06.2022 08:32:06'
]

{ #category : #properties }
AboutPostScript class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPostScript class >> developmentPrerequisites [
	^#(#(#any 'Values' '') #(#any 'URISupport' ''))
]

{ #category : #properties }
AboutPostScript class >> isFunctional [
	^true
]

{ #category : #properties }
AboutPostScript class >> notice [
	^'The MIT License

Copyright © 2020 Christian Haider

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
AboutPostScript class >> prerequisiteDescriptions [
	^#(#(#name 'Values' #componentType #package) #(#name 'URISupport' #componentType #package))
]

{ #category : #properties }
AboutPostScript class >> prerequisiteParcels [
	^#(#('Values' '') #('URISupport' ''))
]

{ #category : #properties }
AboutPostScript class >> source [
	^'Package [PostScript](2.5.5.0,chaider)'
]

{ #category : #properties }
AboutPostScript class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPostScript class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPostScript class >> sourceTime [
	^'21.06.2022 04:50:20'
]

{ #category : #properties }
AboutPostScript class >> targetSmalltalk [
	^'Pharo 10.0'
]
