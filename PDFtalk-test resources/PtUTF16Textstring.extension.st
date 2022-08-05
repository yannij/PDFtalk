Extension { #name : #PtUTF16Textstring }

{ #category : #'*PDFtalk-test resources-test instances' }
PtUTF16Textstring class >> example [
	^self fromPdf: self exampleUnicodeString
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtUTF16Textstring class >> exampleUnicodeString [
	^#[254 255 0 84 0 101 0 120 0 116 0 32 0 66 0 111 0 120 0 58 0 32 0 70 0 105 0 120 0 101 0 100 0 32 0 73 0 110 0 99 0 111 0 109 0 101 0 32 0 83 0 101 0 97 0 114 0 99 0 104 0 101 0 115 0 84 0 13 0 13 0 83 0 82 0 67 0 72 0 9 0 9 0 66 0 111 0 110 0 100 0 32 0 83 0 101 0 97 0 114 0 99 0 104 0 32 0 69 0 110 0 103 0 105 0 110 0 101 0 13 0 13 0 9 0 9 0 77 0 117 0 108 0 116 0 105 0 32 0 99 0 114 0 105 0 116 0 101 0 114 0 105 0 97 0 32 0 115 0 101 0 97 0 114 0 99 0 104 0 32 0 116 0 101 0 109 0 112 0 108 0 97 0 116 0 101 0 115 0 13 0 13 0 83 0 82 0 67 0 77 0 9 0 9 0 83 0 101 0 97 0 114 0 99 0 104 0 32 0 70 0 117 0 110 0 99 0 116 0 105 0 111 0 110 0 115 0 32 0 109 0 97 0 105 0 110 0 32 0 109 0 101 0 110 0 117 0 13 0 13 0 13 0 13 0 67 0 117 0 114 0 118 0 101 0 32 0 65 0 110 0 97 0 108 0 121 0 115 0 105 0 115 0 13 0 13 0 89 0 67 0 82 0 86 0 9 0 9 0 71 0 108 0 111 0 98 0 97 0 108 0 32 0 121 0 105 0 101 0 108 0 100 0 32 0 99 0 117 0 114 0 118 0 101 0 32 0 99 0 111 0 109 0 112 0 97 0 114 0 105 0 115 0 111 0 110 0 115 0 13 0 13 0 9 0 9 0 67 0 114 0 101 0 97 0 116 0 101 0 32 0 109 0 117 0 108 0 116 0 105 0 112 0 108 0 101 0 32 0 99 0 117 0 114 0 118 0 101 0 32 0 116 0 101 0 109 0 112 0 108 0 97 0 116 0 101 0 115 0 32 0 13 0 13 0 70 0 87 0 67 0 86 0 9 0 9 0 80 0 114 0 111 0 106 0 101 0 99 0 116 0 101 0 100 0 32 0 70 0 111 0 114 0 119 0 97 0 114 0 100 0 32 0 82 0 97 0 116 0 101 0 32 0 67 0 117 0 114 0 118 0 101 0 115 0 13 0 13 0 70 0 77 0 67 0 9 0 9 0 70 0 97 0 105 0 114 0 32 0 77 0 97 0 114 0 107 0 101 0 116 0 32 0 67 0 117 0 114 0 118 0 101 0 32 0 65 0 110 0 97 0 108 0 121 0 115 0 105 0 115 0 13 0 13 0 9 0 9 0 67 0 111 0 109 0 112 0 97 0 114 0 101 0 32 0 121 0 105 0 101 0 108 0 100 0 115 0 32 0 97 0 99 0 114 0 111 0 115 0 115 0 32 0 109 0 97 0 116 0 117 0 114 0 105 0 116 0 105 0 101 0 115 0 47 0 115 0 101 0 99 0 116 0 111 0 114 0 115 0 13 0 13 0 67 0 85 0 82 0 86 0 9 0 9 0 67 0 117 0 114 0 118 0 101 0 32 0 67 0 111 0 110 0 115 0 116 0 114 0 117 0 99 0 116 0 105 0 111 0 110 0 47 0 99 0 111 0 109 0 112 0 111 0 110 0 101 0 110 0 116 0 115 0 13 0 13 0 13 0 13 0 66 0 111 0 110 0 100 0 32 0 87 0 97 0 116 0 99 0 104 0 32 32 19 0 32 0 78 0 101 0 119 0 32 0 73 0 115 0 115 0 117 0 101 0 115 0 32 0 38 0 32 0 65 0 117 0 99 0 116 0 105 0 111 0 110 0 115 0 13 0 13 0 78 0 73 0 77 0 9 0 9 0 78 0 101 0 119 0 32 0 73 0 115 0 115 0 117 0 101 0 115 0 32 0 77 0 111 0 110 0 105 0 116 0 111 0 114 0 13 0 13 0 73 0 73 0 73 0 9 0 9 0 73 0 110 0 116 0 101 0 114 0 110 0 97 0 116 0 105 0 111 0 110 0 97 0 108 0 32 0 73 0 110 0 115 0 105 0 100 0 101 0 114 0 13 0 13 0 65 0 85 0 67 0 82 0 9 0 9 0 65 0 117 0 99 0 116 0 105 0 111 0 110 0 32 0 82 0 101 0 115 0 117 0 108 0 116 0 115 0 13 0 13 0 13 0 13 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 115 0 13 0 13 0 70 0 79 0 77 0 67 0 9 0 9 0 70 0 79 0 77 0 67 0 32 0 65 0 110 0 110 0 111 0 117 0 110 0 99 0 101 0 109 0 101 0 110 0 116 0 32 0 68 0 97 0 116 0 101 0 115 0 13 0 13 0 70 0 69 0 68 0 9 0 9 0 70 0 101 0 100 0 101 0 114 0 97 0 108 0 32 0 82 0 101 0 115 0 101 0 114 0 118 0 101 0 32 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 13 0 13 0 67 0 65 0 67 0 84 0 9 0 9 0 67 0 111 0 114 0 112 0 111 0 114 0 97 0 116 0 101 0 32 0 65 0 99 0 116 0 105 0 111 0 110 0 115 0 32 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 13 0 13 0 67 0 65 0 76 0 9 0 9 0 69 0 118 0 101 0 110 0 116 0 32 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 115 0 13 0 13 0 67 0 68 0 82 0 9 0 9 0 49 0 50 0 32 0 109 0 111 0 110 0 116 0 104 0 32 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 13 0 13 0 68 0 67 0 88 0 9 0 9 0 65 0 99 0 99 0 114 0 117 0 97 0 108 0 32 0 67 0 97 0 108 0 101 0 110 0 100 0 97 0 114 0 13 0 13 0 13 0 13 0 69 0 108 0 101 0 99 0 116 0 114 0 111 0 110 0 105 0 99 0 32 0 84 0 114 0 97 0 100 0 105 0 110 0 103 0 13 0 13 0 69 0 84 0 9 0 9 0 69 0 108 0 101 0 99 0 116 0 114 0 111 0 110 0 105 0 99 0 32 0 84 0 114 0 97 0 100 0 105 0 110 0 103 0 32 0 109 0 97 0 105 0 110 0 32 0 109 0 101 0 110 0 117 0 13 0 13 0 69 0 120 0 99 0 101 0 108 0 32 0 83 0 112 0 114 0 101 0 97 0 100 0 115 0 104 0 101 0 101 0 116 0 115 0 13 0 13 0 66 0 66 0 88 0 76 0 9 0 9 0 66 0 108 0 111 0 111 0 109 0 98 0 101 0 114 0 103 0 32 0 65 0 80 0 73 0 32 32 19 0 32 0 100 0 111 0 119 0 110 0 108 0 111 0 97 0 100 0 105 0 110 0 103 0 32 0 100 0 97 0 116 0 97 0 32 0 9 0 9 0 35 0 55 0 32 0 101 0 120 0 97 0 109 0 112 0 108 0 101 0 32 0 66 0 111 0 110 0 100 0 32 0 115 0 112 0 114 0 101 0 97 0 100 0 115 0 104 0 101 0 101 0 116 0 115 0 13 0 13 0 13 0 13 0 77 0 105 0 115 0 99 0 101 0 108 0 108 0 97 0 110 0 101 0 111 0 117 0 115 0 13 0 13 0 76 0 69 0 65 0 71 0 9 0 9 0 85 0 110 0 100 0 101 0 114 0 119 0 114 0 105 0 116 0 101 0 114 0 32 0 82 0 97 0 110 0 107 0 105 0 110 0 103 0 115 0 13 0 13 0 13 0 13 0 83 0 104 0 111 0 114 0 116 0 99 0 117 0 116 0 115 0 13 0 13 0 76 0 65 0 83 0 84 0 9 0 9 0 76 0 97 0 115 0 116 0 32 0 56 0 32 0 102 0 117 0 110 0 99 0 116 0 105 0 111 0 110 0 115 0 32 0 97 0 99 0 99 0 101 0 115 0 115 0 101 0 100 0 13 0 13 0 71 0 82 0 65 0 66 0 9 0 9 0 83 0 101 0 110 0 100 0 32 0 97 0 32 0 115 0 99 0 114 0 101 0 101 0 110 0 32 0 115 0 104 0 111 0 116 0 32 0 97 0 115 0 32 0 97 0 32 0 109 0 101 0 115 0 115 0 97 0 103 0 101 0 32 0 9 0 9 0 97 0 116 0 116 0 97 0 99 0 104 0 109 0 101 0 110 0 116 0 13 0 13 0 69 0 65 0 83 0 89 0 9 0 9 0 69 0 115 0 115 0 101 0 110 0 116 0 105 0 97 0 108 0 32 0 84 0 105 0 112 0 115 0 32 0 38 0 32 0 83 0 104 0 111 0 114 0 116 0 99 0 117 0 116 0 115 0 13 0 13 0 66 0 85 0 9 0 9 0 66 0 76 0 79 0 79 0 77 0 66 0 69 0 82 0 71 0 32 0 85 0 78 0 73 0 86 0 69 0 82 0 83 0 73 0 84 0 89 0 13 0 13 0 9 0 9 0 69 0 118 0 101 0 110 0 116 0 115 0 44 0 32 0 115 0 101 0 109 0 105 0 110 0 97 0 114 0 115 0 44 0 32 0 111 0 110 0 45 0 108 0 105 0 110 0 101 0 32 0 109 0 97 0 110 0 117 0 97 0 108 0 115 0 13 0 13 0 13 0 13 0 13 0 13 0 13 0 13 0 0] asString
]