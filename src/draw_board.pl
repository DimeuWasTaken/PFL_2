:- consult('draw_main_menu.pl').

draw_x([]).
draw_x([X | N]) :- (X >= 0 ->
                   write(' ');
                   true), write(X), write(' '), draw_x(N).

draw_y([], _)  :- nl, nl, write('                X'), nl.
draw_y([Y | N], Line) :- nl, (Line == 4 -> write(' Y ') ; write('   ')), draw_x(Y), Line2 is Line + 1, draw_y(N, Line2).

select_move(Player) :- 
    write('choose X to play: (0 - 8)'), nl,
    read(Input_x),
    write('choose Y to play: (0 - 8)'), nl,
    read(Input_y),
    write('move chosen: X = '), write(Input_x), write(' , Y = '), write(Input_y), nl, process_move(Player, Input_x, Input_y).

process_move(Player, X, Y) :-
    ((X > 8 ; X < 0 ; Y > 8 ; Y < 0) ->
    write('input error'), nl, select_move(Player);
    true).

draw_initial_board :-   Initial_board = [
                            [-1, -1, -1, -1, -1, -1, -1, -1, -1],
                            [-1, -1, -1, -1, -1, -1, -1, -1, -1], 
                            [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                            [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                            [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                            [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                            [0, 0, 0, 0, 0, 0, 0, 0, 0], 
                            [1, 1, 1, 1, 1, 1, 1, 1, 1], 
                            [1, 1, 1, 1, 1, 1, 1, 1, 1]
                        ], First_line = 0,
                        draw_y(Initial_board, First_line), nl.