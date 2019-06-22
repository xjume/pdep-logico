madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(marge, bart).
madreDe(marge, lisa).

padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(homero, bart).
padreDe(homero, lisa).

compartenPadre(UnHermano, OtroHermano) :-
  padreDe(Papa, UnHermano),
  padreDe(Papa, OtroHermano),
  UnHermano \= OtroHermano.

compartenMadre(UnHermano, OtroHermano) :-
  madreDe(Papa, UnHermano),
  madreDe(Papa, OtroHermano),
  UnHermano \= OtroHermano.

distintaMama(UnaPersona, OtraPersona) :-
  madreDe(UnaMama, UnaPersona),
  madreDe(OtraMama, OtraPersona),
  UnaMama \= OtraMama.

distintoPapa(UnaPersona, OtraPersona) :-
  padreDe(UnPapa, UnaPersona),
  padreDe(OtroPapa, OtraPersona),
  UnPapa \= OtroPapa.

medioHermanos(UnHermano, OtroHermano) :-
  compartenPadre(UnHermano, OtroHermano),
  distintaMama(UnHermano, OtroHermano).

medioHermanos(UnHermano, OtroHermano) :-
  compartenMadre(UnHermano, OtroHermano),
  distintoPapa(UnHermano, OtroHermano).

% alternativa usando not
medioHermanos2(UnHermano, OtroHermano) :-
  compartenPadre(UnHermano, OtroHermano),
  not(compartenMadre(UnHermano, OtroHermano)).

medioHermanos2(UnHermano, OtroHermano) :-
  compartenMadre(UnHermano, OtroHermano),
  not(compartenPadre(UnHermano, OtroHermano)).

abueloMultiple(Abuelo) :-
  abueloDe(Abuelo, UnNieto),
  abueloDe(Abuelo, OtroNieto),
  UnNieto \= OtroNieto.

abueloDe(Abuelo, Nieto) :-
  padreDe(Abuelo, Papa),
  padreDe(Papa, Nieto).
% ... todas las combinaciones para relacionar un Abuelo con su Nieto







% materia(Materia, Año).
materia(algoritmos, 1).
materia(analisisI, 1).
materia(pdp, 2).
materia(sintaxis, 2).
materia(proba, 2).

% nota(Alumno, Materia, Nota).
nota(nicolas, pdp, 10).
nota(nicolas, sintaxis, 8).
nota(nicolas, proba, 7).
nota(malena, algoritmos, 6).
nota(malena, proba, 2).
nota(raul, analisisI, 9).

% Una materia es jodida si nadie la aprobó con 10
materiaJodida(Materia) :-
  materia(Materia, _),
  not(fueAprobadaConMasDe9(Materia)).

fueAprobadaConMasDe9(Materia) :-
  nota(_, Materia, Nota),
  Nota > 9.

materiaJodida2(Materia) :-
  materia(Materia, _),
  not(nota(_, Materia, 10)).

% Un alumno terminó un año si aprobó todas las materias de ese año
terminoAño(Alumno, Año) :-
  alumno(Alumno),
  año(Año),
  forall(materia(Materia, Año), aprobo(Alumno, Materia)).

aprobo(Alumno, Materia) :-
  nota(Alumno, Materia, Nota),
  Nota >= 6.

alumno(Alumno) :-
  nota(Alumno, _, _).

año(Año) :-
  materia(_, Año).