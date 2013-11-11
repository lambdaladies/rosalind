fib(N, K, Wabbits) :-
	NN is N - 2,
	fib(NN, K, 1, 1, Wabbits).

fib(0, _K, FMinusOne, _FMinusTwo, FMinusOne).
fib(N, K, FMinusOne, FMinusTwo, Wabbits) :-
	NN is N - 1,
	F is FMinusOne + K * FMinusTwo,
	fib(NN, K, F, FMinusOne, Wabbits).

go :-
	fib(5, 3, W),
	format('~w~n', [W]).

