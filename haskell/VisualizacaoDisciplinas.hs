module VisualizacaoDisciplinas (visualizarDisciplinas, visualizarDiscDetalhada) where

import BancoDisciplinas
import Estruturas
import Planilha

visualizaDisciplinas :: [Disciplina] -> String
visualizaDisciplinas [] = []
visualizaDisciplinas (a:as) = toString a ++ "\n" ++ visualizaDisciplinas as


visualizarDisciplinas :: IO ()
visualizarDisciplinas = do
    putStrLn ("Visualizar disciplinas \n\n")
    menuDisciplinas 

menuDisciplinas :: IO()
menuDisciplinas = do
    putStrLn ("Menu: planilha de horarios(1) listagem(2) filtrar(3) voltar ao menu(4)")
    opcao <- getLine
    let op = (read opcao)

    if (op == 1) then do
        putStrLn (planilha)
        menuDisciplinas
    else if (op == 2) then do
        putStrLn ("Disciplinas: \n")
        putStrLn (visualizaDisciplinas disciplinas)
        menuDisciplinas
    else if (op == 3) then do
        menuFiltro
        menuDisciplinas
    else if (op == 4) then return()
    else do 
        putStrLn ("ERRO! opcao invalida, tente novamente")
        menuDisciplinas

menuFiltro :: IO()
menuFiltro = do
    putStrLn ("Filtrar por periodo(1), obrigatorias(2), optativas(3) ou todas as disciplinas(4)?")
  
    filtro <- getLine
    let fil = read filtro
    
    if(fil == 1) then do
        putStrLn ("Qual periodo? ")
        periodo <- getLine
        putStrLn ("disciplinas do " ++ periodo ++ "° periodo: \n")
        putStrLn (visualizaDisciplinas (getDiscPorPeriodo (read periodo) disciplinas))
    else if (fil == 2) then do
        putStrLn ("disciplinas obrigatorias: ")
        putStrLn (visualizaDisciplinas (getDiscObrigatorias disciplinas))
    else if (fil == 3) then do
        putStrLn ("disciplinas optativas: ")
        putStrLn (visualizaDisciplinas (getDiscOptativas disciplinas))
    else if(fil == 4) then do
        putStrLn ("Grade curricular: ")
        putStrLn (visualizaDisciplinas disciplinas)
    else do
        putStrLn ("ERRO! opcao invalida")
        menuFiltro


visualizarDiscDetalhada :: IO()
visualizarDiscDetalhada = do
    putStrLn ("Informações detalhadas de uma disciplina \n\n")
    menuDiscDetalhada

menuDiscDetalhada :: IO()
menuDiscDetalhada = do
    putStrLn ("Digite o nome da disciplina: ")
    nome <- getLine
    putStrLn("chama metodo")
    putStrLn ("1 - Visualizar outra disciplina\n2 - voltar ao menu")
    op <- getLine
    if((read op) == 1) then menuDiscDetalhada
    else return()