"
PDF Widget Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.19, pp. 409.

The MK entry may be used to provide an appearance characteristics dictionary containing additional information for constructing the annotation’s appearance stream.
"
Class {
	#name : #PtAppearanceCharacteristics,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtAppearanceCharacteristics class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #AppearanceCharacteristics
		supertype: #Dictionary
		section: '12.5.6.19'
		documentation: 'The MK entry may be used to provide an appearance characteristics dictionary containing additional information for constructing the annotation’s appearance stream.'
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> AC [
	<type: #String>
	<attribute: 6 documentation: '(pushbutton fields only)
The widget annotation’s alternate (down) caption, which shall be displayed when the mouse button is pressed within its active area.'>
	^self objectAt: #AC ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> BC [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of numbers that shall be in the range 0.0 to 1.0 specifying the colour of the widget annotation’s border.
The number of array elements determines the colour space in which the colour shall bedefined:
	0	No colour; transparent
	1	DeviceGray
	3	DeviceRGB
	4	DeviceCMYK'>
	^self objectAt: #BC ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> BG [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: 'An array of numbers that shall be in the range 0.0 to 1.0 specifying the colour of the widget annotation’s background.
The number of array elements shall determine the colour space, as described for BC.'>
	^self objectAt: #BG ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> CA [
	<type: #String>
	<attribute: 4 documentation: '(button fields only)
The widget annotation’s normal caption, which shall be displayed when it is not interacting with the user.

Unlike the remaining entries listed in this Table, which apply only to widget annotations associated with pushbutton fields, the CA entry may be used with any type of button field, including check boxes and radio buttons.'>
	^self objectAt: #CA ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> I [
	<typeIndirect: #FormXObject>
	<attribute: 7 documentation: '(pushbutton fields only)
A form XObject defining the widget annotation’s normal icon, which shall be displayed when it is not interacting with the user.'>
	^self objectAt: #I ifAbsent: [(PtPDF classAt: #FormXObject) empty]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> IF [
	<type: #Dictionary>
	<attribute: 10 documentation: '(pushbutton fields only)
An icon fit dictionary specifying how the widget annotation’s icon shall be displayed within its annotation rectangle.
If present, the icon fit dictionary shall apply to all of the annotation’s icons (normal, rollover, and alternate).'>
	^self objectAt: #IF ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> IX [
	<typeIndirect: #FormXObject>
	<attribute: 9 documentation: '(pushbutton fields only)
A form XObject defining the widget annotation’s alternate (down) icon, which shall be displayed when the mouse button is pressed within its active area.'>
	^self objectAt: #IX ifAbsent: [(PtPDF classAt: #FormXObject) empty]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> R [
	<type: #Integer>
	<attribute: 1 documentation: 'The number of degrees by which the widget annotation shall be rotated counterclockwise relative to the page.
The value shall be a multiple of 90.'>
	^self objectAt: #R ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> RC [
	<type: #String>
	<attribute: 5 documentation: '(pushbutton fields only)
The widget annotation’s rollover caption, which shall be displayed when the user rolls the cursor into its active area without pressing the mouse button.'>
	^self objectAt: #RC ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> RI [
	<typeIndirect: #FormXObject>
	<attribute: 8 documentation: '(pushbutton fields only)
A form XObject defining the widget annotation’s rollover icon, which shall be displayed when the user rolls the cursor into its active area without pressing the mouse button.'>
	^self objectAt: #RI ifAbsent: [(PtPDF classAt: #FormXObject) empty]
]

{ #category : #'accessing entries' }
PtAppearanceCharacteristics >> TP [
	<type: #Integer>
	<attribute: 11 documentation: '(pushbutton fields only)
A code indicating where to position the text of the widget annotation’s caption relative to its icon:
	0	No icon; caption only
	1	No caption; icon only
	2	Caption below the icon
	3	Caption above the icon
	4	Caption to the right of the icon
	5	Caption to the left of the icon
	6	Caption overlaid directly on the icon.'>
	^self objectAt: #TP ifAbsent: [0 asPDF]
]
