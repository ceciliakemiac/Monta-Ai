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
    {"1", disciplina {"1", "P1", 4, 1, true, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"2", disciplina{"2", "P2", 4, 2, true,{"1"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{2, 10}, horario{5, 8}}},
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
