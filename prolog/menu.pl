:- module(menu, []).
:- initialization(main).

:-use_module(turmas).
:-use_module(horariosPagos).
:-use_module(avaliacoesDisc).
:-use_module(proximoPeriodo).
:-use_module(gerarHorarios).

logo :- 
    writeln(" __  __             _                            _           "),
    writeln("|  \\/  |           | |                     /\\   (_)        "),
    writeln("| \\  / | ___  _ __ | |_ __ _   ______     /  \\   _         "),
    writeln("| |\\/| |/ _ \\| '_ \\| __/ _` | |______|   / /\\ \\ | |     "),
    writeln("| |  | | (_) | | | | || (_| |           / ____ \\| |         "),
    writeln("|_|  |_|\\___/|_| |_|\\__\\__,_|          /_/    \\_\\_|	  ").



main:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    logo, nl,
    write("MENU"), nl,
    write("0 - Informar/Editar disciplinas que já paguei"), nl,
    write("1 - Montar horário do semestre"), nl,
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

menu1ObservaDiscs:-
    write("Estas são as disciplinas OBRIGATORIAS disponíveis para matrícula"), nl,
    proximoPeriodo:addFinalPossiveisObrigatorias,
    proximoPeriodo:exibirObrigatorias, nl,
    write("Estas são as disciplinas OPTATIVAS disponíveis para matrícula"), nl,
    proximoPeriodo:addFinalPossiveisOptativas,
    proximoPeriodo:exibirOptativas, nl,
    menu1Calcula.

menu1Calcula:-
    write("Calculando possiblidades com as seguintes disciplinas"), nl,
    proximoPeriodo:exibirObrigatorias, nl,
    write("Deseja remover(r) alguma disciplinas ou continuar(c)?"),
    read_line_to_string(user_input, Entrada),
    (Entrada = "r" -> read_line_to_string(user_input, D),
     proximoPeriodo:removerObrigatoria(D), menu1Calcula;
     Entrada = "c" -> gerarHorarios:geraCombinacoesLista(S), 
     gerarHorarios:escreveHorariosPorVez(S);
     menu1Calcula).  

menuMontarHorario:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    write("Menu de montar o horário"), nl, nl,
    write("Deseja importar algum horário pronto? (s/n)"), nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "n" -> menu1ObservaDiscs;
     Entrada = "s" -> menuMontarHorario;
     menuMontarHorario).

menuVisualizarDisciplinas:-
    write("Menu de vizualizar disciplinas"), nl, nl,
    main.

menuInformacoesDetalhadas:-
    write("Menu de informações detalhadas"), nl,
    main.

menuAvaliacao:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    write("Menu de avaliação"), nl,
    avaliacoesDisc:passoAvaliacao,
    main.
    