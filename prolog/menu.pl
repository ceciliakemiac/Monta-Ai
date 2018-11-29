:- initialization(main).

:-use_module(turmas).
:-use_module(horariosPagos).
:-use_module(avaliacoesDisc).
:-use_module(funcoesDeExibicao).
:-use_module(proximoPeriodo).

logo :- 
    writeln(" __  __             _                            _           "),
    writeln("|  \\/  |           | |                     /\\   (_)        "),
    writeln("| \\  / | ___  _ __ | |_ __ _   ______     /  \\   _         "),
    writeln("| |\\/| |/ _ \\| '_ \\| __/ _` | |______|   / /\\ \\ | |     "),
    writeln("| |  | | (_) | | | | || (_| |           / ____ \\| |         "),
    writeln("|_|  |_|\\___/|_| |_|\\__\\__,_|          /_/    \\_\\_|	  ").



main:-
    write('\e[2J'),
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
    tty_clear,
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
    write("Deseja continuar observando(c) ou voltar para o menu principal(v) ?"),
    read_line_to_string(user_input, Entrada),
    (Entrada = "c" -> write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
     nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, menu1ObservaDiscs;
     Entrada = "v" -> main;
     menu1ObservaDiscs).  

menuMontarHorario:-
    write(""), nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl, nl,
    write("Menu de montar o horário"), nl, nl,
    write("Deseja importar algum horário pronto? (s/n)"), nl,
    read_line_to_string(user_input, Entrada),
    (Entrada = "n" -> menu1ObservaDiscs;
     Entrada = "s" -> menuMontarHorario;
     menuMontarHorario).

menuVisualizarDisciplinas:-
    write('\e[H\e[2J'),
    write("Menu de vizualizar disciplinas"), nl,
    menuVisualizarDisciplinasOp1.

menuVisualizarDisciplinasOp1:-
    writeln("Menu: planilha de horarios(1) listagem(2) filtrar(3) voltar ao menu(4)"),
    read_line_to_string(user_input, Op),
    (Op =:= "1" -> funcoesDeExibicao:exibePlanilhaHorarios ; Op =:= "2" -> funcoesDeExibicao:listaDisciplinas; Op =:= "3" -> funcoesDeExibicao:filtraDisciplinas; Op =:= "4" -> main; menuVisualizarDisciplinasOp1),
    menuVisualizarDisciplinasOp1.

filtraDisciplinas:-
    writeln("Filtrar por periodo(1), obrigatorias(2), optativas(3) ou todas as disciplinas(4)?"),
    read_line_to_string(user_input, Op),
    (Op =:= "1" -> funcoesDeExibicao:listaPorPeriodo; Op =:= "2" -> funcoesDeExibicao:listaObrigatorias; Op =:= "3" -> funcoesDeExibicao:listaOptativas; Op =:= "4" -> funcoesDeExibicao:listaDisciplinas; filtraDisciplinas).


menuInformacoesDetalhadas:-
    write("Informações detalhadas de uma disciplina"), nl,
    write("Digite o nome da disciplina: "), read_line_to_string(user_input, Nome),
    turmas:disciplina(Nome, C, P, O, R, H),
    write("Creditos: "), writeln(C),
    write("Status: "), funcoesDeExibicao:exibeStatus(O),
    write("Pre-requisitos: "), 
    funcoesDeExibicao:exibePR(R),
    writeln("Turmas: "),
    funcoesDeExibicao:exibeTurmas(H, 1),
    avaliacoesDisc:toStringAval(Nome),
    menuInformacoesDetalhadasOp,
    main.

menuInformacoesDetalhadasOp:-
    writeln("1 - Visualizar outra disciplina"),
    writeln("2 - voltar ao menu"),
    read_line_to_string(user_input, Op), (Op =:= "1" -> menuInformacoesDetalhadas; Op =:= "2" -> main; menuInformacoesDetalhadasOp).

menuAvaliacao:-
    tty_clear,
    write("Menu de avaliação"), nl,
    writeln(""),
    writeln("Qual disciplina deseja avaliar?"),
    read_line_to_string(user_input, Disc),
    (horariosPagos:existeDisciplina(Disc) -> avaliacoesDisc:escolherOpcao(Disc); 
    writeln("Disciplina não existe /:")),
    writeln("1 - Avaliar outra disciplina"), 
    writeln("2 - voltar ao menu"),
    read_line_to_string(user_input, Opcao),
    (Opcao = "1" -> menuAvaliacao;
    Opcao = "2" -> main).
    