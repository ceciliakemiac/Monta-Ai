:- module(gerarHorarios, []).
:- use_module(proximoPeriodo).
:- use_module(turmas).
:- use_module(horariosPagos).
:- use_module(menu).

:- dynamic (proximoPeriodoTurmas/3).

getProximas(Y):- 
    findall(X, (proximoPeriodo:proximoPeriodoOb(X)), Y).

getProximasComTurmas(Y):- findall([D, Horas, Turma], proximoPeriodoTurmas(D, Horas, Turma), Y).

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
    (Int \== 0 -> assert(proximoPeriodoTurmas(H, T2, 2)), true; true),
    assert(proximoPeriodoTurmas(H, T1, 1)),
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

insereInicio(H, L, [H|L]):- !.

criaListaTurmas([H | T], L):-
    nth0(1, H, Turma),
    criaListaTurmas(T, [Turma | L]).
criaListaTurmas([], Lista).

todasDiscsDiferentes(A, B, C, D):-
    A \== B, A \== C, A \== D,
    B \== C, B \== D, C \== D.

todasDiscsDiferentes(A, B, C, D, E):-
    A \== B, A \== C, A \== D, A \== E, B \== C,
    B \== D, B \== E, C \== D, C \== E, D \== E.

todasDiscsDiferentes(A, B, C, D, E, F):-
    A \== B, A \== C, A \== D, A \== E, A \== F,
    B \== C, B \== D, B \== E, B \== F, C \== D,
    C \== E, C \== F, D \== E, D \== F, E \== F.

todasTurmasDiferentes(A, B, C, D, E):-
    not(temChoque(A, B)), not(temChoque(A, C)), not(temChoque(A, D)), not(temChoque(A, E)), not(temChoque(B, C)), 
    not(temChoque(B, D)), not(temChoque(B, E)), not(temChoque(C, D)), not(temChoque(C, E)), not(temChoque(D, E)).

todasTurmasDiferentes(A, B, C, D, E, F):-
    not(temChoque(A, B)), not(temChoque(A, C)), not(temChoque(A, D)), not(temChoque(A, E)), not(temChoque(A, F)),
    not(temChoque(B, C)), not(temChoque(B, D)), not(temChoque(B, E)), not(temChoque(B, F)), not(temChoque(C, D)),
    not(temChoque(C, E)), not(temChoque(C, F)), not(temChoque(D, E)), not(temChoque(D, F)), not(temChoque(E, F)).

todasTurmasDiferentes(A, B, C, D):-
    not(temChoque(A, B)), not(temChoque(A, C)), not(temChoque(A, D)),
    not(temChoque(B, C)), not(temChoque(B, D)), not(temChoque(C, D)).

%combinações de disciplinas no limite de créditos
geraCombinacoesNoLimite(Discs, C):-
    geraCombinacoes(Discs, C),
    getQuantCreditos(C, N), N > 15, N < 25,
    length(C, L),
    (L =:= 4 -> nth0(0, C, First), nth0(1, C, Second), nth0(2, C, Third), nth0(3, C, Fourth),
    nth0(0, First, D1), nth0(0, Second, D2), nth0(0, Third, D3), nth0(0, Fourth, D4),
    nth0(1, First, T1), nth0(1, Second, T2), nth0(1, Third, T3), nth0(1, Fourth, T4),
    todasDiscsDiferentes(D1, D2, D3, D4), todasTurmasDiferentes(T1, T2, T3, T4);
    L =:= 5 -> nth0(0, C, First), nth0(1, C, Second), nth0(2, C, Third), nth0(3, C, Fourth), nth0(4, C, Fifth),
    nth0(0, First, D1), nth0(0, Second, D2), nth0(0, Third, D3), nth0(0, Fourth, D4), nth0(0, Fifth, D5),
    nth0(1, First, T1), nth0(1, Second, T2), nth0(1, Third, T3), nth0(1, Fourth, T4), nth0(1, Fifth, T5),
    todasDiscsDiferentes(D1, D2, D3, D4, D5), todasTurmasDiferentes(T1, T2, T3, T4, T5);
    L =:= 6 -> nth0(0, C, First), nth0(1, C, Second), nth0(2, C, Third), nth0(3, C, Fourth), nth0(4, C, Fifth), nth0(0, C, Sixth),
    nth0(0, First, D1), nth0(0, Second, D2), nth0(0, Third, D3), nth0(0, Fourth, D4), nth0(0, Fifth, D5), nth0(0, Sixth, D6),
    nth0(1, First, T1), nth0(1, Second, T2), nth0(1, Third, T3), nth0(1, Fourth, T4), nth0(1, Fifth, T5), nth0(1, Fifth, T6),
    todasDiscsDiferentes(D1, D2, D3, D4, D5, D6), todasTurmasDiferentes(T1, T2, T3, T4, T5, T6)).
    
%lista com todas as combinações possíveis das disciplinas a se pagar
geraCombinacoesLista(Saida):-
    criaComTurmas,
    getProximasComTurmas(Disciplinas),
    findall(S, geraCombinacoesNoLimite(Disciplinas, S), Saida).

