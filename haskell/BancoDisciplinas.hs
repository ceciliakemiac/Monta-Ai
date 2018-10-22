module BancoDisciplinas where 
import Estruturas

fmcc1 = Disciplina "1" "FMCC1" 4 1 True [] [
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
fmcc2 = Disciplina "5" "FMCC2" 4 2 True [] [
    getTurma 2 10 5 8, 
    getTurma 2 10 5 8]
c1 = Disciplina "6" "C1" 4 2 True ["FMCC1"] [
    getTurma 2 14 4 16, 
    getTurma 2 14 4 16]
p2 = Disciplina "7" "P2" 4 2 True ["P1", "LP1"] [
    getTurma 4 8 6 10, 
    getTurma 4 8 6 10]
lp2 = Disciplina "8" "LP2" 4 2 True ["P1", "LP1"] [
    getTurma 4 8 6 10, 
    getTurma 4 8 6 10]
al = Disciplina "9" "AL" 4 3 True ["FMCC2"] [
    getTurma 3 14 5 16]
lc = Disciplina "10" "LC" 4 3 True ["FMCC2", "C1"] [
    getTurma 4 8 6 10]
c2 = Disciplina "11" "C2" 4 3 True ["FMCC2", "C1"] [
    getTurma 2 14 4 16]
eda = Disciplina "12" "EDA" 4 3 True ["P2", "LP2"] [
    getTurma 2 8 4 10,
    getTurma 3 8 5 10]
leda = Disciplina "13" "LEDA" 4 3 True ["P2", "LP2"] [
    getTurma 2 16 5 14,
    getTurma 2 16 5 14]
tg = Disciplina "14" "TG" 4 3 True [] [
    getTurma 3 10 6 10]
ip = Disciplina "15" "IP" 4 4 True ["FMCC2", "C1"] [
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
as = Disciplina "22" "AS" 4 5 True ["P1", "LP1"] [
    getTurma 3 10 6 8]
es = Disciplina "23" "ES" 4 5 True ["P1", "LP1"] [
    getTurma 2 14 4 16]
rc = Disciplina "24" "RC" 4 5 True ["IC"] [
    getTurma 3 8 5 10,
    getTurma 3 16 5 14]
so = Disciplina "25" "SO" 4 5 True ["LOAC"] [
    getTurma 2 8 4 10]
tc = Disciplina "26" "TC" 4 5 True ["PLP"] [
    getTurma 2 16 6 14]
mc = Disciplina "27" "MC" 4 6 True [] [
    getTurma 3 14 5 16]
pc = Disciplina "28" "PC" 4 6 True ["SO"] [
    getTurma 2 16 5 14]
ia = Disciplina "29" "IA" 4 6 True ["TC"] [
    getTurma 3 16 6 14]
atal = Disciplina "30" "ATAL" 4 7 True ["EDA", "LEDA"] [
    getTurma 3 10 6 8]
comp = Disciplina "31" "COMP" 4 7 True ["PLP"] [
    getTurma 3 8 5 10,
    getTurma 3 10 5 8]
pc1 = Disciplina "32" "PC1" 4 8 True ["ES"] [
    getTurma 3 10 5 8,
    getTurma 3 10 5 8]
ptcc = Disciplina "33" "PTCC" 4 8 True [] [
    getTurma 3 14 5 8]
pc2 = Disciplina "34" "PC2" 4 9 True ["PC1"] [
    getTurma 3 14 5 16]
tcc = Disciplina "35" "TCC" 4 9 True ["PTCC"] [
    getTurma 2 10 5 8,
    getTurma 3 10 5 8]
vd = Disciplina "36" "VD" 4 0 False [] [
    getTurma 2 10 5 8]
cdp = Disciplina "37" "CDP" 4 0 False [] [
    getTurma 2 8 4 10]
vvts = Disciplina "38" "VVTS" 4 0 False ["ES"] [
    getTurma 2 16 6 14]
pwd = Disciplina "39" "PWD" 4 0 False [] [
    getTurma 3 14 6 16]
pso = Disciplina "40" "PSO" 4 0 False [] [
    getTurma 3 8 5 10]
aa = Disciplina "41" "AA" 4 0 False ["P1", "LP1"] [
    getTurma 2 18 5 18]
eti = Disciplina "42" "ETI" 4 0 False ["EA"] [
    getTurma 2 16 4 14]
jd = Disciplina "43" "JD" 4 0 False [] [
    getTurma 2 18 4 18]
pf = Disciplina "44" "PF" 4 0 False ["PLP"] [
    getTurma 2 14 4 16]
d = Disciplina "45" "D1/2" 2 0 False [] [
    getTurma 2 18 5 8]
grc = Disciplina "46" "GRC" 4 0 False [] [
    getTurma 3 7 6 7]
lp = Disciplina "47" "LP" 4 0 False [] [
    getTurma 4 8 6 10]
ing = Disciplina "48" "ING" 4 0 False [] [
    getTurma 2 8 4 10,
    getTurma 2 18 5 10]
fut = Disciplina "49" "FUT" 2 0 False [] [
    getTurma 2 18 5 18]
dc = Disciplina "50" "DC" 4 0 False [] [
    getTurma 3 10 6 8]


disciplinas = [fmcc1, p1, lp1, ic, fmcc2, c1, p2, lp2, al, lc, c2, eda, leda, tg, ip, ps, plp, 
                bd1, oac, loac, ea, as, es, rc, so, tc, mc, pc, ia, atal, comp, pc1, ptcc, pc2, 
                tcc, vd, cdp, vvts, pwd, pso, aa, eti, jd, pf, d, grc, lp, ing, fut, dc]

disciplinasPagas :: [String]              
disciplinasPagas = ["P1", "LP1", "IC"]

getTurma :: Int -> Int -> Int -> Int -> Turma
getTurma d1 h1 d2 h2 = Turma { horarios = [Horario d1 h1, Horario d2 h2] }

getPrimeiroElemento :: [Disciplina] -> Disciplina
getPrimeiroElemento array = array !! 0

getDisciplinaNome::String -> Disciplina
getDisciplinaNome nomeDisc = getPrimeiroElemento [disc | disc<-disciplinas, nomeDisc == (nome disc)]

atendePreRequisitos :: Disciplina -> [String] -> Bool
atendePreRequisitos d1 pagas = ehSubList (pre_requisitos d1) pagas

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


disciplinasDisponiveis :: [Disciplina] -> String
disciplinasDisponiveis [] = ""
disciplinasDisponiveis (d:ds) = if((atendePreRequisitos d disciplinasPagas) && not(foiPaga disciplinasPagas d))
                                then (toString d) ++ "\n" ++ (disciplinasDisponiveis ds) 
                                else disciplinasDisponiveis ds

foiPaga :: [String] -> Disciplina -> Bool
foiPaga [] disc = False
foiPaga (a:as) disc = if(a == nome disc) then True else foiPaga as disc

getDiscPorPeriodo :: Int -> [Disciplina] -> [Disciplina]
getDiscPorPeriodo n [] = []
getDiscPorPeriodo n (a:as) = if((periodo a) == n) then a : getDiscPorPeriodo n as
                                else getDiscPorPeriodo n as

getDiscObrigatorias :: [Disciplina] -> [Disciplina]
getDiscObrigatorias [] = []
getDiscObrigatorias (a:as) = if (obrigatorio a) then a : getDiscObrigatorias as
                            else getDiscObrigatorias as

getDiscOptativas :: [Disciplina] -> [Disciplina]
getDiscOptativas [] = []
getDiscOptativas (a:as) = if not(obrigatorio a) then a : getDiscOptativas as
                            else getDiscOptativas as
                            
toString :: Disciplina -> String
toString (Disciplina {codigo = c, nome = n, creditos = cr}) = 
    "Disciplina: " ++ n ++ " - Creditos: " ++ show(cr) ++ " - Codigo: " ++ c 

getNome :: Disciplina -> String
getNome d1 = (nome d1)

existeDisciplina :: [Disciplina] -> String -> Bool
existeDisciplina lista nomeDsc
    | null lista
        = False
    | nomeDsc == (getNome (head lista))
        = True
    | otherwise = existeDisciplina (tail lista) nomeDsc
