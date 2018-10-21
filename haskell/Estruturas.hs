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
            pre_requisitos :: [String],
            turmas :: [Turma]
        } deriving (Show)

    data Disciplina_matricula =
        Disciplina_matricula{
            nome_m :: String,
            creditos_m :: Int,
            turma_m :: Turma
        } deriving (Show)


    data Avaliacao =
        Avaliacao {
            nomeDisciplina :: String,
            comentarios :: [String],
            nivel :: Nivel
        } deriving (Show)
    
    data Nivel = Rasgada
                    | DeBoa
                    | Carrego
                    | Tenso
                    | Peso
                    | Nada deriving(Eq, Show)


    stringToNivel :: String -> Nivel
    stringToNivel palavra | (palavra == "rasgada") = Rasgada
                     | (palavra == "deBoa")   = DeBoa
                     | (palavra == "carrego") = Carrego
                     | (palavra == "tenso") = Tenso
                     | (palavra == "rasgada") = Peso
                     | otherwise = Nada

