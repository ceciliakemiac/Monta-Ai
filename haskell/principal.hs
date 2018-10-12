import Estruturas


main :: IO()
main = do
    let nivel = "rasgada"
    let nivelReal = stringToNivel nivel
    print nivelReal
    -- let horario1 = Horario {dia=1, hora=10}
    -- let horario2 = Horario {dia=2, hora=25}
    -- let turma1 = Turma { horarios = [horario1, horario2]}
    -- let loac = Disciplina { codigo = "LOAC", nome = "LOAC", creditos = 4, periodo = 2, obrigatorio = False, pre_requisitos = [], turmas = [turma1]}
    -- print loac
    -- let horario3 = Horario 1 2
    -- print horario3
