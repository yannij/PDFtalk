"
PDF PostScript XObjects as defined in PDF 32000_2008.pdf, section 8.8.2, pp. 202.

Beginning with PDF 1.1, a content stream may include PostScript language fragments. 
These fragments may be used only when printing to a PostScript output device; 
they shall have no effect either when viewing the document on-screen or when printing it to a non-PostScript device. 
In addition, conforming readers may not be able to interpret the PostScript fragments. 
Hence, this capability should be used with extreme caution and only if there is no other way to achieve the same result. 
Inappropriate use of PostScript XObjects can cause PDF files to print incorrectly.

A PostScript XObject is an XObject stream whose Subtype entry has the value PS.

If a PDF content stream is translated by a conforming reader into the PostScript language, 
any Do operation that references a PostScript XObject may be replaced by the contents of the XObject stream itself. 
The stream shall be copied without interpretation. 
The PostScript fragment may use Type 1 and TrueType fonts listed in the Font subdictionary of the current resource dictionary, 
accessing them by their BaseFont names using the PostScript findfont operator. 
The fragment shall not use other types of fonts listed in the Font subdictionary. 
It should not reference the PostScript definitions corresponding to PDF procedure sets, which are subject to change.
"
Class {
	#name : #PtPostScriptXObject,
	#superclass : #PtXObject,
	#category : #'PDFtalk-XObjects'
}

{ #category : #accessing }
PtPostScriptXObject class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PostScriptXObject
		supertype: #XObject
		version: #(1 1)
		section: '8.8.2'
		documentation: 'Beginning with PDF 1.1, a content stream may include PostScript language fragments. 
These fragments may be used only when printing to a PostScript output device; 
they shall have no effect either when viewing the document on-screen or when printing it to a non-PostScript device. 
In addition, conforming readers may not be able to interpret the PostScript fragments. 
Hence, this capability should be used with extreme caution and only if there is no other way to achieve the same result. 
Inappropriate use of PostScript XObjects can cause PDF files to print incorrectly.

A PostScript XObject is an XObject stream whose Subtype entry has the value PS.

If a PDF content stream is translated by a conforming reader into the PostScript language, 
any Do operation that references a PostScript XObject may be replaced by the contents of the XObject stream itself. 
The stream shall be copied without interpretation. 
The PostScript fragment may use Type 1 and TrueType fonts listed in the Font subdictionary of the current resource dictionary, 
accessing them by their BaseFont names using the PostScript findfont operator. 
The fragment shall not use other types of fonts listed in the Font subdictionary. 
It should not reference the PostScript definitions corresponding to PDF procedure sets, which are subject to change.'
]

{ #category : #accessing }
PtPostScriptXObject class >> resourcePrefix [
	^'Po'
]

{ #category : #accessing }
PtPostScriptXObject class >> subtype [
	^#PS
]

{ #category : #'accessing entries' }
PtPostScriptXObject >> Level1 [
	<type: #Stream>
	<attribute: 1 documentation: 'A stream whose contents shall be used in place of the PostScript XObject’s stream 
when the target PostScript interpreter is known to support only LanguageLevel 1.'>
	^self objectAt: #Level1
]
