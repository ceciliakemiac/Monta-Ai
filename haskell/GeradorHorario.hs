module GeradorHorarios where 
import Estruturas 
import FuncoesAuxiliares

horarioBate :: Int -> Int -> [Horario] -> Bool
horarioBate d h horarios = length [horario | horario <- horarios, (dia horario) == d && (hora horario) == h] > 0

filtrarDiaeHora :: Int -> Int -> [Disciplina_matricula] -> [Disciplina_matricula]
filtrarDiaeHora d h disciplinas = [x | x <- disciplinas, horarioBate d h (horarios (turma_m x))]

geraTabelaHorario :: [Disciplina_matricula] -> [[[Disciplina_matricula]]]
geraTabelaHorario disciplinas = [[ filtrarDiaeHora dia hora disciplinas | hora <- [8, 10..16]] | dia <- [2..6]]

gerarPossiveisHorarios :: [Disciplina_matricula] -> [[Disciplina_matricula]]
gerarPossiveisHorarios disc = [ gera disc b | b <- comBinario ]
            where
                nBits = length disc
                maxComb = 2 ^ nBits - 1
                comBinario = [decimalTobinario n nBits | n <- [1..maxComb]] 


gera :: [Disciplina_matricula] -> [Int] -> [Disciplina_matricula]
gera [] [] = []
gera (d:ds) (b:bs)
            | b == 1 = [d] ++ gera ds bs
            | otherwise = gera ds bs
