
void printLogo(){
	cout << " __  __             _                            _           " << endl;
	cout << "|  \\/  |           | |                     /\\   (_)        " << endl;
	cout << "| \\  / | ___  _ __ | |_ __ _   ______     /  \\   _         " << endl;
	cout << "| |\\/| |/ _ \\| '_ \\| __/ _` | |______|   / /\\ \\ | |     " << endl;
	cout << "| |  | | (_) | | | | || (_| |           / ____ \\| |         " << endl;
	cout << "|_|  |_|\\___/|_| |_|\\__\\__,_|          /_/    \\_\\_|	  " << endl;
}

void rodaMenu() {
    cout << "MENU" << "\n";
	cout << "0 - Informar/Editar disciplinas que já paguei" << "\n";
    cout << "1 - Montar horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";
}

void printHorario(vector<string> h[5][5], int marcarChoques){

	string BOLD = "\x1B[1m";
	string RED = "\x1B[31m";
	string GREEN = "\x1B[32m";
	string RESTORE_COLOR = "\x1B[0m";

	if(!marcarChoques){
		RED = RESTORE_COLOR;
		GREEN = RESTORE_COLOR;
	}

	int w = 15;
	cout << "        ";
	cout << left << setw(w) << setfill(' ') << "SEGUNDA";
	cout << left << setw(w) << setfill(' ') << "TERÇA";
	cout << left << setw(w) << setfill(' ') << "QUARTA";
	cout << left << setw(w) << setfill(' ') << "QUINTA";
	cout << left << setw(w) << setfill(' ') << "SEXTA";
	cout << endl;

	int numMaxDisciplina;
	for(int hora = 0; hora < 5; hora++){

		// 2 representa 12 horas (2 * 2 + 8), logo não tem disciplinas nesse horario
		if(hora == 2) {
			cout << endl;
			continue;
		}

		// Pega a hora(comparando em cada dia da semana) com maior quantidade de disciplinas para ajustar o tamanho da tabela
		numMaxDisciplina = 0;
		for (int dia = 0; dia < 5; dia++){
			if(h[dia][hora].size() > numMaxDisciplina) numMaxDisciplina = h[dia][hora].size();
		}


		for(int idisc = 0; idisc < numMaxDisciplina; idisc++){

			if(idisc == 0) cout << left << setw(7) << setfill(' ')  << to_string((hora * 2) + 8) + ":00"; 
			else cout << "       ";

			for(int dia = 0; dia < 5; dia++){

				if( idisc < h[dia][hora].size()){

					if(h[dia][hora].size() > 1) {
						cout << BOLD << RED << left << setw(w) << setfill(' ') <<  h[dia][hora][idisc] << RESTORE_COLOR;
					} else {
						cout << BOLD << GREEN <<  left << setw(w) << setfill(' ') <<  h[dia][hora][idisc] << RESTORE_COLOR;                                           
					}

				} else cout << left << setw(w) << setfill(' ') << "";
			}
			cout << endl;
		}
		cout << endl;

	}

}

void printDisciplinas(vector<disciplina> disciplinas) {

	vector<string> h[5][5];
	for(disciplina d: disciplinas){
		for(int i = 0; i < d.turmas.size(); i++){
			for(horario hr: d.turmas[i].horarios){
				h[hr.dia - 2][(hr.hora - 8) / 2].push_back(d.nome + " t-"+ to_string(i + 1));
			}
		}
	}
	
	printHorario(h, 0);
}



void printQuadro(quadro q){
	vector<string> h[5][5];
	for(celula cel: q.celulas){
		if(cel.turma == 0){
			for(int i = 0; i < cel.disc.turmas.size(); i++){
				for(horario hr: cel.disc.turmas[i].horarios){
					h[hr.dia - 2][(hr.hora - 8) / 2].push_back(cel.disc.nome + " t-"+ to_string(i + 1));
			}
		}
		} else {

			for(horario hr: cel.disc.turmas.at(cel.turma - 1).horarios){
				h[hr.dia - 2][(hr.hora - 8) / 2].push_back(cel.disc.nome + " t-" + to_string(cel.turma));
			}
		}	
	}

	printHorario(h, 1);
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
        saida = "Não foram encontradas disciplinas que corresopondam à pesquisa.\n";
    }
    return saida;
}

// Metodos de iteracao para visualizacao das disciplinas
void visualizarDisciplinaDet(){
	system("clear");

	cout << "Informações detalhadas de uma disciplina" << "\n\n";

	int op = 1;

    while(op != 2){
	    string disc;
	    cout << "Digite o nome da disciplina: ";
	    cin >> disc;
	    cout << exibirDiscDetalh(disc); 
	    cout << endl;
	    cout << "1 - Visualizar outra disciplina\n2 - voltar ao menu\n";
	    cout << ">> ";
        cin >> op;
	}
}

void visualizarTodasDisc(){
   cout << exibirTodasAsDiscSimples();
}