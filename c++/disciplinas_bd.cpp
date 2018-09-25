#include <map>
#include <string>
#include <vector>
using namespace std;

struct horario{
    int dia;
    int hora;

    string toString() {
        return "Dia " + to_string(dia) + "- hora: " + to_string(hora); 
    }
};

struct turma {
    vector<horario> horarios;

    string toString() {
        string saida;
        
        for(int i = 0; i < horarios.size(); i++)
        {
            saida += "| " + horarios.at(i).toString() + " |";
        }

        return saida;
        
    }
};

struct celula {
    string nomeDisciplina;
    turma turmaDisciplina;

    string toString() {
        return nomeDisciplina + " | "+ turmaDisciplina.toString();
    }
};


struct quadro {
    vector<celula> celulas;
};

enum nivel {
    rasgada,
    deBoa,
    carrego,
    tenso,
    peso
};

map<nivel, string> stringAvaliacao = {
    {rasgada, "rasgada"},
    {deBoa, "deBoa"},
    {carrego, "carrego"},
    {tenso, "tenso"},
    {peso, "peso"}
};

struct avaliacao {
    vector<string> comentarios;
    map<nivel, int> avaliacao;

    void adicionaComentario(string comentario) {
        comentarios.push_back(comentario);
    }

    void votaAvaliacao(nivel a) {
        avaliacao[a] += 1;
    }

    nivel maiorVotacao() {
        nivel niv = rasgada;
        int maior = 0;
        int atual;
        map<nivel, int>::iterator it = avaliacao.begin();
        for(it; it != avaliacao.end(); it++) {
            atual = it->second;
            if(atual > maior) {
                maior = atual;
                niv = it->first;
            }
        }
        return niv;
    }

    string toStringComentarios() {
        string saida = "Comentários:\n";
        int pos = 1;
        for(string comentario : comentarios) {
            saida += to_string(pos) + " - " + comentario + "\n";
            pos++;
        }
        return saida;
    }

    string toStringAvaliacao() {
        string saida = "";
        saida += "Essa disciplina eh ";
        nivel niv = maiorVotacao();
        saida += stringAvaliacao[niv];
        return saida;   
    }
};

struct disciplina {
    string codigo;
    string nome;
    int creditos;
    int periodo;
    bool obrigatoria;
    vector<string> pre_requisitos;
    vector<turma> turmas;
    avaliacao aval;

    string toString() {
        return "Disciplina: " + nome + " - Creditos: " + to_string(creditos) + " - Codigo: " + codigo;
    }

    string toStringDetalhado() {
        string saida = "Codigo: "  + codigo + "\nCreditos: " + to_string(creditos) + "\nPeriodo: " + to_string(periodo) + "\n";
        if(obrigatoria){
            saida += "Status: Obrigatoria \n"; 
        } else {
            saida += "Status: Optativa \n";
        }
        saida += "Pre-requisitos: ";
        for (string p : pre_requisitos){
            saida += p + " | ";
        }
        saida += "\nTurmas: ";
        int i = 1;
        for (turma t : turmas){
            saida += "\n------ " + to_string(i) + " " + t.toString();
            i++;
        }
        saida += "\n";
    saida += aval.toStringComentarios();
        saida += "- " + aval.toStringAvaliacao() + " >:(";
        return saida + "\n";
    }
};

struct preRequisitos {
    vector<disciplina> disciplinasPagas;

    void dPagas(disciplina d){
        disciplinasPagas.push_back(d);
    }

    int atendePreRequisitos(disciplina d, vector<disciplina> disciplinasPagas){
        int atendePreRequisitos = 1;
        int pagou;
        for(string preRequisitos: d.pre_requisitos){
           pagou = 0;
            for(disciplina dPaga : disciplinasPagas){
                if(dPaga.codigo == preRequisitos){
                    pagou = 1;
                    break;
                }
            }
            if(!pagou){
                atendePreRequisitos = 0;
                break;
            }
        }
        return atendePreRequisitos;
    }
};

