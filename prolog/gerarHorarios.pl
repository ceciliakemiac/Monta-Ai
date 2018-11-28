:- module(gerarHorarios, []).
:- use_module(proximoPeriodo).
:- use_module(turmas).
:- use_module(horariosPagos).

:- dynamic (proximoPeriodoTurmas/3).

getProximas(Y):- 
    findall(X, (proximoPeriodo:proximoPeriodoOb(X)), Y).

getProximasComTurmas(Y):- findall([D, Horas, Turma], proximoPeriodoTurmas(D, Horas, Turma), Y).

/* Verifica se um dia e hora não bate com horarios de uma turma */
naoChoca(D, H, []).
naoChoca(D, H, [D1, H1|Tail]):- not(D = D1), naoChoca(D, H, Tail).
naoChoca(D, H, [D1, H1|Tail]):- not(H = H1), naoChoca(D, H, Tail).

/* verifica se não tem choques entre turmas. 
** turmas: [[2, 8, 4, 10], [2, 10, 5, 8], ...]*/
naotemChoques([]).
naotemChoques([X]).
naotemChoques([ [D, H | [] ] | [X | T2] ]):- naoChoca(D, H, X), naotemChoques([X | T2]).
naotemChoques([ [D, H | T1] | [X | T2]]) :- naoChoca(D, H, X), naotemChoques([T1 | [ X |T2]]).


getTurmas(Disc, T):-
    turmas:disciplina(Disc, _, _, _, _, T).

getTurma(Turmas, T1, T2):-
    nth0(0, Turmas, T1),
    nth0(1, Turmas, T2).

criaComTurmasPorDisc([]).
criaComTurmasPorDisc([H | T]):-
    getTurmas(H, Turmas),
    getTurma(Turmas, T1, T2),
    length(T2, Int),
    (Int \== 0 -> assert(proximoPeriodoTurmas(H, T2, t-2)), true; true),
    assert(proximoPeriodoTurmas(H, T1, t-1)),
    criaComTurmasPorDisc(T).

%gera os fatos de proximoPeriodoTurmas com as proximas disciplinas/turmas a se pagar
criaComTurmas:-
    getProximas(D),
    criaComTurmasPorDisc(D).

geraCombinacoes( [],[] ).
geraCombinacoes( [X|L1] , [X|L2]):-
    geraCombinacoes( L1 , L2).
geraCombinacoes( [ _ |L1] , L2 ) :-
    geraCombinacoes( L1 , L2).

getQuantCreditos([], 0).
getQuantCreditos([H | T], N):-
    nth0(0, H, Nome),
    turmas:disciplina(Nome, C, _, _, _, _),
    getQuantCreditos(T, M),
    N is M + C.

%combinações de disciplinas no limite de créditos
geraCombinacoesNoLimite(Discs, C):-
    geraCombinacoes(Discs, C),
    getQuantCreditos(C, N), N > 15, N < 25.

%lista com todas as combinações possíveis das disciplinas a se pagar
geraCombinacoesLista(Saida):-
    criaComTurmas,
    getProximasComTurmas(Disciplinas),
    findall(S, geraCombinacoesNoLimite(Disciplinas, S), Saida).

%true se duas turmas têm mesmo horário, false se não tem o mesmo horário
% analisaChoqueTurmas([], []).
% analisaChoqueTurmas(_, []).
% analisaChoqueTurmas([], _).
% analisaChoqueTurmas([H1 | T1], [H2 | T2]):-
%     (H1 == H2 -> analisaChoqueTurmas(T1, T2);
%      false).  

%4 turmas não tem o mesmo horário
% semChoqueTurmas([], [], [], []).
% semChoqueTurmas([], _, _, _).
% semChoqueTurmas(_, [], _, _).
% semChoqueTurmas(_, _, [], _).
% semChoqueTurmas(_, _, _, []).
% semChoqueTurmas(T1, T2, T3, T4):-
%     not(analisaChoqueTurmas(T1, T2)), not(analisaChoqueTurmas(T1, T3)), 
%     not(analisaChoqueTurmas(T1, T4)), not(analisaChoqueTurmas(T2, T3)),
%     not(analisaChoqueTurmas(T2, T4)), not(analisaChoqueTurmas(T3, T4)).  

% temChoqueDiscs(A, B):-
%     getTurmas(A, Ta), getTurmas(B, Tb),
%     nth0(0, Ta, T1), nth0(1, Ta, T2), nth0(0, Tb, T3), nth0(1, Tb, T4),
%     (not(analisaChoqueTurmas(T1, T3)) -> false;
%      not(analisaChoqueTurmas(T1, T4)) -> false;
%      not(analisaChoqueTurmas(T2, T3)) -> false;
%      not(analisaChoqueTurmas(T2, T4)) -> false;
%      true).

% getDiscsAleatorias(Y, X, W, Z):-
%     proximoPeriodo:proximoPeriodoOb(Y),
%     proximoPeriodo:proximoPeriodoOb(X),
%     proximoPeriodo:proximoPeriodoOb(W),
%     proximoPeriodo:proximoPeriodoOb(Z),
%     Y \== X, Y \== W, Y \== Z,
%     X \== W, X \== Z, W \== Z,
%     not(temChoqueDiscs(Y, X)), not(temChoqueDiscs(Y, W)), not(temChoqueDiscs(Y, Z)),
%     not(temChoqueDiscs(X, W)), not(temChoqueDiscs(X, Z)), not(temChoqueDiscs(W, Z)).

% geraHorario(Y, X, W, Z):-
%     getTurmas(Y, Ty), getTurmas(X, Tx), getTurmas(W, Tw), getTurmas(Z, Tz),
%     getTurma(Ty, Ty1, Ty2), getTurma(Tx, Tx1, Tx2), getTurma(Tw, Tw1, Tw2), getTurma(Tz, Tz1, Tz2),
%     (semChoqueTurmas(Ty1, Tx1, Tw1, Tz1) -> exibeHorarioTurmas(Y, Ty1, X, Tx1, W, Tw1, Z, Tz1)).

% exibeHorarioTurmas(Y, Ty, X, Tx, W, Tw, Z, Tz):-

