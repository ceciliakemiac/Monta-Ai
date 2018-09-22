#include <iostream>
#include <avaliacao.h>
#include "disciplinas_bd.cpp"
#include <validacoes.h>
using namespace std;

extern map<string, disciplina> gradeCurricular;
Aluno alunoLogado;

void menuPrincipal() {
    cout << "MENU" << "\n";
    cout << "1 - Montar Horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";

    //cout << gradeCurricular.at("FMCCI").nome << endl;
}

void menuAvaliacao() {
    string nomeDisciplina;
    cout << "Qual disciplina deseja avaliar?" << "\n";
    cin >> nomeDisciplina;
    if(alunoLogado.contemDisciplina(nomeDisciplina)) {
        int tipo;
        disciplina disc = alunoLogado.retornaDisciplina(nomeDisciplina);
        menuTipoAvaliacao();
        cin >> tipo;
        switch(tipo) {
            case(1):
                string conteudo;
                cout << "Digite um comentário sobre a disciplina: " << "\n";
                cin >> conteudo;
                disc.avaliacao.adicionaComentario(conteudo);
                break;
            case(2):
                Nivel nivel;
                menuNivel();
                cin >> nivel;
                if(validaNivel(nivel)) {
                    disc.avaliacao.adicionaAvaliacao(nivel);
                }else {
                    cout << "Opção inválida" << "\n";
                }
                break;
            default: 
                cout << "Opção inválida" << "\n";
                break;
        }
    }else {
        cout << "Você ainda não cursou essa disciplina."
    }
}

void menuNivel() {
    cout << "O que achou da disciplina?" << "\n";
    cout << "1 - rasgada" << "\n";
    cout << "2 - de boa" << "\n";
    cout << "3 - carrego" << "\n";
    cout << "4 - tenso" << "\n";
    cout << "5 - eh peso" << "\n";
}

void menuTipoAvaliacao() {
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
                menuAvaliacao();
                break;
            default:
            //
            break;
        }
        rodaMenu();
        cin >> opcao;
    }
}
