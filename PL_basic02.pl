/* Youtube_Programming In Prolog Part 2
   --- Syntax, Questions and Structs */
/* Topics: 
       Variables, 
       Questions/Compound Questions, 
       Rules, 
       Structs */

/* weather(City, Season, Temp). */
weather(phoenix, summer, hot).
weather(la, summer, warm).
weather(phoenix, winter, warm).

/* variables */
% weather(City, summer, hot).
% City = phoenix.
% weather(City, _, hot).
% City = la.
% City = phoenix.
% ...
% Note:
% it is strange that when the variable start with 
% lower-case, things do not work as above
% weather(city, summer, hot).
% false.

/* compound question */
% weather(City, summer, hot), weather(City, winter, warm).
% City = phoenix.

/* Rules */
% relationship(object..object) :- relationship(object..object)
%          HEAD                IF          BODY 
warmer_than(C1, C2) :-
    weather(C1, summer, hot), 
    weather(C2, summer, warm),
    write(C1), write(' is warmer than '), write(C2), nl. 

% note: nl --- newline


/* Structs */
% we have a fact below, notice that it is very complicated
course(cse110, mon, wed, 11, 12, 11, 12, holton, bryce, coor105, coor321).

% we can rewrite it in structure
course(
    cse110,
    day(mon, wed), 
    time(11, 12),
    prof(holton, bryce),
    coor105).

course(
    cse110,
    day(mon, wed), 
    time(11, 12),
    prof(holton, bryce),
    coor321).

% ?- course(cse110, Day, Time, Prof, Place).
% Day = day(mon, wed),
% Time = time(11, 12),
% Prof = prof(holton, bryce),
% Place = coor105
