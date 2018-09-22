#include <iostream>
#include <map>
#include <vector>
using namespace std;

enum Nivel {
    rasgada,
    deBoa,
    carrego,
    tenso,
    ehPeso
};

struct Avaliacao {
    vector<string> comentarios;
    map<Nivel, int> classificacao;

    void adicionaComentario(string conteudo) {
        comentarios.push_back(conteudo);
    }

    void adicionaAvaliacao(Nivel a) {
        classificacao[a] += 1;
    }
};

// int main() {
//     Avaliacao eu;
//     string a = "oi";
//     eu.adicionaComentario(a);
//     cout << eu.comentarios[0] << "\n";
//     cout << eu.classificacao[ehPeso] << "\n";
//     eu.adicionaAvaliacao(ehPeso);
//     cout << eu.classificacao[ehPeso] << "\n";
// }