"
PDF Explicit Destination as defined in PDF 32000_2008.pdf, section 12.3.2.2, pp. 366.

The table shows the allowed syntactic forms for specifying a destination explicitly in a PDF file.
In each case, page is an indirect reference to a page object (except in a remote go-to action).
All coordinate values (left, right, top, and bottom) shall be expressed in the default user space coordinate system.
The page’s bounding box is the smallest rectangle enclosing all of its contents.
(If any side of the bounding box lies outside the page’s crop box, the corresponding side of the crop box shall be used instead.)

No page object can be specified for a destination associated with a remote go-to action because the destination page is in a different PDF document.
In this case, the page parameter specifies an integer page number within the remote document instead of a page object in the current document.

[page /XYZ left top zoom]
Display the page designated by page, with the coordinates (left, top) positioned at the upper-left corner of the window and the contents of the page magnified by the factor zoom.
A null value for any of the parameters left, top, or zoom specifies that the current value of that parameter shall be retained unchanged.
A zoom value of 0 has the same meaning as a null value.

[page /Fit]
Display the page designated by page, with its contents magnified just enough to fit the entire page within the window both horizontally and vertically.
If the required horizontal and vertical magnification factors are different, use the smaller of the two, centering the page within the window in the other dimension.

[page /FitH top]
Display the page designated by page, with the vertical coordinate toppositioned at the top edge of the window and the contents of the page magnified just enough to fit the entire width of the page within the window.
A null value for top specifies that the current value of that parameter shall be retained unchanged.

[page /FitV left]
Display the page designated by page, with the horizontal coordinate left positioned at the left edge of the window and the contents of the page magnified just enough to fit the entire height of the page within the window.
A null value for left specifies that the current value of that parameter shall be retained unchanged.

[page /FitR left bottom right top]
Display the page designated by page, with its contents magnified just enough to fit the rectangle specified by the coordinates left, bottom, right, and top entirely within the window both horizontally and vertically.
If the required horizontal and vertical magnification factors are different, use the smaller of the two, centering the rectangle within the window in the other dimension.

[page /FitB]
(PDF 1.1) Display the page designated by page, with its contents magnified just enough to fit its bounding box entirely within the window both horizontally and vertically.
If the required horizontal and vertical magnification factors are different, use the smaller of the two, centering the bounding box within the window in the other dimension.

[page /FitBH top]
(PDF 1.1) Display the page designated by page, with the vertical coordinate top positioned at the top edge of the window and the contents of the page magnified just enough to fit the entire width of its bounding box within the window.
A null value for top specifies that the current value of that parameter shall be retained unchanged.

[page /FitBV left]
(PDF 1.1) Display the page designated by page, with the horizontal coordinate left positioned at the left edge of the window and the contents of the page magnified just enough to fit the entire height of its bounding box within the window.
A null value for left specifies that the current value of that parameter shall be retained unchanged.
"
Class {
	#name : #PtExplicitDestination,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtExplicitDestination class >> maxNumberOfAttributes [
	^6
]

{ #category : #accessing }
PtExplicitDestination class >> numberOfAttributes [
	^2
]

{ #category : #accessing }
PtExplicitDestination class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #ExplicitDestination
		supertype: #Destination
		section: '12.3.2'
		documentation: 'A destination defines a particular view of a document, consisting of the following items:
• The page of the document that shall be displayed
• The location of the document window on that page
• The magnification (zoom) factor

Destinations may be associated with outline items, annotations, or actions.
In each case, the destination specifies the view of the document that shall be presented when the outline item or annotation is opened or the action is performed. In addition, the optional OpenAction entry in a document’s catalogue may specify a destination that shall be displayed when the document is opened.
A destination may be specified either explicitly by an array of parameters defining its properties or indirectly by name.'
]

{ #category : #'accessing entries' }
PtExplicitDestination >> page [
	<typeIndirect: #Page>
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'a page object (except in a remote go-to action where it is a page number)'>
	^self objectAt: 1
]

{ #category : #'accessing entries' }
PtExplicitDestination >> parameter1 [
	<type: #Number>
	<type: #Null>
	<attribute: 3 documentation: 'the first parameter (meaning depends on style)'>
	^self objectAt: 3
]

{ #category : #'accessing entries' }
PtExplicitDestination >> parameter2 [
	<type: #Number>
	<type: #Null>
	<attribute: 4 documentation: 'the second parameter (meaning depends on style)'>
	^self objectAt: 4
]

{ #category : #'accessing entries' }
PtExplicitDestination >> parameter3 [
	<type: #Number>
	<type: #Null>
	<attribute: 5 documentation: 'the third parameter (meaning depends on style)'>
	^self objectAt: 5
]

{ #category : #'accessing entries' }
PtExplicitDestination >> parameter4 [
	<type: #Number>
	<type: #Null>
	<attribute: 6 documentation: 'the fourth parameter (meaning depends on style)'>
	^self objectAt: 6
]

{ #category : #'accessing entries' }
PtExplicitDestination >> style [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'the style in which the destination will be displayed.
One of /XYZ /Fit /FitH /FitV /FitR /FitB /FitBH or /FitBV'>
	^self objectAt: 2
]
