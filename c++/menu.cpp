#include <iostream>
<<<<<<< HEAD
#include <avaliacao.h>
=======
#include "disciplinas_bd.cpp"
>>>>>>> 0a58ff3e461541166ed48a979d14220d5bc5e26e
using namespace std;

extern map<string, disciplina> gradeCurricular;

void rodaMenu() {
    cout << "MENU" << "\n";
    cout << "1 - Montar Horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";


    //cout << gradeCurricular.at("FMCCI").nome << endl;
}

void menuAvaliacao() {
    cout << "1 - Deixar um comentário" << "\n";
    cout << "2 - Deixar uma avaliação segundo classificação" << "\n";
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
            // cout << pesquisaDisc("FMCCI");  // removi por causar erros de compilação
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
