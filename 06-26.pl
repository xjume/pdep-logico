% Individuos: Simples o compuesots (Functores)
% Los FUNCTORES están compuestos por un nombre y aridad.
% No se pueden hacer consultas por functores.


libroDeTerrorCopado(Libro) :-
  tipo(Libro,novela(terror,CantidadDePaginas)),
  CantidadDePaginas > 300.

/*
Un libro es bueno si es una novela policial y tiene más de 150 páginas o si es una novela de terror.
Los libros con más de 10 cuentos siempre son buenos.
Científico física cuántica también es un libro bueno.
Un best seller solo si el precio por página < 50.
*/

libroEstaBueno(Libro) :-
  tipo(Libro,novela(policial,CantidadDePaginas)),
  CantidadDePaginas > 150.

libroEstaBueno(Libro) :-
  tipo(Libro,novela(terror,_)).

libroEstaBueno(Libro) :-
  tipo(Libro,libroDeCuentos(CantidadDeCuentos)),
  CantidadDeCuentos > 10.

libroEstaBueno(Libro) :-
  tipo(Libro,cientifico(fisicaDeCuantica)).

libroEstaBueno(Libro) :-
  tipo(Libro,bestSeller(Precio,Paginas)),
  PrecioPorPagina(Precio,Paginas,PrecioPorPagina),
    PrecioPorPagina < 50

PrecioPorPagina(Precio,Paginas;PrecioPorPagina):-
  PrecioPorPagina is Precio / Paginas

% Para salvar la repetición de lógica, podemos usar PATTERN MATCHING

libroEstaBueno(Libro):-
   tipo(libro, Tipo),
   tipoBueno(Tipo).

tipoBueno(novela(terror,_)).
tipoBueno(cientifico(fisicaDeCuantica)).
tipoBueno(novela(policial, Paginas)):-
    Paginas > 150.

tipoBueno(libroDeCuentos(CantidadDeCuentos)):-
 CantidadDeCuentos > 10.

tipoBueno(bestSeller(Precio, CantidadDePaginas)):-
    PrecioPorPagina(Precio, CantidadDePaginas, PrecioPorPagina),
    PrecioPorPagina < 50

precioPorPagina(Precio,Paginas,PrecioPorPagina),
    PrecioPorPagina < 50

% Polimorfismo es poder tratar indistintamente a la variable que representa dos o más cosas distintas.

/*
El puntaje de un escritor se calcula como 3 * cantidad de libros buenos que escribió.
*/

puntaje(UneAuter, Puntaje):-
  esAuter(UneAuter),
  librosBuenosDe(UneAuter, LibrosBuenos),
  length(librosBuenos, Cantidad),
  Puntaje is 3 * Cantidad.

librosBuenosDe(UneAuter,LibrosBuenos):-
  findall(Unlibro, buenLibroDe(UneAuter, UnLibro), LibrosBuenos).  
  % findall /3: UnoQueCumple, Condición, ListaDeLosQueCumplen.

buenLibroDe(UneAuter, UnLibro):-
  escribio(UneAuter, UnLibro),
  libroEstaBueno(UnLibro).

% Una consulta es TOTALMENTE INVERSIBLE si podemos hacer consultas para todos sus parámetros. Si sólo se puede consultar por 
% algunos es PARCIALMENTE INVERSIBLE.
% findall es parcialmente inversible (por la lista), a menos que hagamos esAuter(UneAuter) para generar a le auter.
% Algunas veces vamos a poder hacerlo inversible otras no.

librosDe(UneAuter, Libros):-
   esAuter(UneAuter).
   findall(UnLibro, libroDe(UneAuter, UnLibro), Libros)

libroDe(UneAuter, Unlibro):-
  esLibro(UnLibro),
  escribio(UneAuter,Unlibro).
  
esAuter(UneAuter):-
  escribio(UneAuter, _).

/*
Promedio de puntajes/1 de todes les escriteres.
*/

promedioDePuntajes(Promedio) :-
  findall(UnPuntaje, puntaje(_,Puntaje), ListaPuntaje), % ListaPuntaje = encuentra todos los formatos que cumplan tal condicion 
  length(ListaPuntaje, CantidadDePuntajes),
  sumList(ListaPuntaje,SumatoriaPuntajes),
  Promedio is SumatoriaPuntajes / CantidadDePuntajes.