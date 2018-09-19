#include <iostream>
#include <string>
using namespace std;

//Esboço de Função de Busca.

string;
string pesquisaDisc(char entrada[]){
    string arrayDeDisciplinas[] = {""}; //Atribuir á variável Global aqui.
    string saida = "";
    for(int i = 0; i < arrayDeDisciplinas.size(); i++){
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
        saida = "Não foram encontradas disciplinas que corresopondam á pesquisa.";
    }
    return saida;
}

//Fim da Função

int main() {
    return 0;
}
