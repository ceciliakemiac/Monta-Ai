:- module(gerarHorarios, []).
:- use_module(proximoPeriodo).
:- use_module(turmas).

getTurmas(Disc, T):-
    turmas:disciplina(Disc, _, _, _, _, T).

getTurma(Turmas, T1, T2):-
    nth0(0, Turmas, T1),
    nth0(1, Turmas, T2).

%true se duas turmas têm mesmo horário, false se não tem o mesmo horário
analisaChoqueTurmas([], []).
analisaChoqueTurmas(_, []).
analisaChoqueTurmas([], _).
analisaChoqueTurmas([H1 | T1], [H2 | T2]):-
    (H1 == H2 -> analisaChoqueTurmas(T1, T2);
     false).  

%4 turmas não tem o mesmo horário
% semChoqueTurmas([], [], [], []).
% semChoqueTurmas([], _, _, _).
% semChoqueTurmas(_, [], _, _).
% semChoqueTurmas(_, _, [], _).
% semChoqueTurmas(_, _, _, []).
semChoqueTurmas(T1, T2, T3, T4):-
    not(analisaChoqueTurmas(T1, T2)), not(analisaChoqueTurmas(T1, T3)), 
    not(analisaChoqueTurmas(T1, T4)), not(analisaChoqueTurmas(T2, T3)),
    not(analisaChoqueTurmas(T2, T4)), not(analisaChoqueTurmas(T3, T4)).  

temChoqueDiscs(A, B):-
    getTurmas(A, Ta), getTurmas(B, Tb),
    nth0(0, Ta, T1), nth0(1, Ta, T2), nth0(0, Tb, T3), nth0(1, Tb, T4),
    (not(analisaChoqueTurmas(T1, T3)) -> false;
     not(analisaChoqueTurmas(T1, T4)) -> false;
     not(analisaChoqueTurmas(T2, T3)) -> false;
     not(analisaChoqueTurmas(T2, T4)) -> false;
     true).

getDiscsAleatorias(Y, X, W, Z):-
    proximoPeriodo:proximoPeriodoOb(Y),
    proximoPeriodo:proximoPeriodoOb(X),
    proximoPeriodo:proximoPeriodoOb(W),
    proximoPeriodo:proximoPeriodoOb(Z),
    Y \== X, Y \== W, Y \== Z,
    X \== W, X \== Z, W \== Z,
    not(temChoqueDiscs(Y, X)), not(temChoqueDiscs(Y, W)), not(temChoqueDiscs(Y, Z)),
    not(temChoqueDiscs(X, W)), not(temChoqueDiscs(X, Z)), not(temChoqueDiscs(W, Z)).

geraHorario(Y, X, W, Z):-
    getTurmas(Y, Ty), getTurmas(X, Tx), getTurmas(W, Tw), getTurmas(Z, Tz),
    getTurma(Ty, Ty1, Ty2), getTurma(Tx, Tx1, Tx2), getTurma(Tw, Tw1, Tw2), getTurma(Tz, Tz1, Tz2),
    (semChoqueTurmas(Ty1, Tx1, Tw1, Tz1) -> exibeHorarioTurmas(Y, Ty1, X, Tx1, W, Tw1, Z, Tz1)).

exibeHorarioTurmas(Y, Ty, X, Tx, W, Tw, Z, Tz):-

