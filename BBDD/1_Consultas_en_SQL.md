# Consultes en SQL: SELECT, FROM i WHERE

## Objectius

En aquesta pràctica aprendràs a:

* Formular consultes simples en SQL amb la sentència **SELECT** (sobre una sola taula), fent ús de les clàusules **FROM**, **WHERE** i **ORDER BY**.
* Determinar quan és necessari utilitzar el modificador **DISTINCT**.
* Gestionar valors nuls amb l’operador **IS NULL** i la funció **COALESCE**.

---

## Recordatori de la sessió anterior

La sentència **SELECT** està formada per diferents clàusules. L’estructura bàsica és:

```sql
SELECT [DISTINCT] { * | columna [, columna] }
FROM taula
[WHERE condició_de_busqueda]
[ORDER BY columna [ASC|DESC] [, columna [ASC|DESC]]];
```

**Ordre d’execució:**

1. **FROM**: especifica la taula sobre la qual es farà la consulta.
2. **WHERE**: defineix les condicions que han de complir les files a mostrar (predicats booleans amb AND/OR).
3. **SELECT**: selecciona les columnes del resultat. Amb `*` es mostren totes les columnes.
4. **DISTINCT**: elimina les files repetides del resultat.

---

## En aquesta sessió

Practicarem la sentència **SELECT** aplicant-la a la base de dades de pràctiques.
És important conèixer bé la seva estructura i tenir a mà el document que la descriu.

---

## Clàusula ORDER BY

La clàusula **ORDER BY** és sempre l’última de la sentència. Serveix per **ordenar** el resultat segons una o diverses columnes, en ordre ascendent (`ASC`) o descendent (`DESC`).

**Exemple:**

```sql
SELECT *
FROM clientes
ORDER BY codpue DESC, codcli;
```

Aquest exemple mostra tots els clients ordenats primer pel codi de poble (descendent) i després pel número de client.

---

## Expressions en SELECT i WHERE

A les clàusules **SELECT** i **WHERE** es poden utilitzar expressions formades per columnes i constants.
Les expressions poden ser **renombrades** amb `AS`.

També és possible ordenar pel número de posició de la columna a **SELECT**.

**Exemple:**

```sql
SELECT precio, ROUND(precio * 0.8, 2) AS rebajado
FROM articulos
ORDER BY 2;
```

---

## Tractament de valors nuls

Un **nul** significa absència de valor, no és el mateix que un zero.
Per comprovar-los:

* `IS NULL` → comprova si un valor és nul.
* `IS NOT NULL` → comprova si no és nul.

Amb la funció **COALESCE(columna, valor_si_nul)** podem substituir els nuls per un valor concret.

**Exemple:**

```sql
SELECT codcli, nombre, COALESCE(codpostal, 0) AS postal, codpostal AS postal_null
FROM clientes
WHERE codcli < 150
  AND (codpostal = 0 OR codpostal IS NULL);
```

Aquesta condició es pot simplificar amb:

```sql
COALESCE(limite_credito, 0) = 0
```

---

## Bones pràctiques a recordar

* Tracta sempre amb cura els **nuls** quan facis servir aquestes columnes a les condicions (**WHERE**).
* Decideix **a priori** si necessites el modificador **DISTINCT**.
* Alguns SGBD implementen **DISTINCT** mitjançant algoritmes d’ordenació. Si el resultat ja s’ha d’ordenar, pot no ser necessari afegir un **ORDER BY** addicional.

👉 Recomanació: ordena correctament les columnes a la clàusula **SELECT** per aprofitar millor el rendiment.
