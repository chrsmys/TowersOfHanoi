==================
Demo
==================
![alt tag](https://raw.githubusercontent.com/chrsmys/TowersOfHanoi/current-branch/file.gif)

==================
How to Play
==================
<br />1.Tap the peg with the desired disk to move.
<br />2.Then tap the peg of the desired disk position.
<br />3.Tap the background at any point to autosolve.
<br />Note: Autosolve may take a couple of seconds for the correct moves to be processed

==================
About
==================
This game was created with Spritekit and is a basic implementation of towers of hanoi. This project was a spike exercise where I researched the breadth first search algorithm. 

<br />step 0:This algorithm starts by adding the current state of the game to an empty queue. (We will call this queue stateQueue). 
<br />step 1:Take off the state(currentState) from the top of stateQueue and create every possible state that could come after it (nextStateList).
<br />/*
 <br />All Possible Moves
 <br />from:peg1 to:peg2
 <br />from:peg1 to:peg3
 <br />from:peg2 to:peg1
 <br />from:peg2 to:peg3
 <br />from:peg3 to:peg1
 <br />from:peg3 to:peg2
 <br />*/
<br />Step 3: Eliminate any states inside of nextStateList that are not possible. EX. Pegs with no disks cannot move a disk from it.
<br />Step 4: Check if any states inside of nextStateList are the solution (All disks on peg3). If one of the states is the solution then the problem is solved. If none of the states in nextStateList are the solution then add all of the sates to stateQueue and then jump back up to step 1:


