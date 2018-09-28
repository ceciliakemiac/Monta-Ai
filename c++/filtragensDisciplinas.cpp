
vector<disciplina> todasDisciplinas(){

    vector<disciplina> disciplinas;
    map<string, disciplina>::iterator it = gradeCurricular.begin();
    for (it; it != gradeCurricular.end(); it++){

            disciplina d = it->second;
            disciplinas.push_back(d);
           
    }
    return disciplinas;
}

vector<disciplina> disciplinasObrigatorias(){

    vector<disciplina> disciplinas;
    map<string, disciplina>::iterator it = gradeCurricular.begin();
    for (it; it != gradeCurricular.end(); it++){

            disciplina d = it->second;
            if(d.obrigatoria){
                disciplinas.push_back(d);
            }
           
    }
    return disciplinas;
}

vector<disciplina> disciplinasOptativas(){

    vector<disciplina> disciplinas;
    map<string, disciplina>::iterator it = gradeCurricular.begin();
    for (it; it != gradeCurricular.end(); it++){

            disciplina d = it->second;
            if(!d.obrigatoria){
                disciplinas.push_back(d);
            }
           
    }
    return disciplinas;
}

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


bool temDisciplina(string nomeDisciplina) {
    return gradeCurricular.count(nomeDisciplina) > 0;
}

disciplina buscarDisciplina(string nomeDisciplina){
    disciplina encontrada;
    if (temDisciplina(nomeDisciplina)) {
        encontrada = gradeCurricular[nomeDisciplina];
    }
    return encontrada;
}