#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm> 
#include <fstream>
#include <iomanip>

using namespace std;

#include "structs.cpp"
#include "bancoDisciplinas.cpp"
#include "filtragensDisciplinas.cpp"
#include "validacoes.cpp"
#include "funcoesAuxiliares.cpp"
#include "visualizacaoDisciplinas.cpp"
#include "menuAvaliacao.cpp"
#include "menuDisciplinasPagas.cpp"
#include "exporta.cpp"
#include "menuMontagemHorario.cpp"




int main(){

	const int INFORM_DSC_PAGAS = 0;
    const int MONTAR_HOR = 1;
    const int VIZUALIZAR_DISC = 2;
    const int INFORMACAO_DISC = 3;
    const int AVALIAR_DISC = 4;
    const int SAIR = 5;  

    int opcao = -1;
    while(opcao != SAIR) {

    	system("clear");

    	printLogo();
    	cout << endl;
        rodaMenu();
        cout << endl;
        cout << ">> ";
        cin >> opcao;
        switch(opcao) {
            case(INFORM_DSC_PAGAS):
                informaDisciplinasPagas();
                break;
            case(MONTAR_HOR):
                montarHorario();
                break;
            case(VIZUALIZAR_DISC):
                visualizarDiciplinas();
            break;
            case(INFORMACAO_DISC):
                visualizarDisciplinaDet();
            break;
            case(AVALIAR_DISC):
                menuAvaliacao();
                break;
            case(SAIR):
            	cout << "Até mais ver, em francês, Au revoir!" << endl << endl;
            	break;
            default:
            	cout << CRED << "ERRO! " << RESTORE_COLOR << "opcao invalida, tente novamente" << endl;
            //
            break;
        }
    }
	
	return 0;
}