Class {
	#name : #PtCrossReferenceTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtCrossReferenceTests >> testReadReference [
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n ' , self stringLf) parser) = (PtUsedReference id: (PtObjectId number: 0 generation: 73) value: 12345).
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '1234567890 00000 n ' , self stringLf) parser) = (PtUsedReference id: (PtObjectId number: 0) value: 1234567890).
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000000003 00015 f ' , self stringLf) parser) = (PtFreeReference id: (PtObjectId number: 0 generation: 15) value: 3).
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000000000 65535 f ' , self stringLf) parser) = (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0).
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n ' , (String with: Character cr)) parser) = (PtUsedReference id: (PtObjectId number: 0 generation: 73) value: 12345).
	self assert: (PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n' , (String with: Character cr) , self stringLf) parser) = (PtUsedReference id: (PtObjectId number: 0 generation: 73) value: 12345)
]

{ #category : #tests }
PtCrossReferenceTests >> testReadReferenceErrors [
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '00000123450 00073 n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '00000123450 00073 n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '000012345 00073 n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '000012345 00073 n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345	00073 n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345	00073 n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 0073 n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 0073 n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 000073 n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 000073 n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 x ' , self stringLf) parser]
		raise: PtFileError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 x ' , self stringLf) parser] on: PtFileError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073	n ' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073	n ' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 n	' , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n	' , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , ' ') parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , ' ') parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , self stringLf) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , self stringLf) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 n' , (String with: Character cr) , (String with: Character cr)) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n' , (String with: Character cr) , (String with: Character cr)) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference'].
	self
		should: [
		PtCrossReference
			read: 0
			from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , (String with: Character cr)) parser]
		raise: PtReadError.
	[
	PtCrossReference
		read: 0
		from: (PtFile readTesterOn: '0000012345 00073 n' , self stringLf , (String with: Character cr)) parser] on: PtReadError do: [:ex |
			self assert: ex description = 'Wrong format of cross-reference']
]

{ #category : #tests }
PtCrossReferenceTests >> testReadSection [
	self assert: (PtCrossReferenceSection readFrom: (PtFile readTesterOn: PtCrossReferenceSection exampleString) parser) = PtCrossReferenceSection example.
]

{ #category : #tests }
PtCrossReferenceTests >> testReadSubsection [
	self assert: (PtCrossReferenceSubsection readFrom: (PtFile readTesterOn: PtCrossReferenceSubsection exampleString) parser) = PtCrossReferenceSubsection example.
	self assert: (PtCrossReferenceSubsection readFrom: (PtFile readTesterOn: PtCrossReferenceSubsection example pdfSource) parser) = PtCrossReferenceSubsection example.
]

{ #category : #tests }
PtCrossReferenceTests >> testWriteReference [
	self assert: (PtUsedReference id: (PtObjectId number: 0) value: 123) valueString = '0000000123'.
	self assert: (PtUsedReference id: (PtObjectId number: 0) value: 1234567890) valueString = '1234567890'.
	self assert: (PtUsedReference id: (PtObjectId number: 0) value: 123456789) valueString = '0123456789'.
	self assert: (PtUsedReference id: (PtObjectId number: 0) value: 12345) generationString = '00000'.
	self assert: (PtUsedReference id: (PtObjectId number: 0 generation: 65535) value: 12345) generationString = '65535'.
	self assert: (PtUsedReference id: (PtObjectId number: 0 generation: 73) value: 12345) generationString = '00073'.
	self assert: (PtUsedReference id: (PtObjectId number: 0 generation: 73) value: 12345) pdfSource = ('0000012345 00073 n ' , self stringLf).
	self assert: (PtFreeReference id: (PtObjectId number: 0 generation: 15) value: 3) pdfSource = ('0000000003 00015 f ' , self stringLf).
	self assert: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0) pdfSource = ('0000000000 65535 f ' , self stringLf)
]

{ #category : #tests }
PtCrossReferenceTests >> testWriteSection [
	self assert: (PtCrossReferenceSection readFrom: (PtFile readTesterOn: 'xref', self stringLf, PtCrossReferenceSection example pdfSource) parser) = PtCrossReferenceSection example
]
