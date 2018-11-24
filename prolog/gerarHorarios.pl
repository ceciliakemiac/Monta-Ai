:- module(gerarHorarios, []).
:- use_module(turmas).
:- use_module(horariosPagos).

%proximoPeriodoOb(Nome)
:- dynamic(proximoPeriodoOb/1).

getDisciplinas(Y):- findall(X, turmas:disciplina(X, _, _, _, _, _), Y).

getOptativas(Y):- findall(X, turmas:disciplina(X, _, _, false, _, _), Y).

getObrigatorias(Y):- findall(X, turmas:disciplina(X, _, _, true, _, _), Y).

getProximoPeriodoOb(Y):- findall(X, proximoPeriodoOb(X), Y).

listarDisciplinas([]):-
    writeln("").
listarDisciplinas([H | T]):-
    write(H),
    write(" "),
    listarDisciplinas(T).

exibirOptativas:-
    getOptativas(Y),
    listarDisciplinas(Y).

iteraSobreRequisitos([]).
iteraSobreRequisitos([H | T]):-
    (horariosPagos:disciplinaPaga(H) -> iteraSobreRequisitos(T), true;
     false).

%Dado uma lista de disciplinas, sobre cada um de seus pre-requisitos, se todos forem disciplinas
%já pagas, a disciplina é uma candidata para ser paga no próximo período.
addPossiveisObrigatorias([]).
addPossiveisObrigatorias([H | T]):-
    horariosPagos:getPreRequisito(H, Y),
    ((iteraSobreRequisitos(Y), not(horariosPagos:disciplinaPaga(H)), not(proximoPeriodoOb(H)))
     -> assert(proximoPeriodoOb(H)), addPossiveisObrigatorias(T);
    addPossiveisObrigatorias(T)).

%Dada todas as disciplinas obrigatórias, adiciona as que já podem ser pagas próximo período.
addFinalPossiveisObrigatorias:-
    getObrigatorias(Obrigatorias),
    addPossiveisObrigatorias(Obrigatorias).

exibirObrigatorias:-
    getProximoPeriodoOb(Y),
    listarDisciplinas(Y).

