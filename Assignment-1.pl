%
% Assignment 1
%

% Problem 1

incr(f1(null), f0(f1(null))).
incr(f0(P), f1(P)).
incr(f1(P1), f0(P2)) :- incr(P1, P2).

% Problem 2

% Part 1

legal(f0(null)).
legal(P) :- legal(Pn), incr(Pn, P).

% Part 2

incrR(P1, P2) :- legal(P1), incr(P1, P2).

% Problem 3

add(f0(null), P, P).
add(P1, P2, P3) :- incr(Pn1, P1), incr(P2, Pn2), add(Pn1, Pn2, P3).

% Problem 4

mult(P1, P2, P3) :- multR(P1, P2, f0(null), P3).

multR(f0(null), _, Acc, Acc).
multR(P1, P2, Acc, P3) :- incr(Pn1, P1), add(P2, Acc, PnAcc), multR(Pn1, P2, PnAcc, P3).

% Problem 5

revers(P, RevP) :- accRevers(P, null, RevP).

accRevers(null, Acc, Acc).
accRevers(f0(P), Acc, RevP) :- accRevers(P, f0(Acc), RevP).
accRevers(f1(P), Acc, RevP) :- accRevers(P, f1(Acc), RevP).

% Problem 6

normalize(null, f0(null)).
normalize(P, Pn) :- revers(P, RevP), normalizeR(RevP, RevPn), revers(RevPn, Pn).

normalizeR(f0(null), f0(null)).
normalizeR(f0(P), Pn) :- normalizeR(P, Pn).
normalizeR(f1(P), f1(P)).
