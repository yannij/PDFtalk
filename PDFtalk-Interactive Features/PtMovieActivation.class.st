"
PDF Movies as defined in PDF 32000_2008.pdf, section 13.4, pp. 508.

The features described in this sub-clause are obsolescent and their use is no longer recommended.
They are superseded by the general multimedia framework described in 13.2, “Multimedia.”

PDF shall embed movies within a document by means of movie annotations.
Despite the name, a movie may consist entirely of sound with no visible images to be displayed on the screen.
The Movie and A (activation) entries in the movie annotation dictionary shall refer, respectively, to a movie dictionary that shall describe the static characteristics of the movie and a movie activation dictionary that shall specify how it shall be presented.

"
Class {
	#name : #PtMovieActivation,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtMovieActivation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #MovieActivation
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
PtMovieActivation >> Duration [
	<type: #Integer>
	<type: #String>
	<type: #Array>
	<attribute: 2 documentation: 'The duration of the movie segment to be played, that shall be specified in the same form as Start.
If this entry is omitted, the movie shall be played to the end.'>
	^self objectAt: #Duration ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> FWPosition [
	<typeArrayOf: #Number>
	<attribute: 9 documentation: 'For floating play windows, the relative position of the window on the screen.
The value shall be an array of two numbers
	[horiz vert]
each in the range 0.0 to 1.0, denoting the relative horizontal and vertical position of the movie window with respect to the screen.

	EXAMPLE	The value [0.5 0.5] centers the window on the screen.'>
	^self objectAt: #FWPosition ifAbsent: [#(0.5 0.5) asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> FWScale [
	<typeArrayOf: #Integer>
	<attribute: 8 documentation: 'The magnification (zoom) factor at which the movie shall be played.
The presence of this entry implies that the movie shall be played in a floating window.
If the entry is absent, the movie shall be played in the annotation rectangle.

The value of the entry shall be an array of two positive integers, [numerator denominator], denoting a rational magnification factor for the movie.
The final window size, in pixels, shall be
	(numerator ÷ denominator) × Aspect
where the value of Aspect shall be taken from the movie dictionary.'>
	^self objectAt: #FWScale ifAbsent: [#(1 1) asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> Mode [
	<type: #Name>
	<attribute: 6 documentation: 'The play mode for playing the movie:
	Once			Play once and stop.
	Open			Play and leave the movie controller bar open.
	Repeat			Play repeatedly from beginning to end until stopped.
	Palindrome	Play continuously forward and backward until stopped.'>
	^self objectAt: #Mode ifAbsent: [#Once asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> Rate [
	<type: #Number>
	<attribute: 3 documentation: 'The initial speed at which to play the movie.
If the value of this entry is negative, the movie shall be played backward with respect to Start and Duration.'>
	^self objectAt: #Rate ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> ShowControls [
	<type: #Boolean>
	<attribute: 5 documentation: 'A flag specifying whether to display a movie controller bar while playing the movie.'>
	^self objectAt: #ShowControls ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtMovieActivation >> Start [
	<type: #Integer>
	<type: #String>
	<type: #Array>
	<attribute: 1 documentation: 'The starting time of the movie segment to be played.
Movie time values shall be expressed in units of time based on a time scale, which defines the number of units per second.
The default time scale shall be defined in the movie data.
The starting time shall be nominally a non-negative 64-bit integer, specified as follows:
	•	If it is representable as an integer (subject to the implementation limit for integers, as described in Annex C), it shall be specified as such.
	•	If it is not representable as an integer, it shall be specified as an 8-byte string representing a 64-bit twos-complement integer, most significant byte first.
	•	If it is expressed in a time scale different from that of the movie itself, it shall be represented as an array of two values: an integer or byte string denoting the starting time, followed by an integer specifying the time scale in units per second.

If this entry is omitted, the movie shall be played from the beginning.'>
	^self objectAt: #Start ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMovieActivation >> Synchronous [
	<type: #Boolean>
	<attribute: 7 documentation: 'A flag specifying whether to play the movie synchronously or asynchronously.
If this value is true, the movie player shall retain control until the movie is completed or dismissed by the user.
If the value is false, the player shall return control to the conforming reader immediately after starting the movie.'>
	^self objectAt: #Synchronous ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtMovieActivation >> Volume [
	<type: #Number>
	<attribute: 4 documentation: 'The initial sound volume at which to play the movie, in the range −1.0 to 1.0.
Higher values shall denote greater volume; negative values shall mute the sound. Default value: 1.0.'>
	^self objectAt: #Volume ifAbsent: [1.0 asPDF]
]
