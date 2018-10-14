import Estruturas
import BancoDisciplinas

main :: IO()
main = do
    let d1 = getDisciplinaNome "EDA"
    print d1
    putStrLn (show (disciplinas))
