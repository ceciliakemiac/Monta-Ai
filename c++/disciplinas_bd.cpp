#include <map>
#include <string>
#include <vector>
#include "avaliacao.cpp"
using namespace std;

struct horario {
    int dia;
    int hora;

    string toString() {
        
    }
};

struct aluno {
    int periodo;
    vector<disciplina> disciplinasCursadas;

    void adicionaDisciplina(disciplina &disc) {
        disciplinasCursadas.push_back(disc);
    }

    // bool contemDisciplina(string nome) {
    //     bool retorno = false;
    //     for(auto it = disciplinasCursadas.begin(); it != disciplinasCursadas.end(); it++) {
    //         if(it->nome == nome) {
    //             retorno = true;
    //             break;
    //         }
    //     }
    //     return retorno;
    // }

    // disciplina retornaDisciplina(string nome) {
    //     disciplina disc;
    //     for(auto it = disciplinasCursadas.begin(); it != disciplinasCursadas.end(); ++it) {
    //         if(it->nome == nome) {
    //             disc = *it;
    //             break;
    //         }
    //     }
    //     return disc;
    // }
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
   {"FMCCI", disciplina {"1", "FMCCI", 4, 1, true, {{"Top"}, {0, 4}},
                    {}, {turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{3, 10}, horario{6, 8}}}
                     }}},
    {"P1", disciplina {"2", "P1", 4, 1, true, {{"Bom ate o for forever"}, {1, 4}},{}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"LP1", disciplina {"3", "LP1", 4, 1, true, {{"Nada de for com break"}, {1, 4}},{}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"IC", disciplina {"4", "IC", 4, 1, true, {{"Top - et"}, {0, 3}},{}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"FMCCII", disciplina {"5", "FMCCII", 4, 2, true, {{"Tem gente que chora"}, {1, 3}},{"1"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"CalculoI", disciplina {"6", "CalculoI", 4, 2, true, {{"Deus na guia"}, {3, 3}}, {"1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"P2", disciplina{"7", "P2", 4, 2, true, {{"Bom demais, jr"}, {0, 5}},{"2", "3"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"LP2", disciplina {"8", "LP2", 4, 2, true,{{"Topissima"}, {0, 5}},{"2", "3"}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"Algebra Linear", disciplina {"9", "Algebra Linear", 4, 3, true, 
                     {{"Xoooo"}, {2, 4}}, {"5"}, {
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"Logica para computacao", disciplina{"10", "Logica para computacao", 4, 3, true, 
                     {{"Alloy"}, {1, 5}},{"5", "6"}, {
                     turma{{horario {4, 8}, horario {6, 10}}}
                     }}},
    {"CalculoII", disciplina {"11", "CalculoII", 4, 3, true, {{"Deus eh amor"}, {3, 3}}, {"5", "6"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"EDA", disciplina {"12", "EDA", 4, 3, true, {{"Eita..."}, {3, 3}}, {"7", "8"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"LEDA", disciplina {"13", "LEDA", 4, 3, true, {{"... atras de eita"}, {0, 5}},{"7", "8"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"Teoria dos grafos", disciplina{"14", "Teoria dos grafos", 4, 3, true, {{"Aumenta cra"}, {0, 5}}, {}, {
                     turma{{horario{3, 10}, horario{6, 10}}}
                     }}},
    {"Introducao a probabilidade", disciplina {"15", "Introducao a probabilidade", 4, 4, true, 
                     {{"É tranquilo, mas da trabalho"}, {2, 4}}, {"5", "6"}, {
                     turma{{horario{2, 10}, horario{5, 10}}},
                     turma{{horario{2, 10}, horario{5, 10}}}
                     }}},
    {"Projeto de software", disciplina {"16", "Projeto de software", 4, 4, true, {{"Eita..."}, {3, 3}}, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"PLP", disciplina {"17", "PLP", 4, 4, true, {{"Da trabalho, viu!"}, {3, 4}}, {"2", "3"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"BD1", disciplina {"18", "BD1", 4, 4, true, {{"eh bom, mas precisa de dedicacao"}, {2, 5}}, {"12"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"OAC", disciplina {"19", "OAC", 4, 4, true, {{"Te mt atividade"}, {2, 5}}, {"4"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"LOAC", disciplina {"20", "LOAC", 4, 4, true, {{"EH PESO!"}, {4, 4}}, {"4"}, {
                     turma{{horario{4, 8}, horario{6, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"Estatistica aplicada", disciplina{"21", "Estatistica aplicada", 4, 5, true,
                     {{"Eh chato"}, {3, 3}}, {"15"}, {
                     turma{{horario {2, 10}, horario {5, 8}}},
                     }}},
    {"Analise de sistema", disciplina {"22", "Analise de sistema", 4, 5, true,
                     {{"Eita..."}, {3, 3}}, {"2", "3"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"Engenharia de software", disciplina {"23", "Engenharia de software", 4, 5, true,
                     {{"Bacana..."}, {3, 5}}, {"2", "3"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"Rede de computadores", disciplina{"24", "Rede de computadores", 4, 5, true,
                     {{"Top"}, {3, 5}}, {"4"}, {
                     turma{{horario {3, 8}, horario {5, 10}}},
                     turma{{horario{3, 16}, horario{5, 14}}}
                     }}},
    {"Sistemas operacionais", disciplina {"25", "Sistemas operacionais", 4, 5, true, 
                     {{"Bacaninha"}, {3, 4}}, {"20"}, {
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"Teoria da computacao", disciplina {"26", "Teoria da computacao", 4, 5, true,
                     {{"Show"}, {2, 4}}, {"17"}, {
                     turma{{horario{2, 16}, horario{6, 14}}}
                     }}},
    {"Metodologia cientifica", disciplina{"27", "Metodologia cientifica", 4, 6, true,
                     {{"Rasgado"}, {0, 5}}, {}, {
                     turma{{horario {3, 14}, horario {5, 16}}}
                     }}},
    {"Programacao concorrente", disciplina {"28", "Progamacao concorrente", 4, 6, true,
                    {{"Eita..."}, {3, 3}}, {"25"}, {
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"Inteligencia artificial", disciplina {"29", "Inteligencia artificial", 4, 6, true,
                    {{"Eita..."}, {3, 5}}, {"26"}, {
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"ATAL", disciplina {"30", "ATAL", 4, 7, true, {{"Precisa de Deus!"}, {4, 4}}, {"12", "13"}, {
                     turma{{horario{3, 10}, horario{6, 8}}}
                     }}},
    {"Compiladores", disciplina{"31", "Compiladores", 4, 7, true, {{"Fé no pai"}, {4, 4}}, {"17"}, {
                     turma{{horario {3, 8}, horario {5, 16}}},
                     turma{{horario{3, 10}, horario{5, 8}}}
                     }}},
    {"Projeto em computacao I", disciplina {"32", "Projeto em computacao I", 4, 8, true, 
                     {{"Nao sou capaz de opinar"}, {2, 3}}, {"23"}, {
                     turma{{horario{3, 18}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"Projeto TCC", disciplina {"33", "Projeto TCC", 4, 8, true, {{"Um sonho"}, {2, 3}}, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}}
                     }}},
    {"Projeto em computacao II", disciplina{"34", "Projeto em computacao II", 4, 9, true,
                    {{"Continuacao do sonho"}, {2, 3}}, {"32"}, {
                     turma{{horario {3, 14}, horario {5, 16}}}
                     }}},
    {"TCC", disciplina {"35", "TCC", 4, 9, true, {{"Realizando o sonho e sofrendo"}, {3, 3}}, {"33"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
        // optativas especificas 
    {"Visualizacao de dados", disciplina {"36", "Visualizacao de dados", 4, 0, false, 
                     {{"Eh boa"}, {3, 4}}, {"15"}, {
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"Ciencia de dados preditiva", disciplina {"37", "Ciencia de dados preditiva", 4, 0, false,
                    {{"Nao sou capaz de opinar"}, {3, 3}}, {"21"}, {
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"VVTS", disciplina {"38", "VVTS", 4, 1, true, {{"Legal"}, {3, 3}}, {"23"}, {
                     turma{{horario{2, 16}, horario{6, 14}}}
                     }}},
    {"Principios de des web", disciplina {"39", "Principios de des web", 4, 0, false, 
                     {{"Eh boa"}, {3, 4}}, {"16"}, {
                     turma{{horario{3, 14}, horario{6, 16}}}
                     }}},
    {"Projeto de SO", disciplina{"40", "Projeto de SO", 4, 0, false, 
                     {{"Bacana"}, {3, 3}}, {"19", "20"}, {
                     turma{{horario {3, 8}, horario {5, 10}}}
                     }}},
    {"Administracao de sistemas", disciplina {"41", "Administracao de sistemas", 4, 0, false, 
                     {{"Eh bacana"}, {2, 3}}, {"7"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"Empreendorismo em software", disciplina {"42", "Empreendorismo em software", 4, 0, false, 
                     {{"Bacanerrimo"}, {2, 4}}, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}}
                     }}},
    {"Algoritmos avancados", disciplina{"43", "Algoritmos avancados", 4, 0, false, 
                     {{"Para quem quer participar de Olimpiadas"}, {3, 5}}, {"2", "3"}, {
                     turma{{horario {2, 18}, horario {5, 18}}}
                     }}},
    {"Economia de tec da informacao", disciplina {"44", "Economia de tec da informacao", 4, 0, false, 
                     {{"Show, papai"}, {2, 5}}, {"21"}, {
                     turma{{horario{2, 16}, horario{4, 14}}}
                     }}},  
    {"Jogos digitais", disciplina {"45", "Jogos digitais", 4, 0, false, 
                     {{"Ultima opcao"}, {2, 2}}, {}, {
                     turma{{horario{2, 18}, horario{4, 18}}}
                     }}},
    {"Programacao funcional", disciplina{"46", "Programacao funcional", 4, 0, false, 
                     {{"Eita..."}, {3, 3}}, {"17"}, {
                     turma{{horario {2, 14}, horario {4, 16}}}
                     }}},
    {"Didatica", disciplina {"47", "Didatica", 2, 0, false, 
                     {{"Topissimo"}, {1, 5}}, {}, {
                     turma{{horario{2, 18}, horario{5, 8}}}
                     }}},
    {"Gerencia de redes de computadores", disciplina {"48", "Gerencia de redes de computadores", 4, 0, false,
                     {{"Bacana demais"}, {3, 5}}, {}, {
                     turma{{horario{3, 7}, horario{6, 7}}}
                     }}},
    // optativas gerais
    {"Lingua portuguesa", disciplina{"48", "Lingua portuguesa", 4, 0, false, 
                     {{"Bom"}, {1, 4}}, {}, {
                     turma{{horario {4, 8}, horario {6, 10}}}
                     }}},
    {"Ingles", disciplina {"49", "Ingles", 4, 0, false, {{"Bom"}, {1, 4}}, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{2, 18}, horario{5, 10}}}
                     }}},
    {"Futsal", disciplina {"50", "Futsal", 2, 0, false, {{"Coloca com LOAC"}, {0, 5}}, {}, {
                     turma{{horario{2, 18}}}
                     }}},
    {"Direito e cidadania", disciplina {"51", "Direito e cidadania", 4, 0, false, 
                     {{"Melhor disciplina"}, {0, 5}}, {}, {
                     turma{{horario{3, 10}, horario{6, 10}}}
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
