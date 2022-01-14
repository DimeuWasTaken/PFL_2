:- consult('draw_main_menu.pl').
:- consult('draw_board.pl').

play :- Board = [
    [-1, -1, -1, -1, -1, -1, -1, -1, -1],
    [-1, -1, -1, -1, -1, -1, -1, -1, -1], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [1, 1, 1, 1, 1, 1, 1, 1, 1], 
    [1, 1, 1, 1, 1, 1, 1, 1, 1]],
    draw_main_menu, game_cycle(Board).
    
game_cycle(Board) :-
    Current_player = 1, 
    
    display_game(Board),
    move(Board, Current_player).

move(GameState, Current_player) :- 
    repeat,
    write('choose X to play: (0 - 8)'), nl,
    read(Input_x),
    write('choose Y to play: (0 - 8)'), nl,
    read(Input_y),

    ((Input_x > 8 ; Input_x < 0 ; Input_y > 8 ; Input_y < 0) ->
    write('input error'), nl, fail;
    true),

    match(GameState, Input_y, I), match(I, Input_x, J),

    (((Current_player == 1, J == 1); (Current_player == 2, J == -1))->
    !;
    write('invalid cell, not your piece'), nl, fail),
    
    write('position '), write(Input_x), write(':'), write(Input_y), write(' - '), draw_cell(J).

test(I) :-
    Y = 5,
    Z = 1,
    I is Y + Z,
    write(I), nl.