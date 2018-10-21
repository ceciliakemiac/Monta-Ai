module Avaliacao (passoAvaliacao) where

import BancoDisciplinas
import Estruturas
import Data.List.Split
import System.IO  
import System.Directory  
import Data.List 
import Data.Char  


comentario_ou_votarAvaliacao = do
    putStrLn "1 - Deixar um comentário"
    putStrLn "2 - Votar em uma avaliação" 

menu_votar_avaliacao = do
    putStrLn "O que achou da disciplina?"
    putStrLn "1 - rasgada"
    putStrLn "2 - de boa"
    putStrLn "3 - carrego"
    putStrLn "4 - tenso"
    putStrLn "5 - peso"

passoAvaliacao :: IO()
passoAvaliacao = do
    putStrLn "Qual disciplina deseja avaliar?"
    nomeDisc <- getLine

    if (existeDisciplina disciplinas (upper nomeDisc)) then do
        escolherOpcao nomeDisc
    else
        putStrLn "Disciplina não existe /:"
    
    putStrLn "1 - Avaliar outra disciplina\n2 - voltar ao menu"
    op <- getLine
    if((read op) == 1) then passoAvaliacao
    else return ()

escolherOpcao :: String -> IO()
escolherOpcao nome = do
    comentario_ou_votarAvaliacao
    op <- getLine
    if (op == "2") then do
        menu_votar_avaliacao
        atribuirNivel nome
        
    else
        adicionarComentario nome


adicionarComentario :: String -> IO ()
adicionarComentario nome = do
    putStrLn ("Digite um comentario sobre a disciplina " ++ nome)
    comentario <- getLine
    avaliacoes <- pegarAvaliacao
    atualizaTxt nome avaliacoes
    appendFile "avaliacao.txt" (nome ++ ";" ++ (pegaNivel nome avaliacoes ) ++ ";" ++ comentario ++ " " ++
                (pegaComentarios nome avaliacoes) ++ "\n") 

atribuirNivel :: String -> IO ()
atribuirNivel nome = do
    nivel <- getLine
    avaliacoes <- pegarAvaliacao
    atualizaTxt nome avaliacoes
    appendFile "avaliacao.txt" (nome ++ ";" ++ (verificaNivel (read nivel)) ++ ";" ++
                (pegaComentarios nome avaliacoes) ++ "\n") 

atualizaTxt :: String -> [String] -> IO ()
atualizaTxt nome avaliacoes = do
    handle <- openFile "avaliacao.txt" ReadMode  
    writeFile "novo.txt" ""
    contents <- hGetContents handle  
    let todoTasks = lines contents   
    let newTodoItems = deletar nome avaliacoes todoTasks
    appendFile "novo.txt" (unlines newTodoItems) 
    hClose handle  
    removeFile "avaliacao.txt"  
    renameFile "novo.txt" "avaliacao.txt"  

deletar :: String -> [String] -> [String] -> [String]
deletar nome avaliacoes array =  delete (array !! (pegaIndice nome avaliacoes 0)) array

pegaIndice :: String -> [String] -> Int -> Int
pegaIndice nome [] n = n - (n+1)
pegaIndice nome (a:as) n = if ((splitOn ";" a) !! 0) == nome then n
                            else 0 + pegaIndice nome as (n + 1)

pegaNivel :: String -> [String] -> String
pegaNivel nome aval = (pegarDadosAval aval nome) !! 1

pegarDadosAval:: [String] -> String -> [String]
pegarDadosAval avaliacoes nome =  splitOn (";") (unwords [aval | aval <- avaliacoes, nome == ((splitOn ";" aval) !! 0)]) 


pegarAvaliacao :: IO [String]
pegarAvaliacao = do
    contents <- readFile "avaliacao.txt"   
    let todoTasks = lines contents
    return (zipWith (\n line -> line) [0..] todoTasks)

pegaComentarios :: String -> [String] -> String
pegaComentarios nome aval = if ((pegarDadosAval aval nome) !! 2) == "*" then ""
                            else (pegarDadosAval aval nome) !! 2

verificaNivel :: Int -> String
verificaNivel n 
    | n == 1 = "rasgada"
    | n == 2 = "de boa"
    | n == 3 = "carrego"
    | n == 4 = "tenso"
    | n == 5 = "peso"
    | otherwise = "Opção inválida!"

upper :: String -> String
upper [] = []
upper (a:as) = toUpper(a) : upper as

toStringComentarios :: String -> [String] -> String
toStringComentarios nome avaliacoes = auxCom (splitOn " " (pegaComentarios nome avaliacoes)) 1

auxCom :: [String] -> Int -> String
auxCom [] n = ""
auxCom (a:as) n = (show n) ++ " - " ++ a ++ "\n" ++ (auxCom as (n+1)) 