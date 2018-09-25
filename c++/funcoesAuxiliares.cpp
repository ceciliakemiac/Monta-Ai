#include <iostream>
#include <iomanip>
using namespace std;

void rodaMenu() {
    cout << "MENU" << "\n";
    cout << "1 - Montar Horário do semestre" << "\n";
    cout << "2 - Visualizar disciplinas" << "\n";
    cout << "3 - Ver informações detalhadas de uma disciplina" << "\n";
    cout << "4 - Avaliar disciplina" << "\n";
    cout << "5 - SAIR" << "\n";
}

void printHorario(vector<disciplina> disciplinas) {

	vector<string> h[5][5];
	for(disciplina d: disciplinas){
		for(int i = 0; i < d.turmas.size(); i++){
			for(horario hr: d.turmas[i].horarios){
				h[hr.dia - 2][(hr.hora - 8) / 2].push_back(d.nome + " t-"+ to_string(i + 1));
			}
		}
	}
	

	int w = 30;
	cout << left << setw(w) << setfill(' ') << "SEGUNDA";
	cout << left << setw(w) << setfill(' ') << "TERÇA";
	cout << left << setw(w) << setfill(' ') << "QUARTA";
	cout << left << setw(w) << setfill(' ') << "QUINTA";
	cout << left << setw(w) << setfill(' ') << "SEXTA";
	cout << endl;

	int maior;
	for(int i = 0; i < 5; i++){
		cout << left << setw(w * 5) << setfill('-') << to_string((i * 2) + 8) + ":00" << endl;
		if(i == 2) {
			continue;
		}
		maior = 0;
		for (int l = 0; l < 5; l++){
			if(h[l][i].size() > maior) maior = h[l][i].size();
		}
		for(int j = 0; j < maior; j++){
			for(int k = 0; k < 5; k++){
				if( j < h[k][i].size()){
					cout << left << setw(w) << setfill(' ') <<  h[k][i][j];                                           
				} else cout << left << setw(w) << setfill(' ') << "";
			}
			cout << endl;
		}

	}
}

// Metodos de iteracao para visualizacao das disciplinas
void visualizarDisciplinaDet(){
    string disc;
    cout << "Digite o nome da disciplina: ";
    cin >> disc;
    cout << exibirDiscDetalh(disc); 
}

void visualizarTodasDisc(){
   cout << exibirTodasAsDiscSimples();
}
