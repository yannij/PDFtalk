Extension { #name : #PSCategory }

{ #category : #'*PostScript-Testing-examples' }
PSCategory class >> exampleResourceDictionary [
	| dict |
	dict := PSDictionary new.
	dict at: #DefineResource put: self genericDefineResource.
	dict at: #UndefineResource put: self genericUndefineResource.
	dict at: #FindResource put: self genericFindResource.
	dict at: #ResourceStatus put: self genericResourceStatus.
	dict at: #ResourceForAll put: self genericResourceForAll.
	dict at: #Category put: #Example.
	dict at: #InstanceType put: #dicttype.
	dict at: #ResourceFileName put: self genericResourceFileName.
	^dict
]
