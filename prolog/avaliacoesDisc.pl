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

passoAvaliacao :-
    writeln(""),
    writeln("Qual disciplina deseja avaliar?"),
    read_line_to_string(user_input, Disc),
    (horariosPagos:existeDisciplina(Disc) -> escolherOpcao(Disc); 
    writeln("Disciplina não existe /:")),
    writeln("1 - Avaliar outra disciplina"), 
    writeln("2 - voltar ao menu"),
    read_line_to_string(user_input, Opcao),
    (Opcao = "1" -> passoAvaliacao;
    Opcao = "2" -> main).

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
    

atribuirNivel(Nome, Nivel) :- avaliacoesNivel(Nome,_) ->
    retract(avaliacoesNivel(Nome,_)), assert(avaliacoesNivel(Nome, Nivel));
    assert(avaliacoesNivel(Nome, Nivel)).

getNivel(Nome, Res) :- avaliacoesNivel(Nome, Res).

getComentarios(Nome) :- 
    findall(X, avaliacoesComentario(Nome, X), Y),
    writeln("Comentarios:"),
    listar(Y).

toStringAval(Nome) :- 
    getComentarios(Nome), write("- Essa disciplina eh "),
    getNivel(Nome, X), nivel(X, Y), write(Y), 
    writeln(" >:(").

nivel(1, "rasgada").
nivel(2, "de boa").
nivel(3, "carrego").
nivel(4, "tenso").
nivel(5, "peso").

