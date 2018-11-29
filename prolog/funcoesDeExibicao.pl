:- module(funcoesDeExibicao, []).

exibeStatus(O):-
    (O =:= 1 -> writeln("Obrigatoria"); O =:= 0 -> writeln("Optativa")).

exibePR([]) :- writeln("").
exibePR([X|XS]) :- write(X),
    write(" | "),
    exibePR(XS).

exibeTurmas([], N) :- writeln("").
exibeTurmas([X|XS], Nx) :- X = [D1, H1, D2, H2], 
    write("------ "), write(Nx), write(" | Dia "), write(D1), write("- hora: "), write(H1), write(" |"),
    write("| "), write(" | Dia "), write(D2), write("- hora: "), write(H2), writeln(" |"),
    N is Nx + 1,
    exibeTurmas(XS, N).

exibeListaDeDisciplinas([]) :- write("").
exibeListaDeDisciplinas([X|XS]) :-
    turmas:disciplina(X, C, P, O, R, H),
    write("Disciplina: "), write(X),
    write(" - Creditos: "), write(C),
    write(" - Período: "), writeln(P),
    exibeListaDeDisciplinas(XS).