map<string, disciplina> gradeCurricular = {
    {"FMCCI", disciplina {"1", "FMCC1", 4, 1, true, {}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{3, 10}, horario{6, 8}}}
                     }}},
    {"P1", disciplina {"2", "P1", 4, 1, true, {}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"LP1", disciplina {"3", "LP1", 4, 1, true, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"IC", disciplina {"4", "IC", 4, 1, true, {}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"FMCCII", disciplina {"5", "FMCC2", 4, 2, true, {"FMCC1"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"C1", disciplina {"6", "C1", 4, 2, true, {"FMCC1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"P2", disciplina{"7", "P2", 4, 2, true,{"P1", "LP1"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     turma{{horario{4, 8}, horario{6, 10}}},
                     }}},
    {"LP2", disciplina {"8", "LP2", 4, 2, true, {"P1", "LP1"}, {
                     turma{{horario{3, 8}, horario{5, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"AL", disciplina {"9", "AL", 4, 3, true, {"FMCC2"}, {
                     turma{{horario{3, 14}, horario{5, 16}}},
                     }}},
    {"LC", disciplina{"10", "LC", 4, 3, true,{"FMCC2", "C1"}, {
                     turma{{horario {4, 8}, horario {6, 10}}},
                     }}},
    {"C2", disciplina {"11", "C2", 4, 3, true, {"FMCC2", "C1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     }}},
    {"EDA", disciplina {"12", "EDA", 4, 3, true, {"P2", "LP2"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 8}, horario{5, 10}}}
                     }}},
    {"LEDA", disciplina {"13", "LEDA", 4, 3, true, {"P2", "LP2"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     turma{{horario{2, 16}, horario{5, 14}}}
                     }}},
    {"TG", disciplina{"14", "TG", 4, 3, true,{}, {
                     turma{{horario{3, 10}, horario{6, 10}}},
                     }}},
    {"IP", disciplina {"15", "IP", 4, 4, true, {"FMCC2", "C1"}, {
                     turma{{horario{2, 10}, horario{5, 10}}},
                     turma{{horario{2, 10}, horario{5, 10}}}
                     }}},
    {"PS", disciplina {"16", "PS", 4, 4, true, {"P1", "LP1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}},
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"PLP", disciplina {"17", "PLP", 4, 4, true, {"P1", "LP1"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     turma{{horario{3, 16}, horario{6, 14}}}
                     }}},
    {"BD1", disciplina {"18", "BD1", 4, 4, true, {"EDA"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"OAC", disciplina {"19", "OAC", 4, 4, true, {"IC"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     turma{{horario{4, 8}, horario{6, 10}}}
                     }}},
    {"LOAC", disciplina {"20", "LOAC", 4, 4, true, {"IC"}, {
                     turma{{horario{4, 8}, horario{6, 10}}},
                     turma{{horario{3, 14}, horario{5, 16}}}
                     }}},
    {"EA", disciplina{"21", "EA", 4, 5, true,{"IP"}, {
                     turma{{horario {2, 10}, horario {5, 8}}},
                     }}},
    {"AS", disciplina {"22", "AS", 4, 5, true, {"P1", "LP1"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"ES", disciplina {"23", "ES", 4, 5, true, {"P1", "LP1"}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"RC", disciplina{"24", "RC", 4, 5, true, {"IC"}, {
                     turma{{horario {3, 8}, horario {5, 10}}},
                     turma{{horario{3, 16}, horario{5, 14}}},
                     }}},
    {"SO", disciplina {"25", "SO", 4, 5, true, {"LOAC"}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     }}},
    {"TC", disciplina {"26", "TC", 4, 5, true, {"PLP"}, {
                     turma{{horario{2, 16}, horario{6, 14}}},
                     }}},
    {"MC", disciplina{"27", "MC", 4, 6, true,{}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"PC", disciplina {"28", "PC", 4, 6, true, {"SO"}, {
                     turma{{horario{2, 16}, horario{5, 14}}},
                     }}},
    {"IA", disciplina {"29", "IA", 4, 6, true, {"TC"}, {
                     turma{{horario{3, 16}, horario{6, 14}}},
                     }}},
    {"ATAL", disciplina {"30", "ATAL", 4, 7, true, {"EDA", "LEDA"}, {
                     turma{{horario{3, 10}, horario{6, 8}}},
                     }}},
    {"Comp", disciplina{"31", "Comp", 4, 7, true, {"PLP"}, {
                     turma{{horario {3, 8}, horario {5, 16}}},
                     turma{{horario{3, 10}, horario{5, 8}}},
                     }}},
    {"PC1", disciplina {"32", "PC1", 4, 8, true, {"ES"}, {
                     turma{{horario{3, 18}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"PTCC", disciplina {"33", "PTCC", 4, 8, true, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}},
                     }}},
    {"PC2", disciplina{"34", "PC2", 4, 9, true, {"PC1"}, {
                     turma{{horario {3, 14}, horario {5, 16}}},
                     }}},
    {"TCC", disciplina {"25", "TCC", 4, 9, true, {"PTCC"}, {
                     turma{{horario{2, 10}, horario{5, 8}}},
                     turma{{horario{3, 10}, horario{5, 10}}}
                     }}},
    {"VD", disciplina {"36", "VD", 4, 0, false, {}, {
                     turma{{horario{2, 10}, horario{5, 8}}}
                     }}},
    {"CDP", disciplina {"37", "CDP", 4, 0, false, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}}
                     }}},
    {"VVTS", disciplina {"38", "VVTS", 4, 1, true, {"ES"}, {
                     turma{{horario{2, 16}, horario{6, 14}}}
                     }}},
    {"PDW", disciplina {"39", "PDW", 4, 0, false, {}, {
                     turma{{horario{3, 14}, horario{6, 16}}}
                     }}},
    {"PSO", disciplina{"40", "PSO", 4, 0, false, {}, {
                     turma{{horario {3, 8}, horario {5, 10}}}
                     }}},
    {"AS", disciplina {"41", "AS", 4, 0, false, {}, {
                     turma{{horario{2, 14}, horario{4, 16}}}
                     }}},
    {"ES", disciplina {"42", "ES", 4, 0, false, {}, {
                     turma{{horario{3, 14}, horario{5, 8}}}
                     }}},
    {"AA", disciplina{"43", "AA", 4, 0, false, {"P1", "LP1"}, {
                     turma{{horario {2, 18}, horario {5, 18}}}
                     }}},
    {"ETI", disciplina {"44", "ETI", 4, 0, false, {"EA"}, {
                     turma{{horario{2, 16}, horario{4, 14}}}
                     }}},  
    {"JD", disciplina {"45", "JD", 4, 0, false, {}, {
                     turma{{horario{2, 18}, horario{4, 18}}}
                     }}},
    {"PF", disciplina{"46", "PF", 4, 0, false, {"PLP"}, {
                     turma{{horario {2, 14}, horario {4, 16}}}
                     }}},
    {"D1/2", disciplina {"47", "D1/2", 2, 0, false, {}, {
                     turma{{horario{2, 18}, horario{5, 8}}}
                     }}},
    {"GRC", disciplina {"48", "GRC", 4, 0, false, {}, {
                     turma{{horario{3, 7}, horario{6, 7}}}
                     }}},
    // optativas gerais
    {"LP", disciplina{"48", "LP", 4, 0, false, {}, {
                     turma{{horario {4, 8}, horario {6, 10}}}
                     }}},
    {"Ing", disciplina {"49", "Ing", 4, 0, false, {}, {
                     turma{{horario{2, 8}, horario{4, 10}}},
                     turma{{horario{2, 18}, horario{5, 10}}}
                     }}},
    {"Fut", disciplina {"50", "Fut", 2, 0, false, {}, {
                     turma{{horario{2, 18}}}
                     }}},
    {"DC", disciplina {"51", "DC", 4, 0, false, {}, {
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

string pesquisaDisc(string entrada){
    std::map<std::string, disciplina>::iterator i = gradeCurricular.begin();
    string saida = "";
    while(i != gradeCurricular.end()){
        int j = 0;
        bool add = true;
        while(entrada[j] != '\0'){
            if(entrada[j] != i->first[j]){
                add = false;
                break;
            }
            j++;
        }
        if(add){
            saida += i->second.toString() + "\n";
        }
        i++;
    }
    if(saida == ""){
        saida = "Não foram encontradas disciplinas que corresopondam à pesquisa.";
    }
    return saida + '\n';
}

string exibirTodasAsDiscSimples(){
    std::map<std::string, disciplina>::iterator i = gradeCurricular.begin();
    string saida = "";
    while(i != gradeCurricular.end()){
        saida += i->second.toString() + '\n';
        i++;
    }
    return saida + '\n';
}

string exibirDiscDetalh(string entrada){
    std::map<std::string, disciplina>::iterator i = gradeCurricular.begin();
    string saida = "";
    while(i != gradeCurricular.end()){
        if(entrada == i->second.nome){
            saida = i->second.toStringDetalhado();
        }
        i++;
    }
    if(saida == ""){
        saida = "Não foram encontradas disciplinas que corresopondam à pesquisa.";
    }
    return saida;
}








