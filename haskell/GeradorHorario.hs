module GeradorHorario where 
import Estruturas 
import FuncoesAuxiliares
import Data.List

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

cabecalhoTabelaHorario :: String
cabecalhoTabelaHorario = concat [ formataString dia | dia <- ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"]] ++ "\n"

printHorario :: [Disciplina_matricula] -> String
printHorario disciplinas =  cabecalhoTabelaHorario ++  concat [ formataString (if(length dh > 0) then nome_m $ dh !! 0 else "----") ++ if(dia == 4) then "\n" else "" |
                            hora <-  delete 2 [0..4], dia <- [0..4], let dh = tabela !! dia !! hora ]
                            where tabela = geraTabelaHorario disciplinas

quantidadeCreditos::[Disciplina_matricula]->Bool
quantidadeCreditos [] = True
quantidadeCreditos disciplinas = (cadeiras >= 4 && cadeiras <= 6)
                                 where cadeiras = length disciplinas
