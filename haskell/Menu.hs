module Menu
(principal,
logo,
comentario_ou_votarAvaliacao,
menuVotarAvaliacao) where


principal = do
        putStrLn "MENU"
        putStrLn "0 - Informar/Editar disciplinas que já paguei"
        putStrLn "1 - Montar horário do semestre"
        putStrLn "2 - Visualizar disciplinas"
        putStrLn "3 - Ver informações detalhadas de uma disciplina"
        putStrLn "4 - Avaliar disciplina"
        putStrLn "5 - SAIR"


logo = do
        putStrLn " __  __             _                            _           "
	putStrLn "|  \\/  |           | |                     /\\   (_)        "
	putStrLn "| \\  / | ___  _ __ | |_ __ _   ______     /  \\   _         "
	putStrLn "| |\\/| |/ _ \\| '_ \\| __/ _` | |______|   / /\\ \\ | |     "
	putStrLn "| |  | | (_) | | | | || (_| |           / ____ \\| |         "

comentario_ou_votarAvaliacao = do
        putStrLn "1 - Deixar um comentário"
        putStrLn "2 - Votar em uma avaliação" 

menuVotarAvaliacao = do
        putStrLn "O que achou da disciplina?"
        putStrLn "1 - rasgada"
        putStrLn "2 - de boa"
        putStrLn "3 - carrego"
        putStrLn "4 - tenso"
        putStrLn "5 - eh peso"