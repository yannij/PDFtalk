"
PDF Multiple Master Fonts as defined in PDF 32000_2008.pdf, clause 9.6.2.3, pp. 256.

The multiple master font format is an extension of the Type 1 font format that allows the generation of a wide variety of typeface styles from a single font program. 
This is accomplished through the presence of various design dimensions in the font.

EXAMPLE 1	Examples of design dimensions are weight (light to extra-bold) and width (condensed to expanded).

Coordinates along these design dimensions (such as the degree of boldness) are specified by numbers. 
A particular choice of numbers selects an instance of the multiple master font. 
PDFs can contain multiple master instances.

NOTE		Adobe Technical Note #5015, Type 1 Font Format Supplement, describes multiple master fonts in detail.

The font dictionary for a multiple master font instance may contain the same entries as a Type 1 font dictionary, with these differences:
	•	The value of Subtype shall be MMType1.
	•	If the PostScript name of the instance contains SPACEs (20h), the SPACEs shall be replaced by LOW LINEs (underscores) (5Fh) in the value of BaseFont. 
		For instance, as illustrated in this example, the name “MinionMM 366 465 11 ” (which ends with a SPACE character) becomes /MinionMM_366_465_11_.

If the font program for a multiple master font instance is embedded in the PDF file, it shall be an ordinary Type 1 font program, not a multiple master font program. 
This font program is called a snapshot of the multiple master font instance that incorporates the chosen values of the design coordinates.
"
Class {
	#name : #PtMMType1,
	#superclass : #PtType1,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtMMType1 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #MMType1
		supertype: #Font
		section: '9.6.2.3'
		documentation: 'The multiple master font format is an extension of the Type 1 font format that allows the generation of a wide variety of typeface styles from a single font program. 
This is accomplished through the presence of various design dimensions in the font.

EXAMPLE 1	Examples of design dimensions are weight (light to extra-bold) and width (condensed to expanded).

Coordinates along these design dimensions (such as the degree of boldness) are specified by numbers. 
A particular choice of numbers selects an instance of the multiple master font. 
PDFs can contain multiple master instances.

NOTE		Adobe Technical Note #5015, Type 1 Font Format Supplement, describes multiple master fonts in detail.

The font dictionary for a multiple master font instance may contain the same entries as a Type 1 font dictionary, with these differences:
	•	The value of Subtype shall be MMType1.
	•	If the PostScript name of the instance contains SPACEs (20h), the SPACEs shall be replaced by LOW LINEs (underscores) (5Fh) in the value of BaseFont. 
		For instance, as illustrated in this example, the name “MinionMM 366 465 11 ” (which ends with a SPACE character) becomes /MinionMM_366_465_11_.

If the font program for a multiple master font instance is embedded in the PDF file, it shall be an ordinary Type 1 font program, not a multiple master font program. 
This font program is called a snapshot of the multiple master font instance that incorporates the chosen values of the design coordinates.'
]
