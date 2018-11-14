% noms, qtdCreditos, periodo, Obrigatoria, 
% .....Requisitos, turmas 
:- module(turmas, []).

% 1p
disciplina("FMCC1", 4, 1, true, [], 
    [[3, 10, 6, 8], [3, 10, 6, 8]]).

disciplina("P1", 4, 1, true, [],
    [[2, 14, 4, 16], [2, 8, 4, 10]]).

disciplina("LP1", 4, 1, true, [],
    [[2, 10, 4, 8], [2, 16, 5, 14]]).

disciplina("IC", 4, 1, true, [],
    [[3, 8, 5, 10], [3, 8, 5, 10]]).


% 2p
disciplina("FMCC2", 4, 2, true, ["FMCC1"], 
    [[2, 10, 5, 8], [2, 10, 5, 8]]).

disciplina("C1", 4, 2, true, ["FMCC1"], 
    [[2, 14, 4, 16], [2, 14, 4, 16]]).

disciplina("P2", 4, 2, true, ["P1", "LP1"], 
    [[4, 8, 6, 10], [4, 8, 6, 10]]).

disciplina("LP2", 4, 2, true, ["P1", "LP1"], 
    [[3, 8, 5, 10], [3, 8, 5, 10]]).


% 3p
disciplina("AL", 4, 3, true, ["FMCC2"], 
    [[3, 14, 5, 16]]).

disciplina("LC", 4, 3, true, ["FMCC2", "C1"], 
    [[4, 8, 6, 10]]).

disciplina("C2", 4, 3, true, ["FMCC2", "C1"], 
    [[2, 14, 4, 16]]).

disciplina("EDA", 4, 3, true, ["P2", "LP2"], 
    [[2, 8, 4, 10], [3, 8, 5, 10]]).

disciplina("LEDA", 4, 3, true, ["P2", "LP2"], 
    [[2, 16, 5, 14], [2, 16, 5, 14]]).

disciplina("TG", 4, 3, true, [], 
    [[3, 10, 6, 10]]).

% 4p
disciplina("IP", 4, 4, true, ["FMCC2", "C1"], 
    [[2, 10, 5, 8], [2, 10, 5, 8]]).

disciplina("PS", 4, 4, true, ["P1", "LP1"], 
    [[2, 14, 4, 16], [2, 14, 4, 16]]).

disciplina("PLP", 4, 4, true, ["P1", "LP1"], 
    [[2, 16, 6, 14], [2, 16, 6, 14]]).

disciplina("BD1", 4, 4, true, ["EDA"], 
    [[2, 8, 4, 10], [3, 14, 5, 16]]).

disciplina("OAC", 4, 4, true, ["IC"], 
    [[3, 10, 6, 8], [4, 8, 6, 10]]).

disciplina("LOAC", 4, 4, true, ["IC"], 
    [[4, 8, 6, 10], [3, 14, 5, 16]]).


% 5p
disciplina("EA", 4, 5, true, ["IP"], 
    [[2, 10, 5, 8]]).

disciplina("AS", 4, 5, true, ["P1", "LP1"], 
    [[3, 10, 6, 8]]).

disciplina("ES", 4, 5, true, ["P1", "LP1"], 
    [[2, 14, 4, 16]]).


disciplina("RC", 4, 5, true, ["IC"], 
    [[3, 8, 5, 10], [3, 16, 5, 14]]).


disciplina("SO", 4, 5, true, ["LOAC"], 
    [[2, 8, 4, 10]]).


disciplina("TC", 4, 5, true, ["PLP"], 
    [[2, 16, 6, 14]]).



% 6p
disciplina("MC", 4, 6, true, [], 
    [[3, 14, 5, 16]]).

disciplina("PC", 4, 6, true, ["SO"], 
    [[2, 16, 5, 14]]).


disciplina("IA", 4, 6, true, ["TC"], 
    [[3, 16, 6, 14]]).


% 7p


disciplina("ATAL", 4, 7, true, ["EDA", "LEDA"], 
    [[3, 10, 6, 8]]).

disciplina("COMP", 4, 7, true, ["EDA", "LEDA"], 
    [[3, 10, 6, 8]]).


% 8p 

disciplina("PC1", 4, 8, true, ["ES"], 
    [[3, 10, 5, 8], [3, 10, 5, 8]]).


disciplina("PTCC", 4, 8, true, [], 
    [[3, 14, 5, 8]]).

% 9p

disciplina("PC2", 4, 8, true, ["PC1"], 
    [[3, 14, 5, 16]]).

disciplina("TCC", 4, 8, true, ["PTCC"], 
    [[2, 10, 5, 8], [3, 10, 5, 8]]).


% optativas

disciplina("VD", 4, 0, false, [], 
    [[2, 10, 5, 8]]).

disciplina("CDP", 4, 0, false, [], 
    [[2, 8, 4, 10]]).

disciplina("VVTS", 4, 0, false, ["ES"], 
    [[2, 16, 6, 14]]).


disciplina("PWD", 4, 0, false, [], 
    [[3, 14, 6, 16]]).


disciplina("PSO", 4, 0, false, [], 
    [[3, 8, 5, 10]]).


disciplina("AA", 4, 0, false, ["P1", "LP1"], 
    [[3, 8, 5, 10]]).


disciplina("ETI", 4, 0, false, ["EA"], 
    [[2, 16, 4, 14]]).


disciplina("JD", 4, 0, false, [], 
    [[2, 18, 4, 18]]).


disciplina("PF", 4, 0, false, ["PLP"], 
    [[2, 14, 4, 16]]).


disciplina("D1/2", 2, 0, false, [], 
    [[2, 18, 5, 8]]).

disciplina("GRC", 4, 0, false, [], 
    [[2, 18, 4, 18]]).

disciplina("LP", 4, 0, false, [], 
    [[2, 18, 4, 18]]).


disciplina("ING", 4, 0, false, [], 
    [[2, 8, 4, 10], [2, 18, 5, 10]]).

disciplina("FUT", 2, 0, false, [], 
    [[2, 18, 5, 18]]).

disciplina("DC", 4, 0, false, [], 
    [[3, 10, 6, 8]]).