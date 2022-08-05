"
PDF Character Encoding as defined in PDF 32000_2008.pdf, section 9.6.6, pp. 262.

A font program’s built-in encoding can be overridden or altered by including an Encoding entry in the PDF font dictionary. The possible encoding modifications depend on the font type, as discussed below. The value of the Encoding entry is either a named encoding (the name of one of the predefined encodings MacRomanEncoding, MacExpertEncoding, or WinAnsiEncoding) or an encoding dictionary.
"
Class {
	#name : #PtEncoding,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtEncoding class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Encoding
		supertype: #Dictionary
		section: '9.6.6.1'
		documentation: 'A font program’s built-in encoding can be overridden or altered by including an Encoding entry in the PDF font dictionary. 
		The possible encoding modifications depend on the font type, as discussed below. 
		The value of the Encoding entry is either a named encoding (the name of one of the predefined encodings MacRomanEncoding, MacExpertEncoding, or WinAnsiEncoding) or an encoding dictionary.'
]

{ #category : #'accessing entries' }
PtEncoding >> BaseEncoding [
	<type: #Name>
	<attribute: 2 documentation: 'The base encoding—that is, the encoding from which the Differences entry (if present) describes differences—specified as the name of a predefined encoding MacRomanEncoding, MacExpertEncoding, or WinAnsiEncoding.
If this entry is absent, the Differences entry describes differences from an implicit base encoding. 
For a font program that is embedded in the PDF file, the implicit base encoding is the font program’s built-in encoding. 
Otherwise, for a nonsymbolic font, it is StandardEncoding, and for a symbolic font, it is the font’s built-in encoding.'>
	^self objectAt: #BaseEncoding ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtEncoding >> Differences [
	<type: #Array>
	<attribute: 3 documentation: 'An array describing the differences from the encoding specified by BaseEncoding or, if BaseEncoding is absent, from an implicit base encoding.'>
	^self objectAt: #Differences ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtEncoding >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Encoding asPDF]
]

{ #category : #accessing }
PtEncoding >> encoderFor: aPDFFont [
	| encoder code |
	encoder := (self BaseEncoding ifNil: [aPDFFont font encoder] ifNotNil: [:encoding |
		PtPDF encoderAt: encoding asSmalltalkValue]) copy.
	self Differences asSmalltalkValue do: [:codeOrName |
		codeOrName respondsToArithmetic
			ifTrue: [code := codeOrName]
			ifFalse: [
			(PSCharacterNames characterNamed: codeOrName) ifNotNil: [:char |
				encoder encode: char as: code].
			"When the name is not known, it is not encoded.
			Try to find it in the internet and add it to PostScript.CharacterNames class>>#otherGlyphNames
			and reset the mappings with PostScript.CharacterNames class>>#resetMappings"
			code := code + 1]].
	^encoder
]
