module BancoDisciplinas where 
import Estruturas

fmcci = Disciplina "1" "FMCCI" 4 1 True [] [
    getTurma 3 10 6 8,
    getTurma 3 10 6 8 ]
p1 = Disciplina "2" "P1" 4 1 True [] [
    getTurma 2 14 4 16, 
    getTurma 2 8 4 10 ]
lp1 = Disciplina "3" "LP1" 4 1 True [] [
        getTurma 2 10 4 8, 
        getTurma 2 16 5 14 ]
ic = Disciplina "4" "IC" 4 1 True [] [
    getTurma 3 8 5 10, 
    getTurma 3 8 5 10]
fmccii = Disciplina "5" "FMCCII" 4 2 True [] [
    getTurma 2 10 5 8, 
    getTurma 2 10 5 8]
c1 = Disciplina "6" "C1" 4 2 True ["FMCCI"] [
    getTurma 2 14 4 16, 
    getTurma 2 14 4 16]
p2 = Disciplina "7" "P2" 4 2 True ["P1", "LP1"] [
    getTurma 4 8 6 10, 
    getTurma 4 8 6 10]
lp2 = Disciplina "8" "LP2" 4 2 True ["P1", "LP1"] [
    getTurma 4 8 6 10, 
    getTurma 4 8 6 10]
al = Disciplina "9" "AL" 4 3 True ["FMCCII"] [
    getTurma 3 14 5 16]
lc = Disciplina "10" "LC" 4 3 True ["FMCCII", "C1"] [
    getTurma 4 8 6 10]
c2 = Disciplina "11" "C2" 4 3 True ["FMCCII", "C1"] [
    getTurma 2 14 4 16]
eda = Disciplina "12" "EDA" 4 3 True ["P2", "LP2"] [
    getTurma 2 8 4 10,
    getTurma 3 8 5 10]
leda = Disciplina "13" "LEDA" 4 3 True ["P2", "LP2"] [
    getTurma 2 16 5 14,
    getTurma 2 16 5 14]
tg = Disciplina "14" "TG" 4 3 True [] [
    getTurma 3 10 6 10]
ip = Disciplina "15" "IP" 4 4 True ["FMCCII", "C1"] [
    getTurma 2 10 5 8,
    getTurma 2 10 5 8]
ps = Disciplina "16" "PS" 4 4 True ["P1", "LP1"] [
    getTurma 2 14 4 16,
    getTurma 2 14 4 16]
plp = Disciplina "17" "PLP" 4 4 True ["P1", "LP1"] [
    getTurma 3 16 6 14,
    getTurma 3 16 6 14]
bd1 = Disciplina "18" "BD1" 4 4 True ["EDA"] [
    getTurma 2 8 4 10,
    getTurma 3 14 5 16]
oac = Disciplina "19" "OAC" 4 4 True ["IC"] [
    getTurma 3 10 6 8,
    getTurma 4 8 6 10]
loac = Disciplina "20" "LOAC" 4 4 True ["IC"] [
    getTurma 4 8 6 10,
    getTurma 3 14 5 16]
ea = Disciplina "21" "EA" 4 5 True ["IP"] [
    getTurma 2 10 5 8]

disciplinas = [ fmcci, p1, lp1, ic, fmccii, c1, p2, lp2, al, lc, c2, eda, leda, tg, ip, ps, plp, 
                bd1, oac, loac, ea]

disicplinasPagas :: [String]              
disicplinasPagas = ["P1", "LP1", "IC"]

getTurma :: Int -> Int -> Int -> Int -> Turma
getTurma d1 h1 d2 h2 = Turma { horarios = [ Horario d1 h1, Horario d2 h2] }

getPrimeiroElemento::[Disciplina]->Disciplina
getPrimeiroElemento array = array !! 0


getDisciplinaNome::String->Disciplina
getDisciplinaNome nomeDisc = getPrimeiroElemento [disc | disc<-disciplinas, nomeDisc == (nome disc)]

atendePreRequisitos :: Disciplina -> [String] -> Bool
atendePreRequisitos d1 pagas = ehSubList (pre_requisitos d1) pagas

showObrigatoria :: Bool -> String
showObrigatoria True = "Obrigatoria"
showObrigatoria False = "Optativa"

toString :: Disciplina -> String
toString (Disciplina {codigo = c, nome = n, creditos = cr}) = "Disciplina: " ++ n ++ " - Creditos: " ++ show(cr) ++ " - Codigo: " ++ c

--toStringDetalhado :: Disciplina -> String
--toStringDetalhado (Disciplina {codigo c, nome n, creditos cr, periodo p, obrigatorio o, pre_requisitos pr, turmas t}) = c ++ n ++  

exibeDisciplinas :: [Disciplina] -> String
exibeDisciplinas disciplinas = "Disciplinas:\n" ++ exibeDisciplinasRec disciplinas

exibeDisciplinasRec :: [Disciplina] -> String
exibeDisciplinasRec [] = ""
exibeDisciplinasRec (x:xs) = (toString x) ++ "\n" ++(exibeDisciplinasRec xs)

ehSubList :: [String] -> [String] -> Bool
ehSubList l1 l2
    | l1 == []
        = True
    | length l1 > length l2
        = False
    | head l1 == head l2
        = ehSubList (tail l1) l2
    | head l1 /= head l2
        = ehSubList l1 (tail l2)