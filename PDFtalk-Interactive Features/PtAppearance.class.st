"
PDF appearance dictionary as defined in PDF 32000_2008.pdf, section 12.5.5, pp. 389.

An annotation may define as many as three separate appearances:

• The normal appearance shall be used when the annotation is not interacting with the user. This appearance is also used for printing the annotation.

• The rollover appearance shall be used when the user moves the cursor into the annotation’s active area without pressing the mouse button.

• The down appearance shall be used when the mouse button is pressed or held down within the annotation’s active area.

NOTE As used here, the term mouse denotes a generic pointing device that controls the location of a cursor on the screen and has at least one button that can be pressed, held down, and released.

The normal, rollover, and down appearances shall be defined in an appearance dictionary, which in turn is the value of the AP entry in the annotation dictionary.
"
Class {
	#name : #PtAppearance,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtAppearance class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Appearance
		supertype: #Dictionary
		version: #(1 2)
		section: '12.5.5'
		documentation: 'Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.
As a convenience, when a field has only a single associated widget annotation, the contents of the field dictionary and the annotation dictionary may be merged into a single dictionary containing entries that pertain to both a field and an annotation.

	NOTE	This presents no ambiguity, since the contents of the two kinds of dictionaries do not conflict.'
]

{ #category : #'accessing entries' }
PtAppearance >> D [
	<type: #FormXObject>
	<type: #Dictionary>
	<attribute: 3 documentation: 'The annotation’s down appearance.
Default value: the value of the N entry.'>
	^self objectAt: #D ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtAppearance >> N [
	<type: #FormXObject>
	<type: #Dictionary>
	<required>
	<attribute: 1 documentation: 'The annotation’s normal appearance.'>
	^self objectAt: #N
]

{ #category : #'accessing entries' }
PtAppearance >> R [
	<type: #FormXObject>
	<type: #Dictionary>
	<attribute: 2 documentation: 'The annotation’s rollover appearance.
Default value: the value of the N entry.'>
	^self objectAt: #R ifAbsent: [nil]
]
