Extension { #name : #Valuemap }

{ #category : #'*Values-Testing-test instances' }
Valuemap class >> example [
	"self example"

	| map |
	map := Valuemap new.
	map at: #title put: self class name , ' example with examples of all basic values'.
	map at: #boolean put: true.
	map at: #character put: $A.
	map at: #symbol put: #mySymbol.
	map at: #string put: 'with umlauts and euro: äöüß€'.
	map at: #schlüssel put: nil.
	map at: #integer put: 42.
	map at: #number put: 3.14.
	map at: #date put: (Date d: 27 m: 3 y: 2022).
	map at: #time put: (Time h: 12 m: 18).
	map at: #timestamp put: (Timestamp d: 27 m: 3 y: 2022 h: 12 m: 18).
	map at: #duration put: 5 minutes.
	map at: #color put: (ColorValue fromBytesRed: 127 green: 0 blue: 0).
	map at: #knownColor put: ColorValue red.
	map at: #array put: #(#one 'two' 3).
	map at: #bytearray put: #[1 2 3].
	map
		at: #valuemap
		put: (Valuemap
			with: #test -> true
			with: #two -> 2
			with: #none -> nil).
	^map
]
