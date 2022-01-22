/*check_pos(Array, Index, Value)*/

check_pos([Head | _], 0, Head) :-
    !.

check_pos([_ | Tail], Index, Value) :-
    Index1 is Index - 1,
    check_pos(Tail, Index1, Value).

/*replace(Array, Index, Value, NewArray)*/

replace([_ | Tail], 0, Value, [Value | Tail]).
replace([Head | Tail], Index, Value, [Head | Rest]) :-
    Index > 0,
    Index1 is Index - 1,
    replace(Tail, Index1, Value, Rest).

/*replace2D(Array, X, Y, Value, NewArray)*/

replace2D([[_ | Tail1] | Tail2], 0, 0, Value, [[Value | Tail1] | Tail2]).
replace2D([[Head | Tail1] | Tail2], X, 0, Value, [[Head | Rest1] | Rest2]) :-
    X > 0,
    X1 is X - 1,
    replace2D([Tail1 | Tail2], X1, 0, Value, [Rest1 | Rest2]).

replace2D([Head | Tail], X, Y, Value, [Head | Rest]) :-
    Y > 0,
    Y1 is Y - 1,
    replace2D(Tail, X, Y1, Value, Rest).
