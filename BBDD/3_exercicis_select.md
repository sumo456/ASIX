SELECT (Exercicis)

Fent ús de la base de dades de Factures, resol els següents exercicis:

1\. Llista totes les dades de les oficines amb els seus objectius i ventes

 codofi | codpue | region | director | objetivo  |  ventas     
\--------+-----------+----------+----------+---------------+-----------  
        2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33  
        1 |  26395 | SUR     |  	105 | 150000.00 | 170795.42  
        3 |  25644 | NORTE  |  	405 | 120000.00 | 122401.17  
(3 filas)

2\. Llista les oficines de la regió Este amb els seus objectius i ventes

 codofi | codpue | region | director | objetivo  |  ventas     
\--------+--------+--------+----------+-----------+-----------  
  	2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33  
(1 fila)

3\. Muestra les oficines ( codi,  ventes i objectiu)  on les ventes excedeixen l’objetiu

 codofi | objetivo  |  ventas     
\--------+-----------+-----------  
  	1 | 150000.00 | 170795.42  
  	3 | 120000.00 | 122401.17  
(2 filas)

4\. Llista les oficines,mostra els seus objectius i ventes on les ventes excedeixen als seus objectius, ordenades en ordre alfabétic per regió.

 codofi | codpue | region | director | objetivo  |  ventas     
\--------+--------+--------+----------+-----------+-----------  
  	3 |  25644 | NORTE  |  	405 | 120000.00 | 122401.17  
  	1 |  26395 | SUR	|  	105 | 150000.00 | 170795.42  
(2 filas)

5\. Quin és el nom del venedor 105 ?  
   	nombre  	   
\--------------------  
 POY OMELLA, PALOMA  
(1 fila)  
	 	 	 	  
6\. Nom i direcció dels venedors que tenen com a jefe el 105

nombre | direccion

\-----------------------------+---------------------------

DANIEL MIRALLES, SERGIO | CORTS VALENCIANES, 177-14

ROCA FAURA, ANTONIO DIEGO | POU DEN CALVO, 31

GUILLEN VILLALONGA, NATALIA | SANT JOSEP, 110

(3 filas)

7\. Recupera el nom i les dades del client 165

 codcli |       	nombre                     			| 	direccion  	    | codpostal | codpue  
\--------+-----------------------------------------------------------+-------------------------------+-------------+--------  
	165 | BUESO ORDONYEZ, JUAN MANUEL | CALLE LA PUNTA, 46 |  	5359  |  32550  
(1 fila)

	 	 	 	  
8\. quins son els productes que estan per baix de 2 unitats d'stock

	(235 filas)

9\. quins productes tenen 16 unitats d'stock minim.

	codart

	\--------

	 LAPT

	 L85500

	 	 	 	  
10.- Articles que estan per sota del seu stock minim

  codart  

\----------

 LA1460EC

 VI718S

 cm2X2.5

(3 filas)

	 	 	 	

11.- Numero de factures amb descompte 0 (Funcions d’agrupació)

 count

\-------

   208

(1 fila)  
	 	 	 	  
12.- Numero de linies de factura amb descompte 0

 count

\-------

   917

(1 fila)

13\. Quins son els objectius i vendes promig per a les oficines?

     	avg     	|     	avg    	   
\---------------------+---------------------  
 130000.000000000000 | 134439.306666666667  
(1 fila)

14\. Quins son els objectius i vendes promig per a les oficines?, mostra sols 2 decimals.

   round   |   round     
\-----------+-----------  
 130000.00 | 134439.31  
(1 fila)  
	 	 	 	  
15.-maxim descompte a una línea de factura.

	 max

	\-----

	 50

	(1 fila)

16.-maxim, minim i promig descompte de les factures

	 max | min | avg

	\-----+-----+---------------------

	 50 | 0 | 17.8263274336283186

	(1 fila)

17.-maxim, minim i promig descompte a una linea factura

	 max | min | avg

	\-----+-----+---------------------

	 50 | 0 | 17.7875417130144605

	(1 fila)

18.-iva minim i maxim

	 min | max

	\-----+-----

	 0 | 16

	(1 fila)

	 	 	 	  
19\. mostrar preu minim, preu maxim i promig dels articles

min | max | avg

\------+--------+---------------------

0.03 | 532.60 | 11.8270443349753695

