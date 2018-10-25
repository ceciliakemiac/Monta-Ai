module Menu
(principal,
logo,
menuVotarAvaliacao) where

import Avaliacao
import VisualizacaoDisciplinas
import MontagemHorario
import MenuDisciplinasPagas


selecinarPrincipal :: String -> IO()
selecinarPrincipal op
        | op == "0" = do
                putStr ("\ESC[2J")
                MenuDisciplinasPagas.menuPagas
                principal
        | op == "1" = do
                putStr ("\ESC[2J")
                MontagemHorario.montarHorario
                principal
        | op == "2" = do
                putStr ("\ESC[2J")
                VisualizacaoDisciplinas.visualizarDisciplinas
                principal
        | op == "3" = do
                putStr ("\ESC[2J")
                VisualizacaoDisciplinas.visualizarDiscDetalhada
                principal
        | op == "4" = do
                putStr ("\ESC[2J")
                Avaliacao.passoAvaliacao
                principal
        | op == "5" = putStrLn ""
        | otherwise = do
                putStrLn "Opção Inválida"
                principal

principal = do
        putStrLn ""
        putStrLn "MENU"
        putStrLn "0 - Informar/Editar disciplinas que já paguei"
        putStrLn "1 - Montar horário do semestre"
        putStrLn "2 - Visualizar disciplinas"
        putStrLn "3 - Ver informações detalhadas de uma disciplina"
        putStrLn "4 - Avaliar disciplina"
        putStrLn "5 - SAIR"
        op <- getLine
        selecinarPrincipal op
        

logo = do
        putStr ("\ESC[2J")
        putStrLn " __  __             _                            _           "
        putStrLn "|  \\/  |           | |                     /\\   (_)        "
        putStrLn "| \\  / | ___  _ __ | |_ __ _   ______     /  \\   _         "
        putStrLn "| |\\/| |/ _ \\| '_ \\| __/ _` | |______|   / /\\ \\ | |     "
        putStrLn "| |  | | (_) | | | | || (_| |           / ____ \\| |         "
        putStrLn ""


menuVotarAvaliacao = do
        putStrLn "O que achou da disciplina?"
        putStrLn "1 - rasgada"
        putStrLn "2 - de boa"
        putStrLn "3 - carrego"
        putStrLn "4 - tenso"
        putStrLn "5 - eh peso"

        


