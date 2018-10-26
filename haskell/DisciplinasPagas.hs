module DisciplinasPagas where
    import Avaliacao
    import Data.List.Split
    import System.IO  
    import System.Directory  
    import Data.List 
    import Data.Char
    import FuncoesAuxiliares

    adicionarDisciplina :: String -> IO ()
    adicionarDisciplina nome = do
        appendFile "disciplinasPagas.txt" (upper nome ++ "\n") 
    
    atualizaTxtPagas :: String -> [String] -> IO ()
    atualizaTxtPagas nome avaliacoes = do
        handle <- openFile "disciplinasPagas.txt" ReadMode  
        writeFile "novo.txt" ""
        contents <- hGetContents handle  
        let todoTasks = lines contents   
        let newTodoItems = deletar nome avaliacoes todoTasks
        appendFile "novo.txt" (unlines newTodoItems) 
        hClose handle  
        removeFile "disciplinasPagas.txt"  
        renameFile "novo.txt" "disciplinasPagas.txt"  
    
    removerDisciplina :: String -> IO()
    removerDisciplina nome = do
        dPagas <- pegarDiscPagas
        atualizaTxtPagas (upper nome) dPagas

    pegarDiscPagas :: IO [String]
    pegarDiscPagas = do
        contents <- readFile "disciplinasPagas.txt"   
        let todoTasks = lines contents
        return (zipWith (\n line -> line) [0..] todoTasks)
    
    toStringPagas :: [String] -> String
    toStringPagas [] = []
    toStringPagas (a:as) = "         " ++ (upper a) ++ "\n" ++ toStringPagas as

    limpaArquivo :: [String] -> IO()
    limpaArquivo [] = return()
    limpaArquivo (a:as) = do
        removerDisciplina a
        limpaArquivo as