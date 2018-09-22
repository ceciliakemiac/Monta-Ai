#include <map>
#include <string>
#include <vector>
#include <avaliacao.h>
using namespace std;

struct horario {
    int dia;
    int hora;
};

struct aluno {
    int periodo;
    vector<disciplina> disciplinasCursadas;

    void adicionaDisciplinas(disciplina &disc) {
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