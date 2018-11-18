:- initialization(main).

:-use_module(turmas).
:-use_module(horariosPagos).

main:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    write("MENU"), nl,
    write("0 - Informar/Editar disciplinas que já paguei"), nl,
    write("1 - Montar horário que já paguei"), nl,
    write("2 - Visualizar disciplinas"), nl,
    write("3 - Ver informações detalhadas de uma disciplina"), nl,
    write("4 - Avaliar disciplina"), nl,
    write("5 - SAIR"), nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "0" -> menuDisciplinasPagas;
     Entrada = "1" -> menuMontarHorario;
     Entrada = "2" -> menuVisualizarDisciplinas;
     Entrada = "3" -> menuInformacoesDetalhadas;
     Entrada = "4" -> menuAvaliacao;
     Entrada = "5" -> write("Espero que volte novamente!!!"), nl, halt(0); main).

menu0RetornaMenu:-
    write("Deseja retornar ao menu principal? s/n"), nl, nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "s" -> write(""), nl, nl, nl, nl, nl, main;
     Entrada = "n" -> write(""), nl, nl, nl, nl, nl, menuDisciplinasPagas;
     menu0RetornaMenu).

menu0EscreveOpcoes:-
    writeln("Deseja remover alguma disciplina que informou como paga? s/n, visualizar disciplinas pagas(v) ou apagar histórico(a):"),
    read_line_to_string(user_input, Entrada),
    (Entrada = "s" -> write("Qual disciplina deseja remover? "), nl, horariosPagos:removerDisciplina,
     menu0EscreveOpcoes;
     Entrada = "n" -> write("Você pagou as seguintes disciplinas: "), nl, nl,
     horariosPagos:getListaDisciplinasPagas, menu0RetornaMenu;
     Entrada = "v" -> write("Disciplinas pagas: "), nl, horariosPagos:iteraResumido, 
     horariosPagos:iteraResumido, horariosPagos:getListaDisciplinasPagas, menu0EscreveOpcoes;
     Entrada = "a" -> horariosPagos:getRemoveDisciplinas, menu0RetornaMenu;
     menu0EscreveOpcoes).

menuDisciplinasPagas:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    write("Menu de disciplinas pagas"), nl, nl,
    write("Quais disciplinas você já pagou?        | Digite 'pronto' quando terminar"), nl, nl,
    horariosPagos:digitaDisciplinas,
    menu0EscreveOpcoes.

menuMontarHorario:-
    write("Menu de montar o horário"), nl,
    main.

menuVisualizarDisciplinas:-
    write("Menu de vizualizar disciplinas"), nl,
    main.

menuInformacoesDetalhadas:-
    write("Menu de informações detalhadas"), nl,
    main.

menuAvaliacao:-
    write("Menu de avaliação"), nl,
    main.
    