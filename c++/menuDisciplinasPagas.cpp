
vector<disciplina> disciplinasPagas;

void adicionaDscPaga(string nome, vector<disciplina>& dscPagas) {
    if(temDisciplina(nome)){
        disciplina dscPaga = buscarDisciplina(nome);
        dscPagas.push_back(dscPaga);
    }
}
    

void removeDscPaga(string nome, vector<disciplina>& dscPagas) {
    int i = 0;
    vector<disciplina>::iterator it = dscPagas.begin();
    for(it; it != dscPagas.end(); it++){
        if((*it).nome == nome) {
            dscPagas.erase(disciplinasPagas.begin() + i);
            break;
        }
        i++;
    }
}

void informaDisciplinasPagas() {
    system("clear");
    
    cout << "Menu de disciplinas pagas" << endl << endl;
    string entrada = "";
    string comando = "";

    //Leitura de quais disciplinas o usuário já pagou
    cout << "Quais disciplinas voce ja pagou?       | Digite \"pronto\" quando terminar \n"; 
    cout << ">> ";
    cin >> entrada;
    transform(entrada.begin(), entrada.end(), entrada.begin(), ::toupper);

    while(entrada != "PRONTO"){
        
        if(temDisciplina(entrada)) {
            adicionaDscPaga(entrada, disciplinasPagas);
        } else{
            cout << CRED << "ERRO! " << RESTORE_COLOR  << "Disciplina não encontrada" << endl;
        }
        cout << ">> ";
        cin >> entrada;
        transform(entrada.begin(), entrada.end(), entrada.begin(), ::toupper);  
    }

    //Remove disciplinas que o usuário possa ter informado erroneamente
    while(comando != "n"){
        cout << "Deseja remover alguma disciplina que informou como paga? s/n ou visulaizar disciplinas pagas(v):\n";
        cout << ">> ";
        cin >> comando;
        if(comando == "v"){
            cout << "disciplinas pagas: " << CGREEN << endl;
            for(disciplina d: disciplinasPagas){
                cout << "         "<< d.nome << endl;
            }
            cout << RESTORE_COLOR <<  endl;
        }
        if(comando == "s") {
            cout << "Qual disciplina deseja remover? ";
            cout << ">> ";
            cin >> entrada;
            removeDscPaga(entrada, disciplinasPagas);
        }
    }

    cout << "Você pagou as seguintes disciplinas.\n\n";
    vector<disciplina>::iterator it = disciplinasPagas.begin();
    for(it; it != disciplinasPagas.end(); it++) {
        cout << (*it).toString();
        cout << "\n";
    }
}