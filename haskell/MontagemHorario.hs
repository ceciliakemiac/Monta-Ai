module MontagemHorario where
import GeradorHorario
import BancoDisciplinas
import Estruturas
import Data.Char

montarHorario :: IO ()
montarHorario = do
    putStrLn "Menu montagem de horario"
    putStrLn ""
    discDisponiveis
    adicionarOuRemoverDisciplinas disciplinasCandidatas
    where
        disciplinasCandidatas = [d | d <- (getDiscObrigatorias disciplinas), atendePreRequisitos  d disciplinasPagas, not(foiPaga disciplinasPagas d)]


discDisponiveis::IO()
discDisponiveis = do
    putStrLn "Estas são as disciplinas OBRIGATÓRIAS disponíveis para matricula"
    printDisciplinas $ [d | d <- (getDiscObrigatorias disciplinas), atendePreRequisitos  d disciplinasPagas, not(foiPaga disciplinasPagas d)]
    putStrLn ""
    putStrLn "Estas são as disciplinas OPTATIVAS disponíveis para matricula"
    printDisciplinas $ [d | d <- (getDiscOptativas disciplinas), atendePreRequisitos  d disciplinasPagas, not(foiPaga disciplinasPagas d)]
    
adicionarOuRemoverDisciplinas:: [Disciplina] -> IO()
adicionarOuRemoverDisciplinas  d = do
    putStrLn ""
    putStrLn "Calculando possibilidades com as seguintes disciplinas"
    printDisciplinas d
    if (length d > 9) then putStrLn "ATENÇÂO: a partir de 9 disciplinas pode demorar um pouco"
    else putStr ""
    putStrLn ""
    putStrLn "deseja adicionar(a) ou remover(r) alguma disciplina ou continuar(c)?"
    op <- getLine
    if(op == "c") then do
        putStrLn "Processando..."
        putStrLn "Possíveis horarios, por favor escolha um:"
        iterarHorarios (geraHorariosValidos d) 0 False
    else if(op == "a") then do 
        dis <- getLine
        adicionarDisc d [toUpper c | c <- dis]             
    else if(op == "r") then do 
        dis <- getLine
        adicionarOuRemoverDisciplinas $ removeDisciplina [toUpper c | c <- dis] d
    else adicionarOuRemoverDisciplinas d

printDisciplinas :: [Disciplina] -> IO()
printDisciplinas [] = putStrLn ""
printDisciplinas (d:ds) = do 
    putStr $ nome d ++ " "
    printDisciplinas ds

adicionarDisc::[Disciplina] -> String -> IO()
adicionarDisc disc nomed =  do
    if(existeDisciplina disciplinas nomed) then do
        if(atendePreRequisitos (pegaDisciplina disciplinas nomed) disciplinasPagas) then do
            if (not(foiPaga disciplinasPagas (pegaDisciplina disciplinas nomed))) then do
                adicionarOuRemoverDisciplinas $ removeDiscDuplicadas' $ disc ++ [(pegaDisciplina disciplinas nomed)]
            else do 
                putStrLn "Disciplina já foi paga"
                adicionarOuRemoverDisciplinas disc
        else do
            putStrLn "Diciplina não antende pre-requisitos"
            adicionarOuRemoverDisciplinas disc 
    else do
        putStrLn "Diciplina não encontrada"
        adicionarOuRemoverDisciplinas disc


iterarHorarios::[[Disciplina_matricula]] -> Int -> Bool -> IO()
iterarHorarios horarios n escolheu
                    | length horarios == 0 = putStrLn "Não foi possível gerar nenhuma possibilidade com estas disciplinas"
                    | escolheu = adicionarOuRemoverDisciplinasHorario $ horarios !! n
                    | otherwise =  menuEscolherHorario horarios n

menuEscolherHorario :: [[Disciplina_matricula]] -> Int -> IO()
menuEscolherHorario h n = do
    putStrLn $ printHorario $ h !! n 
    putStrLn $ "escolher(e) anterior(a) proximo(p) " ++ show (n+1) ++ " de " ++ show (length h)
    op <- getLine
    if(op == "p") then do
        if(length h == n + 1) then iterarHorarios h 0 False 
        else iterarHorarios h (n+1) False 
    else  if (op == "a")  then do 
        if(n <= 0) then iterarHorarios h 0 False 
        else iterarHorarios h (n-1) False 
    else  if (op == "e")  then iterarHorarios h n True 
    else do putStrLn "opcao invalida " 
            menuEscolherHorario h n

adicionarOuRemoverDisciplinasHorario :: [Disciplina_matricula] -> IO()
adicionarOuRemoverDisciplinasHorario horario = do
    putStrLn "deseja adicionar(a) ou remover(r) alguma disciplina ou salvar(s)?"
    op <- getLine
    if(op == "s") then do
        putStrLn "Salvando..."
    else if(op == "a") then do 
        dis <- getLine
        adicionarDiscHorario horario [toUpper c | c <- dis]             
    else if(op == "r") then do 
        dis <- getLine
        if(limiteCreditos $ removeDisciplina' [toUpper c | c <- dis] horario) then
            adicionarOuRemoverDisciplinasHorario $ removeDisciplina' [toUpper c | c <- dis] horario
        else do
            putStrLn "Não foi possível remover disciplinas por causa do limite de creditos"
            adicionarOuRemoverDisciplinasHorario horario
    else do 
        adicionarOuRemoverDisciplinasHorario horario

adicionarDiscHorario::[Disciplina_matricula] -> String -> IO()
adicionarDiscHorario disc nomed =  do
    if(existeDisciplina disciplinas nomed) then do
        if(atendePreRequisitos (pegaDisciplina disciplinas nomed) disciplinasPagas) then do
            if (not(foiPaga disciplinasPagas (pegaDisciplina disciplinas nomed))) then do
                if (not (jaTem nomed disc)) then iterarHorarios (adicionaDiscNoHorario (pegaDisciplina disciplinas nomed) disc) 0 False 
                else do
                    putStrLn "Disciplina já no horario"
                    adicionarOuRemoverDisciplinasHorario disc
            else do 
                putStrLn "Disciplina já foi paga"
                adicionarOuRemoverDisciplinasHorario disc
        else do
            putStrLn "Diciplina não antende pre-requisitos"
            adicionarOuRemoverDisciplinasHorario disc 
    else do
        putStrLn "Diciplina não encontrada"
        adicionarOuRemoverDisciplinasHorario disc
