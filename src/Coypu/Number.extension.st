Extension { #name : #Number }

{ #category : #'*Coypu' }
Number >> randomsFromArray: anArray [
	" returns an array of self size with randomInts from anArray at: 1 to anArray at: 2"

	| min max |
	min := anArray at: 1.
	max := anArray at: 2.
	^ (1 to: self )collect: [ : i | Random new nextIntegerBetween: min and: max  ].
]
