# CONSULTES RESUM

---

\*SUM.  
\*AVG.  
\*MIN, MAX.  
.Determinar el mínim i màxim de valors numèrics és trivial.  
.Els valors alfanumèrics s’ordenen segons la taula de codis pròpia de la màquina. Per tant no és el mateix el resultat obtingut en una màquina basada en la taula ASCII que en la taula EBCDIC.  
.Les dates i hores es comparen cronològicament.  
\*COUNT.  
\*COUNT(\*).  
.En realitat, count compta les línies que hi ha, és indiferent el camp que usem per a fer-ho. És per això que podem usar l’operador COUNT(\*) on l’\* no significa tots els camps sinó que és indiferent quin d’ells s’utilitzi.  
\*Valors NULL i funcions de columna  
.L’estèndard ANSI indica que els valors NULL són ignorats per les funcions de columna.  
.Count(\*) comptarà quantes files hi ha, independentment que continguin valors NULL.  
.Count(columna) comptarà NOMÉS les files no NULL.

.SUM() i AVG() també estan afectades per valors NULL. Les dues ignoren aquest valor. Llavors poden passar contradiccions com: (SUM(A)-SUM(B)) \<\> (SUM(A-B)). Les dues expressions no seràn iguals si algún dels elements de A o de B és NULL.   
.Suposem que B conté un valor NULL, i les dues columnes són de 10 files. SUM(A) suma les deu files, i li restem SUM(B) que suma nou files. SUM(A-B) suma només nou files perquè A-B en una fila fa una resta de un valor – null, i això genera null.  
.SUM(A)-SUM(B) significa la suma de A menys la suma de B.  
.SUM(A-B) significa la suma de fer (A-B). I no té perquè ser el mateix que l’anterior.

NORMES:  
.Si  totes les dades de la columna són NULL, SUM(), AVG(), MIN(), MAX() retornen NULL; i la funció COUNT() retorna 0\.  
.Si no hi ha dades a la columna (està buida), les funcions SUM(), AVG(), MIN(), MAX() retornen 0\.  
.La funció COUNT(\*) compta files, i no depèn de la presència o absència de valors NULL en la columna. Si no hi ha files retorna 0\.

\*DISTINCT.  
.Podem eliminar valors duplicats d’una columna ABANS d’aplicar la funció de columna cal escriure DISTINCT abans de l’argument de la funció. Per exemple: COUNT(DISTINCT TITULO)

\*És il·legal aniuar funcions de columna.  
\*També és il·legal barrejar funcions de columna amb noms de columna ordinaris en la llista de selecció.

REGLES:  
\=======

1) Si la sentència és un UNION de sentències SELECT, aplicar les passes 2 fins a 5 a cada una de les sentències SELECT per generar els seus resultats individuals.

2) Formar el producte de les taules indicades en la clàusula FROM. Si la clàusula FROM designa una sola taula, el producte és la taula.

3) Si hi ha una clàusula WHERE, aplicar la seva condició  de búsqueda a cada fila de la taula producte, retenint aquelles files per a les quals la condició de búsqueda és TRUE (i descartant aquelles en les quals és FALSE o NULL).

4) Per a cada fila restant, calcular el valor de cada element en la llista de selecció per produir una única fila de resultats. Per a cada referència de columna simple, usar el valor de la columna en la fila (o grup de files) actual. Per a una funció de columna, utilitzar com argument el conjunt sencer de files.

 

5) Si s’especifica SELECT DISTINCT, eliminar les files duplicades dels resultats que s’ha produït.

6) Si la sentència és UNION de sentències SELECT, barrejar els resultats de consulta de les sentències individuals en una única taula de resultats. Eliminar les files duplicades a menys que s’especifiqui UNION ALL.

7) Si hi ha una clàusula ORDER BY, ordenar la formació dels resultats de la consulta.

