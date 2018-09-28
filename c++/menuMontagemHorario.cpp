vector<quadro> quadrosPossiveis;
quadro quadrofinal;
vector<disciplina> meuHorario;

vector<celula> copiar_e_addCelula(vector<celula> celulas, celula nova) {
        vector<celula> copia = celulas;
        copia.push_back(nova);

        return copia;
}

void interarMeuHorario(vector<disciplina> disciplinas, int num, vector<celula> saida){
    disciplina atual = disciplinas.at(num);
    
    for(int i = 0; i < atual.turmas.size(); i++)
    {   
        celula nova = celula{ atual, i + 1};
        if (num + 1 < disciplinas.size()) {
        	if(validaChoques(nova.disc.turmas.at(i), saida) == 0){
        		vector<celula> copia = copiar_e_addCelula(saida, nova);
        		interarMeuHorario(disciplinas, num + 1, copia);
        	}  else {
        		interarMeuHorario(disciplinas, num + 1, saida);
        	}
            

        } else {
        	if(validaChoques(nova.disc.turmas.at(i), saida) == 0){
        		vector<celula> copia = copiar_e_addCelula(saida, nova);
        		quadrosPossiveis.push_back({copia});
        	} else{
        		quadrosPossiveis.push_back({saida});
        	}
                
        }
        
    }
    
}

void adicionarDisciplinas(){
	cout << "\nAdicionar disciplina que pretende pagar  | digite \"pronto\" quando acabar\n\n";
    
    string nomeDisciplina = "";
    
    while(nomeDisciplina != "PRONTO")
    {
        cout << "Digite o nome da disciplina: ";
        cin >> nomeDisciplina;
        transform(nomeDisciplina.begin(), nomeDisciplina.end(), nomeDisciplina.begin(), ::toupper);
        
        if (temDisciplina(nomeDisciplina)) {
        	
        	disciplina d = gradeCurricular.at(nomeDisciplina);
        	string validaPreRequisitos = atendePreRequisitos(d, disciplinasPagas);
        	
        	if( validaPreRequisitos == "OK"){
        		meuHorario.push_back(d);
        		cout <<  CGREEN << validaPreRequisitos << RESTORE_COLOR << endl;
        	} else {
        		cout << CRED << "ERRO! " << RESTORE_COLOR  << validaPreRequisitos << endl;
        	}
            
        } else {
        	if(nomeDisciplina == "PRONTO") break;
            cout << CRED << "ERRO! " << RESTORE_COLOR  << "Disciplina não encontrada" << endl;
        }
    }
}

int verificaChoquesNoHorario(quadro horario){
	int choque = 0;
	for(int i = 0; i < horario.celulas.size() - 1; i++){
		for(int j = i + 1;  j < horario.celulas.size(); j++){
			if(deuChoqueDeHorarios(horario.celulas.at(i).disc.turmas.at(horario.celulas.at(i).turma - 1), 
									horario.celulas.at(j).disc.turmas.at(horario.celulas.at(j).turma - 1))){
				cout << "Choque de horario entre " << horario.celulas.at(i).disc.nome;
				cout << " e " << horario.celulas.at(j).disc.nome << endl;
				choque = 1;
			}
		}	
	}
	return choque;
}

void gerarHorarioAuto(){
	vector<celula> celulas;

    interarMeuHorario(meuHorario, 0, celulas);

    for (int i = quadrosPossiveis.size() - 1; i >= 0 ; i--){
    	if(validaQtdCreditos(quadrosPossiveis.at(i)) != 0){
    		quadrosPossiveis.erase(quadrosPossiveis.begin() + i);
    	}
    }

    int i = 0;
    int horarioEscolhido = 0;

    string op;
    while(op != "s"){
        if(quadrosPossiveis.size() <= 0){
            cout << CRED << "Não foi possível gerar uma combinação" << RESTORE_COLOR <<  endl;
            break;
        }
    	if(i < quadrosPossiveis.size()){
    		cout << "Horario: " << i + 1 << " de " << quadrosPossiveis.size() << endl << endl;
    		printQuadro(quadrosPossiveis.at(i));
    	}
    	cout << "Menu: escolher horario(e) proximo(p) anterior(a) sair(s)" << endl;
    	cout << ">> ";
    	cin >> op;
    	if(op == "s"){
    		break;
    	}
    	if(op == "p"){
    		if(i < quadrosPossiveis.size()){
    			i++;
    		} else {
    			cout << "Fim das possibilidades de horario" << endl;
    		}
    	} else if(op == "a"){
    		if(i > 0){
    			i--;
    		} else {
    			cout << "Não tem mais possibilidade anterior de horario" << endl;
    		}
    	} else if(op == "e"){
    		horarioEscolhido = i;
    		break;
    	}
    }

    if(quadrosPossiveis.size() > 0){
        quadrofinal = quadrosPossiveis.at(i);
        cout << "deseja exportar horario? s/n" << endl;
        string exp;
        cout << ">> ";
        cin >> exp;
        if(exp == "s"){
            string nomeArquivo;
            cout << "Digite o nome arquivo" << endl;
                cout << ">> ";
                cin >> nomeArquivo;
                exportarQuadro(quadrofinal, nomeArquivo);
        }

    }
    
}

