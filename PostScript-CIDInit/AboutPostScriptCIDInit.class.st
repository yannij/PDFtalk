"
Adobe CMap implementation

CMaps are PostScript programs which create a CMap structure use to decode bytes.

This implementation does just that: it uses the PostScript interpreter to read the CMap source and creates a CMap object from the result.

CMaps are used in PDF Type0 fonts.

See https://wiki.pdftalk.de/doku.php?id=cmap for more information
"
Class {
	#name : #AboutPostScriptCIDInit,
	#superclass : #Object,
	#category : #'PostScript-CIDInit'
}

{ #category : #properties }
AboutPostScriptCIDInit class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> creationTime [
	^'21.06.2022 08:32:10'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPostScriptCIDInit class >> notice [
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
AboutPostScriptCIDInit class >> source [
	^'Package [PostScript CIDInit](2.5.0.1,chaider)'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> sourceTime [
	^'14.06.2021 10:45:09'
]

{ #category : #properties }
AboutPostScriptCIDInit class >> targetSmalltalk [
	^'Pharo 10.0'
]
