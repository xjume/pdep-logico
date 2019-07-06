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
  incluye(Medicamento,Droga),
  estaEnfermo(Persona,Enfermedad),
  efecto(Droga,cura(Enfermedad)),
  not(efecto(Droga,potencia(Enfermedad))).

medicamentoMilagroso(Persona, Medicamento):-
  incluye(Medicamento,Droga),
  forall(estaEnfermo(Persona,Enfermedad),efecto(Droga,cura(Enfermedad))),
  forall(estaEnfermo(Persona,Enfermedad),not(efecto(Droga,potencia(Enfermedad)))).

drogaSimpatica(Droga):-
  findall(Enfermedad,efecto(Droga,cura(Enfermedad)), Enfermedades),
  Enfermedades >= 4.

drogaSimpatica(Droga):-
  estaEnfermo(eomer,EnfermedadEomer)
  efecto(Droga,cura(EnfermedadEomer)),
  not(estaEnfermo(eowyn,OtraEnfermedad)),
  efecto(Droga,cura(OtraEnfermedad)).

drogaSimpatica(Droga):-
  incluye(Medicamento,Droga),
  vende(Farmacia,Medicamento,_),
  not(seVendeAMasDe10(Medicamento)).

seVendeAMasDe10(Medicamento):-
  incluye(Medicamento,_),
  vende(_,Medicamento,Precio),
  Precio > 10.

tipoSuicida(Persona):-
  forall(actividad(Persona,_,compro(Medicamento,_)), not(medicamentoUtil(Persona,Medicamento)).

tipoAhorrativo(Persona):-
  forall( actividad(Persona,_,compro(Medicamento,Precio)),
          actividad(Persona,_,preguntoPor(Medicamento,OtroPrecio))),
  Precio < OtroPrecio.

tipoActivoEn(Persona, Mes, Anio):-
  actividad(Persona,fecha(_,Mes,Anio),_).

diaProductivo(Fecha):-
  forall(actividad(Persona,Fecha,actividad(_,_,compro(Medicamento,_))),medicamentoUtil(Persona,Medicamento)).

diaProductivo(Fecha):-
  forall(actividad(Persona,Fecha,actividad(_,_,preguntoPor(Medicamento,_))),medicamentoUtil(Persona,Medicamento)).

gastoTotal(Persona, Plata):-
  findall(Precio,actividad(Persona,_,compro(_,Precio)),Precios),
  sumlist(Precios,Plata).

zafoDe(Persona, Enfermedad):-
  not(estaEnfermo(Persona,Enfermedad)),
  padre(Padre,Persona),
  estaEnfermo(Padre,Enfermedad).