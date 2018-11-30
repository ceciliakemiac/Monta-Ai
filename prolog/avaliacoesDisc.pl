:-module(avaliacoesDisc, []).
:- use_module(horariosPagos).

:- dynamic (avaliacoesComentario/2),
            (avaliacoesNivel/2).

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

escolherOpcao(Disc) :- 
    comentario_ou_votarAvaliacao,
    read_line_to_string(user_input, Opcao),
    (Opcao = "2" -> menu_votar_avaliacao, read_line_to_string(user_input, Nivel), atribuirNivel(Disc, Nivel);
    Opcao = "1" -> write("Digite um comentario sobre a disciplina "), writeln(Disc), read_line_to_string(user_input, Comentario),
    adicionaComentario(Disc, Comentario)).

adicionaComentario(Nome, Comentario) :- assert(avaliacoesComentario(Nome, Comentario)).

listar([]):- write("").
listar([H | T]):-
    write("     - "),
    writeln(H),
    listar(T).
    
atribuirNivel(Nome, Nivel) :- assert(avaliacoesNivel(Nome, Nivel)).

getNivel(Nome) :- 
    (avaliacoesNivel(Nome, _) ->
    avaliacoesNivel(Nome, N), write(N); write("")).

getComentarios(Nome) :- 
    findall(X, avaliacoesComentario(Nome, X), Y),
    writeln("Comentarios:"),
    listar(Y).

toStringAval(Nome) :- 
    getComentarios(Nome), write("- Essa disciplina foi avaliada no nível "),
    getNivel(Nome), 
    writeln(" >:(").

