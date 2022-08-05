"
PDF Number Trees as defined in PDF 32000_2008.pdf pp. 91.

A number tree is similar to a name tree (see NameTree), except that its keys shall be integers instead of strings and shall be sorted in ascending numerical order.
The entries in the leaf (or root) nodes containing the key-value pairs shall be named Nums instead of Names as in a name tree.
"
Class {
	#name : #PtNumberTreeNode,
	#superclass : #PtNumberTree,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'accessing entries' }
PtNumberTreeNode >> Kids [
	<typeArrayOf: #NumberTree>
	<required>
	<attribute: 1 documentation: 'Shall be an array of indirect references to the immediate children of this node.
The children may be intermediate or leaf nodes.'>
	^self objectAt: #Kids
]
