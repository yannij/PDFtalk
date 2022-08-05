"
PDF TrueType Fonts as defined in PDF 32000_2008.pdf, clause 9.6.3, pp. 257.

A TrueType font dictionary may contain the same entries as a Type 1 font dictionary, with these differences:

	•	The value of Subtype shall be TrueType.
	•	The value of Encoding is subject to limitations that are described in 9.6.6, ""Character Encoding"".
	•	The value of BaseFont is derived differently.

The PostScript name for the value of BaseFont may be determined in one of two ways:

	•	If the TrueType font program's “name” table contains a PostScript name, it shall be used.
	•	In the absence of such an entry in the “name” table, a PostScript name shall be derived from the name by which the font is known in the host operating system. 
		On a Windows system, the name shall be based on the lfFaceName field in a LOGFONT structure; 
		in the Mac OS, it shall be based on the name of the FOND resource. 
		If the name contains any SPACEs, the SPACEs shall be removed.

NOTE 1		The TrueType font format was developed by Apple Computer, Inc., and has been adopted 
			as a standard font format for the Microsoft Windows operating system. 
			Specifications for the TrueType font file format are available in Apple’s TrueType Reference Manual and 
			Microsoft’s TrueType 1.0 Font Files Technical Specification (see Bibliography).

NOTE 2		A TrueType font program may be embedded directly in a PDF file as a stream object.

NOTE 3		The Type 42 font format that is defined for PostScript does not apply to PDF.

NOTE 4		For CJK (Chinese, Japanese, and Korean) fonts, the host font system’s font name is often encoded in the host operating system’s script. 
			For instance, a Japanese font may have a name that is written in Japanese using some (unidentified) Japanese encoding. 
			Thus, TrueType font names may contain multiple-byte character codes, 
			each of which requires multiple characters to represent in a PDF name object (using the # notation to quote special characters as needed).
"
Class {
	#name : #PtTrueType,
	#superclass : #PtType1,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtTrueType class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #TrueType
		supertype: #Font
		section: '9.6.3'
		documentation: 'A TrueType font dictionary may contain the same entries as a Type 1 font dictionary, with these differences:

	•	The value of Subtype shall be TrueType.
	•	The value of Encoding is subject to limitations that are described in 9.6.6, "Character Encoding".
	•	The value of BaseFont is derived differently.

The PostScript name for the value of BaseFont may be determined in one of two ways:

	•	If the TrueType font program''s “name” table contains a PostScript name, it shall be used.
	•	In the absence of such an entry in the “name” table, a PostScript name shall be derived from the name by which the font is known in the host operating system. 
		On a Windows system, the name shall be based on the lfFaceName field in a LOGFONT structure; 
		in the Mac OS, it shall be based on the name of the FOND resource. 
		If the name contains any SPACEs, the SPACEs shall be removed.

NOTE 1		The TrueType font format was developed by Apple Computer, Inc., and has been adopted 
			as a standard font format for the Microsoft Windows operating system. 
			Specifications for the TrueType font file format are available in Apple’s TrueType Reference Manual and 
			Microsoft’s TrueType 1.0 Font Files Technical Specification (see Bibliography).

NOTE 2		A TrueType font program may be embedded directly in a PDF file as a stream object.

NOTE 3		The Type 42 font format that is defined for PostScript does not apply to PDF.

NOTE 4		For CJK (Chinese, Japanese, and Korean) fonts, the host font system’s font name is often encoded in the host operating system’s script. 
			For instance, a Japanese font may have a name that is written in Japanese using some (unidentified) Japanese encoding. 
			Thus, TrueType font names may contain multiple-byte character codes, 
			each of which requires multiple characters to represent in a PDF name object (using the # notation to quote special characters as needed).'
]
