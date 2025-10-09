# Exercicis de Consultes Multitaula en SQL

Aquest document presenta una sèrie d'exercicis relacionats amb consultes SQL que involucren múltiples taules, utilitzant les taules `clientes`, `facturas`, `lineas_fac`, `productos`, `vendedores`, i altres relacionades. Cada exercici inclou una breu descripció del resultat esperat i el nombre de files retornades.

---

## 1. Pobles amb venedors
Llista els pobles on viuen els venedors.

**Resultat esperat** (10 files):
```
nombre
----------------------
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
```

---

## 2. Pobles amb clients
Llista els pobles on viuen els clients.

**Resultat esperat** (130 files).

---

## 3. Pobles amb clients i venedors
Identifica els pobles que tenen tant clients com venedors.

**Resultat esperat** (0 files):
```
nombre
--------
```

---

## 4. Codis de factures amb el producte "Tubo Empotrar 65"
Llista els codis de factures on s'ha venut el producte "Tubo Empotrar 65", incloent data, codi de client, codi de venedor, IVA i descompte.

**Resultat esperat** (1 fila):
```
codfac | fecha      | codcli | codven | iva | dto
-------+------------+--------+--------+-----+-----
6579   | 2004-03-27 | 342    | 355    | 16  | 50
```

---

## 5. Dates de venda del producte "Tubo Empotrar 65"
Mostra les dates en què s'ha venut el producte "Tubo Empotrar 65".

**Resultat esperat** (1 fila):
```
fecha
------------
2004-03-27
```

---

## 6. Factures amb descompte zero
Llista els codis de factures que tenen un descompte de 0 tant en la factura com en les seves línies.

**Resultat esperat** (177 files).

---

## 7. Factures amb descompte diferent entre factura i línies
Compta el nombre de factures on el descompte de la factura no coincideix amb el descompte de les seves línies.

**Resultat esperat** (1 fila):
```
solucio_exercici
------------------
655
```

---

## 8. Factures amb descompte igual entre factura i línies
Compta el nombre de factures on el descompte de la factura coincideix amb el descompte de les seves línies.

**Resultat esperat** (1 fila):
```
solucio_exercici
------------------
154
```

---

## 9. Clients sense codi postal i els seus pobles
Llista els noms i pobles dels clients que no tenen codi postal registrat.

**Resultat esperat** (8 files):
```
nombre                        | nombre
-----------------------------+------------
MIRAVET SALA, MARIA MERCEDES | VILLARREAL
VILLALONGA SANCHIS, MILAGROS | VILLARREAL
MARTI MOLTO, CONCHITA        | VILLARREAL
CHALER SORIANO, MANUEL DIEGO | VILLARREAL
RINCON VERNIA, DAVID         | CASTELLON
LOPEZ RINCON, LUIS MIGUEL    | BURRIANA
LOPEZ GUITART, XAVIER        | BURRIANA
AZNAR MONFERRER, ADRIAN      | NULES
```

---

## 10. Províncies dels clients sense codi postal
Llista les províncies on viuen els clients que no tenen codi postal registrat.

**Resultat esperat** (1 fila):
```
nombre
---------
CASTELLON
```

---

## 11. Clients de les Balears
Llista el nom i l'adreça dels clients que viuen a les Balears.

**Resultat esperat** (11 files):
```
nombre                        | direccion
-----------------------------+------------------------------------
ATIENZA CASADO, RAMON FRANCISCO | FALCO, 60-17
CEPRIA AGOST, FERNANDO LUIS   | ERMITA, 75
DOMENECH FLORES, RAMON        | GENERAL MARTINEZ CAMPOS, 172-7
FUENTES VILLALONGA, MARIA     | MEDITERRANEO, 91
LLEO GUAITA, MARCOS           | CAMINO DONACION, 144-3
MARIN RAMIREZ, SERGIO VICENTE | FERNANDO EL CATOLICO, 6
NEBOT VITAL, SERGIO MOISES    | LUIS MADRE LLOP, 4-19
ROBRES FRANCO, VICENTE IGNACIO | VALL DE UXO, 179
RODRIGUEZ HERNANDEZ, CESAR    | GENERAL MARTINEZ CAMPOS, 119
SABORIT DOMENECH, ELENA       | FERRANDIS SALVADOR PALMERAS, 124-6
SERRET JOVER, JOSE            | ENMEDIO, 110
```

---

## 12. Productes sense augment de preu des del 2004
Llista els productes venuts que no han augmentat de preu des del 2004, comparant el preu de venda a `lineas_fac` amb el preu actual a `productos`. Inclou codis d'articles (620 files sense repetits) i descripcions (591 files sense repetits, 1180 amb repetits).

**Resultat esperat**: 620 files (codis), 591 files (descripcions sense repetits).

---

## 13. Organigrama de l'empresa
Mostra l'organigrama de l'empresa, amb el nom dels empleats (venedors) i el nom del seu cap.

**Resultat esperat** (9 files):
```
empleado                     | jefe
-----------------------------+-----------------------------
DANIEL MIRALLES, SERGIO      | POY OMELLA, PALOMA
ROCA FAURA, ANTONIO DIEGO    | POY OMELLA, PALOMA
GUILLEN VILLALONGA, NATALIA  | POY OMELLA, PALOMA
VALERO GARCIA, TERESA        | DANIEL MIRALLES