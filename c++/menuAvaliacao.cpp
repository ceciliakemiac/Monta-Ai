void comentario_ou_votarAvaliacao() {
    cout << "1 - Deixar um comentário" << "\n";
    cout << "2 - Votar em uma avaliação" << "\n";
}

void menuVotarAvaliacao() {
    cout << "O que achou da disciplina?" << "\n";
    cout << "1 - rasgada" << "\n";
    cout << "2 - de boa" << "\n";
    cout << "3 - carrego" << "\n";
    cout << "4 - tenso" << "\n";
    cout << "5 - eh peso" << "\n";
}

void menuTipoAvaliacao(int opcao, string nome, disciplina disc, string conteudo) {
    switch(opcao) {
        case(1):
            cout << "Digite um comentario sobre a disciplina " << nome << ": ";
            cin.ignore();
            getline (cin, conteudo);
            gradeCurricular.at(nome).aval.adicionaComentario(conteudo);
            break;
        case(2):
            int num;
            menuVotarAvaliacao();
            cin >> num;
            nivel atual;
            atual = (nivel)num;
            gradeCurricular.at(nome).aval.votaAvaliacao(atual);
            break;
        default:
            cout << "Opção inválida." << "\n";
            break;
    }
    //cout << "\n" << "Valeu e até mais :p" << "\n";
}

void menuAvaliacao() {

    system("clear");

    string nomeDisc;
    disciplina disc;

    int op = 1;

    while(op != 2){

        cout << "Qual disciplina deseja avaliar? ";
        cin >> nomeDisc;

        if(temDisciplina(nomeDisc)) {
            disc = buscarDisciplina(nomeDisc);
            int opcao;
            comentario_ou_votarAvaliacao();
            cin >> opcao;
            string conteudo;
            menuTipoAvaliacao(opcao, nomeDisc, disc, conteudo);
        } else {
            cout << "\n" << "Disciplina não existe /:" << "\n";
        }

        cout << "1 - Avaliar outra disciplina\n2 - voltar ao menu\n";
        cin >> op;
    }
}