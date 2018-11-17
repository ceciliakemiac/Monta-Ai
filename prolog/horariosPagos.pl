:- module(horariosPagos, []).
:- use_module(turmas).

%disciplinaPaga(Nome).
:- dynamic(disciplinaPaga/1).

existeDisciplina(Nome):- turmas:disciplina(Nome, _, _, _, _, _).

digitaDisciplinas:-
    read_line_to_string(user_input, Nome),
    (Nome = "pronto" -> true;
     existeDisciplina(Nome) -> assert(disciplinaPaga(Nome)), digitaDisciplinas;
     writeln("ERRO! Não existe essa daí."), digitaDisciplinas).

getPreRequisito(X, Y):- 
    (turmas:disciplina(X, _, _, _, Y, _) -> true;
     true).

%Itera sobre os pre-requisitos de uma disciplina, se algum dos pre-requisitos não for
%uma disciplina paga, adiciona ele.
adicionaPreRequisito([]).
adicionaPreRequisito([S]):- 
    (not(disciplinaPaga(S)) -> assert(disciplinaPaga(S)), true;
     true).
adicionaPreRequisito([H | T]):-
    (not(disciplinaPaga(H)) -> assert(disciplinaPaga(H)), adicionaPreRequisito(T);
     disciplinaPaga(H) -> adicionaPreRequisito(T)).

%Itera sobre um array de nomes de disciplinas, pega os pre-requisitos e chama o método
%adicionaPreRequisito
iteraPagasAdicionaRequisitos([]).
iteraPagasAdicionaRequisitos([H | T]):-
    getPreRequisito(H, Y),
    adicionaPreRequisito(Y),
    iteraPagasAdicionaRequisitos(T).

iteraResumido:-
    findall(Y, disciplinaPaga(Y), X),
    iteraPagasAdicionaRequisitos(X).

removerDisciplina:-
    read_line_to_string(user_input, Nome),
    iteraResumido,
    (disciplinaPaga(Nome) -> retract(disciplinaPaga(Nome)), true;
     writeln("Você não pagou essa disciplina!!! Digite novamente."), removerDisciplina).

removerDisciplinas([]).
removerDisciplinas([H | T]):-
    retract(disciplinaPaga(H)),
    removerDisciplinas(T).

getRemoveDisciplinas:- 
    findall(X, disciplinaPaga(X), Lista),
    removerDisciplinas(Lista).

listarDisciplinasPagas([]):- writeln("").
listarDisciplinasPagas([H | T]):-
    write("        "), 
    write(H), nl,
    listarDisciplinasPagas(T).

getListaDisciplinasPagas:- 
    findall(Y, disciplinaPaga(Y), X),
    listarDisciplinasPagas(X).


