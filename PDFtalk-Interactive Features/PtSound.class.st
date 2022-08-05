"
PDF Sounds as defined in PDF 32000_2008.pdf, section 13.3, pp. 506.

A sound object shall be a stream containing sample values that define a sound to be played through the computer’s speakers.
The Sound entry in a sound annotation or sound action dictionary shall identify a sound object representing the sound to be played when the annotation is activated.

Since a sound object is a stream, it may contain any of the standard entries common to all streams.
In particular, if it contains an F (file specification) entry, the sound shall be defined in an external file.
This sound file shall be self-describing, containing all information needed to render the sound; no additional information need be present in the PDF file.

	NOTE	The AIFF, AIFF-C (Mac OS), RIFF (.wav), and snd (.au) file formats are all self-describing.

If no F entry is present, the sound object itself shall contain the sample data and all other information needed to define the sound.
"
Class {
	#name : #PtSound,
	#superclass : #PtTypedStream,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtSound class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Sound
		supertype: #Stream
		version: #(1 2)
		section: '13.3'
		documentation: 'A sound object shall be a stream containing sample values that define a sound to be played through the computer’s speakers.
The Sound entry in a sound annotation or sound action dictionary shall identify a sound object representing the sound to be played when the annotation is activated.

Since a sound object is a stream, it may contain any of the standard entries common to all streams.
In particular, if it contains an F (file specification) entry, the sound shall be defined in an external file.
This sound file shall be self-describing, containing all information needed to render the sound; no additional information need be present in the PDF file.

	NOTE	The AIFF, AIFF-C (Mac OS), RIFF (.wav), and snd (.au) file formats are all self-describing.

If no F entry is present, the sound object itself shall contain the sample data and all other information needed to define the sound.'
]

{ #category : #'accessing entries' }
PtSound >> B [
	<type: #Integer>
	<attribute: 4 documentation: 'The number of bits per sample value per channel.'>
	^self objectAt: #B ifAbsent: [8 asPDF]
]

{ #category : #'accessing entries' }
PtSound >> C [
	<type: #Integer>
	<attribute: 3 documentation: 'The number of sound channels.'>
	^self objectAt: #C ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtSound >> CO [
	<type: #Name>
	<attribute: 6 documentation: 'The sound compression format used on the sample data.
(This is separate from any stream compression specified by the sound object’s Filter entry)
If this entry is absent, sound compression shall not be used; the data contains sampled waveforms that shall be played at R samples per second per channel.'>
	^self objectAt: #CO ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtSound >> CP [
	<type: #Object>
	<attribute: 7 documentation: 'Optional parameters specific to the sound compression format used.
No standard values have been defined for the CO and CP entries.'>
	^self objectAt: #CP ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtSound >> E [
	<type: #Name>
	<attribute: 5 documentation: 'The encoding format for the sample data:
	Raw		Unspecified or unsigned values in the range 0 to 2B − 1
	Signed		Twos-complement values
	muLaw		m-law–encoded samples
	ALaw		A-law–encoded samples'>
	^self objectAt: #E ifAbsent: [#Raw asPDF]
]

{ #category : #'accessing entries' }
PtSound >> R [
	<type: #Number>
	<required>
	<attribute: 2 documentation: 'The sampling rate, in samples per second.'>
	^self objectAt: #R
]

{ #category : #'accessing entries' }
PtSound >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Sound asPDF]
]
