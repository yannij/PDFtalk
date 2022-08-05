Class {
	#name : #ByteStreamTests,
	#superclass : #TestCase,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
ByteStreamTests >> testStreamReading [
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4]) next = 1.
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4]) nextShort = 16r201.
	self assert: (ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextShort = -16r1F10.
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4]) nextUnsignedShort = 16r201.
	self assert: (ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextUnsignedShort = 16re0f0.
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4]) nextLong = 16r4030201.
	self assert: (ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextLong = -16r3F2F1F10.
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4]) nextUnsignedLong = 16r4030201.
	self assert: (ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextUnsignedLong = 16rc0d0e0f0.
	self assert: (ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) nextLongLong = 16r807060504030201.
	self assert: (ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) nextLongLong = -16r7F6F5F4F3F2F1F10.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4]) next = 1.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4]) nextShort = 16r102.
	self assert: (ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextShort = -16rF20.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4]) nextUnsignedShort = 16r102.
	self assert: (ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextUnsignedShort = 16rf0e0.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4]) nextLong = 16r1020304.
	self assert: (ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextLong = -16rF1F2F40.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4]) nextUnsignedLong = 16r1020304.
	self assert: (ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) nextUnsignedLong = 16rf0e0d0c0.
	self assert: (ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) nextLongLong = 16r102030405060708.
	self assert: (ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) nextLongLong = -16rF1F2F3F4F5F6F80.
]

