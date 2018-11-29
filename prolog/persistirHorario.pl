:- module(persistirHorario, []).

read_horario(Stream,[]):-
    at_end_of_stream(Stream).

read_horario(Stream,[X, Y|L]):-
    \+  at_end_of_stream(Stream),
    read(Stream, (X, Y)),
    read_horario(Stream,L). 

% recupera o arquivo com horario do aluno e retorna uma lista do horario 
recuperaHorario(Arquivo, Horario) :- 
    (exists_file(Arquivo) -> 
    (open(Arquivo, read, Str),
    read_horario(Str, Horario),
    close(Str)); writeln('Arquivo inexistente')).

% atualiza o horario no arquivo 
atualizaHorario(Arquivo, Lista) :- 
    (exists_file(Arquivo) -> 
    (delete_file(Arquivo),
    access_file(Arquivo, write),
    open(Arquivo, append, Str), 
    escreve(Str, Lista), 
    close(Str)); writeln('Arquivo inexistente.')).

escreve(Str, []) :- write(Str, '').
escreve(Str, [X, Y|L]) :- 
    write(Str, (X, Y)) , write(Str, '.\n'),length(L, T), (T > 2 ->
    escreve(Str, L); (escreve2(Str, L))).

escreve2(Str, [X, Y]) :- 
        write(Str, (X, Y)) , write(Str, '.').
    

% metodo que cria o arquivo e escreve o horario.
criaArquivo(Arquivo, Lista) :-  
        access_file(Arquivo, write),
        open(Arquivo, append, Str), 
        escreve(Str, Lista), 
        close(Str).
