module GeradorHorario where 
import Estruturas 
import FuncoesAuxiliares
import BancoDisciplinas
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
cabecalhoTabelaHorario = "        " ++ concat [ formataString dia | dia <- ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"]] ++ "\n"

printHorario :: [Disciplina_matricula] -> String
printHorario disciplinas =  cabecalhoTabelaHorario ++  
                            concat [ (if(dia==0) then (if (hora == 0) then "0" else "") ++ show (hora * 2 + 8) ++ ":00   " else "") ++
                                        formataString (if(length dh > 0) then nome_m (dh !! 0) ++ " t-" ++ show (t (dh !! 0)) else "----") ++ 
                                        if(dia == 4) then "\n" else "" |
                                    hora <-  delete 2 [0..4], dia <- [0..4], let dh = tabela !! dia !! hora] ++ "\n" ++
                            "Disciplinas: " ++ printDisciplinas' disciplinas ++ "\n"
                            where tabela = geraTabelaHorario disciplinas

printDisciplinas' :: [Disciplina_matricula] -> String
printDisciplinas' [] = "\n"
printDisciplinas' (d:ds) =  nome_m d ++ " t- " ++ show (t d) ++ "  " ++ printDisciplinas' ds

quantidadeCreditos::[Disciplina_matricula]->Int
quantidadeCreditos [] = 0
quantidadeCreditos (x:xs) = (creditos_m x) + (quantidadeCreditos xs)

limiteCreditos::[Disciplina_matricula]->Bool
limiteCreditos cadeiras = creditos >= 14 && creditos <= 24
                          where creditos = (quantidadeCreditos cadeiras)

discToDisc_mat :: Disciplina -> [Turma] -> Int -> [Disciplina_matricula]
discToDisc_mat d [] n = []
discToDisc_mat d (t:ts) n = [Disciplina_matricula{
                                        nome_m = nome d, 
                                        creditos_m = creditos d, 
                                        t = n,
                                        turma_m = t} ]  ++ discToDisc_mat d ts (n+1)

disciplinasToDisciplina_matricula :: [Disciplina] -> [Disciplina_matricula]
disciplinasToDisciplina_matricula [] = []
disciplinasToDisciplina_matricula  (d:ds) = discToDisc_mat d (turmas d) 1  ++ disciplinasToDisciplina_matricula ds

removeHorariosDuplicados :: [[Disciplina_matricula]] -> [[Disciplina_matricula]]
removeHorariosDuplicados h = ordNub [removeDiscDuplicadas x | x <-  h]

removeDiscDuplicadas :: [Disciplina_matricula] -> [Disciplina_matricula]
removeDiscDuplicadas [] = []
removeDiscDuplicadas (d:ds) = d : removeDiscDuplicadas (filter (\y -> not (nome_m y == nome_m d)) ds)

removeDiscDuplicadas' :: [Disciplina] -> [Disciplina]
removeDiscDuplicadas' [] = []
removeDiscDuplicadas' (d:ds) = d : removeDiscDuplicadas' (filter (\y -> not (nome y == nome d)) ds)

removeDisciplina :: String -> [Disciplina] -> [Disciplina]
removeDisciplina nomed disc = filter (\y -> not (nomed == nome y)) disc

removeDisciplina' :: String -> [Disciplina_matricula] -> [Disciplina_matricula]
removeDisciplina' nomed disc = filter (\y -> not (nomed == nome_m y)) disc

jaTem::String -> [Disciplina_matricula] -> Bool
jaTem _ [] = False
jaTem nomed (d:ds) 
        | nomed == nome_m d = True
        | otherwise = jaTem nomed ds

verificaChoques :: Disciplina_matricula -> [Disciplina_matricula] -> Bool
verificaChoques d [] = False
verificaChoques d (x:xs) 
                | (deuChoque (horarios $ turma_m d) x) = True
                | otherwise = verificaChoques d xs

deuChoque :: [Horario] -> Disciplina_matricula -> Bool
deuChoque [] _ = False
deuChoque (x:xs) d = horarioBate (dia x) (hora x) (horarios $ turma_m d) 

validaChoqueTurmas :: [Disciplina_matricula] -> Bool
validaChoqueTurmas [] = True
validaChoqueTurmas (x:xs)
                    | (verificaChoques x xs) = False
                    | otherwise = validaChoqueTurmas xs

validaPossiveisHorarios:: [[Disciplina_matricula]] -> [[Disciplina_matricula]]
validaPossiveisHorarios h =  [x | x <- h, validaChoqueTurmas x, limiteCreditos x]

geraHorariosValidos :: [Disciplina] -> [[Disciplina_matricula]]
geraHorariosValidos disciplinas =   validaPossiveisHorarios $ 
                                    removeHorariosDuplicados $ 
                                    gerarPossiveisHorarios $ 
                                    disciplinasToDisciplina_matricula disciplinas

adicionaDiscNoHorario:: Disciplina -> [Disciplina_matricula] -> [[Disciplina_matricula]]
adicionaDiscNoHorario d disc = horarios
    where  horarios =   validaPossiveisHorarios $ 
                        removeHorariosDuplicados $ 
                        gerarPossiveisHorarios $ disc ++ disciplinasToDisciplina_matricula [d]

getDiscMatricula :: String -> Int -> Disciplina_matricula
getDiscMatricula nome turma = Disciplina_matricula{nome_m = nome, creditos_m = creditos d, t = turma, turma_m = (turmas d ) !! (turma - 1)} 
    where d = pegaDisciplina disciplinas nome 