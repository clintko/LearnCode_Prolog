/**
  Youtube: Programming In Prolog Part 3
    Scope, Structures and Arithmetic Operations
  Topic:
    - Struct
    - Scope
    - Operators & Arithmetic Functions
    - SWISH (an online IDE for writing Prolog
    */

/* Struct */
% suppose that there is a course separated into two classes
course(
    cse340,
    day(tues, thurs),          
    time(1200, 1300),
    instructor(bryce, holton),
    coor300
).

course(
    cse340,
    day(tues, thurs),
    time(1200, 1300),
    instructor(ivan, andersen),
    coor500
).

% ask whether the instructor match the course number
% translate the code:
%    the instructor teach the class 
%    if and only if the parameters match the facts
instructor(Instructor, Class) :-
    course(Class,
           _,
           _, 
           Instructor,
           _).

% ?- instructor(X, cse340).
% X = instructor(bryce, holton) ;
% X = instructor(ivan, andersen).

/* Scope  */
% the scope of the variable only exist in the
% face, rule, query that contains the variable

% some person ate a cheese sandwich
% if and only if the person ate cheese and bread
ate(Person, cheeseSandwich) :-
    ate(Person, cheese),
    ate(Person, bread).

ate2(Person, cake) :-
    ate(Person, bread),
    ate(Person, cream).

% Concept of scope:
% the variable Person in ate and ate2 is not the same

/* Operators & Arithmetic Functions  */
% Prolog weakness: manipulate variables

% assignment
% <variable> is <arithmetic operation>
% X is 7+3. --- x=(7+3);
% Y is 10.  --- y=10;

% mod
% x is 5//2 = 2.
% x is 2**3 = 8.
	     
	     
% now lets use the knownledge above to convert
% fahrenheit to celsius   
% C = (F-32) * 5 / 9
 
avg_temp(phx, 100).
avg_temp(sf, 68).	     
	     

avg_temp_cels(Location, C_Temp) :-
    % assign variable location and F_Temp
    avg_temp(Location, F_Temp), 
    
    % then calculate the celsius
    C_Temp is (F_Temp - 32) * 5//9.

% ?- avg_temp_cels(phx, C).
% C = 37.
% ?- avg_temp_cels(sf, C).
% C = 20.




	     
