"
PDF 3D Annotations as defined in PDF 32000_2008.pdf, section 13.6.2, pp. 514.

An activation dictionary determines how the state of the annotation and its associated artwork may change.

"
Class {
	#name : #PtThreeDActivation,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtThreeDActivation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ThreeDActivation
		supertype: #Dictionary
		version: #(1 6)
		section: '13.6.2'
		documentation: 'An activation dictionary determines how the state of the annotation and its associated artwork may change.'
]

{ #category : #'accessing entries' }
PtThreeDActivation >> A [
	<type: #Name>
	<attribute: 1 documentation: 'A name specifying the circumstances under which the annotation shall be activated.
Valid values are:
	PO	The annotation shall be activated as soon as the page containing the annotation is opened.
	PV	The annotation shall be activated as soon as any part of the page containing the annotation becomes visible.
	XA	The annotation shall remain inactive until explicitly activated by a script or user action.

	NOTE 	At any one time, only a single page shall be considered open in a conforming reader, even though more than one page may be visible, depending on the page layout.
Default value: XA.
	NOTE 	For performance reasons, documents intended for viewing in a web browser should use explicit activation (XA).
In non-interactive applications, such as printing systems or aggregating conforming reader, PO and PV indicate that the annotation shall be activated when the page is printed or placed; XA indicates that the annotation shall never be activated and the normal appearance shall be used.'>
	^self objectAt: #A ifAbsent: [#XA asPDF]
]

{ #category : #'accessing entries' }
PtThreeDActivation >> AIS [
	<type: #Name>
	<attribute: 2 documentation: 'A name specifying the state of the artwork instance upon activation of the annotation.
Valid values are:
	I	The artwork shall be instantiated, but real-time script-driven animations shall be disabled.
	L	Real-time script-driven animations shall be enabled if present; if not, the artwork shall be instantiated.

	NOTE	In non-interactive conforming readers, the artwork shall be instantiated and scripts shall be disabled.'>
	^self objectAt: #AIS ifAbsent: [#L asPDF]
]

{ #category : #'accessing entries' }
PtThreeDActivation >> D [
	<type: #Name>
	<attribute: 3 documentation: 'A name specifying the circumstances under which the annotation shall be deactivated.
Valid values are:
	PC	The annotation shall be deactivated as soon as the page is closed.
	PI	The annotation shall be deactivated as soon as the page containing the annotation becomes invisible.
	XD	The annotation shall remain active until explicitly deactivated by a script or user action.

	NOTE	At any one time, only a single page shall be considered open in the conforming reader, even though more than one page may be visible, depending on the page layout.'>
	^self objectAt: #D ifAbsent: [#PI asPDF]
]

{ #category : #'accessing entries' }
PtThreeDActivation >> DIS [
	<type: #Name>
	<attribute: 4 documentation: 'A name specifying the state of the artwork instance upon deactivation of the annotation.
Valid values are U (uninstantiated), I(instantiated), and L (live).

	NOTE	If the value of this entry is L, uninstantiation of instantiated artwork is necessary unless it has been modified. 
			Uninstantiation is never required in non-interactive conforming readers.'>
	^self objectAt: #DIS ifAbsent: [#U asPDF]
]

{ #category : #'accessing entries' }
PtThreeDActivation >> NP [
	<type: #Boolean>
	<version: 1 dot: 7>
	<attribute: 6 documentation: 'A flag indicating the default behavior of the user interface for viewing or managing information about the 3D artwork.
Such user interfaces can enable navigation to different views or can depict the hierarchy of the objects in the artwork (the model tree).
If true, the user interface should be made visible when the annotation is activated.
If false, the user interface should not be made visible by default.'>
	^self objectAt: #NP ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtThreeDActivation >> TB [
	<type: #Boolean>
	<version: 1 dot: 7>
	<attribute: 5 documentation: 'A flag indicating the default behavior of an interactive toolbar associated with this annotation.
If true, a toolbar shall be displayed by default when the annotation is activated and given focus.
If false, a toolbar shall not be displayed by default.
	NOTE	Typically, a toolbar is positioned in proximity to the 3D annotation.'>
	^self objectAt: #TB ifAbsent: [true]
]
