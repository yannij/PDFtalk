Extension { #name : #PSCategory }

{ #category : #'*PostScript-CIDInit Testing-profiling' }
PSCategory class >> profileTimeToLoadAllCMaps [
	"this loads all 181 CMaps into the PostScript Interpreter - this is very slow and should not run as regular test case"
	"self profileTimeToLoadAllCMaps"

	[PSInterpreter run: '(*) {cvn /CMap findresource pop} 10 string /CMap resourceforall'] timeProfile
]

{ #category : #'*PostScript-CIDInit Testing-profiling' }
PSCategory class >> profileTimeToLoadUniCNS_UCS2_H [
	"this loads the largest CMaps into the PostScript Interpreter"
	"self profileTimeToLoadUniCNS_UCS2_H"

	[100 timesRepeat: [PSInterpreter run: '/UniCNS-UCS2-H /CMap findresource']] timeProfile
]

{ #category : #'*PostScript-CIDInit Testing-profiling' }
PSCategory class >> showTimeToLoadAllCMaps [
	"this loads all 181 CMaps into the PostScript Interpreter - this is very slow and should not run as regular test case"
	"self showTimeToLoadAllCMaps"

	| time |
	time := [PSInterpreter run: '(*) {cvn /CMap findresource pop} 10 string /CMap resourceforall'] timeToRun.
	Transcript
		cr;
		show: time printString
]
