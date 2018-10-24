module Planilha where
import Estruturas

-- getHorarios::[Turma]->[[Horario]]
-- getHorarios [x] = [horarios x]
-- getHorarios (x:xs) = (horarios x):(getHorarios xs)

-- temDiaeHora::Int->Int->Disciplina->Bool
-- temDiaeHora diaD horaD disc | ((horariosD !! 0)

planilha = "          SEGUNDA          TERÇA          QUARTA          QUINTA          SEXTA " 
         ++ "\n\n" ++ " 8:00     BD1 t-1          AA t-1         LC t-1         Comp t-2         AA t-1"
         ++ "\n\n" ++ "          CDP t-1         Comp t-1        LOAC t-1       D1/2 t-1         AS t-1"
         ++ "\n\n" ++ "          EDA t-1         D1/2 t-1        LP t-1         EA t-1           ATAL t-1"
         ++ "\n\n" ++ "          Ing t-1         EDA t-2         OAC t-2        FMCCII t-1       FMCCI t-1"
         ++ "\n\n" ++ "          P1 t-2          Fut t-1         P2 t-1         FMCCII t-2       FMCCI t-2"
         ++ "\n\n" ++ "          SO t-1          GRC t-1         P2 t-2         JD t-1           GRC t-1"
         ++ "\n\n" ++ "                          IC t-1          PC1 t-1        LP1 t-1          OAC t-1"
         ++ "\n\n" ++ "                          IC t-2                         PC1 t-1                 "
         ++ "\n\n" ++ "                          Ing t-2                        PTCC t-1"
         ++ "\n\n" ++ "                          JD t-1                         TCC t-1"
         ++ "\n\n" ++ "                          LP2 t-1                        VD t-1"
         ++ "\n\n" ++ "                          LP2 t-2"
         ++ "\n\n" ++ "                          PSO t-1"
         ++ "\n\n" ++ "                          RC t-1"
       ++ "\n\n\n" ++ " 10:00    EA t-1          AS t-1          BD1 t-1        EDA t-2          DC t-1"
         ++ "\n\n" ++ "          FMCCII t-1      ATAL t-1        COP t-1        IC t-1           IC t-1"
         ++ "\n\n" ++ "          FMCCII t-2      Comp t-2        EDA t-1        IC t-2           LOAC t-1"
         ++ "\n\n" ++ "          IP t-1          DC t-1          Ing t-1        IP t-1           LP t-1"
         ++ "\n\n" ++ "          IP t-2          FMCCI t-1       P1 t-2         IP t-2           OAC t-2"
         ++ "\n\n" ++ "          LP1 t-1         FMCCI t-2       SO t-1         Ing t-2          P2 t-1"
         ++ "\n\n" ++ "          TCC t-1         OAC t-1                        LP2 t-1          P2 t-2"
         ++ "\n\n" ++ "          VD t-1          PC1 t-2                        LP2 t-2          TG t-1"
         ++ "\n\n" ++ "                          TCC t-2                        PC1 t-2"
         ++ "\n\n" ++ "                          TG t-1                         PSO t-1"
         ++ "\n\n" ++ "                                                         RC t-1"
         ++ "\n\n" ++ "                                                         TCC t-2"
       ++ "\n\n\n" ++ " 14:00    C1 t-1          AL t-1          ETI t-1        LEDA t-1         IA t-1"
         ++ "\n\n" ++ "          C1 t-2          BD1 t-2                        LEDA t-2         PLP t-1"
         ++ "\n\n" ++ "          C2 t-1          LOAC t-2                       LP1 t-2          PLP t-2"
         ++ "\n\n" ++ "          ES t-1          MC t-1                         PC t-1           TC t-1"
         ++ "\n\n" ++ "          P1 t-1          PC2 t-2                        RC t-2           VVTS t-1"
         ++ "\n\n" ++ "          PF t-1          PDM t-1"
         ++ "\n\n" ++ "          PS t-1          PTCC t-1"
         ++ "\n\n" ++ "          PS t-2"
       ++ "\n\n\n" ++ " 16:00    ETI t-1         IA t-1          C1 t-1         AL t-1           PDW t-1"
         ++ "\n\n" ++ "          LEDA t-1        PLP t-1         C1 t-2         BD1 t-2"
         ++ "\n\n" ++ "          LEDA t-2        PLP t-2         C2 t-1         Comp t-1"
         ++ "\n\n" ++ "          LP1 t-2         RC t-2          ES t-1         LOAC t-2"
         ++ "\n\n" ++ "          PC t-1                          P1 t-1         MC t-1"
         ++ "\n\n" ++ "          TC t-1                          PF t-1         PC2 t-1"
         ++ "\n\n" ++ "          VVTs t-1                        PS t-1"
         ++ "\n\n" ++ "                                          PS t-2"
         ++ "\n\n"
