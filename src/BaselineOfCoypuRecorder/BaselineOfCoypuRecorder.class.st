Class {
	#name : #BaselineOfCoypuRecorder,
	#superclass : #BaselineOf,
	#category : #BaselineOfCoypuRecorder
}

{ #category : #baselines }
BaselineOfCoypuRecorder >> baseline: spec [

	<baseline>
	spec
		for: #common do: [ "External dependencies"
			spec
				package: 'OSC'
				with: [ spec repository: 'github://Ducasse/OSC/src' ];
				baseline: 'Toplo'
				with: [
					spec repository: 'github://pharo-graphics/Toplo:master/src' ].
			"Packages"
			spec
				package: 'Coypu' with: [ spec requires: #( 'OSC' ) ];
				package: 'LiveCoding' with: [ spec requires: #( 'Coypu' ) ];
				package: 'CoypuRecorder'
				with: [ spec requires: #( 'LiveCoding' ) ];
				package: 'CoypuRecorder-Tests'
				with: [ spec requires: #( 'CoypuRecorder' ) ] ];
		package: 'CoypuRecorder_Graphics'
		with: [ spec requires: #( 'Toplo' ) ]
]