% true se duas turmas têm mesmo horário, false se não tem o mesmo horário
temChoque([], []).
temChoque(_, []).
temChoque([], _).
temChoque([H1 | T1], [H2 | T2]):-
    (H1 == H2 -> temChoque(T1, T2);
     false).

listarHorarios([]):- writeln("").
listarHorarios([H | T]):-
    write(H), nl,
    listarHorarios(T).

pegaDH(D, H, [], []).
pegaDH(D, H, [[Nome,[D, H| []] , Turma]|T1], [S | T2]):-
    atom_string(Nome, N1),
    atom_string(Turma, Turma1),
    atomics_to_string([N1, Turma1], ": t-", S),
    pegaDH(D, H, T1, T2).
pegaDH(D, H, [[Nome,[D, H| T] , Turma]|T1], [S | T2]):-
    atom_string(Nome, N1),
    atom_string(Turma, Turma1),
    atomics_to_string([N1, Turma1], ": t-", S),
    pegaDH(D, H, T1, T2).
pegaDH(D, H, [[Nome,[_, _| T] , Turma]|T1], T2):-
    pegaDH(D, H, [[ Nome, T, Turma] | T1], T2).
pegaDH(D, H, [_|T], X):- pegaDH(D, H, T, X).

replicate(0, X, "").
replicate(1, X, S):- string_concat(X, "", S).
replicate(N, X, S):- N < 0, replicate(0, X, S).
replicate(N, X, S):-
    N1 is N - 1, replicate(N1, X, S1), string_concat(X, S1, S).


formataString(String, S):-
    atomics_to_string(String, "", S1),
    string_length(S1, Len),!,  
    Esp is 15 - Len,
    replicate(Esp, " ", S2),!,
    string_concat(S1, S2, S),!.


writeSemana(S, T, Q, Qt, Sx):-
    formataString(S, S1),!, 
    formataString(T, T1),!,
    formataString(Q, Q1),!,
    formataString(Qt, Qt1),!,
    formataString(Sx, Sx1),!, 
    write(S1), write(T1), write(Q1), write(Qt1), write(Sx1), nl.

printHorario([]).
printHorario(H):-
    pegaDH(2, 8, H, S8),!,pegaDH(3, 8, H, T8),!,pegaDH(4, 8, H, Q8),!,
    pegaDH(5, 8,H, Qi8),!, pegaDH(6, 8, H,Sx8),!,
    pegaDH(2, 10, H, S10),!,pegaDH(3, 10, H, T10),!,pegaDH(4, 10, H, Q10),!,
    pegaDH(5, 10,H, Qi10),!, pegaDH(6, 10, H, Sx10),!,
    pegaDH(2, 14, H, S14),!,pegaDH(3, 14, H, T14),!,pegaDH(4, 14, H, Q14),!,
    pegaDH(5, 14,H, Qi14),!, pegaDH(6, 14, H, Sx14),!,
    pegaDH(2, 16, H, S16),!,pegaDH(3, 16, H, T16),!,pegaDH(4, 16, H, Q16),!,
    pegaDH(5, 16,H, Qi16),!, pegaDH(6, 16, H, Sx16),!,
    write("SEGUNDA        "), 
    write("TERÇA          "), 
    write("QUARTA         "), 
    write("QUINTA         "), 
    write("SEXTA          "), nl,
    writeSemana( S8,  T8,  Q8,  Qi8,  Sx8),
    writeSemana(S10, T10, Q10, Qi10, Sx10),
    writeSemana(S14, T14, Q14, Qi14, Sx14),
    writeSemana(S16, T16, Q16, Qi16, Sx16).

printHorarios([]):- writeln("").
printHorarios([H | T]):-
    printHorario(H),
    printHorarios(T).


exibirHorarios:-
    geraCombinacoesLista(H), 
    printHorarios(H).

escreveHorario(H):-
    write(""), nl,
    nth0(0, H, Nome), nth0(1, H, Horas), nth0(2, H, Turma),
    nth0(0, Horas, D1), nth0(1, Horas, H1), nth0(2, Horas, D2), nth0(3, Horas, H2),
    turmas:dia(D1, Dia1), turmas:dia(D2, Dia2), turmas:hora(H1, Hora1), turmas:hora(H2, Hora2),
    write(Nome), write(": "), write(Turma), nl,
    write(Dia1), write(" às "), write(Hora1), write(" e "), 
    write(Dia2), write(" às "), write(Hora2), nl, true.

escreveHorarios([]).
escreveHorarios([H | T]):-
    escreveHorario(H), true,
    escreveHorarios(T).
    
escreveHorariosPorVez([]).
escreveHorariosPorVez([H | T]):-
    write("Processando..."), nl,
    write("Possíveis horários: "), nl,
    escreveHorarios(H), nl,
    write("escolher(e) proximo(n) menu principal(p)"), nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "e" -> menu:main;
     Entrada = "n" -> escreveHorariosPorVez(T);
     Entrada = "p" -> menu:main;
     escreveHorariosPorVez(T)).

