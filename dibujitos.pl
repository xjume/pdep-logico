% Base de conocimiento

dibujitoAnimado(alejoYValentina).
dibujitoAnimado(bananasEnPijamas).
dibujitoAnimado(billyYMandy).
dibujitoAnimado(bobEsponja).
dibujitoAnimado(losCaballerosDelZodiaco).
dibujitoAnimado(caillou).
dibujitoAnimado(catDog).
dibujitoAnimado(lasChicasSuperpoderosas).
dibujitoAnimado(losChicosDelBarrio).
dibujitoAnimado(corajeElPerroCobarde).
dibujitoAnimado(dexter).
dibujitoAnimado(dragonBall).
dibujitoAnimado(heyArnold).
dibujitoAnimado(misterGo).
dibujitoAnimado(losPadrinosMagicos).
dibujitoAnimado(peppaPig).
dibujitoAnimado(powerOfFour).
dibujitoAnimado(tomYJerry).
dibujitoAnimado(laVacaYElPollito).

canalDeEmision(heyArnold, nickelodeon).
canalDeEmision(tomYJerry, cartoonNetwork).
canalDeEmision(tomYJerry, canalSiete).
canalDeEmision(peppaPig, canalNueve).
canalDeEmision(lasChicasSuperpoderosas, cartoonNetwork).
canalDeEmision(billyYMandy, cartoonNetwork).
canalDeEmision(misterGo, magicKids).

canalDeAire(canalSiete).
canalDeAire(canalNueve).

anioDeEstreno(alejoYValentina, 2002).
anioDeEstreno(bananasEnPijamas, 2011).
anioDeEstreno(billyYMandy, 2001).
anioDeEstreno(bobEsponja, 1999).
anioDeEstreno(losCaballerosDelZodiaco, 1986).
anioDeEstreno(caillou, 1997).
anioDeEstreno(catDog, 1998).
anioDeEstreno(lasChicasSuperpoderosas, 1998).
anioDeEstreno(losChicosDelBarrio, 2002).
anioDeEstreno(corajeElPerroCobarde, 1999).
anioDeEstreno(dexter, 1996).
anioDeEstreno(dragonBall, 1986).
anioDeEstreno(heyArnold, 1996).
anioDeEstreno(misterGo, 1996).
anioDeEstreno(losPadrinosMagicos, 1998).
anioDeEstreno(peppaPig, 2004).
anioDeEstreno(powerOfFour, 2016).
anioDeEstreno(tomYJerry, 1940).
anioDeEstreno(laVacaYElPollito, 1997).

anioDeEstreno(greenBook, 2018).
anioDeEstreno(laFormaDelAgua, 2017).
anioDeEstreno(moonlight, 2016).
anioDeEstreno(spotlight, 2015).
anioDeEstreno(birdman, 2014).
anioDeEstreno(doceAniosDeEsclavitud, 2013).
anioDeEstreno(argo, 2012).
anioDeEstreno(elArtista, 2011).
anioDeEstreno(elDiscursoDelRey, 2010).
anioDeEstreno(theHurtLocker, 2009).
anioDeEstreno(titanic, 1997).

protagonista(arenita, bobEsponja).
protagonista(cosmo, losPadrinosMagicos).
protagonista(wanda, losPadrinosMagicos).
protagonista(caillou, caillou).
protagonista(bombon, lasChicasSuperpoderosas).
protagonista(burbuja, lasChicasSuperpoderosas).
protagonista(bellota, lasChicasSuperpoderosas).
protagonista(brisa, powerOfFour).

protagonista(Chica, powerOfFour) :- 
  protagonista(Chica, lasChicasSuperpoderosas).

protagonistaEnCartoonNetwork(Protagonista) :-
  protagonista(Protagonista, Dibujito),
  canalDeEmision(Dibujito, cartoonNetwork).

ibaPorCanalDeAire(Dibujito) :-
  canalDeEmision(Dibujito, Canal),
  canalDeAire(Canal).

dibujitoViejo(Dibujito) :-
  dibujitoAnimado(Dibujito),
  anioDeEstreno(Dibujito, Año),
  Año < 2000.

dibujitoViejoEn(Dibujito, Canal) :-
  dibujitoViejo(Dibujito),
  canalDeEmision(Dibujito, Canal).

cantidadDeEpisodios(alejoYValentina, 53).
cantidadDeEpisodios(bananasEnPijamas, 104).
cantidadDeEpisodios(billyYMandy, 84).
cantidadDeEpisodios(bobEsponja, 244).
cantidadDeEpisodios(losCaballerosDelZodiaco, 114).
cantidadDeEpisodios(caillou, 144).
cantidadDeEpisodios(catDog, 68).
cantidadDeEpisodios(lasChicasSuperpoderosas, 78).
cantidadDeEpisodios(losChicosDelBarrio, 78).
cantidadDeEpisodios(corajeElPerroCobarde, 52).
cantidadDeEpisodios(dexter, 78).
cantidadDeEpisodios(dragonBall, 153).
cantidadDeEpisodios(heyArnold, 100).
cantidadDeEpisodios(misterGo, 25).
cantidadDeEpisodios(losPadrinosMagicos, 161).
cantidadDeEpisodios(peppaPig, 254).
cantidadDeEpisodios(powerOfFour, 120).
cantidadDeEpisodios(tomYJerry, 161).
cantidadDeEpisodios(laVacaYElPollito, 52).

dibujitoMemorable(Dibujito) :-
  cantidadDeEpisodios(Dibujito, Episodios),
  Episodios >= 100.

dibujitoMemorable(Dibujito) :-
  dibujitoViejo(Dibujito).

dibujitoMemorable(horaDeAventura).
dibujitoMemorable(autobusMagico).
dibujitoMemorable(stevenUniverse).
dibujitoMemorable(thomasYSusAmigos).
dibujitoMemorable(bobElConstructor).
dibujitoMemorable(capitanTsubasa).
dibujitoMemorable(losSimpsons).
dibujitoMemorable(elDibujoAnimadoDeEvaPeron).
dibujitoMemorable(pokemon).
