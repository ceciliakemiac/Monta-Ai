module Estruturas where

    data Horario =
        Horario {
            dia :: Int,
            hora :: Int} 
        deriving (Show)
    
        
    data Turma = 
        Turma {
            horarios :: [Horario]
        } deriving (Show)
    
    
    data Disciplina =
        Disciplina {
            codigo :: String,
            nome :: String,
            creditos :: Int,
            periodo :: Int,
            obrigatorio :: Bool,
            pre_requisitos :: [Disciplina],
            turmas :: [Turma]
        } deriving (Show)


    data Nivel = Rasgada
                    | DeBoa
                    | Carrego
                    | Tenso
                    | Peso deriving(Eq, Show)


    stringToNivel :: String -> Nivel
    stringToNivel palavra | (palavra == "rasgada") = Rasgada
                     | (palavra == "deBoa")   = DeBoa
                     | (palavra == "carrego") = Carrego
                     | (palavra == "tenso") = Tenso
                     | (palavra == "rasgada") = Peso

