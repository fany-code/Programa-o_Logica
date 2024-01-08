sudoku(S) :- resolve(S), mostraSolucao(S).

resolve(S) :- 
    resolveLinhas(S),
    resolveColunas(S),
    resolveQuadros(S).

resolveLinhas([]) :- !.
resolveLinhas([A|B]) :- diferente(A), resolveLinhas(B).

resolveColunas(S) :- 
    transposta(S, S_transposta),
    diferentesColunas(S_transposta).

diferentesColunas([]).
diferentesColunas([A|B]) :- diferente(A), diferentesColunas(B).

diferente([A, B, C, D]) :- 
   num(A), num(B), num(C), num(D), 
   A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

num(1).
num(2).
num(3).
num(4).

mostraSolucao([]):- !.
mostraSolucao([A|B]) :- 
    mostraLinha(A), nl, mostraSolucao(B).

mostraLinha([]) :- !.
mostraLinha([A|B]) :- 
    write(A), write(' '), mostraLinha(B).

transposta([], []).
transposta([[]|_], []) :- !.
transposta(M, [Linha|Ls]) :-
    transposta(M, Linha, Mt),
    transposta(Mt, Ls).

transposta([], [], []).
transposta([[X|Xs]|M], [X|Coluna], [Xs|Ms]) :- 
    transposta(M, Coluna, Ms).

resolveQuadros([]).
resolveQuadros(S) :- divQuadros(S, Q1, Q2, Q3, Q4),
    diffQuadros(Q1),
    diffQuadros(Q2),
    diffQuadros(Q3),
    diffQuadros(Q4).

diffQuadros([]).
diffQuadros([A|B]) :- diferente(A), diffQuadros(B).

divQuadros([], [], [], [], []).
divQuadros([[A, B], [C, D]|Resto], 
          [[A, B], [C, D]|Q1], Q2, Q3, Q4) :- 
              divQuadros(Resto, Q1, Q2, Q3, Q4).
            
divQuadros([[A, B, _, _], [C, D, _, _]|Resto], 
          Q1, [[A, B, _, _], [C, D, _, _]|Q2], Q3, Q4) :- 
              divQuadros(Resto, Q1, Q2, Q3, Q4).

divQuadros([[_, _, A, B], [_, _, C, D]|Resto], 
          Q1, Q2, [[_, _, A, B], [_, _, C, D]|Q3], Q4) :- 
                divQuadros(Resto, Q1, Q2, Q3, Q4).

divQuadros([[_, _, _, _], [_, _, _, _]|Resto], 
          Q1, Q2, Q3, [[_, _, _, _], [_, _, _, _]|Q4]) :- 
              divQuadros(Resto, Q1, Q2, Q3, Q4).

%   Exemplo de consulta:
%   -------------------
%?- sudoku([[4,_,_,_],[_,3,_,_],[_,_,1,_],[_,1,_,2]]).