#include <iostream>
#include "disciplinas_bd.cpp"
#include "funcoesAuxiliares.cpp"
using namespace std;

extern map<string, disciplina> gradeCurricular;

bool temDisciplina(string nomeDisciplina) {
    return gradeCurricular.count(nomeDisciplina) == 1;
}

disciplina retornaDisciplina(string nome) {
    disciplina disc;
    map<string, disciplina>::iterator it = gradeCurricular.begin();
    for(it; it != gradeCurricular.end(); it++) {
        disc = it->second;
        if(disc.nome == nome) {
            break;
        }
    }
    return disc;
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

void comentario_ou_votarAvaliacao() {
    cout << "1 - Deixar um comentário" << "\n";
    cout << "2 - Votar em uma avaliação" << "\n";
}

void menuVotarAvaliacao() {
    cout << "O que achou da disciplina?" << "\n";
    cout << "1 - rasgada" << "\n";
    cout << "2 - de boa" << "\n";
    cout << "3 - carrego" << "\n";
    cout << "4 - tenso" << "\n";
    cout << "5 - eh peso" << "\n";
}

void menuTipoAvaliacao(int opcao, string nome, disciplina disc, string conteudo) {
    switch(opcao) {
        case(1):
            cout << "Digite um comentario sobre a disciplina " << nome << "\n";
            cin.ignore();
            getline (cin, conteudo);
            disc.aval.adicionaComentario(conteudo);
            break;
        case(2):
            int num;
            menuVotarAvaliacao();
            cin >> num;
            nivel atual;
            atual = (nivel)num;
            disc.aval.votaAvaliacao(atual);
            break;
        default:
            cout << "Opção inválida." << "\n";
            break;
    }
    cout << "\n" << "Valeu e até mais :p" << "\n";
}

void menuAvaliacao() {
    string nomeDisc;
    disciplina disc;

    cout << "Qual disciplina deseja avaliar? " << "\n";
    cin >> nomeDisc;
    if(temDisciplina(nomeDisc)) {
        disc = retornaDisciplina(nomeDisc);
        int opcao;
        comentario_ou_votarAvaliacao();
        cin >> opcao;
        string conteudo;
        menuTipoAvaliacao(opcao, nomeDisc, disc, conteudo);
    } else {
        cout << "\n" << "Disciplina não existe /:" << "\n";
    }
}

int main() {
    const int MONTAR_HOR = 1;
    const int VIZUALIZAR_DISC = 2;
    const int INFORMACAO_DISC = 3;
    const int AVALIAR_DISC = 4;
    const int SAIR = 5;

    // disciplina disc = retornaDisciplina("FMCCI");
    // disc.aval.adicionaComentario("chata");
    // disc.aval.adicionaComentario("jorge é muito simpático");
    // disc.aval.votaAvaliacao(ehPeso);
    // disc.aval.votaAvaliacao(ehPeso);
    // cout << disc.periodo << "\n";
    // cout << disc.nome << "\n";
    // cout << disc.aval.comentarios[0] << "\n";
    // cout << disc.aval.comentarios[1] << "\n";
    // cout << disc.aval.avaliacao[ehPeso] << "\n";
    // cout << disc.aval.avaliacao[rasgada] << "\n";


    // meu testezinho - jady
    // preRequisitos p;
    //     p.dPagas(retornaDisciplina("P1"));
    //     p.dPagas(retornaDisciplina("LP1"));
    //     for(disciplina i : p.disciplinasPagas){ 
    //         cout<< i.toString();
    //     }
     disciplina i = retornaDisciplina("P1");
      cout<< i.toStringDetalhado();
    // cout << p.atendePreRequisitos(retornaDisciplina("LC"), p.disciplinasPagas);
    // cout << p.atendePreRequisitos(retornaDisciplina("LP2"), p.disciplinasPagas) << "\n";
    // cout << p.atendePreRequisitos(retornaDisciplina("LC"), p.disciplinasPagas);

    // cout << (pesquisaDisc("P"));

    // cout << (pesquisaDisc("N"));

    // cout << (exibirTodasAsDiscSimples());    

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
                menuAvaliacao();
                break;
            default:
            //
            break;
        }
        cout << "\n";
        rodaMenu();
        cin >> opcao;
    }
}