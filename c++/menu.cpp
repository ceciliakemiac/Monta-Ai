#include <iostream>
#include "funcoesAuxiliares.cpp"
#include "disciplinas_bd.cpp"
using namespace std;

extern map<string, disciplina> gradeCurricular;


bool temDisciplina(string nomeDisciplina) {
    return gradeCurricular.count(nomeDisciplina) == 1;
}


vector<celula> copiar_e_addCelula(vector<celula> celulas, celula nova) {
        vector<celula> copia = celulas;
        copia.push_back(nova);

        return copia;
}


void interarMeuHorario(vector<disciplina> disciplinas, int num, vector<celula> saida){
    disciplina atual = disciplinas.at(num);
    
    for(int i = 0; i < atual.turmas.size(); i++)
    {   
        celula nova = celula{ atual.nome, atual.turmas.at(i)};

        if (num + 1 < disciplinas.size()) {
            vector<celula> copia = copiar_e_addCelula(saida, nova);
            interarMeuHorario(disciplinas, num + 1, copia);
        } else {
            vector<celula> copia =  copiar_e_addCelula(saida, nova);;
            cout << "------SAIDA---" << endl;
            for(int i = 0; i < copia.size(); i++)
            {
                cout << copia.at(i).toString() << endl;
            }
            
        }
        
    }
    
}

void montarHorario() {
    int qtdDisciplinas;
    vector<disciplina> meuHorario;

    meuHorario.push_back(gradeCurricular.at("P1"));
    meuHorario.push_back(gradeCurricular.at("LP1"));
    meuHorario.push_back(gradeCurricular.at("IC"));


    vector<celula> celulas;
    interarMeuHorario(meuHorario, 0, celulas);
    
    
    // Leitura de montar horário
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



