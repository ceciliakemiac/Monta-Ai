module VisualizacaoDisciplinas (visualizarDisciplinas, visualizarDiscDetalhada) where

import BancoDisciplinas
import Estruturas
import Planilha
import Avaliacao
import FuncoesAuxiliares

visualizaDisciplinas :: [Disciplina] -> String
visualizaDisciplinas [] = []
visualizaDisciplinas (a:as) = toString a ++ "\n" ++ visualizaDisciplinas as


visualizarDisciplinas :: IO ()
visualizarDisciplinas = do
    putStrLn ("Visualizar disciplinas \n")
    menuDisciplinas 

menuDisciplinas :: IO()
menuDisciplinas = do
    putStrLn ("Menu: planilha de horarios(1) listagem(2) filtrar(3) voltar ao menu(4)")
    opcao <- getLine
    let op = (read opcao)

    if (op == 1) then do
        putStr ("\ESC[2J")
        putStrLn (planilha)
        menuDisciplinas
    else if (op == 2) then do
        putStr ("\ESC[2J")
        putStrLn ("Disciplinas: \n")
        putStrLn (visualizaDisciplinas disciplinas)
        menuDisciplinas
    else if (op == 3) then do
        putStr ("\ESC[2J")
        menuFiltro
        menuDisciplinas
    else if (op == 4) then do
        putStr ("\ESC[2J")
        return()
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
    aval <- pegarAvaliacao
    putStrLn(exibeDisciplinaDet (getDisciplinaNome (upper nome)) aval) 
    putStrLn ("1 - Visualizar outra disciplina\n2 - voltar ao menu")
    op <- getLine
    if((read op) == 1) then menuDiscDetalhada
    else do
        putStr ("\ESC[2J")
        return()

toStringDet :: Disciplina -> [String] -> String
toStringDet (Disciplina {codigo = c, nome = n, creditos = cr, periodo = p, obrigatorio = o, pre_requisitos = pr, turmas = t}) avals =
    "Codigo: " ++ c ++ "\n" ++ "Creditos: " ++ show(cr) ++ "\n" ++ "Periodo: " ++ show(p) ++ "\n" ++ "Status: " ++ (showObrigatoria o) ++ "\n" ++ "Pre-requisitos: " ++ (toStringPreRequisitos pr) ++ "\n" ++ 
    "Turmas: \n" ++ (pegarTurmas t) ++ "\n" ++ "Comentários:\n" ++ (toStringAvaliacao n avals)  ++ "\n"


exibeDisciplinaDet :: Disciplina -> [String] -> String
exibeDisciplinaDet d avals = (toStringDet d avals)