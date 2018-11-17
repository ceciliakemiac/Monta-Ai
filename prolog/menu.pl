:- initialization(main).

:-use_module(turmas).
:-use_module(horariosPagos).

main:-
    write("MENU"), nl,
    write("0 - Informar/Editar disciplinas que já paguei"), nl,
    write("1 - Montar horário que já paguei"), nl,
    write("2 - Visualizar disciplinas"), nl,
    write("3 - Ver informações detalhadas de uma disciplina"), nl,
    write("4 - Avaliar disciplina"), nl,
    write("5 - SAIR"), nl, nl, nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "0" -> menuDisciplinasPagas;
     Entrada = "1" -> menuMontarHorario;
     Entrada = "2" -> menuVisualizarDisciplinas;
     Entrada = "3" -> menuInformacoesDetalhadas;
     Entrada = "4" -> menuAvaliacao;
     Entrada = "5" -> halt(0); main).

menuDisciplinasPagas:-
    write("Menu de disciplinas pagas"), nl, nl,
    write("Quais disciplinas você já pagou?        | Digite 'pronto' quando terminar"), nl, nl,
    horariosPagos:digitaDisciplinas,
    write("Deseja remover alguma disciplina que informou como paga? s/n, 
           visualizar disciplinas pagas(v)
           ou apagar histórico(a):"), nl.

menuMontarHorario:-
    write("Menu de montar o horário"), nl.

menuVisualizarDisciplinas:-
    write("Menu de vizualizar disciplinas"), nl.

menuInformacoesDetalhadas:-
    write("Menu de informações detalhadas"), nl.

menuAvaliacao:-
    write("Menu de avaliação"), nl.
    