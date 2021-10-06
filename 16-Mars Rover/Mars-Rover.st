!classDefinition: #MarsRoverTests category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 12:58:59'!
test01NewMarsIsWhereDeployedAndPointing
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: ''.
	self assert: 1@4 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:00:03'!
test02OneCommandForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'f'.
	self assert: 1@5 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 12:59:51'!
test03OneCommandBackward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'b'.
	self assert: 1@3 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:39:52'!
test04OneCommandLeft
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'l'.
	self assert: 1@4 equals: newMars position.
	self assert: 'O' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:00:26'!
test05OneCommandRight
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'r'.
	self assert: 1@4 equals: newMars position.
	self assert: 'E' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:08:52'!
test06TwoCommandLeftForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'lf'.
	self assert: 0@4 equals: newMars position.
	self assert: 'O' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:07:55'!
test07TwoCommandRightForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'rf'.
	self assert: 2@4 equals: newMars position.
	self assert: 'E' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:11:35'!
test08TwoCommandForwardForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'ff'.
	self assert: 1@6 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:27:50'!
test09MoreCommandsForwardForwardForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'fff'.
	self assert: 1@7 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:29:32'!
test10MoreCommandsLeftLeftForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'llf'.
	self assert: 1@3 equals: newMars position.
	self assert: 'S' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:49:36'!
test11MoreCommandsRightLeftForward
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'rlf'.
	self assert: 1@5 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 13:49:24'!
test12MoreCommandsWithErrorStops
	|newMars|
	newMars := MarsRover deployAt: 1@4 pointing: 'N'.
	newMars processCommands: 'fefff'.
	self assert: 1@5 equals: newMars position.
	self assert: 'N' equals: newMars pointingDirection.
	
	! !


!classDefinition: #Cardinal category: 'Mars-Rover'!
Object subclass: #Cardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Cardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:40:39'!
asString

	self subclassResponsibility! !

!Cardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:41:01'!
axisMovement

	self subclassResponsibility! !

!Cardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:40:23'!
leftCardinal
	self subclassResponsibility! !

!Cardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:40:28'!
rightCardinal
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cardinal class' category: 'Mars-Rover'!
Cardinal class
	instanceVariableNames: ''!

!Cardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:39:59'!
canHandle: aDirection
	self subclassResponsibility.! !

!Cardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:39:28'!
new: aDirection
	^ (self subclasses detect:[:aCardinalSubclass | aCardinalSubclass canHandle: aDirection]) new.! !


!classDefinition: #EastCardinal category: 'Mars-Rover'!
Cardinal subclass: #EastCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!EastCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:43:05'!
asString
 ^'E'! !

!EastCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:43:45'!
axisMovement
	^ 1@0! !

!EastCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:44:09'!
leftCardinal
	^ Cardinal new: 'N'! !

!EastCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:44:19'!
rightCardinal
	^ Cardinal new: 'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastCardinal class' category: 'Mars-Rover'!
EastCardinal class
	instanceVariableNames: ''!

!EastCardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:45:21'!
canHandle: aDirection
	^ aDirection = 'E'! !


!classDefinition: #NorthCardinal category: 'Mars-Rover'!
Cardinal subclass: #NorthCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!NorthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:18'!
asString
 ^'N'! !

!NorthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:24'!
axisMovement
	^ 0@1! !

!NorthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:32'!
leftCardinal
	^ Cardinal new: 'O'! !

!NorthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:35'!
rightCardinal
	^ Cardinal new: 'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthCardinal class' category: 'Mars-Rover'!
NorthCardinal class
	instanceVariableNames: ''!

!NorthCardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:14'!
canHandle: aDirection
	^ aDirection = 'N'! !


!classDefinition: #SouthCardinal category: 'Mars-Rover'!
Cardinal subclass: #SouthCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!SouthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:49'!
asString
 ^'S'! !

!SouthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:53'!
axisMovement
	^ 0@-1! !

!SouthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:47:00'!
leftCardinal
	^ Cardinal new: 'E'! !

!SouthCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:47:03'!
rightCardinal
	^ Cardinal new: 'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthCardinal class' category: 'Mars-Rover'!
SouthCardinal class
	instanceVariableNames: ''!

!SouthCardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:47:07'!
canHandle: aDirection
	^ aDirection = 'S'! !


!classDefinition: #WestCardinal category: 'Mars-Rover'!
Cardinal subclass: #WestCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!WestCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:45:43'!
asString
 ^'O'! !

!WestCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:45:48'!
axisMovement
	^ -1@0! !

!WestCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:45:54'!
leftCardinal
	^ Cardinal new: 'S'! !

!WestCardinal methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:45:58'!
rightCardinal
	^ Cardinal new: 'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestCardinal class' category: 'Mars-Rover'!
WestCardinal class
	instanceVariableNames: ''!

!WestCardinal class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 14:46:02'!
canHandle: aDirection
	^ aDirection = 'O'! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position pointedCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'command execution' stamp: 'VV 10/6/2021 14:51:49'!
backward 	
		
	position := position - pointedCardinal axisMovement.
	
	
	! !

!MarsRover methodsFor: 'command execution' stamp: 'VV 10/6/2021 14:51:49'!
forward 	
		
	position := position + pointedCardinal axisMovement.
	
		
	
	
	! !

!MarsRover methodsFor: 'command execution' stamp: 'VV 10/6/2021 14:04:06'!
processCommands: aStringCommands
	|currentCommand nextCommands|
	(aStringCommands = '') ifFalse:[			
		currentCommand := aStringCommands at: 1.
		nextCommands := aStringCommands copyFrom: 2 to: (aStringCommands size).
		(currentCommand = $f) ifTrue:[self forward . self processCommands: nextCommands.].		
		(currentCommand = $b) ifTrue:[self backward. self processCommands: nextCommands.].				
		(currentCommand = $l) ifTrue:[self rotateLeft. self processCommands: nextCommands.].
		(currentCommand = $r) ifTrue:[self rotateRight. self processCommands: nextCommands.].		
		].
	
	
	
	! !

!MarsRover methodsFor: 'command execution' stamp: 'VV 10/6/2021 14:51:49'!
rotateLeft 	
		
	pointedCardinal := pointedCardinal leftCardinal.
	
	
	! !

!MarsRover methodsFor: 'command execution' stamp: 'VV 10/6/2021 14:51:49'!
rotateRight

	pointedCardinal := pointedCardinal rightCardinal.
		
	
	
	
	
		
	
	
	! !


!MarsRover methodsFor: 'initialization' stamp: 'VV 10/6/2021 14:51:49'!
initializeDeployAt: aPosition poiting: aDirection.
	position := aPosition.
	pointedCardinal := Cardinal new: aDirection.
	! !


!MarsRover methodsFor: 'access' stamp: 'VV 10/6/2021 14:51:49'!
pointingDirection 
	^pointedCardinal asString.
		! !

!MarsRover methodsFor: 'access' stamp: 'VV 10/6/2021 12:47:19'!
position 
	^ position.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'VV 10/6/2021 12:42:25'!
deployAt: aPosition pointing: aDirection
	^ MarsRover new initializeDeployAt: aPosition poiting: aDirection.! !
