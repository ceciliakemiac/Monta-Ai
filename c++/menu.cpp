#include <iostream>
#include "disciplinas_bd.cpp"
using namespace std;

void rodaMenu() {
    cout << "MENU" << "\n";
    cout << "1 - Montar Horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";
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
            //função ou qlq coisa q a gente fizer q seja relacionado a isso
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