void adicionarDisciplina(){
	string nomeDisciplina;
	cout << "Digite o nome da disciplina: ";
    cin >> nomeDisciplina;
    transform(nomeDisciplina.begin(), nomeDisciplina.end(), nomeDisciplina.begin(), ::toupper);
    
    if (temDisciplina(nomeDisciplina)) {
    	
    	disciplina d = gradeCurricular.at(nomeDisciplina);
    	string validaPreRequisitos = atendePreRequisitos(d, disciplinasPagas);
    	
    	if( validaPreRequisitos == "OK"){
    		quadrofinal.celulas.push_back({d, 0});
    		cout <<  CGREEN << validaPreRequisitos << RESTORE_COLOR << endl;
    	} else {
    		cout << CRED << "ERRO! " << RESTORE_COLOR  << validaPreRequisitos << endl;
    	}
        
    } else {
        cout << CRED << "ERRO! " << RESTORE_COLOR  << "Disciplina não encontrada" << endl;
    }
}

void removerDisciplina(){
	string nomeDisciplina;
	cout << "Digite o nome da disciplina: ";
    cin >> nomeDisciplina;
    transform(nomeDisciplina.begin(), nomeDisciplina.end(), nomeDisciplina.begin(), ::toupper);
    
    if (temDisciplina(nomeDisciplina)) {
    	
    	for(int i = quadrofinal.celulas.size() -1; i > 0;  i--){
    		if(quadrofinal.celulas.at(i).disc.nome == nomeDisciplina){
    			quadrofinal.celulas.erase(quadrofinal.celulas.begin() + i);
    		}	
    	}
        
    } else {
        cout << CRED << "ERRO! " << RESTORE_COLOR  << "Disciplina não encontrada" << endl;
    }
}

void gerarHorarioManual(){

	for (disciplina d : meuHorario){
    	quadrofinal.celulas.push_back(celula{d, 0});
    }
    int turma;
    printQuadro(quadrofinal);
    for(int i = 0; i < quadrofinal.celulas.size(); i++){

    	while(quadrofinal.celulas.at(i).turma == 0){
    		turma = 0;
    		cout << "Escolha uma turma para a disciplina " << quadrofinal.celulas.at(i).disc.nome << endl;
    		cout << ">> ";
    		cin >> turma;
    		if(turma > 0 && turma <= quadrofinal.celulas.at(i).disc.turmas.size()){
    			quadrofinal.celulas.at(i).turma = turma;
    		} else{
    			cout << CRED << "ERRO! " << RESTORE_COLOR << "turma invalida" <<endl;
				break;
    		}
    		turma = 0;
    	}
    }

    int qtdCredito;
    int choques;
    string nomeArquivo;
    string op;
    while(true){
    	printQuadro(quadrofinal);
    	qtdCredito = validaQtdCreditos(quadrofinal);
    	choques = verificaChoquesNoHorario(quadrofinal);
    	
    	if(qtdCredito > 0){
    		cout << CRED << "Máximo de creditos(24) ultrapassados" << RESTORE_COLOR << endl;
    	} else if(qtdCredito < 0){
    		cout << CRED << "Mínimo de creditos(15) não atingidos" << RESTORE_COLOR << endl;
    	}

    	if(choques){
    		cout << CRED << "Verifique choques no horario" << RESTORE_COLOR << endl;
    	}

    	cout << "Menu: visualizar horario(v) Adicionar disciplina(a) remover disciplina(r) exportar horario(x) sair(s)" << endl;
    	cout << ">> ";
    	cin >> op;
    	if(op == "v") {
    		cout << "\n\nHorario:\n\n";
    		printQuadro(quadrofinal);
    	}
    	if(op == "s") break;
    	if(op == "a"){
    		adicionarDisciplina();
    		while(quadrofinal.celulas.at(quadrofinal.celulas.size() - 1).turma == 0){
	    		turma = 0;
	    		cout << "Escolha uma turma para a disciplina " << quadrofinal.celulas.at(quadrofinal.celulas.size() - 1).disc.nome << endl;
	    		cout << ">> ";
	    		cin >> turma;
	    		if(turma > 0 && turma <= quadrofinal.celulas.at(quadrofinal.celulas.size() - 1).disc.turmas.size()){
	    			quadrofinal.celulas.at(quadrofinal.celulas.size() - 1).turma = turma;
	    		} else{
	    			cout << CRED << "ERRO! " << RESTORE_COLOR << "turma invalida" <<endl;
	    		}
	    		turma = 0;
    		}
    	} else if(op == "r"){
    		removerDisciplina();
    	}
        if(op == "x"){
            cout << "Digite o nome arquivo" << endl;
            cout << ">> ";
            cin >> nomeArquivo;
            exportarQuadro(quadrofinal, nomeArquivo);
        }

    }

}

void montarHorario() {

	vector<quadro> quadrosPossiveis = {};
	quadro quadrofinal = {};
	

	system("clear");

	cout << "Montagem do horario" << endl << endl;

    const int ADICIONAR_DISCIPLINA = 1;
    const int GERAR_HORARIOS_AUTO = 2;
    const int GERAR_HORARIOS_MANUAL= 3;
    const int EXPORTAR = 4;
    const int SAIR = 5;
    
    int opcao = 0;
    

    while(opcao != SAIR){
    	cout << "Menu: Adicionar disciplinas(1) gerar horario automaticamente (2) ou manualmente(3) sair(5) "  << endl;
		cout << ">> ";
		cin >> opcao;
		switch(opcao) {
			case(ADICIONAR_DISCIPLINA):
				adicionarDisciplinas();
				break;
			case(GERAR_HORARIOS_AUTO):
				gerarHorarioAuto();
				break;
			case(GERAR_HORARIOS_MANUAL):
				gerarHorarioManual();
				break;
			case(SAIR):
		 		break;
		 	default:
		 		cout << CRED << "ERRO! " << RESTORE_COLOR << "opcao invalida, tente novamente" << endl;
		 		break;
		}

    }


}