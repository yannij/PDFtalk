"
PDF Movie Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.17, pp. 407.

A movie annotation contains animated graphics and sound to be presented on the computer screen and through the speakers.
When the annotation is activated, the movie shall be played.
"
Class {
	#name : #PtMovieAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtMovieAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #MovieAnnotation
		supertype: #Annot
		version: #(1 2)
		section: '12.5.6.17'
		documentation: 'A movie annotation contains animated graphics and sound to be presented on the computer screen and through the speakers.
When the annotation is activated, the movie shall be played.'
]

{ #category : #accessing }
PtMovieAnnotation class >> subtype [
	^#Movie
]

{ #category : #'accessing entries' }
PtMovieAnnotation >> A [
	<type: #Boolean>
	<type: #Dictionary>
	<attribute: 3 documentation: 'A flag or dictionary specifying whether and how to play the movie when the annotation is activated.
If this value is a dictionary, it shall be a movie activation dictionary specifying how to play the movie.
If the value is the boolean true, the movie shall be played using default activation parameters.
If the value is false, the movie shall not be played.'>
	^self objectAt: #A ifAbsent: [true]
]

{ #category : #'accessing entries' }
PtMovieAnnotation >> Movie [
	<type: #Movie>
	<required>
	<attribute: 2 documentation: 'A movie dictionary that shall describe the movie’s static characteristics.'>
	^self objectAt: #Movie ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtMovieAnnotation >> T [
	<type: #String>
	<attribute: 1 documentation: 'The title of the movie annotation.
Movie actions may use this title to reference the movie annotation.'>
	^self objectAt: #T ifAbsent: ['' asPDF]
]
