#include <map>
#include <string>
#include <vector>
using namespace std;

struct horario{
    int dia;
    int hora;
};

struct turma {
    vector<horario> horarios;
};

struct disciplina {
    string codigo;
    string nome;
    int creditos;
    int periodo;
    bool obrigatoria;
    vector<string> pre_requisitos;
    vector<turma> turmas;
};

map<string, disciplina> gradeCurricular = {
   {"1", disciplina {"1", "FMCCI", 4, 1, true, {}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{3, 10}, horario{6, 8}}}
                     }}},
    {"2", disciplina {"2", "P1", 4, 1, true, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"3", disciplina {"3", "LP1", 4, 1, true, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"4", disciplina {"4", "IC", 4, 1, true, {}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"5", disciplina {"5", "FMCCII", 4, 2, true, {"1"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"6", disciplina {"6", "CalculoI", 4, 2, true, {"1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"7", disciplina{"7", "P2", 4, 2, true,{"2", "3"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{4, 8}, horario{6, 10}}},
                     }}},
    {"8", disciplina {"8", "LP2", 4, 2, true, {"2", "3"}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"9", disciplina {"4", "Algebra Linear", 4, 3, true, {"5"}, {
                     turma{{horario{3, 14}, horario{5, 16}}},
                     }}},
    {"10", disciplina{"10", "Logica para computacao", 4, 3, true,{"5", "6"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     }}},
    {"11", disciplina {"11", "CalculoII", 4, 3, true, {"5", "6"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     }}},
    {"12", disciplina {"12", "EDA", 4, 3, true, {"7", "8"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"13", disciplina {"13", "LEDA", 4, 3, true, {"7", "8"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"14", disciplina{"14", "Teoria dos Grafos", 4, 3, true,{}, {
                     turma{{horario{3, 10}, horario{6, 10}}},
                     }}},
    {"15", disciplina {"15", "Introducao a probabilidade", 4, 4, true, {"5", "6"}, {
                     turma{{horario{2, 10}, horario{5, 10}}},
                     turma{{horario{2, 10}, horario{5, 10}}}
                     }}},
    {"16", disciplina {"16", "Projeto de Software", 4, 4, true, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"17", disciplina {"17", "PLP", 4, 4, true, {"2", "3"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"18", disciplina {"18", "BD1", 4, 4, true, {"12"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"19", disciplina {"19", "OAC", 4, 4, true, {"4"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"20", disciplina {"20", "LOAC", 4, 4, true, {"4"}, {
                     turma{{horario{4, 8}, horario{6, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"21", disciplina{"21", "Estatistica Aplicada", 4, 5, true,{"15"}, {
                     turma{{horario {2, 10}, horario {5, 8}}},
                     }}},
    {"22", disciplina {"22", "Analise de sistema", 4, 5, true, {"2", "3"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"23", disciplina {"23", "Engenharia de Software", 4, 5, true, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"24", disciplina{"24", "Rede de Computadores", 4, 5, true, {"4"}, {
                     turma{{horario {3, 8}, horario {5, 10}}},
                     turma{{horario{3, 16}, horario{5, 14}}},
                     }}},
    {"25", disciplina {"25", "Sistemas Operacionais", 4, 5, true, {"20"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     }}},
    {"26", disciplina {"26", "Teoria da Computacao", 4, 5, true, {"17"}, {
                     turma{{horario{2, 16}, horario{6, 14}}},
                     }}},
    {"27", disciplina{"27", "Metodologia Cientifica", 4, 6, true,{}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"28", disciplina {"28", "Progamacao Concorrente", 4, 6, true, {"25"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     }}},
    {"29", disciplina {"29", "Inteligencia Artificial", 4, 6, true, {"26"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     }}},
    {"30", disciplina {"30", "ATAL", 4, 7, true, {"12", "13"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"31", disciplina{"31", "Compiladores", 4, 7, true, {"17"}, {
                     turma{{horario {3, 8}, horario {5, 16}}},
                     turma{{horario{3, 10}, horario{5, 8}}},
                     }}},
    {"32", disciplina {"32", "Projeto em Computacao I", 4, 8, true, {"23"}, {
                     turma{{horario{3, 18}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"33", disciplina {"33", "Projeto TCC", 4, 8, true, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}},
                     }}},
    {"34", disciplina{"34", "Projeto em Computacao II", 4, 9, true, {"32"}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"35", disciplina {"25", "TCC", 4, 9, true, {"33"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}}
};

vector<disciplina> disciplinasDoPeriodo(int periodo){

    vector<disciplina> disciplinas;
    map<string, disciplina>::iterator it = gradeCurricular.begin();
    for (it; it != gradeCurricular.end(); it++){

            disciplina d = it->second;
            if(d.periodo == periodo){
                disciplinas.push_back(d);
            }
    }
    return disciplinas;
}

std::map<std::string, disciplina>::iterator i = gradeCurricular.begin();

string pesquisaDisc(char entrada[]){
    string saida = "";
    while(i != gradeCurricular.end()){
        int j = 0;
        bool add = true;
        char caracter = i->first[0];
        while(caracter != '/n'){
            if(caracter != i->first[j]){
                add = false;
                break;
            }
            j++;
            caracter = entrada[j];
        }
        if(add){
            saida += i->second.codigo + " " + i->second.nome + "/n";
        }
        i++;
    }
    if(saida == ""){
        saida = "Não foram encontradas disciplinas que corresopondam à pesquisa.";
    }
    return saida;
}
