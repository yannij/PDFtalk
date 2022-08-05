"
The ScriptRecord array stores the records alphabetically by a ScriptTag that identifies the script. Each ScriptRecord consists of a ScriptTag and an offset to a Script table.
"
Class {
	#name : #PtOTScriptRecord,
	#superclass : #Value,
	#instVars : [
		'tag',
		'offset'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #specification }
PtOTScriptRecord class >> localSpecification [
	<constant: #tag class: #Integer comment: 'Tag 	ScriptTag 	4-byte ScriptTag identifier'>
	<constant: #offset class: #Integer comment: 'Offset 	Script 	Offset to Script table-from beginning of ScriptList'>
]

{ #category : #'instance creation' }
PtOTScriptRecord class >> tag: tagInteger offset: offsetInteger [
	| inst |
	inst := self new.
	inst initializeTag: tagInteger offset: offsetInteger.
	^inst
]

{ #category : #'initialize-release' }
PtOTScriptRecord >> initializeTag: tagInteger offset: offsetInteger [
	tag := tagInteger.
	offset := offsetInteger.
	self beImmutable
]

{ #category : #accessing }
PtOTScriptRecord >> offset [
	"<Integer>
	Offset 	Script 	Offset to Script table-from beginning of ScriptList"

	^offset
]

{ #category : #printing }
PtOTScriptRecord >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'tag' value: self tag).
	args add: (printer constant: 'offset' value: self offset).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTScriptRecord >> tag [
	"<Integer>
	Tag 	ScriptTag 	4-byte ScriptTag identifier"

	^tag
]
