"
PDF Number Trees as defined in PDF 32000_2008.pdf pp. 91.

A number tree is similar to a name tree (see NameTree), except that its keys shall be integers instead of strings and shall be sorted in ascending numerical order.
The entries in the leaf (or root) nodes containing the key-value pairs shall be named Nums instead of Names as in a name tree.
"
Class {
	#name : #PtNumberTreeLeaf,
	#superclass : #PtNumberTree,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'accessing entries' }
PtNumberTreeLeaf >> Nums [
	<type: #Array>
	<required>
	<attribute: 1 documentation: 'Shall be an array of the form
	[key1 value1 key2 value2 … keyn valuen]
where each key i is an integer and the corresponding value i shall be the object associated with that key.
The keys shall be sorted in numerical order, analogously to the arrangement of keys in a name tree'>
	^self objectAt: #Nums
]
