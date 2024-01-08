pai(mario, rodrigo).
pai(mario, ramiro).
pai(rodrigo, luiz).
pai(rodrigo, pedro).
pai(rodrigo, fernanda).
pai(ramiro, ivete).
pai(julio, clara). 
pai(julio, escobar). 
pai(luiz, bruna).
pai(valdir, amanda).

mae(suzana, rodrigo).
mae(suzana, ramiro).
mae(ana, luiz).
mae(ana, pedro).
mae(ana, fernanda).
mae(monica, ivete).
mae(fernanda, clara). 
mae(fernanda, escobar).
mae(joice, amanda).
mae(amanda, bruna).

filho(A, B) :- pai(B,A).

irmao1(X,Y) :- mae(Z,X),mae(Z,Y),X \= Y.
irmao2(X,Y) :- pai(Z,X),pai(Z,Y),X \= Y.

tio(Z,Y) :- irmao1(Z,X),mae(X,Y).
tio(Z,Y) :- irmao2(Z,X),pai(X,Y).

primo(Z,Y) :- tio(V,Y), pai(V,Z).
primo(Z,Y) :- tio(V,Y), mae(V,Z).

avo(A,C) :- pai(B,C), pai(A,B).
avo(Z,Y):- mae(X,Y),pai(Z,X).

avoh(A,C) :- mae(A,B), pai(B,C).

neto(A,C) :- avo(C,A).
neto(A,C) :- avoh(C,A).

bisavo(A,B) :- filho(X,A), filho(Y,X), filho(B,Y).