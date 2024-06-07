Extension { #name : #Array }

{ #category : #'*Coypu' }
Array >> asNotes [
	"convert an array of MIDI note numbers into a Sequencer where 0 corresponds to rests"

	| seq allTrigs validTrigs validNotes allValues |
	allTrigs := OrderedCollection new.


	allValues := OrderedCollection new.
	self do: [ :i |
		i isArray
			ifTrue: [
				allTrigs addAll: i.
				allValues addAll: i ]
			ifFalse: [
				allTrigs add: i.
				allValues add: i ] ].
	validTrigs := allTrigs collect: [ :i | i isZero not asInteger ].

	validNotes := allValues reject: [ :i | i = 0 ].
	seq := validTrigs asDirtArray asSeq notes: validNotes asDirtArray.

	^ seq
]

{ #category : #'*Coypu' }
Array >> asSeries [

"convenience method to create a series of integers incremented by 1"
^ ((self at: 1) rounded to: (self at: 2) rounded) asArray





]
