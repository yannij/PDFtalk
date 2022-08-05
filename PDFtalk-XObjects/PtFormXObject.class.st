"
PDF Form XObjects as defined in PDF 32000_2008.pdf, section 8.10, pp. 217.

A form XObject is a PDF content stream that is a self-contained description of any sequence of graphics objects (including path objects, text objects, and sampled images). 
A form XObject may be painted multiple times—either on several pages or at several locations on the same page
—and produces the same results each time, subject only to the graphics state at the time it is invoked. 
Not only is this shared definition economical to represent in the PDF file, 
but under suitable circumstances the conforming reader can optimize execution by caching the results of rendering the form XObject for repeated reuse.

NOTE 1		The term form also refers to a completely different kind of object, an interactive form (sometimes called an AcroForm). 
			Whereas the form XObjects described in this sub-clause correspond to the notion of forms in the PostScript language, 
			interactive forms are the PDF equivalent of the familiar paper instrument. 
			Any unqualified use of the word form is understood to refer to an interactive form; 
			the type of form described here is always referred to explicitly as a form XObject.
"
Class {
	#name : #PtFormXObject,
	#superclass : #PtXObject,
	#category : #'PDFtalk-XObjects'
}

{ #category : #testing }
PtFormXObject class >> isClassForStream: aStream [
	self == (PtPDF classAt: #FormXObject) ifFalse: [
		^super isClassForStream: aStream].
	^(super isClassForStream: aStream) and: [
	(aStream hasKey: #Group) not]
]

{ #category : #accessing }
PtFormXObject class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #FormXObject
		supertype: #XObject
		section: '8.10'
		documentation: 'A form XObject is a PDF content stream that is a self-contained description of any sequence of graphics objects (including path objects, text objects, and sampled images). 
A form XObject may be painted multiple times—either on several pages or at several locations on the same page
—and produces the same results each time, subject only to the graphics state at the time it is invoked. 
Not only is this shared definition economical to represent in the PDF file, 
but under suitable circumstances the conforming reader can optimize execution by caching the results of rendering the form XObject for repeated reuse.

NOTE 1		The term form also refers to a completely different kind of object, an interactive form (sometimes called an AcroForm). 
			Whereas the form XObjects described in this sub-clause correspond to the notion of forms in the PostScript language, 
			interactive forms are the PDF equivalent of the familiar paper instrument. 
			Any unqualified use of the word form is understood to refer to an interactive form; 
			the type of form described here is always referred to explicitly as a form XObject.'
]

{ #category : #accessing }
PtFormXObject class >> resourcePrefix [
	^'Fm'
]

{ #category : #accessing }
PtFormXObject class >> subtype [
	^#Form
]

{ #category : #'accessing entries' }
PtFormXObject >> BBox [
	<type: #Rectangle>
	<required>
	<attribute: 2 documentation: 'An array of four numbers in the form coordinate system, 
giving the coordinates of the left, bottom, right, and top edges, respectively, of the form XObject’s bounding box. 
These boundaries shall be used to clip the form XObject and to determine its size for caching.'>
	^self objectAt: #BBox
]

{ #category : #'accessing entries' }
PtFormXObject >> FormType [
	<type: #Integer>
	<attribute: 1 documentation: 'A code identifying the type of form XObject that this dictionary describes. 
The only valid value is 1.'>
	^self objectAt: #FormType ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtFormXObject >> Group [
	<type: #GroupAttributes>
	<version: 1 dot: 4>
	<attribute: 5 documentation: 'A group attributes dictionary indicating that the contents of the form XObject shall be treated 
as a group and specifying the attributes of that group.

If a Ref entry is present, the group attributes shall also apply to the external page imported by that entry, 
which allows such an imported page to be treated as a group without further modification.'>
	^self objectAt: #Group
]

{ #category : #'accessing entries' }
PtFormXObject >> LastModified [
	<type: #Date>
	<requiredIf: #PieceInfo>
	<version: 1 dot: 3>
	<attribute: 9 documentation: 'The date and time when the form XObject’s contents were most recently modified. 
If a page-piece dictionary (PieceInfo) is present, the modification date shall be used to ascertain 
which of the application data dictionaries it contains correspond to the current content of the form.'>
	^self objectAt: #LastModified ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtFormXObject >> Matrix [
	<type: #Matrix>
	<attribute: 3 documentation: 'An array of six numbers specifying the form matrix, which maps form space into user space.'>
	^self objectAt: #Matrix ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

{ #category : #'accessing entries' }
PtFormXObject >> Metadata [
	<type: #Stream>
	<version: 1 dot: 4>
	<attribute: 7 documentation: 'A metadata stream containing metadata for the form XObject.'>
	^self objectAt: #Metadata
]

{ #category : #'accessing entries' }
PtFormXObject >> Name [
	<type: #Name>
	<attribute: 14 documentation: '(Required in PDF 1.0; optional otherwise) 
The name by which this form XObject is referenced in the XObject subdictionary of the current resource dictionary.
NOTE	This entry is obsolescent and its use is no longer recommended.'>
	^self objectAt: #Name
]

{ #category : #'accessing entries' }
PtFormXObject >> OC [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 13 documentation: 'An optional content group or optional content membership dictionary specifying the optional content properties for the form XObject. 
Before the form is processed, its visibility shall be determined based on this entry. 
If it is determined to be invisible, the entire form shall be skipped, as if there were no Do operator to invoke it.'>
	^self objectAt: #OC ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFormXObject >> OPI [
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 12 documentation: 'An OPI version dictionary for the form XObject.'>
	^self objectAt: #OPI ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFormXObject >> PieceInfo [
	<typeDictionaryOf: #PieceInfo>
	<version: 1 dot: 3>
	<attribute: 8 documentation: 'A page-piece dictionary associated with the form XObject.'>
	^self objectAt: #PieceInfo
]

{ #category : #'accessing entries' }
PtFormXObject >> Ref [
	<type: #Dictionary>
	<version: 1 dot: 4>
	<attribute: 6 documentation: 'A reference dictionary identifying a page to be imported from another PDF file, 
and for which the form XObject serves as a proxy.'>
	^self objectAt: #Ref ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFormXObject >> Resources [
	<type: #Resources>
	<version: 1 dot: 2>
	<attribute: 4 documentation: '(Optional but strongly recommended) 
A dictionary specifying any resources (such as fonts and images) required by the form XObject.

In a PDF whose version is 1.1 and earlier, all named resources used in the form XObject 
shall be included in the resource dictionary of each page object on which the form XObject appears, 
regardless of whether they also appear in the resource dictionary of the form XObject. 
These resources should also be specified in the form XObject’s resource dictionary as well, to determine which resources are used inside the form XObject. 
If a resource is included in both dictionaries, it shall have the same name in both locations.

In PDF 1.2 and later versions, form XObjects may be independent of the content streams in which they appear, and this is strongly recommended although not required. 
In an independent form XObject, the resource dictionary of the form XObject is required and shall contain all named resources used by the form XObject. 
These resources shall not be promoted to the outer content stream’s resource dictionary, although that stream’s resource dictionary refers to the form XObject.'>
	^self objectAt: #Resources ifAbsent: [(PtPDF classAt: #Resources) new]
]

{ #category : #'accessing entries' }
PtFormXObject >> StructParent [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 10 documentation: '(Required if the form XObject is a structural content item)
The integer key of the form XObject’s entry in the structural parent tree.'>
	^self objectAt: #StructParent
]

{ #category : #'accessing entries' }
PtFormXObject >> StructParents [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 11 documentation: '(Required if the form XObject contains marked-content sequences that are structural content items) 
The integer key of the form XObject’s entry in the structural parent tree.

At most one of the entries StructParent or StructParents shall bepresent. 
A form XObject shall be either a content item in its entirety or a container for marked-content sequences that are content items, but not both.'>
	^self objectAt: #StructParents
]

{ #category : #accessing }
PtFormXObject >> contentGraphics [
	"<ContentGraphics>"

	^PtContentGraphics on: self
]

{ #category : #accessing }
PtFormXObject >> contentString [
	"<String>
	all decoded content"

	^self internal
]
