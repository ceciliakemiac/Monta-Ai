#include <iostream>
#include <algorithm> 
#include "disciplinas_bd.cpp"
#include "funcoesAuxiliares.cpp"
using namespace std;

extern map<string, disciplina> gradeCurricular;
vector<quadro> quadrosPossiveis;


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

void escolherHorarios() {
    bool parar = false;
    cout << "Existem " << quadrosPossiveis.size() << ".\n";
    string turma;
    cin.ignore();
    while(!parar) {
        
        cout << "Digite um nome de uma turma que você deseja pagar?\n";
        std::getline(std::cin, turma);
        for(int i = quadrosPossiveis.size() - 1; i >= 0; i--)
        {
            bool achou = false;
            int j = quadrosPossiveis.at(i).celulas.size() - 1;

            while(!achou && j >= 0) {
                string nomeCelula = quadrosPossiveis.at(i).celulas.at(j).nomeDisciplina;
                if (quadrosPossiveis.at(i).celulas.at(j).nomeDisciplina == turma) {
                    achou = true;
                }
                // cout << "show";
                j -= 1;
            }

            if (!achou) {
                quadrosPossiveis.erase(quadrosPossiveis.begin() + i);
            }
            
        }

        turma = "";
        cout << "Existem " << quadrosPossiveis.size() << ".\n";
        if (quadrosPossiveis.size() < 4) {
            parar = true;
        }
    }

    for(int i = 0; i < quadrosPossiveis.size(); i++)
    {
        printQuadro(quadrosPossiveis.at(i));
    }
    
   
}

void interarMeuHorario(vector<disciplina> disciplinas, int num, vector<celula> saida){
    disciplina atual = disciplinas.at(num);
    
    for(int i = 0; i < atual.turmas.size(); i++)
    {   

        celula nova = celula{ atual.nome + " - " + to_string(i + 1), atual.turmas.at(i)};

        if (num + 1 < disciplinas.size()) {
            vector<celula> copia = copiar_e_addCelula(saida, nova);
            interarMeuHorario(disciplinas, num + 1, copia);
        } else {
            vector<celula> copia =  copiar_e_addCelula(saida, nova);
            quadro novo = { copia };
            cout << "-------------------------------------------------------------------" << endl;
            printQuadro(novo);
            cout << "-----------------------------END------------------------------------" << endl;
            quadrosPossiveis.push_back(novo);
        }
        
    }
}


bool disciplinasAtendemRequisitos(vector<disciplina> disciplinas) {
    // TODO: adicionar disciplinas pagas
    vector<disciplina> disciplinasPagas;
    preRequisitos requisitos;
    bool pararAnalise = false;
    int i = 0;
    while(i < disciplinas.size() && !pararAnalise) {
        disciplina d = disciplinas.at(i);

        if (!requisitos.atendePreRequisitos(d, disciplinasPagas) == 1) {
            cout << "Você não atente os requisitos da disciplna " << d.nome << ".\n";
            pararAnalise = true;
        }

        i += 1;
    }
    return !pararAnalise;
}

void montarHorario() {
    quadrosPossiveis.clear();

    int qtdDisciplinas;
    bool pararExecucao = false; 
    vector<disciplina> meuHorario;

    vector<celula> celulas;    

    //Leitura de montar horário
    cout << "Quantas disciplinas pretende pagar: ";
    cin >> qtdDisciplinas;
    
    string nomeDisciplina;
    for(int i = 0; i < qtdDisciplinas; i++)
    {
        cout << "Digite o nome da disciplina: ";
        cin >> nomeDisciplina;
        transform(nomeDisciplina.begin(), nomeDisciplina.end(), nomeDisciplina.begin(), ::toupper);
        if (temDisciplina(nomeDisciplina)) {
            meuHorario.push_back(gradeCurricular.at(nomeDisciplina));
        } else {
            cout << "um erro aconteceu! Por favor, tente novamente.\n";
            pararExecucao = true;
            break;
        }
    }

    if (!pararExecucao) {
        if (disciplinasAtendemRequisitos(meuHorario)) {
            vector<celula> celulas;
            interarMeuHorario(meuHorario, 0, celulas);
            escolherHorarios();
        }
    }
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
    
    int opcao = 0;
    while(opcao != SAIR) {
        switch(opcao) {
            case(MONTAR_HOR):
                montarHorario();
                break;
            case(VIZUALIZAR_DISC):
                visualizarTodasDisc();
            break;
            case(INFORMACAO_DISC):
                visualizarDisciplinaDet();
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