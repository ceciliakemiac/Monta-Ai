#include <avaliacao.h>

int deuChoqueDeHorarios(turma t1, turma t2){
    int choque = 0;
    for(horario ht1 : t1.horarios){
        for(horario ht2 : t2.horarios){
            if(ht1.dia == ht2.dia && ht1.hora == ht2.hora){
                choque = 1;
                break;
            }
        }
    }
    return choque;
}

int totalDeCreditos(vector<disciplina> disciplinas){
    int total = 0;
    for(disciplina d : disciplinas){
        total += d.creditos;
    }
    return total;
}

// retorna -1 se estiver abaixo do mínimo de créditos exigido(15),
// 1 se estiver acima do máximo(24) e 0 se estiver tudo certo
int validaQtdCreditos(int totalDeCreditos){
    int valida = 0;
    if(totalDeCreditos < 15){
        valida = -1;
    } else if(totalDeCreditos > 24){
        valida = 1;
    }
    return valida;
}

bool validaNivel(Nivel a) {
    return !(a != deBoa && a != rasgada && a != carrego && a != ehPeso && a != tenso);
}