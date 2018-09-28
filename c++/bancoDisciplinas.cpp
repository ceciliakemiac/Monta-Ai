
map<string, disciplina> gradeCurricular = {
    {"FMCCI", disciplina {"1", "FMCCI", 4, 1, true, {}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{3, 10}, horario{6, 8}}}
                     }}},
    {"P1", disciplina {"2", "P1", 4, 1, true, {}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"LP1", disciplina {"3", "LP1", 4, 1, true, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"IC", disciplina {"4", "IC", 4, 1, true, {}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"FMCCII", disciplina {"5", "FMCCII", 4, 2, true, {"FMCCI"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"C1", disciplina {"6", "C1", 4, 2, true, {"FMCCI"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"P2", disciplina{"7", "P2", 4, 2, true,{"P1", "LP1"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{4, 8}, horario{6, 10}}},
                     }}},
    {"LP2", disciplina {"8", "LP2", 4, 2, true, {"P1", "LP1"}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"AL", disciplina {"9", "AL", 4, 3, true, {"FMCCII"}, {
                     turma{{horario{3, 14}, horario{5, 16}}},
                     }}},
    {"LC", disciplina{"10", "LC", 4, 3, true,{"FMCCII", "C1"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     }}},
    {"C2", disciplina {"11", "C2", 4, 3, true, {"FMCCII", "C1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     }}},
    {"EDA", disciplina {"12", "EDA", 4, 3, true, {"P2", "LP2"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"LEDA", disciplina {"13", "LEDA", 4, 3, true, {"P2", "LP2"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"TG", disciplina{"14", "TG", 4, 3, true,{}, {
                     turma{{horario{3, 10}, horario{6, 10}}},
                     }}},
    {"IP", disciplina {"15", "IP", 4, 4, true, {"FMCCII", "C1"}, {
                     turma{{horario{2, 10}, horario{5, 10}}},
                     turma{{horario{2, 10}, horario{5, 10}}}
                     }}},
    {"PS", disciplina {"16", "PS", 4, 4, true, {"P1", "LP1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"PLP", disciplina {"17", "PLP", 4, 4, true, {"P1", "LP1"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"BD1", disciplina {"18", "BD1", 4, 4, true, {"EDA"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"OAC", disciplina {"19", "OAC", 4, 4, true, {"IC"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"LOAC", disciplina {"20", "LOAC", 4, 4, true, {"IC"}, {
                     turma{{horario{4, 8}, horario{6, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"EA", disciplina{"21", "EA", 4, 5, true,{"IP"}, {
                     turma{{horario {2, 10}, horario {5, 8}}},
                     }}},
    {"AS", disciplina {"22", "AS", 4, 5, true, {"P1", "LP1"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"ES", disciplina {"23", "ES", 4, 5, true, {"P1", "LP1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"RC", disciplina{"24", "RC", 4, 5, true, {"IC"}, {
                     turma{{horario {3, 8}, horario {5, 10}}},
                     turma{{horario{3, 16}, horario{5, 14}}},
                     }}},
    {"SO", disciplina {"25", "SO", 4, 5, true, {"LOAC"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     }}},
    {"TC", disciplina {"26", "TC", 4, 5, true, {"PLP"}, {
                     turma{{horario{2, 16}, horario{6, 14}}},
                     }}},
    {"MC", disciplina{"27", "MC", 4, 6, true,{}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"PC", disciplina {"28", "PC", 4, 6, true, {"SO"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     }}},
    {"IA", disciplina {"29", "IA", 4, 6, true, {"TC"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     }}},
    {"ATAL", disciplina {"30", "ATAL", 4, 7, true, {"EDA", "LEDA"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"Comp", disciplina{"31", "Comp", 4, 7, true, {"PLP"}, {
                     turma{{horario {3, 8}, horario {5, 16}}},
                     turma{{horario{3, 10}, horario{5, 8}}},
                     }}},
    {"PC1", disciplina {"32", "PC1", 4, 8, true, {"ES"}, {
                     turma{{horario{3, 18}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"PTCC", disciplina {"33", "PTCC", 4, 8, true, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}},
                     }}},
    {"PC2", disciplina{"34", "PC2", 4, 9, true, {"PC1"}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"TCC", disciplina {"25", "TCC", 4, 9, true, {"PTCC"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"VD", disciplina {"36", "VD", 4, 0, false, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"CDP", disciplina {"37", "CDP", 4, 0, false, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"VVTS", disciplina {"38", "VVTS", 4, 0, false, {"ES"}, {
                     turma{{horario{2, 16}, horario{6, 14}}}
                     }}},
    {"PDW", disciplina {"39", "PDW", 4, 0, false, {}, {
                     turma{{horario{3, 14}, horario{6, 16}}}
                     }}},
    {"PSO", disciplina{"40", "PSO", 4, 0, false, {}, {
                     turma{{horario {3, 8}, horario {5, 10}}}
                     }}},
    {"AS", disciplina {"41", "AS", 4, 0, false, {}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"ES", disciplina {"42", "ES", 4, 0, false, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}}
                     }}},
    {"AA", disciplina{"43", "AA", 4, 0, false, {"P1", "LP1"}, {
                     turma{{horario {2, 18}, horario {5, 18}}}
                     }}},
    {"ETI", disciplina {"44", "ETI", 4, 0, false, {"EA"}, {
                     turma{{horario{2, 16}, horario{4, 14}}}
                     }}},  
    {"JD", disciplina {"45", "JD", 4, 0, false, {}, {
                     turma{{horario{2, 18}, horario{4, 18}}}
                     }}},
    {"PF", disciplina{"46", "PF", 4, 0, false, {"PLP"}, {
                     turma{{horario {2, 14}, horario {4, 16}}}
                     }}},
    {"D1/2", disciplina {"47", "D1/2", 2, 0, false, {}, {
                     turma{{horario{2, 18}, horario{5, 8}}}
                     }}},
    {"GRC", disciplina {"48", "GRC", 4, 0, false, {}, {
                     turma{{horario{3, 7}, horario{6, 7}}}
                     }}},
    // optativas gerais
    {"LP", disciplina{"48", "LP", 4, 0, false, {}, {
                     turma{{horario {4, 8}, horario {6, 10}}}
                     }}},
    {"Ing", disciplina {"49", "Ing", 4, 0, false, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{2, 18}, horario{5, 10}}}
                     }}},
    {"Fut", disciplina {"50", "Fut", 2, 0, false, {}, {
                     turma{{horario{2, 18}}}
                     }}},
    {"DC", disciplina {"51", "DC", 4, 0, false, {}, {
                     turma{{horario{3, 10}, horario{6, 10}}}
                     }}}
};