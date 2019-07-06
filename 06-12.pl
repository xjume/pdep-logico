% Todo lo que está en el archivo .pl es nuestra BASE DE CONOCIMIENTO
% Se rige por el Principio de Universo Cerrado (Si no puede demostrar que es V, es F)

% Sentencias en lugar de funciones.
% Las sentencias reciben individuos (no parámetros) y la cantidad de ellos se denomina ARIDAD.
% Hay individuos simples (nro, átomo) y compuestos.

% Aridad = 1 -> Propiedad   ||    Aridad > 1 -> Relación

% La Base de Conocimiento es un conjunto de PREDICADOS, que pueden ser Propiedad o Relación
% Los Predicados son un conjunto de CLÁUSULAS, que pueden ser:
%     Hechos (Axioma)
%     Reglas ()

% Las CONSULTAS se hacen sobre la Base de Conocimiento y pueden tener múltiples respuestas.
% Individuales  -> Paso todos los individuos
% Existenciales -> Pongo guión bajo
% Variables     -> Paso una variable

% No hay strings, se los llama ÁTOMOS.
% Las cadenas de caracteres empiezan en minúscula y no tienen espacios.


dibujitoAnimado(heyArnold).               % dibujitoAnimado/1
anioDeEstreno(heyArnold, 1996).           % anioDeEstreno/2
anioDeEstreno(peppaPig,2006).             % anioDeEstreno/2

% dibujitoAnimado(heyArnold).     => true
% anioDeEstreno(heyArnold,1986).  => true
% anioDeEstreno(heyArnold,1980).  => false
% anioDeEstreno(peppaPig,2006).   => true
% anioDeEstreno(Dibujito,1986).   => Dibujito: heyArnold

canalDeEmision(heyArnold,nickelodeon).    % canalDeEmision/2
canalDeEmision(peppaPig,canalNueve).

canalDeAire(canalNueve).
canalDeAire(canalSiete).

ibaPorCanalDeAire(Dibujito) :-
  canalDeEmision(Dibujito, Canal),
  canalDeAire(Canal).

% ibaPorCanalDeAire(Dibujito).    => Dibujito: peppaPig

dibujitoViejo(Dibujito) :-
  anioDeEstreno(Dibujito, Anio),
  Anio < 2000.

% dibujitoViejo(_)                 => true. true.       (Responde si existe)
% dibujitoViejo(Dibujito).         => Dibujito: peppaPig

cantidadDeEpisodios(heyArnold,100).
cantidadDeEpisodios(peppaPig,254).

dibujitoMemorable(Dibujito) :-
  cantidadDeEpisodios(Dibujito, Episodios),
  Episodios > 100.

dibujitoMemorable(Dibujito) :-
  dibujitoViejo(Dibujito).

dibujitoMemorable(losSimpsons).

% dibujitoMemorable(Dibujito).        => Dibujito: peppaPig. Dibujito: heyArnold.