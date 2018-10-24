import Estruturas
import BancoDisciplinas
import Menu
import GeradorHorario
import Planilha


main :: IO ()
main = do

    Menu.logo
    Menu.principal
    -- putStrLn (show (geraTabelaHorario [a,b,c]))
    -- putStrLn (cabecalhoTabelaHorario)
    -- putStrLn (toString fmcc1)
    -- putStrLn (show (dia ((horarios ((turmas fmcc1) !! 0)) !! 0)))

    -- putStrLn (show ((turmas fmcc1) !! 0))
    -- putStrLn (toStringDisciplinaTurma fmcc1 "1")

    -- putStrLn (show (getHorarios (turmas fmcc1)))
    -- putStrLn (show (getHorarios (turmas fut)))
    -- putStrLn (string)

    -- putStrLn (show (geraTabelaHorario [a,b,c]))
    -- putStrLn (show (printHorario [a,b,c]))

    -- print "Teste de pre-requisitos"
    -- print ((atendePreRequisitos (getDisciplinaNome "P1") []) == True)
    -- print ((atendePreRequisitos (getDisciplinaNome "P2") ["P1", "LP1"]) == True)
    -- print ((atendePreRequisitos (getDisciplinaNome "P2") ["IC", "P1", "FMCCI"]) == False)
    -- print ((atendePreRequisitos (getDisciplinaNome "EDA") ["P1", "P2", "IC"]) == False)
    -- print ((atendePreRequisitos (getDisciplinaNome "EDA") ["P1", "P2", "IC", "OAC"]) == False)
    -- print ((atendePreRequisitos (getDisciplinaNome "EDA") ["P2", "IC", "P1", "OAC", "LP2"]) == True)



