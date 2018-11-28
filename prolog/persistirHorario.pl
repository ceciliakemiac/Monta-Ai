main:-
    open('meuh',read,Str),
    read_horario(Str,Horario),
    close(Str),
    test(Horario).

read_horario(Stream,[]):-
    at_end_of_stream(Stream).

read_horario(Stream,[X|L]):-
    \+  at_end_of_stream(Stream),
    read(Stream,X),
    read_horario(Stream,L). 

test(Conteudo) :- 
    open('meuh', write,Str),
    write(Str, Conteudo), nl(Str),
    close(Str).