(1 fila)  
   
	 	 	 	  
20\. quina és la data de la primera compra realitzada

 min

	\------------

	 2000-01-02

	(1 fila)

21\. Llista el mes i l’any de les factures en columnes separades ordenat per any i dins de cada any per mes.

(1000 filas)

	 	 	 	  
22\. facturas de l'any 2000

 count

\-------

   190

(1 fila)  
	 	 	 	  
23\. Nombre de factures realitzades a la primera meitat de l'any 2003

count

\-------

101

(1 fila)

24\. Lista els codis de venedors junt al codi dels seus jefes pero intercalant entre les columnes de codi de venedor i del codi del jefe una frase de l’estil 'dirigit per' .

      codven |	texto 	| codjefe  
     \-----------+---------------+---------  
	105 | Dirigido por |   	   
	255 | Dirigido por | 	105  
	405 | Dirigido por | 	105  
  	5 | Dirigido por | 	105  
 	55 | Dirigido por | 	255  
	205 | Dirigido por | 	255  
	305 | Dirigido por | 	405  
	355 | Dirigido por | 	405  
	455 | Dirigido por |   	5  
	155 | Dirigido por |   	5  
(10 filas)

OBS: Se poden utilitzar constants SQL en una llista de sel·lecció escribint entre comilles simples una cadena (la sentencia SELECT la pendrà como si existirá un camp on tots els seus registres tingeren la mateixa cadena de caracters)

25\. Mostra els empleats dirigits per PALOMA POY OMELLA (empleada 105\)

 codven |       	nombre        	|     	direccion     	| codpostal | codpue | codjefe | codofi  
\--------+-----------------------------+---------------------------+-----------+--------+---------+--------  
255 | DANIEL MIRALLES, SERGIO 	| CORTS VALENCIANES, 177-14 | 	12067 |  54157 | 105 | 2  
405 | ROCA FAURA, ANTONIO DIEGO   | POU DEN CALVO, 31  |16825 |  42039 |105 |3  
5 | GUILLEN VILLALONGA, NATALIA | SANT JOSEP, 110      |7584 |	964 | 	105 |  	2  
(3 filas)

26\. Llista les oficines que tenen ventes per baix del 95 per cent de l'objectiu  
   
 codofi | codpue | region | director | objetivo  |  ventas     
\--------+--------+--------+----------+-----------+-----------  
  	2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33  
(1 fila)

27\. Llista les oficines on el seu objetiu no son 120000 €

 codofi | codpue | region | director | objetivo  |  ventas     
\--------+--------+--------+----------+-----------+-----------  
  	1 |  26395 | SUR	|  	105 | 150000.00 | 170795.42  
(1 fila)

28\. Mostra les linies de pedidos ( el codfac, número de linia i el preu) on el preu oscila entre 200 y 500 €

 codfac | linea | precio  
\--------+-------+--------  
   5835 | 	4 | 489.99  
   5753 | 	6 | 489.99  
   6708 | 	7 | 315.09  
   6385 | 	2 | 308.78  
   6421 | 	4 | 308.78  
   6184 | 	8 | 302.48  
   6699 | 	4 | 204.34  
(7 filas)

	 	 	 	  
29\. nom dels pobles que comencen per “CANA”

	(58 filas)

30\. Mostra els clients on el primer cognom es LOPEZ  

        	nombre        	   
\-------------------------------  
 LOPEZ DOBON, VICENTE RAMON  
 LOPEZ SANMIGUEL, CARLOS  
 LOPEZ BOTELLA, MAURO  
 LOPEZ LLORENS, SANCHEZ MARCOS  
 LOPEZ RINCON, LUIS MIGUEL  
 LOPEZ GUITART, XAVIER  
 LOPEZ VICENS, MANUEL VICTOR  
(7 filas)

31\. Productos on l’ id comença amb els caràcters "B1%B"

 codart  |          	descrip          	| precio | stock | stock\_min  
