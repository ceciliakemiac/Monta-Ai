:- initialization(main).

comentario_ou_votarAvaliacao :- 
    writeln("1 - Deixar um comentário"),
    writeln("2 - Votar em uma avaliação"). 

menu_votar_avaliacao :- 
    writeln("O que achou da disciplina?"),
    writeln("1 - rasgada"),
    writeln("2 - de boa"),
    writeln("3 - carrego"),
    writeln("4 - tenso"),
    writeln("5 - peso").

nivel(1, rasgado).
nivel(2, deboa).
nivel(3, carrego).
nivel(4, tenso).
nivel(5, peso).


main :- 
   avaliacao(p1, X, _), insere(2, X, Res), writeln(Res).
 
# insere(Elem, Lista, [Elem|Lista]).


# getAvalNome(Nome, Res) :- avaliacoes([Nome|Res]).

# avaliacao(p1, [], []).

# alteraNivel(Nome, Novo) :- avaliacoes(Nome, X, _), append(X, Novo, Res), writeln(Res).