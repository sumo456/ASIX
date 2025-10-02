select codjefe from vendedores ;  
 codjefe  
\---------  
   	   
 	105  
 	105  
 	105  
 	255  
 	255  
 	405  
 	405  
   	5  
   	5  
(10 filas)

Canviem el valor de la variable null amb l'ordre:  
 \\pset null NULL  
apareixerà:  
Null display is 'NULL'.

Tornem a fer la instrucció anterior obtenint ara el NULL visible

select codjefe from vendedores ;  
 codjefe  
\---------  
	NULL  
 	105  
 	105  
 	105  
 	255  
 	255  
 	405  
 	405  
   	5  
   	5  
(10 filas)

Ens adonem, però, que la consulta ens torna resultats repetits  
Això ho podem solucionar amb la paraula clau "distinct".

select distinct codjefe from vendedores ;  
 codjefe  
\---------  
	NULL  
 	255  
 	405  
   	5  
 	105  
(5 filas)

Adonem-nos que en tots casos ens surt el camp NULL.

Imposem ara una condició que sigui sempre certa ( i que, per tant, ens hauria de donar el  
mateix resultat que abans)per exemple, imposar que el número del jefe sigui més gran  
de 4 (tots ho són)

select distinct codjefe from vendedores where codjefe\>=4;  
 codjefe  
\---------  
 	405  
 	255  
   	5  
 	105  
(4 filas)

Podem concloure que, si la comparació és certa, s'agafa. Si és falsa, no. I si conté un  
NULL tampoc s'agafa.

Un altre curiositat:  
select distinct codjefe from vendedores where codjefe\<\>NULL;

 codjefe  
\---------  
(0 filas)

En canvi:

select distinct codjefe from vendedores where codjefe is not NULL;  
 codjefe  
\---------  
 	255  
 	405  
   	5  
 	105  
(4 filas)

39\. Llistar els venedors que no tenen oficina assignada.

codven |  	nombre       |  	direccion  	          | codpostal | codpue | codjefe | codofi  
\----------+-----------------------+------------------------------+-------------+----------+-----------+--------  
355  | VIDAL DIEZ, JOSE | PLAZA ESPAÑA, 33-19 |  3380      |  42919 |        405 |   NULL  
(1 fila)  
40.-De quants clients no tinc codi postal

codcli | nombre | direccion | codpostal | codpue  
\--------+------------------------------+------------------------------+-----------+--------  
303 | MIRAVET SALA, MARIA MERCEDES | URBANIZACION EL BALCO, 84-11 | | 53596  
315 | VILLALONGA SANCHIS, MILAGROS | RONDA ESCALANTE, 71-11 | | 53596  
330 | MARTI MOLTO, CONCHITA | SAN ABDON, 152 | | 53596  
339 | CHALER SORIANO, MANUEL DIEGO | SAN ROBERTO, 27 | | 53596  
351 | RINCON VERNIA, DAVID | BORRIOL, 74 | | 12309  
375 | LOPEZ RINCON, LUIS MIGUEL | PADRE MELIA, 49 | | 07766  
384 | LOPEZ GUITART, XAVIER | CALLE PUIG RODA, 162 | | 07766  
390 | AZNAR MONFERRER, ADRIAN | EBANISANTA HERVAS, 138 | | 32093  
(8 filas)

	 	 	 	  
41.- direcció del jefe de jefes. (aquell que no té jefe)

	 direccion  
	\-------------------------  
	 SANCHIS TARAZONA, 103-1  
	(1 fila)