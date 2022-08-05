"
PDF Name Trees as defined in PDF 32000_2008.pdf pp. 88.

The Kids entries in the root and intermediate nodes define the tree’s structure by identifying the immediate children of each node.
"
Class {
	#name : #PtNameTreeNode,
	#superclass : #PtNameTree,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'accessing entries' }
PtNameTreeNode >> Kids [
	<typeArrayOf: #NameTree>
	<required>
	<attribute: 1 documentation: '(Root and intermediate nodes only; present in the root node if and only if Names is not present)
Shall be an array of indirect references to the immediate children of this node. The children may be intermediate or leaf nodes.'>
	^self objectAt: #Kids
]

{ #category : #accessing }
PtNameTreeNode >> elements [
	| wst |
	wst := Array new writeStream.
	self Kids do: [:nameTree | wst nextPutAll: nameTree elements].
	^wst contents
]
