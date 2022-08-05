"
terminates execution of the innermost, dynamically enclosing instance of a looping context without regard to lexical relationship.
A looping context is a procedure invoked repeatedly by one of the following control operators:
	forall 
	repeat
	for 
	loop 
	pathforall
	filenameforall 
	resourceforall
	cshow 
	kshow 

exit pops the execution stack down to the level of that operator.
The interpreter then resumes execution at the next object in normal sequence after that operator.
"
Class {
	#name : #PSExitNotification,
	#superclass : #PSControlNotification,
	#category : #PostScript
}
