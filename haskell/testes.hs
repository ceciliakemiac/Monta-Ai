import BancoDisciplinas
import Estruturas
import GeradorHorario
import Avaliacao
-- import FuncoesDisciplinas


main::IO ()

main = do
     -- testePrintHorarios
    --  testeDisciplinasDisponiveis
    -- testeGetDiscPorPeriodo
    -- testeFoiPaga
    -- putStrLn (exibeDisciplinasRec disciplinas) 
    -- testePegaNivel
    adicionarComentario
    atribuirNivel
    

d1 = Disciplina_matricula "FMCCI" 4 $ getTurma 3 10 6 8
d2 = Disciplina_matricula "P1" 4 $ getTurma 2 8 4 10
d3 =  Disciplina_matricula "P1" 4 $ getTurma 3 8 5 10
d4 = Disciplina_matricula "LP1" 4 $ getTurma 2 16 5 14 
d5 = Disciplina_matricula "LP1" 4 $ getTurma 3 8 5 10

horario = [d1, d2, d3, d4, d5]

testeFoiPaga :: IO ()
testeFoiPaga = do
    let a = getDisciplinaNome "P1"
    print (foiPaga disciplinasPagas a)

testeDisciplinasDisponiveis :: IO ()
testeDisciplinasDisponiveis = putStrLn (disciplinasDisponiveis disciplinas)

testeGetDiscPorPeriodo :: IO ()
testeGetDiscPorPeriodo = putStrLn (getDiscPorPeriodo 2 disciplinas)

testePrintHorarios :: IO ()
testePrintHorarios = putStr $ printHorario horario

testePegaAvaliacao :: IO ()
testePegaAvaliacao = do
    a <- pegarAvaliacao
    print a

testePegaDadosAvaliacao :: IO ()
testePegaDadosAvaliacao = do
    a <- pegarAvaliacao
    print (pegarDadosAval a "fmcc1") 

testePegaNivel :: IO ()
testePegaNivel = do
    a <- pegarAvaliacao 
    let b = pegarDadosAval a "fmcc1"
    print (pegaIndice "ap1" a 0)
    -- print (length b)
    -- print (pegaNivel "fmcc1" b)

-- a :: IO ()
-- a = do
--     adicionarAval "p1"