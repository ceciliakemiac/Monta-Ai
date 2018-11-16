:- module(horariosPagos, []).
:- use_module(turmas).

:- dynamic(disciplinaPaga/1).

existeDisciplina(Nome):- turmas:disciplina(Nome, _, _, _, _, _).

digitaDisciplinas:-
    read_line_to_string(user_input, Nome),
    (Nome = "pronto" -> false;
     existeDisciplina(Nome) -> assert(disciplinaPaga(Nome)), digitaDisciplinas;
     writeln("ERRO! Não existe essa daí."), digitaDisciplinas).

getPreRequisito(X, Y):- 
    (turmas:disciplina(X, _, _, _, Y, _) -> true;
     true).
    
adicionaPreRequisito([S]):- 
    (not(disciplinaPaga(S)) -> assert(disciplinaPaga(S)), true;
     true).
adicionaPreRequisito([H | T]):-
    (not(disciplinaPaga(H)) -> assert(disciplinaPaga(H))),
    adicionaPreRequisito(T).

iteraPagasAdicionaRequisitos([]).
iteraPagasAdicionaRequisitos([H | T]):-
    getPreRequisito(H, Y),
    adicionaPreRequisito(Y),
    iteraPagasAdicionaRequisitos(T).

iteraResumido:-
    findall(Y, disciplinaPaga(Y), X),
    iteraPagasAdicionaRequisitos(X).



























