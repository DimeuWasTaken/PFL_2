/* choose_game_mode(GameMode) */
/* lê e verifica o input, guardando-o em GameMode. */
choose_game_mode(GameMode) :-
    repeat,
    write('Choose gamemode: '), read(GameMode),

    ((GameMode < 1; GameMode > 4) ->
    write('input error'), nl, fail;
    true).


/* get_input(X, Y) */
/* lê e verifica o input, guardando-o em X e em Y. */
get_input(X, Y) :-
    write('choose X and Y to play: (0 - 8)'), nl,
    read(X),
    read(Y).


/* announce_move((X, Y), (X1, Y1)) */
/* escreve a jogada escolhida, estando em (X, Y) a posição antiga da peça e em (X1, Y1) a sua nova posição. */
announce_move((X, Y), (X1, Y1)) :-
    nl, write('moved piece in position '), 
    write(X), write(':'), write(Y), 
    write(' to position '), 
    write(X1), write(':'), write(Y1), nl.


/* announce_winner(Winner) */
/* anuncia o vencedor do jogo. */
announce_winner(Winner) :-
    write('player '), write(Winner), write(' wins!'), nl, !.


/* play_again */
/* pergunta ao jogador se quer jogar de novo, verifica o input e reage de acordo a este. */
play_again :-
    repeat,
    write('want to play again? (y/n)'), read(PlayAgain),

    ((PlayAgain == 'y'; PlayAgain == 'n') ->
    true;
    write('input error'), nl, fail),

    (PlayAgain == 'y' ->
    play;
    !).

