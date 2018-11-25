:- module(proximoPeriodo, []).
:- use_module(turmas).
:- use_module(horariosPagos).

%proximoPeriodoOb(Nome)
%proximoPeriodoOp(Nome)
:- dynamic (proximoPeriodoOb/1),
           (proximoPeriodoOp/1).

getDisciplinas(Y):- findall(X, turmas:disciplina(X, _, _, _, _, _), Y).

getOptativas(Y):- findall(X, turmas:disciplina(X, _, _, false, _, _), Y).

getObrigatorias(Y):- findall(X, turmas:disciplina(X, _, _, true, _, _), Y).

getProximoPeriodoOb(Y):- findall(X, proximoPeriodoOb(X), Y).

getProximoPeriodoOp(Y):- findall(X, proximoPeriodoOp(X), Y).

listarDisciplinas([]):-
    writeln("").
listarDisciplinas([H | T]):-
    write(H),
    write(" "),
    listarDisciplinas(T).

iteraSobreRequisitos([]).
iteraSobreRequisitos([H | T]):-
    (horariosPagos:disciplinaPaga(H) -> iteraSobreRequisitos(T), true;
     false).

%Dado uma lista de disciplinas obrigatórias, sobre cada um de seus pre-requisitos, se todos forem disciplinas
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

%Dado uma lista de disciplinas optativas, sobre cada um de seus pre-requisitos, se todos forem disciplinas
%já pagas, a disciplina é uma candidata para ser paga no próximo período.
addPossiveisOptativas([]).
addPossiveisOptativas([H | T]):-
    horariosPagos:getPreRequisito(H, Y),
    ((iteraSobreRequisitos(Y), not(horariosPagos:disciplinaPaga(H)), not(proximoPeriodoOp(H)))
    -> assert(proximoPeriodoOp(H)), addPossiveisOptativas(T);
    addPossiveisOptativas(T)).

%Dada todas as disciplinas optativas, adiciona as que já podem ser pagas próximo período.
addFinalPossiveisOptativas:-
    getOptativas(Optativas),
    addPossiveisOptativas(Optativas).

exibirObrigatorias:-
    getProximoPeriodoOb(Y),
    listarDisciplinas(Y).

exibirOptativas:-
    getProximoPeriodoOp(Y),
    listarDisciplinas(Y).

