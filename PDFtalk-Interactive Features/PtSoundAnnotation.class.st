"
PDF Sound Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.16, pp. 406.

A sound annotation shall analogous to a text annotation except that instead of a text note, it contains sound recorded from the computer’s microphone or imported from a file.
When the annotation is activated, the sound shall be played.
The annotation shall behave like a text annotation in most ways, with a different icon (by default, a speaker) to indicate that it represents a sound.
"
Class {
	#name : #PtSoundAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtSoundAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #SoundAnnotation
		supertype: #Annot
		version: #(1 2)
		section: '12.5.6.16'
		documentation: 'A sound annotation shall analogous to a text annotation except that instead of a text note, it contains sound recorded from the computer’s microphone or imported from a file.
When the annotation is activated, the sound shall be played.
The annotation shall behave like a text annotation in most ways, with a different icon (by default, a speaker) to indicate that it represents a sound.'
]

{ #category : #accessing }
PtSoundAnnotation class >> subtype [
	^#Sound
]

{ #category : #'accessing entries' }
PtSoundAnnotation >> Name [
	<type: #Name>
	<attribute: 2 documentation: 'The name of an icon that shall be used in displaying the annotation.
Conforming readers shall provide predefined icon appearances for at least the standard names Speaker and Mic.
Additional names may be supported as well.
The annotation dictionary’s AP entry, if present, shall take precedence over the Name entry.'>
	^self objectAt: #Name ifAbsent: [#Speaker asPDF]
]

{ #category : #'accessing entries' }
PtSoundAnnotation >> Sound [
	<type: #Sound>
	<required>
	<attribute: 1 documentation: 'A sound object defining the sound that shall be played when the annotation is activated.'>
	^self objectAt: #Sound
]
