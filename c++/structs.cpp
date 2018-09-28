
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


enum nivel {
    rasgada,
    deBoa,
    carrego,
    tenso,
    peso
};

map<nivel, string> stringAvaliacao {
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

struct celula {
    disciplina disc;
    int turma;

    string toString() {
        return disc.nome + " | "+ disc.turmas.at(turma  - 1).toString();
    }
};


struct quadro {
    vector<celula> celulas;
};

