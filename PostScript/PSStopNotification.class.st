"
terminates execution of the innermost, dynamically enclosing instance of a stopped context, without regard to lexical relationship. 
A stopped context is a procedure or other executable object invoked by the stopped operator. 
stop pops the execution stack down to the level of the stopped operator. 
The interpreter then pushes the boolean value true on the operand stack and resumes execution at the next object in normal sequence after the stopped operator. 
It thus appears that stopped returned the value true, whereas it normally returns false.
"
Class {
	#name : #PSStopNotification,
	#superclass : #PSControlNotification,
	#category : #PostScript
}
