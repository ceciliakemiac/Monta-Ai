module Avaliacao
(passoAvaliacao) where

import BancoDisciplinas
import Estruturas

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



