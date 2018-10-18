module GeradorHorarios where 
import Estruturas 
import FuncoesAuxiliares

horarioBate :: Int -> Int -> [Horario] -> Bool
horarioBate d h horarios = length [horario | horario <- horarios, (dia horario) == d && (hora horario) == h] > 0

filtrarDiaeHora :: Int -> Int -> [Disciplina_matricula] -> [Disciplina_matricula]
filtrarDiaeHora d h disciplinas = [x | x <- disciplinas, horarioBate d h (horarios (turma_m x))]

geraTabelaHorario :: [Disciplina_matricula] -> [[[Disciplina_matricula]]]
geraTabelaHorario disciplinas = [[ filtrarDiaeHora dia hora disciplinas | hora <- [8, 10..16]] | dia <- [2..6]]
