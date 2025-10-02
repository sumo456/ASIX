	 	 	 	  
**Consultes en SQL: SELECT, FROM y WHERE**

**Objectius**

Els objectius a cobrir en aquesta pràctica son els següents:

Ser capaç de formular consultes simples en SQL mitjançant la sentencia SELECT (sobre una sola taula), fent us de les clàusules FROM, WHERE y ORDER BY.

Ser capaç de determinar quan es necessari el us del modificador DISTINCT.

Ser capaç de manejar els nuls mitjançant el operador IS NULL i la funció COALESCE.

**En la sessió anterior . . .**

Varem veure que la sentencia SELECT consta de varies clàusules, de las que ja coneguem algunes.

SELECT \[DISTINCT\] { \* | columna \[, columna\]}

FROM taula

\[WHERE condició\_de\_busqueda\]

\[ORDER BY columna \[ASC|DESC\] \[,columna \[ASC|DESC\] \];

Les recordem en l’ordre en que es tenen en conter durant la execució:

FROM : aquí se especifica la taula sobre la que es va a realitzar la consulta.

WHERE : si sols es deu mostrar un subconjunt de las files de la taula, aquí se especifica la condició que deuen complir les files a mostrar; esta condició serà un predicat booleà amb comparacions unides per AND/OR.

SELECT : aquí se especifiquen les columnes a mostrar en el resultat; per a mostrar totes les columnes se utilitza \*.

DISTINCT : es un modificador que se utilitza darrere la clàusula SELECT para que no se mostren files repetides en el resultat (açò pot ocórrer sols quan en SELECT es prescindeix de la clau primària de la taula o de part de ella, si es composta).

**En esta sessió . . .**

Vas a practicar la sentencia SELECT per a consultar la base de dades de practiques, per el que deuries conèixer be la seva estructura i tenir en tot moment a ma el documento on se explica aquesta.

**Clàusula ORDER BY**

Esta clàusula, si se inclou, es sempre la ultima en la sentencia SELECT. S’utilitza per a ordenar el resultat de la consulta. La ordenació pot ser ascendent o descendent i pot basar-se en una sola columna o en varies.

La sentencia del següent exemple mostra les dades de tots els clientes ordenats pel codic del poble (descendentment) i tots els d’un mateix poble apareixeran ordenats per el numero de client. No es necessari que executes l’exemple.

SELECT \*

FROM clientes

ORDER BY codpue DESC, codcli;

**Expressions en SELECT i WHERE**

En las clàusules SELECT i WHERE, a més de columnes, també es poden incloure expressions que contingen columnes i constants. Les columnes i expressions especificades en la clàusula SELECT es poden renombrar al mostrar-les en el resultat mitjançant AS.

Si el resultat d’una consulta es deu mostrar ordenat segons el valor de una expressió de la clàusula SELECT, esta expressió s’indica en la clàusula ORDER BY mitjançant el nombre d’orde que ocupa en la clàusula SELECT.

SELECT precio, ROUND(precio \* 0.8, 2\) AS rebajado

FROM articulos

ORDER BY 2;

**Nuls**

Quan no se ha insertat un valor en una columna d’una fila es diu que aquesta es nula. Un nul no es un valor: un nul implica absència de valor. Per a saber si una columna es nula deurem utilitzar el operador de comparació IS NULL i para saber si no es nula, utilitzarem l’operador IS NOT NULL.

Quan es realitza una consulta de dades, els nuls es poden interpretar com valors mitjançant la funció COALESCE(columna, valor si nul). Esta funció retorna valor si nul en les files on columna es nula; si no, retorna el valor de columna.

SELECT codcli, nombre, COALESCE(codpostal, 0\) AS postal, codpostal AS postal\_null

FROM clientes

WHERE codcli \< 150

AND (codpostal \= 0 OR codpostal IS NULL);

Fixat que la condició (limite\_credito \= 0 OR limite\_credito IS NULL) es pot substituir per COALESCE(limite\_credito, 0\) \= 0\.

**Lo que no hi ha que oblidar**

Hi ha que tenir sempre molt de compte amb els nuls: si una columna accepta nuls, agafa la precaució de tractar-los quan et bases en aquesta columna per a establir alguna restricció (WHERE).

Deus ser capaç de determinar sempre, a priori, si necessites utilitzar el modificador DISTINCT (sense necessitat de provar la sentencia).

Mots SGBD implementen la clàusula DISTINCT amb algoritmes de ordenació. En aquest cas, si una sentencia que utilitza DISTINCT deu mostrar, a més, el resultat ordenat, se podria prescindir de la clàusula ORDER BY (i per lo tant de una segona ordenació que consumeix temps de execució).

Per açò el únic que has de fer es ordenar convenientment les columnes a mostrar en la clàusula SELECT.

