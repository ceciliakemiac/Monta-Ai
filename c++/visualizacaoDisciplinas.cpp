
string CRED = "\x1B[31m";
string CGREEN = "\x1B[32m";
string RESTORE_COLOR = "\x1B[0m";


void visualizaDisciplinas(vector<disciplina> disc){
	for(disciplina d: disc){
		cout << d.toString() + "\n";
	}
}


void visualizarDiciplinas(){
	system("clear");

	cout << "Visualizar disciplinas" << "\n\n";

	vector<disciplina> disciplinas = todasDisciplinas(); 

	const int PLANILHA_HORARIOS = 1;
	const int LISTAGEM = 2;
	const int FILTRAR = 3;
	const int SAIR = 4;
	
	int filtro;
	int periodo;
	int opcao = 1;

	while(opcao != 4){
		cout << "Menu: planilha de horarios(1) listagem(2) filtrar(3) voltar ao menu(4)" << endl;
		cout << ">> ";
		cin >> opcao;

		 switch(opcao) {

		
		 	case(FILTRAR):
		 		cout << "Filtrar por periodo(1), obrigatorias(2), optativas(3) ou todas as disciplinas(4)?" << endl;
		 		cout << ">> ";
		 		cin >> filtro;
		 		cout << endl;
		 		switch(filtro){
		 			case(1):
		 				cout << "Qual periodo?" <<  endl;
		 				cout << ">> ";
		 				cin >> periodo;
		 				cout << endl;
		 				cout << "disciplinas do " << periodo << "º periodo: " << endl;
		 				disciplinas = disciplinasDoPeriodo(periodo);
						visualizaDisciplinas(disciplinas);
		 				break;
		 			case(2):
		 				cout << "disciplinas obrigatorias: " << endl;
		 				disciplinas = disciplinasObrigatorias();
						visualizaDisciplinas(disciplinas);
		 				break;
		 			case(3):
		 				cout << "disciplinas optativas: " << endl;
		 				disciplinas = disciplinasOptativas();
						visualizaDisciplinas(disciplinas);
		 				break;
		 			case(4):
		 				cout << "Grade curricular: " << endl;
		 				disciplinas = todasDisciplinas();
						 visualizaDisciplinas(disciplinas);
		 				break;
		 			default:
		 				cout << CRED << "ERRO! " << RESTORE_COLOR <<"opcao invalida" << endl;
		 				break;
		 		}
		 		break;

		 	case(PLANILHA_HORARIOS):
		 		printDisciplinas(disciplinas);
		 		break;
		 	case(LISTAGEM):
		 		cout << "Disciplinas: " << endl;
    			for(disciplina d: disciplinas){
       				cout << d.toString() << endl;
    			}
		 		break;
		 	case(SAIR):
		 		break;
		 	default:
		 		cout << CRED << "ERRO! " << RESTORE_COLOR << "opcao invalida, tente novamente" << endl;
		 		break;
		 }

	}
}
