**Multitaula**

1.-Pobles en els que tinc venedors.

       nombre          
\----------------------  
LAGUNA DE CAMEROS  
VIVER  
SACEDA-TRASIERRA  
ALARO  
PRESA (LA)  
PILAR DE LA HORADADA  
BRAZUELO  
SAN JUAN DE ALICANTE  
SOLA (EL)  
POZOAMARGO  
(10 filas)

2.-Pobles en els que tinc clients

(130 filas)

3.-Pobles en els que tinc clients i venedors

nombre  
\--------  
(0 filas)

4.-Codis de factures en les que s'ha demanat Tubo Empotrar   65

codfac |   fecha    | codcli | codven | iva | dto  
\--------+------------+--------+--------+-----+-----  
  6579 | 2004-03-27 |    342 |    355 |  16 |  50  
(1 fila)

5.-En quines dates s'ha venut Tubo Empotrar   65 ?

 fecha      
\------------  
2004-03-27  
(1 fila)

6.- Codis de factures amb descompte 0 en la factura i en la línia.

(177 filas)

7.-Número de factures que no tenen el mateix descompte que les seves línies

 solucio\_exercici  
\------------------  
          	655  
(1 fila)

8.-Número de factures que  tenen el mateix descompte que les seves línies

 solucio\_exercici  
\------------------  
          	154  
(1 fila)

9.- En quins pobles viuen aquells clients dels que no tinc codi postal ?

   

        	nombre        	|   nombre     
\------------------------------+------------  
 MIRAVET SALA, MARIA MERCEDES | VILLARREAL  
 VILLALONGA SANCHIS, MILAGROS | VILLARREAL  
 MARTI MOLTO, CONCHITA    	| VILLARREAL  
 CHALER SORIANO, MANUEL DIEGO | VILLARREAL  
 RINCON VERNIA, DAVID     	| CASTELLON  
 LOPEZ RINCON, LUIS MIGUEL	| BURRIANA  
 LOPEZ GUITART, XAVIER    	| BURRIANA  
 AZNAR MONFERRER, ADRIAN  	| NULES  
(8 filas)

10.-En quines províncies viuen aquells clients dels que no tinc codi postal ?

  nombre     
\-----------  
 CASTELLON  
(1 fila)

11.-Nom i direcció dels clients de balears

   

         	nombre          	|         	direccion         	   
\---------------------------------+------------------------------------  
 ATIENZA CASADO, RAMON FRANCISCO | FALCO, 60-17  
 CEPRIA AGOST, FERNANDO LUIS 	| ERMITA, 75  
 DOMENECH FLORES, RAMON      	| GENERAL MARTINEZ CAMPOS, 172-7  
 FUENTES VILLALONGA, MARIA   	| MEDITERRANEO, 91  
 LLEO GUAITA, MARCOS         	| CAMINO DONACION, 144-3  
 MARIN RAMIREZ, SERGIO VICENTE   | FERNANDO EL CATOLICO, 6  
 NEBOT VITAL, SERGIO MOISES  	| LUIS MADRE LLOP, 4-19  
 ROBRES FRANCO, VICENTE IGNACIO  | VALL DE UXO, 179  
 RODRIGUEZ HERNANDEZ, CESAR  	| GENERAL MARTINEZ CAMPOS, 119  
 SABORIT DOMENECH, ELENA     	| FERRANDIS SALVADOR PALMERAS, 124-6  
 SERRET JOVER, JOSE          	| ENMEDIO, 110  
(11 filas)

12 .- Quins productes venuts no han augmentat el seu preu des de 2004 ? (el preu de venta esta a linias\_fac i el actual a productes)

620 amb codi d’articles,sense repetits, 591 filas sense repetits amb la descripció (1180 filas amb repetits)

13.- Crea el organigrama de l'empresa, és a dir,  nom de qui dirigeix a quin venedor, volem el nom de tots 2, empleat i jefe

       	empleado       	|      	Jefe    	   
\------------------------------+-----------------------------  
 DANIEL MIRALLES, SERGIO  	| POY OMELLA, PALOMA  
 ROCA FAURA, ANTONIO DIEGO	| POY OMELLA, PALOMA  
 GUILLEN VILLALONGA, NATALIA  | POY OMELLA, PALOMA  
 VALERO GARCIA, TERESA    	| DANIEL MIRALLES, SERGIO  
 CORBATO CARUANA, JOSE JUSTO  | DANIEL MIRALLES, SERGIO  
 PEREZ CEBRIA, IGNACIO DIEGO  | ROCA FAURA, ANTONIO DIEGO  
 VIDAL DIEZ, JOSE         	| ROCA FAURA, ANTONIO DIEGO  
 AGOST TIRADO, JORGE VICTOR   | GUILLEN VILLALONGA, NATALIA  
 RUBERT CANO, DIEGO GUILLERMO | GUILLEN VILLALONGA, NATALIA  
(9 filas)

14.-  A quins clients hem aplicat un 50% de dto. en les seves factures ?

(67 filas)

15.-  Descripció dels productes venuts a clients de la província de “Castellon”

(718 filas)

16.-Províncies en les que no tinc clients.

   nombre      
\-------------  
 EXTRANJERO  
 BADAJOZ  
 HUESCA  
 TOLEDO  
 GERONA  
 MURCIA  
 MELILLA  
 VIZCAYA  
 VALLADOLID  
 LUGO  
 ALAVA  
 ZAMORA  
 CIUDAD REAL  
 MALAGA  
(14 filas)

17.- Pobles on viuen els jefes dels empleats

  	nombre  	   
\-------------------  
 ALARO  
 LAGUNA DE CAMEROS  
 SACEDA-TRASIERRA  
 VIVER  
(4 filas)

18 A quins clients han venut els jefes d'empleats  
(104 filas)

19.- Pobles de l’estranger. (província)

 nombre  
\--------  
(0 filas)

20.- Hi ha clients als que compren en negre, sense iva. Quins son i com es diuen?

(98 filas)

21.-  Quins productes s'han venut en cada província ?

(3715 filas)

22\. Mostra TOTS els venedors(10) i la regió de la seva oficina.

\--------------------+--------  
 DANIEL MIRALLES, SERGIO  	| ESTE  
 ROCA FAURA, ANTONIO DIEGO	| NORTE  
 GUILLEN VILLALONGA, NATALIA  | ESTE  
 VALERO GARCIA, TERESA    	| SUD  
 CORBATO CARUANA, JOSE JUSTO  | SUD  
 PEREZ CEBRIA, IGNACIO DIEGO  | NORTE  
 VIDAL DIEZ, JOSE         	| NULL  
 AGOST TIRADO, JORGE VICTOR   | ESTE  
 RUBERT CANO, DIEGO GUILLERMO | NORTE  
 POY OMELLA, PALOMA       	| SUD  
(10 rows)  
