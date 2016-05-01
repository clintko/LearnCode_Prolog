/**
  GoldbachConjecture:
    - Every even integer greater than 2 can be expressed as 
      the sum of two primes.
    - Best-known unsolved problem in number theory
    - To this day, the conjecture has been shown to 
      hold up through 4 กั 10 18 .
    */

% Rule: isFactor
% param:  X; first input number
% param:  Y; second input number
% return: true if X is a factor of Y (Y mod X is 0)
zero(0).
isFactor(X, Y) :-
    Result is mod(Y, X),
    zero(Result).
    
% Rule: isPrime
% param:  Num; a number
% return: true if input number is a prime number
% desc:
%   to test whether a number is a prime number
%   for all number smaller than Num^0.5, 
%   whether any one is a factor of Num
%   if none of them is a factor of Num, Num is a prime number
isPrime(2).
isPrime(Num) :- 
     Num > 1,
     Threshold is round(Num**0.5),
     checkPrime(Threshold, Num).

% Rule: checkPrime
% param:  X
% param:  Num
% return: true if any number < X is "not" a factor of Num 
% desc:
%   the main recursive rule of the rule isPrime
checkPrime(1, Num) :- Num > 1. % base case
checkPrime(X, Num) :-          % recursive case
     X > 1,
     NextX is X-1,
     % check the process of function
     % write(X),
     % write(NextX), nl,
     \+ (isFactor(X, Num)),
     checkPrime(NextX, Num).

% Rule: checkBothPrime
% param X; first  input number
% param Y; second input number
% return: false
% desc:
%   the aim of this Rule is to execute print statement
%   when both input numbers are prime number. It will
%   skip the print statement if any input number is 
%   not prime. Note that the Rule will always return false
%   no matter for all cases of input
checkBothPrime(X, Y) :-
    % check if both are prime
    isPrime(X),
    isPrime(Y),

    % print if both are prime; 
    % if false, print statement won't be executed
    write(X), write(" "), write(Y), nl,

    % guarentee false statement
    X < 0.   
    
% Rule: GoldbachConj
% param: Even; an even number
% return: return true if input is an even number; 
%         return false otherwise
% desc:
%     print out the number when there are two prime numbers
%     (both < EvenNum) that can be added up to the EvenNum
goldbachConj(EvenNum) :-
    % check even
    EvenNum > 0, isFactor(2, EvenNum),

    %
    Num is EvenNum/2,
    findGoldbach(Num, EvenNum).
    
% Rule: findGoldbach
% param: X
% param: EvenNum
% return: true    
% desc:
%   since the checkBothPrime will always return false,
%   the Rule will always run to the end, where X is 
%   decremented to 1, and will always return true.
findGoldbach(1, EvenNum) :- EvenNum > 0. % base case    
findGoldbach(X, EvenNum) :-              % recursive
    Y is EvenNum - X,
    
    % if both prime, print in the console
    % note: "\+" is "not"
    \+ checkBothPrime(X, Y),
    
    % recursive
    NextX is X-1,
    findGoldbach(NextX, EvenNum).

    
