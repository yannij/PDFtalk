"
This type matches a specific name


"
Class {
	#name : #PtNameType,
	#superclass : #PtAttributeType,
	#category : #'PDFtalk-Typing'
}

{ #category : #'instance creation' }
PtNameType class >> onSymbol: aSymbol [
	^self onType: aSymbol
]

{ #category : #accessing }
PtNameType >> name [
	^self type asString
]

{ #category : #printing }
PtNameType >> printOn: stream [
	stream nextPutAll: self class name asString , ' onSymbol: ' , self type printString
]

{ #category : #testing }
PtNameType >> specifiesObject: aPDFObject [
	^self type asPDF = aPDFObject
]
