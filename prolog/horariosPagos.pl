:- module(horariosPagos, []).
:- use_module(turmas).

existeDisciplina(Nome):- turmas:disciplina(Nome, _, _, _, _, _).

digitaDisciplinas(Discs):-
    read_line_to_string(user_input, Nome),
    (Nome = "pronto" -> halt(0);
     existeDisciplina(Nome) -> append([Nome], Discs, D), digitaDisciplinas(D);
     writeln("ERRO! Não existe essa daí."), digitaDisciplinas(Discs)).
        
    


