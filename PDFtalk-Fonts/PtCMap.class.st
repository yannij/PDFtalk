"
Embedded CMap Files as defined in PDF 32000_2008.pdf, section 9.7.5.3, pp. 277

For character encodings that are not predefined, the PDF file shall contain a stream that defines the CMap. The data in the stream defines the mapping from character codes to a font number and a character selector.

Embedded CMap files shall conform to the format documented in Adobe Technical Note #5014, subject to these additional constraints:

a) If the embedded CMap file contains a usecmap reference, the CMap indicated there shall also be identified by the UseCMap entry in the CMap stream dictionary.

b) The usefont operator, if present, shall specify a font number of 0.

c) The beginbfchar and endbfchar shall not appear in a CMap that is used as the Encoding entry of a Type 0 font; however, they may appear in the definition of a ToUnicode CMap.

d) A notdef mapping, defined using beginnotdefchar, endnotdefchar, beginnotdefrange, and endnotdefrange shall be used if the normal mapping produces a CID for which no glyph is present in the associated CIDFont.

e) The beginrearrangedfont, endrearrangedfont, beginusematrix, and endusematrix operators shall not be used.
"
Class {
	#name : #PtCMap,
	#superclass : #PtTypedStream,
	#instVars : [
		'cmap'
	],
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtCMap class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CMap
		supertype: #Stream
		section: '9.7.5.3'
		documentation: 'For character encodings that are not predefined, the PDF file shall contain a stream that defines the CMap. The data in the stream defines the mapping from character codes to a font number and a character selector.

Embedded CMap files shall conform to the format documented in Adobe Technical Note #5014, subject to these additional constraints:

a) If the embedded CMap file contains a usecmap reference, the CMap indicated there shall also be identified by the UseCMap entry in the CMap stream dictionary.

b) The usefont operator, if present, shall specify a font number of 0.

c) The beginbfchar and endbfchar shall not appear in a CMap that is used as the Encoding entry of a Type 0 font; however, they may appear in the definition of a ToUnicode CMap.

d) A notdef mapping, defined using beginnotdefchar, endnotdefchar, beginnotdefrange, and endnotdefrange shall be used if the normal mapping produces a CID for which no glyph is present in the associated CIDFont.

e) The beginrearrangedfont, endrearrangedfont, beginusematrix, and endusematrix operators shall not be used.'
]

{ #category : #'accessing entries' }
PtCMap >> CIDSystemInfo [
	<type: #CIDSystemInfo>
	<required>
	<attribute: 2 documentation: 'A dictionary containing entries that define the character collection for the CIDFont or CIDFonts associated with the CMap.
The value of this entry shall be the same as the value of CIDSystemInfo in the CMap file. (However, it does not need to match the values of CIDSystemInfo for the Identity-H or Identity-V CMaps.)'>
	^self objectAt: #CIDSystemInfo
]

{ #category : #'accessing entries' }
PtCMap >> CMapName [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The name of the CMap. It shall be the same as the value of CMapName in the CMap file'>
	^self objectAt: #CMapName
]

{ #category : #'accessing entries' }
PtCMap >> UseCMap [
	<type: #Name>
	<type: #CMap>
	<attribute: 4 documentation: 'The name of a predefined CMap, or a stream containing a CMap. If this entry is present, the referencing CMap shall specify only the character mappings that differ from the referenced CMap.'>
	^self objectAt: #UseCMap ifAbsent: [#none]
]

{ #category : #'accessing entries' }
PtCMap >> WMode [
	<type: #Integer>
	<attribute: 3 documentation: 'A code that specifies the writing mode for any CIDFont with which this CMap is combined. The value shall be 0 for horizontal or 1 for vertical.
The value of this entry shall be the same as the value of WMode in the CMap file.'>
	^self objectAt: #WMode ifAbsent: [0]
]

{ #category : #accessing }
PtCMap >> cmap [
	"<PostScript.CMap>"

	^cmap ifNil: [cmap := PSCMap fromPostScriptString: self internal]
]
