"
PDF Line Dash Pattern as defined in PDF 32000_2008.pdf, section 8.4.3.6, pp. 126.

The line dash pattern shall control the pattern of dashes and gaps used to stroke paths. It shall be specified by a dash array and a dash phase. 
The dash array's elements shall be numbers that specify the lengths of alternating dashes and gaps; 
the numbers shall be nonnegative and not all zero. 
The dash phase shall specify the distance into the dash pattern at which to start the dash. 
The elements of both the dash array and the dash phase shall be expressed in user space units.

Before beginning to stroke a path, the dash array shall be cycled through, adding up the lengths of dashes and gaps. 
When the accumulated length equals the value specified by the dash phase, stroking of the path shall begin, 
and the dash array shall be used cyclically from that point onward. 
As can be seen from the table, an empty dash array and zero phase can be used to restore the dash pattern to a solid line.

Dashed lines shall wrap around curves and corners just as solid stroked lines do. 
The ends of each dash shall be treated with the current line cap style, and corners within dashes shall be treated with the current line join style. 
A stroking operation shall take no measures to coordinate the dash pattern with features of the path; 
it simply shall dispense dashes and gaps along the path in the pattern defined by the dash array.

When a path consisting of several subpaths is stroked, each subpath shall be treated independently—that is, 
the dash pattern shall be restarted and the dash phase shall be reapplied to it at the beginning of each subpath.
"
Class {
	#name : #PtDash,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtDash class >> array: arrayArray [
	^self array: arrayArray offset: 0
]

{ #category : #'instance creation' }
PtDash class >> array: arrayArray offset: offsetNumber [
	| inst |
	inst := self empty.
	inst initializeArray: arrayArray offset: offsetNumber.
	^inst
]

{ #category : #'instance creation' }
PtDash class >> empty [
	| empty |
	empty := super empty.
	empty at: 1 put: #().
	empty at: 2 put: 0.
	^empty
]

{ #category : #accessing }
PtDash class >> numberOfAttributes [
	^2
]

{ #category : #'instance creation' }
PtDash class >> offset: offsetNumber [
	^self array: #() offset: offsetNumber
]

{ #category : #accessing }
PtDash class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Dash
		supertype: #Object
		section: '8.4.3.6'
		documentation: 'The line dash pattern shall control the pattern of dashes and gaps used to stroke paths. It shall be specified by a dash array and a dash phase. 
The dash arrays elements shall be numbers that specify the lengths of alternating dashes and gaps; 
the numbers shall be nonnegative and not all zero. 
The dash phase shall specify the distance into the dash pattern at which to start the dash. 
The elements of both the dash array and the dash phase shall be expressed in user space units.

Before beginning to stroke a path, the dash array shall be cycled through, adding up the lengths of dashes and gaps. 
When the accumulated length equals the value specified by the dash phase, stroking of the path shall begin, 
and the dash array shall be used cyclically from that point onward. 
As can be seen from the table, an empty dash array and zero phase can be used to restore the dash pattern to a solid line.

Dashed lines shall wrap around curves and corners just as solid stroked lines do. 
The ends of each dash shall be treated with the current line cap style, and corners within dashes shall be treated with the current line join style. 
A stroking operation shall take no measures to coordinate the dash pattern with features of the path; 
it simply shall dispense dashes and gaps along the path in the pattern defined by the dash array.

When a path consisting of several subpaths is stroked, each subpath shall be treated independently—that is, 
the dash pattern shall be restarted and the dash phase shall be reapplied to it at the beginning of each subpath.'
]

{ #category : #'accessing entries' }
PtDash >> array [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'The dash array’s elements shall be numbers that specify the lengths of alternating dashes and gaps; the numbers shall be nonnegative and not all zero'>
	^self objectAt: 1 ifNil: [#() asPDF]
]

{ #category : #'initialize-release' }
PtDash >> initializeArray: arrayArray offset: offsetNumber [
	self at: 1 put: (Array withAll: (arrayArray ifNil: [#()])).
	self at: 2 put: (offsetNumber ifNil: [0])
]

{ #category : #'accessing entries' }
PtDash >> offset [
	<type: #Number>
	<attribute: 2 documentation: 'The dash array’s elements shall be numbers that specify the lengths of alternating dashes and gaps; the numbers shall be nonnegative and not all zero'>
	^self objectAt: 2 ifNil: [0 asPDF]
]

{ #category : #printing }
PtDash >> printvalueWith: printer [
	| wst |
	wst := String new writeStream.
	wst
		nextPut: $(;
		nextPutAll: (printer classnameOf: self);
		nextPutAll: ' array: ';
		nextPutAll: self array asSmalltalkValue printString;
		nextPutAll: ' offset: ';
		nextPutAll: self offset asSmalltalkValue printString;
		nextPut: $).
	^LiteralPrintvalue string: wst contents
]

{ #category : #copying }
PtDash >> scaled: aNumber [
	^self class
		array: (self array content collect: [:elem | elem * aNumber])
		offset: self offset content * aNumber
]

{ #category : #accessing }
PtDash >> string [
	"<String>
	the PostScript source arguments for setdash. Default: '[] 0' "

	^self pdfSource
]
