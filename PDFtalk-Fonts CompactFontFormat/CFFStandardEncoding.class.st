"
A standard encoding vector (Array[256])
"
Class {
	#name : #CFFStandardEncoding,
	#superclass : #CFFEncoding,
	#instVars : [
		'name',
		'codes'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #instances }
CFFStandardEncoding class >> expert [
	"<StandardEncoding>"

	^self
		name: 'Expert'
		codes: #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 229 230 0 231 232 233 234 235 236 237 238 13 14 15 99 239 240 241 242 243 244 245 246 247 248 27 28 249 250 251 252 0 253 254 255 256 257 0 0 0 258 0 0 259 260 261 262 0 0 263 264 265 0 266 109 110 267 268 269 0 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 304 305 306 0 0 307 308 309 310 311 0 312 0 0 313 0 0 314 315 0 0 316 317 318 0 0 0 158 155 163 319 320 321 322 323 324 325 0 0 326 150 164 169 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377 378)
]

{ #category : #specification }
CFFStandardEncoding class >> localSpecification [
	<constant: #name class: #String>
	<sequence: #codes>
]

{ #category : #'instance creation optional' }
CFFStandardEncoding class >> name: nameString [
	| inst |
	inst := self new.
	inst initializeName: nameString codes: nil.
	^inst
]

{ #category : #'instance creation' }
CFFStandardEncoding class >> name: nameString codes: codesArray [
	| inst |
	inst := self new.
	inst initializeName: nameString codes: codesArray.
	^inst
]

{ #category : #instances }
CFFStandardEncoding class >> standard [
	"<StandardEncoding>"

	^self
		name: 'Standard'
		codes: #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 0 111 112 113 114 0 115 116 117 118 119 120 121 122 0 123 0 124 125 126 127 128 129 130 131 0 132 133 0 134 135 136 137 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 138 0 139 0 0 0 0 140 141 142 143 0 0 0 0 0 144 0 0 0 145 0 0 146 147 148 149 0 0 0 0)
]

{ #category : #accessing }
CFFStandardEncoding >> codes [
	"<Array256 of: SID>"

	^codes ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFStandardEncoding >> initializeName: nameString codes: codesArray [
	name := nameString.
	(codesArray notNil and: [
	codesArray notEmpty]) ifTrue: [
			codes := (Array withAll: codesArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
CFFStandardEncoding >> name [
	"<String>"

	^name
]

{ #category : #printing }
CFFStandardEncoding >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer array: 'codes' value: self codes).
	^printer printvalue: self arguments: args
]
