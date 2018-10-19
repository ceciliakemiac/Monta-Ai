import BancoDisciplinas
import Estruturas
import GeradorHorario


main::IO ()

main = do
    testePrintHorarios


d1 = Disciplina_matricula "FMCCI" 4 $ getTurma 3 10 6 8
d2 = Disciplina_matricula "P1" 4 $ getTurma 2 8 4 10
d3 =  Disciplina_matricula "P1" 4 $ getTurma 3 8 5 10
d4 = Disciplina_matricula "LP1" 4 $ getTurma 2 16 5 14 
d5 = Disciplina_matricula "LP1" 4 $ getTurma 3 8 5 10

horario = [d1, d2, d3, d4, d5]

testePrintHorarios :: IO ()
testePrintHorarios = putStr $ printHorario horario