% BASE DE CONOCIMIENTO

padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge,maggie).
madreDe(selma, ling).

% PREDICADOS PEDIDOS EN CONSIGNA
tieneHijo(Progenitor) :-
    padreDe(Progenitor,_).

tieneHijo(Progenitor) :-
    madreDe(Progenitor,_).

hermanos(Hermano1,Hermano2) :-
    compartenPadre(Hermano1,Hermano2),
    compartenMadre(Hermano1,Hermano2).
    
compartenPadre(Hermano1,Hermano2) :-
    padreDe(UnProgenitor,Hermano1),
    padreDe(UnProgenitor,Hermano2), 
    Hermano1 \= Hermano2.

compartenMadre(Hermano1,Hermano2) :-
    madreDe(UnaProgenitora,Hermano1),
    madreDe(UnaProgenitora,Hermano2), 
    Hermano1 \= Hermano2.

medioHermanos(Hijo1,Hijo2) :-
    compartenPadre(Hijo1,Hijo2), 
    not(compartenMadre(Hijo1,Hijo2)).

medioHermanos(Hijo1,Hijo2) :-
    compartenMadre(Hijo1,Hijo2),
    not(compartenPadre(Hijo1,Hijo2)).

tioDe(Tio,Sobrino) :-
    madreDe(Progenitor,Sobrino),
    hermanos(Tio,Progenitor).

tioDe(Tio,Sobrino) :-
    padreDe(Progenitor,Sobrino),
    hermanos(Tio,Progenitor).

abueloMultiple(Abuelo) :-
  abueloDe(Abuelo, UnNieto),
  abueloDe(Abuelo, OtroNieto),
  UnNieto \= OtroNieto.

abueloDe(Abuelo, Nieto) :-
  padreDe(Abuelo, Papa),
  padreDe(Papa, Nieto).

% BONUS
% descendiente(Descendiente,Ascendiente) :-