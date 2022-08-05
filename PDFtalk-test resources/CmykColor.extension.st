Extension { #name : #CmykColor }

{ #category : #'*PDFtalk-test resources-instance creation' }
CmykColor class >> example [
	^self name: 'BN Gray01' cyan: 0.09 magenta: 0.05 yellow: 0.05 black: 0 rgb: #[232 234 231]
]

{ #category : #'*PDFtalk-test resources-named instances' }
CmykColor class >> gray55 [
	"obsolete - was used by the old Handelsblatt charts"

	^self gray: 0.55
]

{ #category : #'*PDFtalk-test resources-named instances' }
CmykColor class >> hks42 [
	"obsolete - was used by the old Handelsblatt charts"

	^self name: 'HKS42' cyan: 1 magenta: 0.55 yellow: 0 black: 0
]

{ #category : #'*PDFtalk-test resources-named instances' }
CmykColor class >> hks8 [
	"obsolete - was used by the old Handelsblatt charts"

	^self name: 'HKS8' cyan: 0 magenta: 0.5 yellow: 1 black: 0
]

{ #category : #'*PDFtalk-test resources-comparing' }
CmykColor >> isSameColor: anObject [ 
	^self class == anObject class and: [
	self cyan = anObject cyan and: [
	self magenta = anObject magenta and: [
	self yellow = anObject yellow and: [
	self black = anObject black]]]]
]
