#include <iostream>
#include "disciplinas_bd.cpp"
using namespace std;

extern map<string, disciplina> gradeCurricular;

void rodaMenu() {
    cout << "MENU" << "\n";
    cout << "1 - Montar Horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";
}

bool temDisciplina(string nomeDisciplina) {
    return gradeCurricular.count(nomeDisciplina) == 1;
}


void interarMeuHorario(vector<disciplina> disciplinas, int num, string saida){
    disciplina atual = disciplinas.at(num);
    //cout << atual.nome << endl;
    
    for(int i = 0; i < atual.turmas.size(); i++)
    {
        if (num + 1 < disciplinas.size()) {
            interarMeuHorario(disciplinas, num + 1, atual.nome + "-" + atual.turmas.at(i).toString());
        } else {
            cout << saida + atual.nome + "-" + atual.turmas.at(i).toString() << endl;
        }
        
    }

    //cout << saida << endl;
    
}

void montarHorario() {
    int qtdDisciplinas;
    vector<disciplina> meuHorario;
    //cout << gradeCurricular.at("FMCCI").nome << endl;

    meuHorario.push_back(gradeCurricular.at("P1"));
    meuHorario.push_back(gradeCurricular.at("LP1"));
    
    interarMeuHorario(meuHorario, 0, "");
    
    // cout << "Quantas disciplinas pretende pagar: ";
    // cin >> qtdDisciplinas;
    
    // string nomeDisciplina;
    // for(int i = 0; i < qtdDisciplinas; i++)
    // {
    //     cout << "Digite o nome da disciplina: ";
    //     cin >> nomeDisciplina;

    //     if (temDisciplina(nomeDisciplina)) {
    //         meuHorario.push_back(gradeCurricular.at(nomeDisciplina));
    //     } else {
    //         cout << "um erro aconteceu! Por favor, tente novamente.\n";
    //         break;
    //     }
    // }
}

int main() {
    const int MONTAR_HOR = 1;
    const int VIZUALIZAR_DISC = 2;
    const int INFORMACAO_DISC = 3;
    const int AVALIAR_DISC = 4;
    const int SAIR = 5;

    int opcao = 0;
    while(opcao != SAIR) {
        switch(opcao) {
            case(MONTAR_HOR):
                montarHorario();
            break;
            case(VIZUALIZAR_DISC):
            //idem
            break;
            case(INFORMACAO_DISC):
            //
            break;
            case(AVALIAR_DISC):
            //
            break;
            default:
            //
            break;
        }
        rodaMenu();
        cin >> opcao;
    }
}



