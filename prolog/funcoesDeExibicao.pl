
exibePR([]) :- writeln("").
exibePR([X|XS]) :- write(X),
    write(" | "),
    exibePR(XS).

exibeTurmas([], N) :- writeln("").
exibeTurmas([X|XS], Nx) :- X = [D1, H1, D2, H2], 
    write("------ "), write(Nx), write(" | Dia "), write(D1), write("- hora: "), write(H1), write(" |"),
    write("| "), write(" | Dia "), write(D2), write("- hora: "), write(H2), writeln(" |"),
    N is Nx + 1,
    exibeTurmas(XS, N).