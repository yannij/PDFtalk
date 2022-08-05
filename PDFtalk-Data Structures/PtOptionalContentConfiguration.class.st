"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.3, pp. 229.

The D and Configs entries in a OptionalContentProperties are configuration dictionaries, which represent different presentations of a document’s optional content groups for use by conforming readers.
The D configuration dictionary shall be used to specify the initial state of the optional content groups when a document is first opened.
Configs lists other configurations that may be used under particular circumstances
"
Class {
	#name : #PtOptionalContentConfiguration,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentConfiguration class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentConfiguration
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.3'
		documentation: 'The D and Configs entries in a OptionalContentProperties are configuration dictionaries, which represent different presentations of a document’s optional content groups for use by conforming readers.
The D configuration dictionary shall be used to specify the initial state of the optional content groups when a document is first opened.
Configs lists other configurations that may be used under particular circumstances'
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> AS [
	<typeArrayOf: #OptionalContentUsageApplication>
	<attribute: 7 documentation: 'An array of usage application dictionaries specifying which usage dictionary categories shall be consulted by conforming readers to automatically set the states of optional content groups based on external factors, such as the current system language or viewing magnification, and when they shall be applied'>
	^self objectAt: #AS ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> BaseState [
	<type: #Name>
	<attribute: 3 documentation: 'Used to initialize the states of all the optional content groups in a document when this configuration is applied.
The value of this entry shall be one of the following names:
	ON The states of all groups shall be turned ON.
	OFF The states of all groups shall be turned OFF.
	Unchanged The states of all groups shall be left unchanged.
After this initialization, the contents of the ON and OFF arrays shall beprocessed, overriding the state of the groups included in the arrays.

If BaseState is present in the document’s default configuration dictionary, its value shall be ON.'>
	^self objectAt: #BaseState ifAbsent: [#ON asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> Creator [
	<type: #String>
	<attribute: 2 documentation: 'Name of the application or feature that created this configuration dictionary'>
	^self objectAt: #Creator ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> Intent [
	<type: #Name>
	<typeArrayOf: #Name>
	<attribute: 6 documentation: 'A single intent name or an array containing any combination of names.
It shall be used to determine which optional content groups’ states to consider and which to ignore in calculating the visibility of content.

PDF defines two intent names, View and Design.
In addition, the name All shall indicate the set of all intents, including those not yet defined.
The value shall be View for the document’s default configuration'>
	^self objectAt: #Intent ifAbsent: [#View asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> ListMode [
	<type: #Name>
	<attribute: 9 documentation: 'A name specifying which optional content groups in the Order array shall be displayed to the user.
Valid values shall be:
	AllPages 		Display all groups in the Order array.
	VisiblePages 	Display only those groups in the Order array that are referenced by one or more visible pages'>
	^self objectAt: #ListMode ifAbsent: [#AllPages asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> Locked [
	<type: #Array>
	<version: 1 dot: 6>
	<attribute: 11 documentation: 'An array of optional content groups that shall be locked when this configuration is applied.
The state of a locked group cannot be changed through the user interface of a conforming reader.
Conforming writers can use this entry to prevent the visibility of content that depends on these groups from being changed by users.

A conforming reader may allow the states of optional content groups from being changed by means other than the user interface, such as JavaScript or items in the AS entry of a configuration dictionary'>
	^self objectAt: #Locked ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> Name [
	<type: #String>
	<attribute: 1 documentation: 'A name for the configuration, suitable for presentation in a user interface'>
	^self objectAt: #Name ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> OFF [
	<typeArrayOf: #OptionalContentGroup>
	<attribute: 5 documentation: 'An array of optional content groups whose state shall beset to OFF when this configuration is applied.
If the BaseState entry is OFF, this entry is redundant'>
	^self objectAt: #OFF ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> ON [
	<typeArrayOf: #OptionalContentGroup>
	<attribute: 4 documentation: 'An array of optional content groups whose state shall beset to ON when this configuration is applied.
If the BaseState entry is ON, this entry is redundant'>
	^self objectAt: #ON ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> Order [
	<type: #Array>
	<attribute: 8 documentation: 'An array specifying the order for presentation of optional content groups in a conforming reader’s user interface.
The array elements may include the following objects:

	Optional content group dictionaries, whose Name entry shall be displayed in the user interface by the conforming reader.

	Arrays of optional content groups which may be displayed by a conforming reader in a tree or outline structure. Each nested array may optionally have as its first element a text string to be used as a non-selectable label in a conforming reader’s user interface.

	Text labels in nested arrays shall be used to present collections of related optional content groups, and not to communicate actual nesting of content inside multiple layers of groups.
To reflect actual nesting of groups in the content, such as for layers with sublayers, nested arrays of groups without a text label shall be used.

	An empty array [] explicitly specifies that no groups shall be presented.

In the default configuration dictionary, the default value shall be an empty array; in other configuration dictionaries, the default shall be the Order value from the default configuration dictionary.

Any groups not listed in this array shall not be presented in any user interface that uses the configuration'>
	^self objectAt: #Order ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentConfiguration >> RBGroups [
	<typeArrayOf: #Array>
	<attribute: 10 documentation: 'An array consisting of one or more arrays, each of which represents a collection of optional content groups whose states shall be intended to follow a radio button paradigm.
That is, the state of at most one optional content group in each array shall be ON at a time.
If one group is turned ON, all others shall be turned OFF.
However, turning a group from ON to OFF does not force any other group to be turned ON.

An empty array [] explicitly indicates that no such collections exist.

In the default configuration dictionary, the default value shall be an empty array; in other configuration dictionaries, the default is the RBGroups value from the default configuration dictionary'>
	^self objectAt: #RBGroups ifAbsent: [#() asPDF]
]
