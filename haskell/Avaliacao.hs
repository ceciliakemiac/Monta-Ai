module Avaliacao where

import BancoDisciplinas
import Estruturas
import Data.List.Split
import System.IO  
import System.Directory  
import Data.List  


comentario_ou_votarAvaliacao = do
    putStrLn "1 - Deixar um comentário"
    putStrLn "2 - Votar em uma avaliação" 

passoAvaliacao :: IO()
passoAvaliacao = do
    putStrLn "Qual disciplina deseja avaliar?"
    nomeDisc <- getLine

    if (existeDisciplina disciplinas nomeDisc) then do
        let d1 = (getDisciplinaNome nomeDisc)
        escolherOpcao d1 
    else
        putStrLn "Disciplina não existe /:"
        -- 1 - Avaliar outra disciplina
        -- 2 - voltar ao menu


escolherOpcao :: Disciplina -> IO()
escolherOpcao disc = do
    comentario_ou_votarAvaliacao
    op <- getLine
    if (op == "1") then do
        comentarDisciplina disc 
    else
        putStrLn "avaliar"




comentarDisciplina :: Disciplina -> IO()
comentarDisciplina disc = do
    let nomeDisc = (getNome disc)
    putStrLn ("Digite um comentario sobre a disciplina " ++ nomeDisc)
    comentario <- getLine
    let aval = Avaliacao { nomeDisciplina = nomeDisc, comentarios = [], nivel = stringToNivel ""}
    let novaAvaliacao = (addComentario aval comentario)
    print novaAvaliacao


addComentario :: Avaliacao -> String -> Avaliacao
addComentario aval comentario = Avaliacao { nomeDisciplina = n, comentarios = com, nivel = niv}
    where
        n = (nomeDisciplina aval)
        niv = (nivel aval)
        com = ((comentarios aval) ++ [comentario])

adicionarComentario :: IO ()
adicionarComentario = do
    putStrLn ("Digite o nome da disciplina: ")
    nome <- getLine
    putStrLn ("Digite o comentario: ")
    comentario <- getLine
    avaliacoes <- pegarAvaliacao
    atualizaTxt nome avaliacoes
    appendFile "avaliacao.txt" (nome ++ ";" ++ (pegaNivel nome avaliacoes ) ++ ";" ++ comentario ++ " " ++
                (pegaComentarios nome avaliacoes) ++ "\n") 

atribuirNivel :: IO ()
atribuirNivel = do
    putStrLn ("Digite o nome da disciplina: ")
    nome <- getLine
    putStrLn ("Digite o nivel: ")
    nivel <- getLine
    avaliacoes <- pegarAvaliacao
    atualizaTxt nome avaliacoes
    appendFile "avaliacao.txt" (nome ++ ";" ++ nivel ++ ";" ++
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