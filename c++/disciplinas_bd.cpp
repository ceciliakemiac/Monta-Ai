#include <map>
#include <string>
#include <vector>
#include <avaliacao.h>
using namespace std;

struct horario {
    int dia;
    int hora;

    string toString() {
        return "Dia " + to_string(dia) + "- hora: " + to_string(hora); 
    }
};

struct aluno {
    int periodo;
    vector<disciplina> disciplinasCursadas;

    void adicionaDisciplina(disciplina &disc) {
        disciplinasCursadas.push_back(disc);
    }

    bool contemDisciplina(string nome) {
        bool retorno = false;
        for(auto it = disciplinasCursadas.begin(); it != disciplinasCursadas.end(); it++) {
            if(it->nome == nome) {
                retorno = true;
                break;
            }
        }
        return retorno;
    }

    disciplina retornaDisciplina(string nome) {
        disciplina disc;
        for(auto it = disciplinasCursadas.begin(); it != disciplinasCursadas.end(); ++it) {
            if(it->nome == nome) {
                disc = *it;
                break;
            }
        }
        return disc;
    }
};

struct turma {
    vector<horario> horarios;

    string toString() {
        string saida;
        
        for(int i = 0; i < horarios.size(); i++)
        {
            saida += "/ " + horarios.at(i).toString() + " /";
        }

        return saida;
        
    }
};

struct celula {
    string nomeDisciplina;
    turma turmaDisciplina;

    string toString() {
        return nomeDisciplina + " | "+ turmaDisciplina.toString();
    }
};

struct disciplina {
    string codigo;
    string nome;
    int creditos;
    int periodo;
    bool obrigatoria;
    Avaliacao avaliacao;
    vector<string> pre_requisitos;
    vector<turma> turmas;

    string toString() {

    }
};

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
    {"FMCCII", disciplina {"5", "FMCCII", 4, 2, true, {"1"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"CalculoI", disciplina {"6", "CalculoI", 4, 2, true, {"1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"P2", disciplina{"7", "P2", 4, 2, true,{"2", "3"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{4, 8}, horario{6, 10}}},
                     }}},
    {"LP2", disciplina {"8", "LP2", 4, 2, true, {"2", "3"}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"Algebra Linear", disciplina {"4", "Algebra Linear", 4, 3, true, {"5"}, {
                     turma{{horario{3, 14}, horario{5, 16}}},
                     }}},
    {"Logica para computacao", disciplina{"10", "Logica para computacao", 4, 3, true,{"5", "6"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     }}},
    {"CalculoII", disciplina {"11", "CalculoII", 4, 3, true, {"5", "6"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     }}},
    {"EDA", disciplina {"12", "EDA", 4, 3, true, {"7", "8"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"LEDA", disciplina {"13", "LEDA", 4, 3, true, {"7", "8"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"Teoria dos grafos", disciplina{"14", "Teoria dos grafos", 4, 3, true,{}, {
                     turma{{horario{3, 10}, horario{6, 10}}},
                     }}},
    {"Introducao a probabilidade", disciplina {"15", "Introducao a probabilidade", 4, 4, true, {"5", "6"}, {
                     turma{{horario{2, 10}, horario{5, 10}}},
                     turma{{horario{2, 10}, horario{5, 10}}}
                     }}},
    {"Projeto de software", disciplina {"16", "Projeto de software", 4, 4, true, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"PLP", disciplina {"17", "PLP", 4, 4, true, {"2", "3"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"BD1", disciplina {"18", "BD1", 4, 4, true, {"12"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"OAC", disciplina {"19", "OAC", 4, 4, true, {"4"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"LOAC", disciplina {"20", "LOAC", 4, 4, true, {"4"}, {
                     turma{{horario{4, 8}, horario{6, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"Estatistica aplicada", disciplina{"21", "Estatistica aplicada", 4, 5, true,{"15"}, {
                     turma{{horario {2, 10}, horario {5, 8}}},
                     }}},
    {"Analise de sistema", disciplina {"22", "Analise de sistema", 4, 5, true, {"2", "3"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"Engenharia de software", disciplina {"23", "Engenharia de software", 4, 5, true, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"Rede de computadores", disciplina{"24", "Rede de computadores", 4, 5, true, {"4"}, {
                     turma{{horario {3, 8}, horario {5, 10}}},
                     turma{{horario{3, 16}, horario{5, 14}}},
                     }}},
    {"Sistemas operacionais", disciplina {"25", "Sistemas operacionais", 4, 5, true, {"20"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     }}},
    {"Teoria da computacao", disciplina {"26", "Teoria da computacao", 4, 5, true, {"17"}, {
                     turma{{horario{2, 16}, horario{6, 14}}},
                     }}},
    {"Metodologia cientifica", disciplina{"27", "Metodologia cientifica", 4, 6, true,{}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"Programacao concorrente", disciplina {"28", "Progamacao concorrente", 4, 6, true, {"25"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     }}},
    {"Inteligencia artificial", disciplina {"29", "Inteligencia artificial", 4, 6, true, {"26"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     }}},
    {"ATAL", disciplina {"30", "ATAL", 4, 7, true, {"12", "13"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"Compiladores", disciplina{"31", "Compiladores", 4, 7, true, {"17"}, {
                     turma{{horario {3, 8}, horario {5, 16}}},
                     turma{{horario{3, 10}, horario{5, 8}}},
                     }}},
    {"Projeto em computacao I", disciplina {"32", "Projeto em computacao I", 4, 8, true, {"23"}, {
                     turma{{horario{3, 18}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"Projeto TCC", disciplina {"33", "Projeto TCC", 4, 8, true, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}},
                     }}},
    {"Projeto em computacao II", disciplina{"34", "Projeto em computacao II", 4, 9, true, {"32"}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"TCC", disciplina {"25", "TCC", 4, 9, true, {"33"}, {
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
        while(caracter != '/'){ // TODO: plese ajeite
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

vector<string> disciplinasPagas(string codigo){
    vector<string> disciplinasPagas;
    disciplinasPagas.push_back(codigo);
    return disciplinasPagas;
}
