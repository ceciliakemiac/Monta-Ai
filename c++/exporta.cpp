void exportarQuadro(quadro q, string nomeArquivo) {

	ofstream outfile;
	outfile.open(nomeArquivo);
	if(outfile.is_open() && outfile.good()){

		outfile << "Disciplinas: " << endl;
		vector<string> h[5][5];
		for(celula cel: q.celulas){
			outfile << left << setw(15) << setfill(' ') << "" << left << setw(15) << cel.disc.nome
				<< " " << cel.disc.turmas.at(cel.turma - 1).horarios[0].dia <<" "<< cel.disc.turmas.at(cel.turma - 1).horarios[0].hora << ":00" << " / "
				<< cel.disc.turmas.at(cel.turma - 1).horarios[1].dia <<" "<< cel.disc.turmas.at(cel.turma - 1).horarios[1].hora << ":00" << endl;
			for(horario hr: cel.disc.turmas.at(cel.turma - 1).horarios){
				h[hr.dia - 2][(hr.hora - 8) / 2].push_back(cel.disc.nome);
			}
		}

		outfile << endl << "Horario:" << endl << endl;

		int w = 15;
		outfile << left << setw(7) << setfill(' ') << "";
		outfile << left << setw(w) << setfill(' ') << "SEGUNDA";
		outfile << left << setw(w) << setfill(' ') << "TERÇA";
		outfile << left << setw(w) << setfill(' ') << "QUARTA";
		outfile << left << setw(w) << setfill(' ') << "QUINTA";
		outfile << left << setw(w) << setfill(' ') << "SEXTA";
		outfile << endl;

		int numMaxDisciplina;
		for(int hora = 0; hora < 5; hora++){

			// 2 representa 12 horas (2 * 2 + 8), logo não tem disciplinas nesse horario
			if(hora == 2) {
				outfile << endl;
				continue;
			}

			// Pega a hora(comparando em cada dia da semana) com maior quantidade de disciplinas para ajustar o tamanho da tabela
			numMaxDisciplina = 0;
			for (int dia = 0; dia < 5; dia++){
				if(h[dia][hora].size() > numMaxDisciplina) numMaxDisciplina = h[dia][hora].size();
			}


			for(int idisc = 0; idisc < numMaxDisciplina; idisc++){

				if(idisc == 0) outfile << left << setw(7) << setfill(' ')  << to_string((hora * 2) + 8) + ":00"; 
				else outfile << "       ";

				for(int dia = 0; dia < 5; dia++){

					if( idisc < h[dia][hora].size()){

						outfile << left << setw(w) << setfill(' ') <<  h[dia][hora][idisc];                                           

					} else outfile << left << setw(w) << setfill(' ') << "";
				}
				outfile << endl;
			}
			outfile << endl;

		}
	} else cout << "erro ao tentar salvar o arquivo";
}