%
% Assignment 2
%

% Problem 1

odd(L) --> lex(L), oddR(L).

oddR(_) --> [].
oddR(L) --> lex(L), lex(L), oddR(L).

lex(L) --> [X], {member(X, L)}.

% Problem 2

s --> [].
s --> a, s.
a --> [0].
a --> [1].

p(L) :- length(L, _).

% Problem 3

fib --> [0], [1], fibR(0, 1).

fibR(_, _) --> [].
fibR(N, N1) --> [Res], {Res is (N + N1)}, fibR(N1, Res).

% Problem 4

% Part 1

accept(L) :- steps(q0, L, F), final(F).
steps(Q, [], Q).
steps(Q, [H|T], Q2) :- tran(Q, H, Qn), steps(Qn, T, Q2).

tran(q0, 0, q0).
tran(q0, 1, q1).
tran(q0, 1, q0).

tran(q1, 0, q2).
tran(q1, 1, q2).

tran(q2, 0, q3).
tran(q2, 1, q3).

final(q3).

% Part 2

q0 --> [0], q0.
q0 --> [1], q1.
q0 --> [1], q0.

q1 --> [0], q2.
q1 --> [1], q2.

q2 --> [0].
q2 --> [1].

% Part 3

l3([1|T], succ(succ(succ(0)))) :- q1(T, []).
l3([H|T], succ(Numeral)) :- q2([H], []), l3(T, Numeral).
