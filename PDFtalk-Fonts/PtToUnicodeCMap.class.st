"
ToUnicode CMaps as defined in PDF 32000_2008.pdf, section 9.10.3, pp. 293

The CMap defined in the ToUnicode entry of the font dictionary shall follow the syntax for CMaps fully documented in Adobe Technical Note #5014, Adobe CMap and CIDFont Files Specification. Additional guidance regarding the CMap defined in this entry is provided in Adobe Technical Note #5411, ToUnicode Mapping File Tutorial. This CMap differs from an ordinary one in these ways:

	•	The only pertinent entry in the CMap stream dictionary is UseCMap, which may be used if the CMap is based on another ToUnicode CMap.
	•	The CMap file shall contain begincodespacerange and endcodespacerange operators that are consistent with the encoding that the font uses. In particular, for a simple font, the codespace shall be one byte long.
	•	It shall use the beginbfchar, endbfchar, beginbfrange, and endbfrange operators to define the mapping from character codes to Unicode character sequences expressed in UTF-16BE encoding.
"
Class {
	#name : #PtToUnicodeCMap,
	#superclass : #PDFStream,
	#instVars : [
		'cmap'
	],
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtToUnicodeCMap class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ToUnicodeCMap
		supertype: #Stream
		section: '9.10.3'
		documentation: 'The CMap defined in the ToUnicode entry of the font dictionary shall follow the syntax for CMaps fully documented in Adobe Technical Note #5014, Adobe CMap and CIDFont Files Specification. Additional guidance regarding the CMap defined in this entry is provided in Adobe Technical Note #5411, ToUnicode Mapping File Tutorial. This CMap differs from an ordinary one in these ways:

	•	The only pertinent entry in the CMap stream dictionary is UseCMap, which may be used if the CMap is based on another ToUnicode CMap.
	•	The CMap file shall contain begincodespacerange and endcodespacerange operators that are consistent with the encoding that the font uses. In particular, for a simple font, the codespace shall be one byte long.
	•	It shall use the beginbfchar, endbfchar, beginbfrange, and endbfrange operators to define the mapping from character codes to Unicode character sequences expressed in UTF-16BE encoding.'
]

{ #category : #'accessing entries' }
PtToUnicodeCMap >> UseCMap [
	<type: #Name>
	<type: #ToUnicodeCMap>
	<attribute: 1 documentation: 'The name of a predefined CMap, or a stream containing a CMap. If this entry is present, the referencing CMap shall specify only the character mappings that differ from the referenced CMap.'>
	^self objectAt: #UseCMap ifAbsent: [#none]
]

{ #category : #accessing }
PtToUnicodeCMap >> cmap [
	"<PostScript.CMap>"

	^cmap ifNil: [cmap := PSCMap fromPostScriptString: self internal]
]
