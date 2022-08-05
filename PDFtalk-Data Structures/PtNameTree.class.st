"
PDF Name Trees as defined in PDF 32000_2008.pdf pp. 88.

A name tree serves a similar purpose to a dictionary—associating keys and values—but by different means.
A name tree differs from a dictionary in the following important ways:
	• Unlike the keys in a dictionary, which are name objects, those in a name tree are strings.
	• The keys are ordered.
	• The values associated with the keys may be objects of any type.
	Stream objects shall be specified by indirect object references.
	The dictionary, array, and string objects should be specified by indirect object references, and other PDF objects (nulls, numbers, booleans, and names) should be specified as direct objects.
	• The data structure can represent an arbitrarily large collection of key-value pairs, which can be looked up efficiently without requiring the entire data structure to be read from the PDF file. (In contrast, a dictionary can be subject to an implementation limit on the number of entries it can contain.)

A name tree shall be constructed of nodes, each of which shall be a dictionary object.
The nodes shall be of three kinds, depending on the specific entries they contain.
The tree shall always have exactly one root node, which shall contain a single entry: either Kids or Names but not both.
If the root node has a Names entry, it shall be the only node in the tree.
If it has a Kids entry, each of the remaining nodes shall be either an intermediate node, that shall contain a Limits entry and a Kids entry, or a leaf node, that shall contain a Limits entry and a Names entry.
"
Class {
	#name : #PtNameTree,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtNameTree class >> leafClass [
	^PtNameTreeLeaf
]

{ #category : #accessing }
PtNameTree class >> nodeClass [
	^PtNameTreeNode
]

{ #category : #'instance creation' }
PtNameTree class >> on: aDictionary [
	aDictionary at: #Names ifAbsent: [
		^(PtPDF classAt: #NameTree) nodeClass content: aDictionary].
	^(PtPDF classAt: #NameTree) leafClass content: aDictionary
]

{ #category : #accessing }
PtNameTree class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #NameTree
		supertype: #Dictionary
		section: '7.9.6'
		documentation: 'A name tree serves a similar purpose to a dictionary—associating keys and values—but by different means.
A name tree differs from a dictionary in the following important ways:
	• Unlike the keys in a dictionary, which are name objects, those in a name tree are strings.
	• The keys are ordered.
	• The values associated with the keys may be objects of any type.
	Stream objects shall be specified by indirect object references.
	The dictionary, array, and string objects should be specified by indirect object references, and other PDF objects (nulls, numbers, booleans, and names) should be specified as direct objects.
	• The data structure can represent an arbitrarily large collection of key-value pairs, which can be looked up efficiently without requiring the entire data structure to be read from the PDF file. (In contrast, a dictionary can be subject to an implementation limit on the number of entries it can contain.)

A name tree shall be constructed of nodes, each of which shall be a dictionary object.
The nodes shall be of three kinds, depending on the specific entries they contain.
The tree shall always have exactly one root node, which shall contain a single entry: either Kids or Names but not both.
If the root node has a Names entry, it shall be the only node in the tree.
If it has a Kids entry, each of the remaining nodes shall be either an intermediate node, that shall contain a Limits entry and a Kids entry, or a leaf node, that shall contain a Limits entry and a Names entry.'
]

{ #category : #'accessing entries' }
PtNameTree >> Limits [
	<typeArrayOf: #String>
	<attribute: 1 documentation: 'Shall be an array of two strings, that shall specify the (lexically) least and greatest keys included in the Names array of a leaf node or in the Names arrays of any leaf nodes that are descendants of an intermediate node.'>
	^self objectAt: #Limits ifAbsent: [#() asPDF]
]

{ #category : #accessing }
PtNameTree >> elements [
	"<SequenceableCollection of: (Association key: String value: PDFObject)>"

	^#()
]
