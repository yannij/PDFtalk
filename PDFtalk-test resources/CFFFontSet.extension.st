Extension { #name : #CFFFontSet }

{ #category : #'*PDFtalk-test resources-test instances' }
CFFFontSet class >> example [
	^self for: nil fromBytes: self exampleBytes readStream
]

{ #category : #'*PDFtalk-test resources-test instances' }
CFFFontSet class >> exampleBytes [
	"from Appendix D"

	^#[16r01 16r00 16r04 16r01 16r00 16r01 16r01 16r01 16r13 16r41 16r42 16r43 16r44 16r45 16r46 16r2b 16r54 16r69 16r6d 16r65 16r73 16r2d 16r52 16r6f 16r6d 16r61 16r6e 16r00 16r01 16r01 16r01 16r1f 16rf8 16r1b 16r00 16rf8 16r1c 16r02 16rf8 16r1d 16r03 16rf8 16r19 16r04 16r1c 16r6f 16r00 16r0d 16rfb 16r3c 16rfb 16r6e 16rfa 16r7c 16rfa 16r16 16r05 16re9 16r11 16rb8 16rf1 16r12 16r00 16r03 16r01 16r01 16r08 16r13 16r18 16r30 16r30 16r31 16r2e 16r30 16r30 16r37 16r54 16r69 16r6d 16r65 16r73 16r20 16r52 16r6f 16r6d 16r61 16r6e 16r54 16r69 16r6d 16r65 16r73 16r00 16r00 16r00 16r02 16r01 16r01 16r02 16r03 16r0e 16r0e 16r7d 16r99 16rf9 16r2a 16r99 16rfb 16r76 16r95 16rf7 16r73 16r8b 16r06 16rf7 16r9a 16r93 16rfc 16r7c 16r8c 16r07 16r7d 16r99 16rf8 16r56 16r95 16rf7 16r5e 16r99 16r08 16rfb 16r6e 16r8c 16rf8 16r73 16r93 16rf7 16r10 16r8b 16r09 16ra7 16r0a 16rdf 16r0b 16rf7 16r8e 16r14]
]