{ #category : #tests }
ByteStreamTests >> testStreamReadingPositionalBigEndian [
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 1 do: #next) = 1.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 2 do: #next) = 2.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 3 do: #next) = 3.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 4 do: #next) = 4.
	self deny: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 4 do: #atEnd).
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 5 do: #next) isNil.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 5 do: #atEnd).
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 6 do: #next] raise: PositionOutOfBoundsError.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 0 do: #next] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 1 do: #nextShort) = 16r102.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 2 do: #nextShort) = 16r203.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 3 do: #nextShort) = 16r304.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 4 do: #nextShort] raise: IncompleteNextCountError.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 0 do: #nextShort] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 1 do: #nextShort) = -16rF20.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 2 do: #nextShort) = -16r1F30.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 3 do: #nextShort) = -16r2F40.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 1 do: #nextUnsignedShort) = 16r102.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 2 do: #nextUnsignedShort) = 16r203.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4]) atPosition: 3 do: #nextUnsignedShort) = 16r304.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 1 do: #nextUnsignedShort) = 16rf0e0.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 2 do: #nextUnsignedShort) = 16re0d0.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 3 do: #nextUnsignedShort) = 16rd0c0.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 1 do: #nextLong) = 16r1020304.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 2 do: #nextLong) = 16r2030405.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 3 do: #nextLong) = 16r3040506.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 5 do: #nextLong) = 16r5060708.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 6 do: #nextLong] raise: IncompleteNextCountError.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 0 do: #nextLong] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 1 do: #nextLong) = -16rF1F2F40.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 3 do: #nextLong) = -16r2F3F4F60.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 5 do: #nextLong) = -16r4F5F6F80.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 1 do: #nextUnsignedLong) = 16r1020304.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 2 do: #nextUnsignedLong) = 16r2030405.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 3 do: #nextUnsignedLong) = 16r3040506.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 5 do: #nextUnsignedLong) = 16r5060708.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 1 do: #nextUnsignedLong) = 16rf0e0d0c0.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 3 do: #nextUnsignedLong) = 16rd0c0b0a0.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 5 do: #nextUnsignedLong) = 16rb0a09080.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 1 do: #nextLongLong) = 16r102030405060708.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 3 do: #nextLongLong) = 16r30405060708090a.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 5 do: #nextLongLong) = 16r5060708090a0b0c.
	self assert: ((ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 9 do: #nextLongLong) = 16r90A0B0C0D0E0F10.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 10 do: #nextLongLong] raise: IncompleteNextCountError.
	self should: [(ByteReadStream bigEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 0 do: #nextLongLong] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80 16r70 16r60 16r50 16r40 16r30 16r20 16r10 0]) atPosition: 1 do: #nextLongLong) = -16rF1F2F3F4F5F6F80.
	self assert: ((ByteReadStream bigEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80 16r70 16r60 16r50 16r40 16r30 16r20 16r10 0]) atPosition: 9 do: #nextLongLong) = 16r7060504030201000.
]

{ #category : #tests }
ByteStreamTests >> testStreamReadingPositionalLittleEndian [
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 1 do: #next) = 1.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 2 do: #next) = 2.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 3 do: #next) = 3.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 4 do: #next) = 4.
	self deny: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 4 do: #atEnd).
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 5 do: #next) isNil.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 5 do: #atEnd).
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 6 do: #next] raise: PositionOutOfBoundsError.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 0 do: #next] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 1 do: #nextShort) = 16r201.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 2 do: #nextShort) = 16r302.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 3 do: #nextShort) = 16r403.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 4 do: #nextShort] raise: IncompleteNextCountError.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 0 do: #nextShort] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 1 do: #nextShort) = -16r1F10.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 2 do: #nextShort) = -16r2F20.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 3 do: #nextShort) = -16r3F30.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 1 do: #nextUnsignedShort) = 16r201.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 2 do: #nextUnsignedShort) = 16r302.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4]) atPosition: 3 do: #nextUnsignedShort) = 16r403.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 1 do: #nextUnsignedShort) = 16re0f0.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 2 do: #nextUnsignedShort) = 16rd0e0.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0]) atPosition: 3 do: #nextUnsignedShort) = 16rc0d0.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 1 do: #nextLong) = 16r4030201.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 2 do: #nextLong) = 16r5040302.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 3 do: #nextLong) = 16r6050403.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 5 do: #nextLong) = 16r8070605.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 6 do: #nextLong] raise: IncompleteNextCountError.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 0 do: #nextLong] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 1 do: #nextLong) = -16r3F2F1F10.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 3 do: #nextLong) = -16r5F4F3F30.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 5 do: #nextLong) = -16r7F6F5F50.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 1 do: #nextUnsignedLong) = 16r4030201.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 2 do: #nextUnsignedLong) = 16r5040302.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 3 do: #nextUnsignedLong) = 16r6050403.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8]) atPosition: 5 do: #nextUnsignedLong) = 16r8070605.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 1 do: #nextUnsignedLong) = 16rc0d0e0f0.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 3 do: #nextUnsignedLong) = 16ra0b0c0d0.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80]) atPosition: 5 do: #nextUnsignedLong) = 16r8090a0b0.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 1 do: #nextLongLong) = 16r807060504030201.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 3 do: #nextLongLong) = 16ra09080706050403.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 5 do: #nextLongLong) = 16rc0b0a0908070605.
	self assert: ((ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 9 do: #nextLongLong) = 16r100F0E0D0C0B0A09.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 10 do: #nextLongLong] raise: IncompleteNextCountError.
	self should: [(ByteReadStream littleEndianOn: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]) atPosition: 0 do: #nextLongLong] raise: PositionOutOfBoundsError.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80 16r70 16r60 16r50 16r40 16r30 16r20 16r10 0]) atPosition: 1 do: #nextLongLong) = -16r7F6F5F4F3F2F1F10.
	self assert: ((ByteReadStream littleEndianOn: #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80 16r70 16r60 16r50 16r40 16r30 16r20 16r10 0]) atPosition: 9 do: #nextLongLong) = 16r10203040506070.
]

{ #category : #tests }
ByteStreamTests >> testStreamWriting [
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPut: 1; yourself) contents = #[1].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutShort: 16r201; yourself) contents = #[1 2].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutShort: -16r1F10; yourself) contents = #[16rf0 16re0].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutUnsignedShort: 16r201; yourself) contents = #[1 2].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutUnsignedShort: 16re0f0; yourself) contents = #[16rf0 16re0].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutLong: 16r4030201; yourself) contents = #[1 2 3 4].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutLong: -16r3F2F1F10; yourself) contents = #[16rf0 16re0 16rd0 16rc0].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutUnsignedLong: 16r4030201; yourself) contents = #[1 2 3 4].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutUnsignedLong: 16rc0d0e0f0; yourself) contents = #[16rf0 16re0 16rd0 16rc0].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutLongLong: 16r807060504030201; yourself) contents = #[1 2 3 4 5 6 7 8].
	self assert: ((ByteWriteStream littleEndianOn: ByteArray new) nextPutLongLong: -16r7F6F5F4F3F2F1F10; yourself) contents = #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPut: 1; yourself) contents = #[1].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutShort: 16r102; yourself) contents = #[1 2].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutShort: -16rF20; yourself) contents = #[16rf0 16re0].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutUnsignedShort: 16r102; yourself) contents = #[1 2].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutUnsignedShort: 16rf0e0; yourself) contents = #[16rf0 16re0].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutLong: 16r1020304; yourself) contents = #[1 2 3 4].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutLong: -16rF1F2F40; yourself) contents = #[16rf0 16re0 16rd0 16rc0].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutUnsignedLong: 16r1020304; yourself) contents = #[1 2 3 4].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutUnsignedLong: 16rf0e0d0c0; yourself) contents = #[16rf0 16re0 16rd0 16rc0].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutLongLong: 16r102030405060708; yourself) contents = #[1 2 3 4 5 6 7 8].
	self assert: ((ByteWriteStream bigEndianOn: ByteArray new) nextPutLongLong: -16rF1F2F3F4F5F6F80; yourself) contents = #[16rf0 16re0 16rd0 16rc0 16rb0 16ra0 16r90 16r80].
]
