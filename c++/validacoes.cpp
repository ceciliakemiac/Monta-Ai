
string atendePreRequisitos(disciplina d, vector<disciplina> disciplinasPagas){
        int atendePreRequisitos = 1;
        int pagou;
        for(string preRequisito: d.pre_requisitos){
           pagou = 0;
            for(disciplina dPaga : disciplinasPagas){
                if(dPaga.nome == preRequisito){
                    pagou = 1;
                    break;
                }
            }
            if(!pagou){
                return "Pre-requisito de " + d.nome + " não atendido: " + preRequisito;
            }
        }
        return "OK";
}

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

int validaChoques(turma t, vector<celula> celulas){
    for(celula cel : celulas){
        if(deuChoqueDeHorarios(t, cel.disc.turmas.at(cel.turma - 1))){
            return 1;
        }
    }
    return 0;
}

int validaQtdCreditos(quadro horario){
    int total = 0;
    
    for(celula cel : horario.celulas){
        total += cel.disc.creditos;
    }

    int valida = 0;
    if(total < 15){
        valida = -1;
    } else if(total > 24){
        valida = 1;
    }
    return valida;
}
