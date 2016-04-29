/* Youtube_Programming In Prolog Part 1 - Facts, Rules and Queries */
/* Facts */
likes(dan, sally).
likes(sally, dan).
likes(josh, brittney).
   
/* Rules */ 
dating(X, Y) :-
    likes(X, Y), likes(Y, X).

friendship(X, Y) :-
    likes(X, Y); likes(Y, X).
    
