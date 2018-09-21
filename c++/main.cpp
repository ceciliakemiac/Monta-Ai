#include <iostream>
#include <string>
#include <stdio.h>

using namespace std;

struct turma {
    string horarios[2];

    void setHorarios(string *novo) {
        horarios[0] = novo[0];
        horarios[1] = novo[1];
    }

    string print() {
        string saida;

        saida = horarios[0] + "\n";
        saida = saida + horarios[1] + "\n";

        return saida;
    }
};
 
struct disciplina {
    string nome;
    string codigo;
    turma turmas[2];

    void iniciar(string nome, string codigo, turma novas[2]) {
        nome = nome;
        codigo = codigo;
        setTurmas(novas);
    }

    void setTurmas(turma *nova) {
        turmas[0] = nova[0];
        turmas[1] = nova[1];
    }

    string print() {
        string saida; 
        //std::cout << "Length of array = " << (sizeof(turmas)/sizeof(*turmas)) << std::endl;
        
        saida = "Nome: " + nome + "\n";
        saida = saida + "Turma 1\n";
        saida = saida + turmas[0].print();

        saida = saida + "Turma 2\n";
        saida = saida + turmas[1].print();
        return saida;
    }
};
 



// void inserirValores(turma *grade) {
//     turma prob1;
//     prob1.codigo = "1001";
//     prob1.horarios[2] = {"2 10-12", "4 08-10"};
//     grade[0] = prob1;

//     cout << grade[0].codigo;
// }

int lenghtArray(string *array) {
    return (sizeof(array)/sizeof(*array));
}



int main() {
    turma conjTurmas1[2];

    turma prob1, prob2;
    string horarios[] = {"2 10/12", "3 08/10"};
    prob1.setHorarios(horarios);

    string horarios2[] = {"3 10/12", "4 08/10"};
    prob2.setHorarios(horarios2);
    conjTurmas1[0] = prob1;
    conjTurmas1[1] = prob2;

    //cout << conjTurmas1[0].horarios[0].c_str() << endl;


    disciplina oac;
    oac.iniciar("peso", "OAC", conjTurmas1);
    //oac.codigo = "peso";
    //oac.nome = "OAC";
    //oac.setTurmas(conjTurmas1);

    cout << oac.print();

}


