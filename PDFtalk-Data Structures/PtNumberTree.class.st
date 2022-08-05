"
PDF Number Trees as defined in PDF 32000_2008.pdf pp. 91.

A number tree is similar to a name tree (see NameTree), except that its keys shall be integers instead of strings and shall be sorted in ascending numerical order.
The entries in the leaf (or root) nodes containing the key-value pairs shall be named Nums instead of Names as in a name tree.
"
Class {
	#name : #PtNumberTree,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtNumberTree class >> leafClass [
	^PtNumberTreeLeaf
]

{ #category : #accessing }
PtNumberTree class >> nodeClass [
	^PtNumberTreeNode
]

{ #category : #'instance creation' }
PtNumberTree class >> on: aDictionary [
	aDictionary at: #Nums ifAbsent: [
		^(PtPDF classAt: #NumberTree) nodeClass content: aDictionary].
	^(PtPDF classAt: #NumberTree) leafClass content: aDictionary
]

{ #category : #accessing }
PtNumberTree class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #NumberTree
		supertype: #Dictionary
		section: '7.9.7'
		documentation: 'A number tree is similar to a name tree (see NameTree), except that its keys shall be integers instead of strings and shall be sorted in ascending numerical order.
The entries in the leaf (or root) nodes containing the key-value pairs shall be named Nums instead of Names as in a name tree.'
]

{ #category : #'accessing entries' }
PtNumberTree >> Limits [
	<typeArrayOf: #Integer>
	<attribute: 1 documentation: '(Shall be present in Intermediate and leaf nodes only)
Shall be an array of two integers, that shall specify the (numerically) least and greatest keys included in the Nums array of a leaf node or in the Nums arrays of any leaf nodes that are descendants of an intermediate node.'>
	^self objectAt: #Limits ifAbsent: [#() asPDF]
]
