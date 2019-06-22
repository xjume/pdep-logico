jugador(amarillo). jugador(magenta). jugador(negro). jugador(rojo).

continente(americaDelSur). continente(americaDelNorte). continente(asia). continente(oceania).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(asia, kamchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(asia, filipinas).
estaEn(oceania, australia).
estaEn(oceania, sumatra).
estaEn(oceania, java).
estaEn(oceania, borneo).

ocupa(argentina, magenta).
ocupa(chile, negro).
ocupa(brasil, amarillo).
ocupa(uruguay, rojo).
ocupa(alaska, amarillo).
ocupa(yukon, amarillo).
ocupa(canada, amarillo).
ocupa(oregon, amarillo).
ocupa(kamchatka, negro).
ocupa(china, amarillo).
ocupa(siberia, amarillo).
ocupa(japon, amarillo).
ocupa(australia, negro).
ocupa(sumatra, negro).
ocupa(java, negro).
ocupa(borneo, negro).

sonLimitrofes(X, Y) :- limitrofes(X, Y). sonLimitrofes(X, Y) :- limitrofes(Y, X).

limitrofes(argentina, brasil).
limitrofes(argentina, chile).
limitrofes(argentina, uruguay).
limitrofes(uruguay, brasil).
limitrofes(alaska, kamchatka).
limitrofes(alaska, yukon).
limitrofes(canada, yukon).
limitrofes(alaska, oregon).
limitrofes(canada, oregon).
limitrofes(siberia, kamchatka).
limitrofes(siberia, china).
limitrofes(china, kamchatka).
limitrofes(japon, china).
limitrofes(japon, kamchatka).
limitrofes(australia, sumatra).
limitrofes(australia, java).
limitrofes(australia, borneo).
limitrofes(australia, chile).

% Relaciona un jugador y un continente si el jugador ocupa todos los países del mismo.
% ocupaContinente(negro,oceania).
ocupaContinente(Jugador,Continente):-
    forall(estaEn(Continente,Pais),ocupa(Pais,Jugador)).

% Es verdadero para un país si nadie lo ocupa.
% desocupado(polonia).
desocupado(Pais):-
    forall(jugador(Jugador),not(ocupa(Pais,Jugador))).

% Se cumple para los continentes en los cuales todos los jugadores ocupan algún país.
% estaPeleado(americaDelSur).
estaPeleado(Continente):-
    forall(jugador(Jugador),ocupaPaisEnContinente(Continente,Pais,Jugador)).

ocupaPaisEnContinente(Continente,Pais,Jugador):-
    estaEn(Continente,Pais),
    ocupa(Pais,Jugador).

% Relaciona un jugador y un continente si el jugador no ocupa ningún país del mismo.
% continenteLibre(magenta,asia).
continenteLibre(Jugador,Continente):-
    forall(estaEn(Continente,Pais),not(ocupa(Pais,Jugador))).

% Se cumple para los jugadores que ocupan países en un único continente.
% seAtrinchero(rojo).
seAtrinchero(Jugador):-
    .

% Se cumple para los países cuyos limítrofes están todos ocupados por otros jugadores.
% estaEnElHorno(argentina).
estaEnElHorno(Pais):-
    ocupa(Pais,UnJugador),
    forall(limitrofes(Pais,OtroPais),ocupa(OtroPais,OtroJugador)),
    UnJugador \= OtroJugador.
