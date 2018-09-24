#include <iostream>
#include <disciplinas_bd.cpp>
using namespace std;

int atendePreRequisitos(disciplina d, vector<disciplina> disciplinasPagas){
    int atendePreRequisitos = 1;
    int pagou;
    for(string preRequisitos: d.pre_requisitos){
        pagou = 0;
        for(disciplina dPaga : disciplinasPagas){
            if(dPaga.codigo == preRequisitos){
                pagou = 1;
                break;
            }
        }
        if(!pagou){
            atendePreRequisitos = 0;
            break;
        }
    }
    return atendePreRequisitos;
}

int main(){
    cout << 1;
    return 0;
}

