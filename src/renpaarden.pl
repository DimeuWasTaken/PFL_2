:- consult('draw_main_menu.pl').
:- consult('draw_board.pl').

play :- Current_player = 1, draw_main_menu, draw_initial_board, select_move(Current_player).