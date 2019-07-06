%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                1                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inspeccionSatisfactoria(Resto):-
  trabajaEn(Resto,_),
  not(rata(_,Resto)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                2                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chef(Empleado,Resto):-
  cocina(Empleado,_,_),
  trabajaEn(Resto,Empleado).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                3                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chefcito(Rata):-
  trabajaEn(Resto,linguini),
  rata(Rata,Resto).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                4                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cocinaBien(Chef,Plato):-
  trabajaEn(_,Chef),
  cocina(Chef,Plato,Experiencia),
  Experiencia > 7.

cocinaBien(remy,Plato):-
  cocina(_,Plato,_).                  % Tiene que ser un plato que alguien cocine.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                5                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
encargadoDe(Encargado,Plato,Resto):-
  cocinaYTrabajaEn(Encargado,Plato,Resto),
  forall( cocinaYTrabajaEn(OtroCocinero,Plato,Resto),
          tieneMenosExperiencia(OtroCocinero, Encargado,Plato)).

cocinaYTrabajaEn(Encargado,Plato,Resto):-
  trabajaEn(Resto,Encargado),
  cocina(Encargado,Plato,_).

tieneMenosExperiencia(OtroCocinero,Encargado,Plato):-
  cocina(Encargado,Plato,Exp1),
  cocina(OtroCocinero,Plato,Exp2),
  Exp1 >= Exp2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                6                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
saludable(Plato):-
  grupo(Plato).

saludable(Plato):-
  plato(Plato,TipoPlato,
  caloriasDe(TipoPlato,Calorias),
  Calorias < 75.

caloriasDe(entrada(Ingredientes),Calorias):-
  length(Ingredientes, CantidadIngredientes)
  Calorias is CantidadIngredientes*15.

caloriasDe(principal(Guarnicion,Minutos),Calorias):-
  caloriasGuarnicion(Guarnicion,CaloriasGuarnicion),
  Calorias is Minutos*5 + CaloriasGuarnicion.

caloriasDe(postre(Calorias),Calorias).

caloriasGuarnicion(papasFritas,50).
caloriasGuarnicion(pure,20).
caloriasGuarnicion(ensalada,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                7                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
criticaPositiva(Resto,Critico):-
  inspeccionSatisfactoria(Resto),
  positivoSegun(Critico,Resto).

positivoSegun(antonEgo,Resto):-
  especialistaEn(ratatouille,Resto).

positivoSegun(christophe,Resto):-
  findall(Chef,chef(Chef,Resto), Chefs),
  length(Chefs,CantidadChefs),
  CantidadChefs > 3.

positivoSegun(cormillot,Resto):-
  forall(seCocinaEn(Resto,Plato),saludable(Plato)),
  forall(seCocinaEn(Resto,Plato),tieneZanahoria(Plato)).

positivoSegun(gordonRamsey,Resto):-
  not(inspeccionSatisfactoria(Resto)).

especialistaEn(Plato,Resto):-
  seCocinaEn(Resto,Plato),
  forall(cocinaYTrabajaEn(Chef,Plato,Resto),cocinaBien(Chef,Plato)).

seCocinaEn(Resto,Plato):-.
  trabajaEn(Resto,Chef),
  cocina(Chef,Plato,_).

tieneZanahoria(Plato):-
  plato(Plato,entrada(Ingredientes)),
  member(Ingredientes,zanahoria).

% PROBLEMAS DE INVERSIBILIDAD: not, forall, findall, is, comparaciones (>, <, >=, =>, ==).
% Para usar estas reglas es que debemos unificar antes.

% Usar FINDALL cuando queremos meter en una bolsa algo para obtener un resultado de eso.