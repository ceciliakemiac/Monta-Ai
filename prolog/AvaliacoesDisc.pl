:- initialization(main).

comentario_ou_votarAvaliacao :- 
    writeln(""),    
    writeln("1 - Deixar um comentário"),
    writeln("2 - Votar em uma avaliação"). 

menu_votar_avaliacao :- 
    writeln(""),
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

passoAvaliacao :-
    writeln(""),
    writeln("Qual disciplina deseja avaliar?"),
    read_line_to_string(user_input, Disc),
    (avaliacao(Disc) -> escolherOpcao(Disc); 
    writeln("Disciplina não existe /:")),
    writeln("1 - Avaliar outra disciplina"), 
    writeln("2 - voltar ao menu"),
    read_line_to_string(user_input, Opcao),
    (Opcao = "1" -> passoAvaliacao;
    Opcao = "2" -> main).

escolherOpcao(Disc) :- 
    comentario_ou_votarAvaliacao,
    read_line_to_string(user_input, Opcao),
    (Opcao = "2" -> menu_votar_avaliacao, atribuirNivel(Disc);
    adicionarComentario(Disc)).

atribuirNivel(Disc) :- avaliacao(Disc), writeln("Nivel a implementar").
adicionarComentario(Disc) :- avaliacao(Disc), writeln("Cmen a implementar").


% adicionaAval([]).
% adicionaAval([H|T]) :- 

avaliacao("p1").
    
     
    
    

main :- 
    writeln("voltou"),
    passoAvaliacao.
%    avaliacoes(p1, X, _), insere(2, X, Res), writeln(Res).
%    insere(Elem, Lista, [Elem|Lista]).


% getAvalNome(Nome, Res) :- avaliacoes([Nome|Res]).

avaliacoes(p1, [], []).

alteraNivel(Nome, Novo) :- avaliacoes(Nome, X, _), append(X, Novo, Res), writeln(Res).