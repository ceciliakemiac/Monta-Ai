:- module(horariosPagos, []).
:- use_module(turmas).

:- dynamic(disciplinaPaga/1).

existeDisciplina(Nome):- turmas:disciplina(Nome, _, _, _, _, _).

digitaDisciplinas():-
    read_line_to_string(user_input, Nome),
    (Nome = "pronto" -> halt(0);
     existeDisciplina(Nome) -> assert(disciplinaPaga(Nome));
     writeln("ERRO! Não existe essa daí."), digitaDisciplinas()).

adicionaDisciplinaPaga():-
    forall(disciplinaPaga(X)),
    turmas:disciplina(X, _, _, _, Y, _),
    adicionaPreRequisito(Y).
    
adicionaPreRequisito([S]):- 
    not(disciplinaPaga(S)) -> assert(disciplinaPaga(S))).
adicionaPreRequisito([H | T]):-
    (not(disciplinaPaga(H)) -> assert(disciplinaPaga(H))),
    adicionaPreRequisito(T).

% digitaDisciplinas(Discs):-
%     read_line_to_string(user_input, Nome),
%     (Nome = "pronto" -> halt(0);
%      existeDisciplina(Nome) -> append([Nome], Discs, D), digitaDisciplinas(D);
%      writeln("ERRO! Não existe essa daí."), digitaDisciplinas(Discs)).
        
% digitaDisciplinas(D):-
%     read_line_to_string(user_input, Nome),
%     Nome = "pronto",
%     D = [].

% disciplinasPagas("pronto", []).
% disciplinasPagas(Nome, [X | T]):-
%     existeDisciplina(Nome),
%     read_line_to_string(user_input, Novo_nome),
%     disciplinasPagas(Novo_nome, [Nome, X | T]).

% :- initialization(main).

% main:-
%     writeln("Digite as disciplinas que já pagou: "),
%     read_line_to_string(user_input, Disc),
























