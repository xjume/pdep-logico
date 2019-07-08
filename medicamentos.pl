% Functores
% Efecto:     cura(), potencia()
% Fecha:      fecha(Dia,Mes,Año)
% Actividad:  compro(Medicamento,Farmacia)
%             preguntoPor(Medicamento,Farmacia)

incluye(Medicamento,Droga).
efecto(Droga,Efecto).       
vende(Farmacia,Medicamento,Precio). 
estaEnfermo(Persona,Enfermedad).
padre(Padre,Hijo).
actividad(Persona,Fecha,Actividad). 

persona(Persona):- estaEnfermo(Persona,_).
medicamento(Medicamento):- incluye(Medicamento,_).
droga(Droga):- incluye(_,Droga).
farmacia(Farmacia):- vende(Farmacia,_,_).
fecha(Fecha):- actividad(_,Fecha,_).

vende(laGondoriana, trancosin, 35).
vende(laGondoriana, sanaSam, 35).
incluye(trancosin, athelas).
incluye(trancosin, cenizaBoromireana).
efecto(athelas, cura(desazon)).
efecto(athelas, cura(heridaDeOrco)).
efecto(cenizaBoromireana, cura(gripeA)).
efecto(cenizaBoromireana, potencia(deseoDePoder)).
estaEnfermo(eomer, heridaDeOrco). % eomer es varon
estaEnfermo(eomer, deseoDePoder).
estaEnfermo(eomund, desazon).
estaEnfermo(eowyn, heridaDeOrco). % eowyn es mujer
padre(eomund, eomer).
actividad(eomer, fecha(15, 6, 3014), compro(trancosin, laGondoriana)).
actividad(eomer, fecha(15, 8, 3014), preguntoPor(sanaSam, laGondoriana)).
actividad(eowyn, fecha(14, 9, 3014), preguntoPor(sanaSam, laGondoriana)).

medicamentoUtil(Persona, Medicamento):-
  sirveParaCurar(Medicamento,Persona),
  not(sirveParaPotenciar(Medicamento,Persona)).

sirveParaCurar(Medicamento,Persona):-
  sirveParaCurar(Medicamento,Persona,_).

sirveParaCurar(Medicamento,Persona,Enfermedad):-
  sirveParaCurar(Medicamento,Persona,Enfermedad,_).

sirveParaCurar(Medicamento,Persona,Enfermedad,Droga):-
  incluye(Medicamento,Droga),
  estaEnfermo(Persona,Enfermedad),
  efecto(Droga,cura(Enfermedad)).

sirveParaPotenciar(Medicamento,Persona):-
  incluye(Medicamento,Droga),
  estaEnfermo(Persona,Enfermedad),
  efecto(Droga,potencia(Enfermedad)).

medicamentoMilagroso(Persona, Medicamento):-
  persona(Persona),           % Lo ligo para que sea para UNA persona.
  medicamento(Medicamento),   % Lo ligo para que sea para UN medicamento.
  forall(estaEnfermo(Persona,Enfermedad),sirveParaCurar(Medicamento,Persona,Enfermedad)),
  not(sirveParaPotenciar(Medicamento,Persona)).

drogaSimpatica(Droga):-
  droga(Droga),
  findall(Enfermedad,efecto(Droga,cura(Enfermedad)), Enfermedades),
  length(Enfermedades,CantidadEnfermedades),
  CantidadEnfermedades >= 4,
  not(efecto(Droga,potencia(_))).

drogaSimpatica(Droga):-
  sirveParaCurar(_,eomer, Enfermedad1, Droga),
  sirveParaCurar(_,eowyn, Enfermedad2, Droga),
  Enfermedad1 \= Enfermedad2.

drogaSimpatica(Droga):-
  incluye(Medicamento,Droga),
  vende(_,Medicamento,_),
  not(seVendeAMasDe10(Medicamento)).

seVendeAMasDe10(Medicamento):-
  medicamento(Medicamento),
  vende(_,Medicamento,Precio),
  Precio > 10.

tipoSuicida(Persona):-
  actividad(Persona,_,compro(Medicamento,_)),
  not(sirveParaCurar(Medicamento,Persona)),
  sirveParaPotenciar(Medicamento,Persona).

tipoAhorrativo(Persona):-
  persona(Persona),   % Ligo para que sea inversible (generador).
  farmacia(Farmacia), % Ligo para que sea para UNA farmacia.
  forall(actividad(Persona,_,compro(Medicamento,Farmacia)),
    preguntaPorUnoMasCaroQueEn(Persona,Medicamento,Farmacia)
  ).

preguntaPorUnoMasCaroQueEn(Persona,Medicamento,Farmacia):-
  actividad(Persona,_,preguntoPor(Medicamento,OtraFarmacia)),
  vende(Farmacia,Medicamento,Precio),
  vende(OtraFarmacia,Medicamento,OtroPrecio),
  OtroPrecio > Precio.

tipoActivoEn(Persona, Mes, Anio):-
  actividad(Persona,fecha(_,Mes,Anio),_).

diaProductivo(Fecha):-
  fecha(Fecha),    % Genero Fecha válida para que sea inversible.
  forall(
    actividad(Persona,Fecha,Actividad),
    actividadUtil(Persona,Actividad)
  ).

actividadUtil(Persona,Actividad):-
  medicamentoDeLaActividad(Actividad,Medicamento),
  medicamentoUtil(Persona,Medicamento).

medicamentoDeLaActividad(compro(Medicamento,_),Medicamento).
medicamentoDeLaActividad(preguntaPor(Medicamento,_),Medicamento).
gastoTotal(Persona, Plata):-
  persona(Persona),
  findall(Precio,precioPorCompra(Persona,Precio),Precios),
  sumlist(Precios,Plata).

precioPorCompra(Persona,Precio):-
  actividad(Persona,_,compro(Medicamento,Farmacia)),
  vende(Farmacia,Medicamento,Precio).

zafoDe(Persona, Enfermedad):-
  not(estaEnfermo(Persona,Enfermedad)),
  ancestro(Ancestro,Persona),
  estaEnfermo(Ancestro,Enfermedad).

ancestro(Ancestro,Descendiente):-
  padre(Ancestro,Descendiente).

ancestro(Ancestro,Descendiente):-
  padre(Ancestro,OtroDescendiente),
  ancestro(OtroDescendiente,Descendiente).