\---------+-----------------------------------+--------+-------+-----------  
 B10000B | Cortacicuito Bjc Ibiza Blaco  	|   0.88 |	11 |     	7  
 B10001B | Marco Bjc 1 E Blanco          	|   1.38 | 	1 |     	1  
 B10005B | Marco Bjc 2 E Ibiza Blanco    	|   3.93 | 	1 |     	1  
 B10006B | Marco Bjc 3 E Ibiza Blanco    	|   4.44 | 	6 |     	3  
 B10007B | Placa 2 E. Bjc Serie Olimpia  	|  68.29 | 	1 |     	1  
 B10009B | Placa 3 E. Bjc Serie Olimpia  	|   5.57 | 	2 |     	1  
 B10010B | Interruptor Bjc Serie Olimpia 	|   7.13 | 	2 |     	1  
 B10022B | Interruptor Con Visor Bjc Serie O |   2.70 |   	|     	6  
 B10023B | Conmutador Bjc Serie Olimpia  	|   3.12 | 	6 |     	1  
 B10025B | Conmutador Con Visor Bjc Serie Ol |   2.85 | 	4 |     	4  
 B10028B | Cruzamiento  Bjc Serie Olimpia	|   4.38 | 	2 |     	1  
 B10200B | Cruzamiento Bjc Olimpia Con Visor |   0.88 |	29 |     	   
 B10201B | Doble Interruptor Bjc Serie Olimp |   1.38 |	12 |     	3  
 B10202B | Doble Conmutador Bjc Olimpia  	|   2.33 |	11 |     	2  
 B14001B | Pulsador Timbre Con Visor Bjc Ser |   1.44 | 	6 |     	3  
 B14002B | Pulsador Bjc Olimpia          	|   1.96 |	14 |    	13  
(16 filas)

	 	 	 	  
32\. Pobles amb la lletra X al seu nom i acaben en A.

	(327 filas)

33\. Pobles amb le lletres X i Y al seu nom.

nombre

\---------------------------------------

AGRILLOY DE ABAIXO

ALXEN (SAN PELAYO P.)

BAIXOS DE CALBINYA

BORMOXOYO

CASAS NOVAS Y LAXE

CASTROMAYOR (SAN XOAN)

CHAYAN DA BAIXO

HERMANDAD (LA) Y TIXGES

HUERTAS Y EXTRAMUROS

LAYA (SAN XOAN)

MILLAROSO Y SAN TURXO (LA CONCEPCION)

POLINYA DE XUQUER

REFOXOS (SAN PELAYO P.)

ROMAY (SAN XULIAN P.)

VIXOY

(15 filas)

34 Pobles que comencen per Z i amb la lletra Ñ al seu nom.

nombre

\------------------------

ZAÑARTU

ZAMPAÑO

ZANFAÑO

ZANFOGA (SAN MARTIÑO)

ZAPARDIEL DE LA CAÑADA

ZICUÑAGA

ZOÑAN

ZUÑEDA

ZUÑIGA

ZUÑIGA Y LA JUNCOSA

(10 filas)

	 	 	 	  
35 Províncies que comencen per “A” i acaben per “E”

codpro | nombre

\--------+----------

02 | ALBACETE

03 | ALICANTE

(2 filas)

36\. Llista les oficines, classificades en ordre descendent de ventes, de forma que las oficines amb majors ventes aparegin en primer lloc

 codofi | codpue | region | director | objetivo  |  ventas     
\--------+--------+--------+----------+-----------+-----------  
  	1 |  26395 | SUR	|  	105 | 150000.00 | 170795.42  
  	3 |  25644 | NORTE  |  	405 | 120000.00 | 122401.17  
  	2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33  
(3 filas)

37\. Llista les oficines, classificades en ordre descendent de rendimient de ventes, amb un màxim de 2 decimals ( rendimient= percentatge de la cuota que es du en ventes, dit d’altra forma, una regla de 3, si objetivo es el 100%, quin percentatge representen les ventes? )  

 codofi | codpue | region | director | objetivo  |  ventas   | rendimiento  
\--------+--------+--------+----------+-----------+-----------+-------------  
  	1 |  26395 | SUR	|  	105 | 150000.00 | 170795.42 |  	113.86  
  	3 |  25644 | NORTE  |  	405 | 120000.00 | 122401.17 |  	102.00  
  	2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33 |   	91.77  
(3 filas)

38 Agrega al rendimient de la solució anterior el simbol del %

 codofi | codpue | region | director | objetivo  |  ventas   | rendimiento  
\--------+--------+--------+----------+-----------+-----------+-------------  
  	2 |  12310 | ESTE   |  	255 | 120000.00 | 110121.33 | 91.77%  
  	1 |  26395 | SUR	|  	105 | 150000.00 | 170795.42 | 113.86%  
  	3 |  25644 | NORTE  |  	405 | 120000.00 | 122401.17 | 102.00%  
(3 filas)

