#include <iostream>
#include <string>
using namespace std;

//Esboço de Função de Busca.

string;
string pesquisaDisc(char entrada[]){
    int nDisciplinas = 200; //Colocar contador do número de disciplinas aqui. 
    string arrayDeDisciplinas[nDisciplinas] = {""}; //Atribuir á variável global com um Array com todas as disciplinas aqui.
    string saida = "";
    for(int i = 0; i < nDisciplinas; i++){
        int j = 0;
        bool add = true;
        char caracter = entrada[0];
        while(caracter != '/n'){
            if(caracter != arrayDeDisciplinas[i][j]){
                add = false;
                break;
            }
            j++;
            caracter = entrada[j];
        }
        if(add){
            saida += arrayDeDisciplinas[i] + "/n";
        }
    }
    if(saida == ""){
        saida = "Não foram encontradas disciplinas que corresopondam à pesquisa.";
    }
    return saida;
}

//Fim da Função

int main() {
    return 0;
}
