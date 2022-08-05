"
PDF Movies as defined in PDF 32000_2008.pdf, section 13.4, pp. 507.

The features described in this sub-clause are obsolescent and their use is no longer recommended.
They are superseded by the general multimedia framework described in 13.2, “Multimedia.”

PDF shall embed movies within a document by means of movie annotations.
Despite the name, a movie may consist entirely of sound with no visible images to be displayed on the screen.
The Movie and A (activation) entries in the movie annotation dictionary shall refer, respectively, to a movie dictionary that shall describe the static characteristics of the movie and a movie activation dictionary that shall specify how it shall be presented.
"
Class {
	#name : #PtMovie,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtMovie class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Movie
		supertype: #Dictionary
		version: #(1 2)
		section: '13.4'
		documentation: 'The features described in this sub-clause are obsolescent and their use is no longer recommended.
They are superseded by the general multimedia framework described in 13.2, “Multimedia.”

PDF shall embed movies within a document by means of movie annotations.
Despite the name, a movie may consist entirely of sound with no visible images to be displayed on the screen.
The Movie and A (activation) entries in the movie annotation dictionary shall refer, respectively, to a movie dictionary that shall describe the static characteristics of the movie and a movie activation dictionary that shall specify how it shall be presented.'
]

{ #category : #'accessing entries' }
PtMovie >> Aspect [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'The width and height of the movie’s bounding box, in pixels, and shall be specified as [width height].
This entry should be omitted for a movie consisting entirely of sound with no visible images.'>
	^self objectAt: #Aspect ifAbsent: [#(0 0) asPDF]
]

{ #category : #'accessing entries' }
PtMovie >> F [
	<type: #FileSpecification>
	<required>
	<attribute: 1 documentation: 'A file specification identifying a self-describing movie file.
NOTE	The format of a self-describing movie file shall be left unspecified, and there is no guarantee of portability.'>
	^self objectAt: #F
]

{ #category : #'accessing entries' }
PtMovie >> Poster [
	<type: #Boolean>
	<type: #ImageXObject>
	<attribute: 4 documentation: 'A flag or stream specifying whether and how a poster image representing the movie shall be displayed.
If this value is a stream, it shall contain an image XObject to be displayed as the poster.
If it is the boolean value true, the poster image shall be retrieved from the movie file; if it is false, no poster shall be displayed.'>
	^self objectAt: #Poster ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtMovie >> Rotate [
	<type: #Integer>
	<attribute: 3 documentation: 'The number of degrees by which the movie shall be rotated clockwise relative to the page.
The value shall be a multiple of 90.'>
	^self objectAt: #Rotate ifAbsent: [0 asPDF]
]
