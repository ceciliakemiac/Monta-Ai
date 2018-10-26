module MenuDisciplinasPagas (menuPagas) where
    import DisciplinasPagas
    import BancoDisciplinas
    import FuncoesAuxiliares

    menuPagas :: IO()
    menuPagas = do
        putStr ("\ESC[2J")
        putStrLn ("Menu de disciplinas pagas\n")
        putStrLn ("Quais disciplinas voce ja pagou?       | Digite \"pronto\" quando terminar")
        guardarPagas

    
    guardarPagas :: IO()
    guardarPagas = do
        disc <- getLine
        if ((upper disc) == "PRONTO") then  removerPagas
            else do
                if(existeDisciplina disciplinas (upper disc)) then do
                    adicionarDisciplina disc
                    guardarPagas
                else do
                    putStrLn ("ERRO! Disciplina não encontrada")
                    guardarPagas
    
    
    removerPagas :: IO()
    removerPagas = do
        pagas <- pegarDiscPagas
        putStrLn ("Deseja remover alguma disciplina que informou como paga? s/n, visualizar disciplinas pagas(v) ou apagar histórico(a):")
        comando <- getLine
        if(comando == "n") then do
            putStrLn "Você pagou as seguintes disciplinas:"
            putStrLn (toStringPagas pagas)
            retornoMenuPrincipal
        else if (comando == "v") then do
            putStrLn ("disciplinas pagas: ")
            putStrLn (toStringPagas pagas)
            removerPagas
        else if (comando == "a") then do
            limpaArquivo pagas
            retornoMenuPrincipal
            
        else do
            putStrLn ("Qual disciplina deseja remover? ")
            disc <- getLine
            removerDisciplina disc
            removerPagas
            
    retornoMenuPrincipal :: IO()
    retornoMenuPrincipal = do
        putStrLn ("\nDeseja retornar ao menu principal? s/n")
        c <- getLine
        if(c == "s") then do 
            putStr ("\ESC[2J")
            return()
            else menuPagas