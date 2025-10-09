# Tipus de combinacions (JOIN) en SQL

Aquest document explica els diferents tipus de combinacions (JOIN) en SQL per relacionar dues o més taules en una base de dades. Cada tipus de JOIN s'acompanya d'una breu descripció i exemples pràctics utilitzant les taules `clientes` i `facturas`, amb les columnes `nombre` (de `clientes`) i `codfac` (de `facturas`), relacionades mitjançant `codcli`.

---

## 1. **Comma Join (`,`)**  
Genera totes les combinacions possibles entre dues taules (producte cartesià). La relació entre taules es pot especificar al `WHERE`.

### Exemple 1: Producte cartesià sense condició
```sql
SELECT nombre, codfac
FROM clientes, facturas;
```

### Exemple 2: Amb condició de relació
```sql
SELECT nombre, codfac
FROM clientes, facturas
WHERE clientes.codcli = facturas.codcli;
```

---

## 2. **SELF JOIN**  
Permet relacionar una taula amb si mateixa. Sovint s'utilitza amb la clàusula `USING` quan les columnes tenen el mateix nom.

### Exemple:
```sql
SELECT nombre, codfac
FROM clientes SELF JOIN facturas USING (codcli);
```

---

## 3. **CROSS JOIN**  
Similar a la coma (`,`), produeix un producte cartesià entre dues taules. És una sintaxi més explícita.

### Exemple 1: Sense condició
```sql
SELECT nombre, codfac
FROM clientes CROSS JOIN facturas;
```

### Exemple 2: Amb condició de relació
```sql
SELECT nombre, codfac
FROM clientes CROSS JOIN facturas
WHERE clientes.codcli = facturas.codcli;
```

---

## 4. **JOIN (INNER JOIN implícit)**  
Combina files de dues taules basant-se en una condició de relació. És equivalent a `INNER JOIN` i s'utilitza per a columnes amb el mateix nom (`USING`) o amb una condició explícita (`ON`).

### Exemple 1: Amb `USING`
```sql
SELECT nombre, codfac
FROM clientes JOIN facturas USING (codcli);
```

### Exemple 2: Amb `ON`
```sql
SELECT nombre, codfac
FROM clientes JOIN facturas ON (clientes.codcli = facturas.codcli);
```

---

## 5. **NATURAL JOIN**  
Similar a `JOIN`, però no requereix especificar les columnes de relació, ja que utilitza automàticament les columnes amb el mateix nom. Cal que les claus foranes estiguin correctament definides a la creació de les taules. **Precaució**: pot ser imprevisible si hi ha més d'una columna amb el mateix nom.

### Exemple:
```sql
SELECT nombre, codfac
FROM clientes NATURAL JOIN facturas;
```

---

## 6. **INNER JOIN**  
És el tipus de `JOIN` per defecte. Només retorna les files que compleixen la condició de relació entre les dues taules.

### Exemple 1: Amb `ON`
```sql
SELECT nombre, codfac
FROM clientes INNER JOIN facturas ON (clientes.codcli = facturas.codcli);
```

### Exemple 2: Amb `USING`
```sql
SELECT nombre, codfac
FROM clientes INNER JOIN facturas USING (codcli);
```

---

## 7. **LEFT JOIN (o LEFT OUTER JOIN)**  
Retorna totes les files de la taula de l'esquerra (`clientes`) i les files coincidents de la taula de la dreta (`facturas`). Si no hi ha coincidència, es retorna `NULL` per a les columnes de la taula de la dreta.

### Exemple 1: Amb `ON`
```sql
SELECT nombre, codfac
FROM clientes LEFT JOIN facturas ON (clientes.codcli = facturas.codcli);
```

### Exemple 2: Amb `USING`
```sql
SELECT nombre, codfac
FROM clientes LEFT JOIN facturas USING (codcli);
```

---

## 8. **RIGHT JOIN (o RIGHT OUTER JOIN)**  
Retorna totes les files de la taula de la dreta (`facturas`) i les files coincidents de la taula de l'esquerra (`clientes`). Si no hi ha coincidència, es retorna `NULL` per a les columnes de la taula de l'esquerra.

### Exemple 1: Amb `ON`
```sql
SELECT nombre, codfac
FROM clientes RIGHT JOIN facturas ON (clientes.codcli = facturas.codcli);
```

### Exemple 2: Amb `USING`
```sql
SELECT nombre, codfac
FROM clientes RIGHT JOIN facturas USING (codcli);
```

---

## 9. **FULL JOIN (o FULL OUTER JOIN)**  
Retorna totes les files de les dues taules, amb `NULL` per a les columnes de la taula oposada quan no hi ha coincidència.

### Exemple 1: Amb `ON`
```sql
SELECT nombre, codfac
FROM clientes FULL JOIN facturas ON (clientes.codcli = facturas.codcli);
```

### Exemple 2: Amb `USING`
```sql
SELECT nombre, codfac
FROM clientes FULL JOIN facturas USING (codcli);
```

---

## Notes addicionals
- **Rendiment**: Els `CROSS JOIN` i la coma (`,`) poden generar grans quantitats de dades si no es filtren adequadament amb `WHERE`.
- **Bones pràctiques**: Utilitza `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` o `FULL JOIN` amb `ON` o `USING` per a més claredat i control en les consultes.
- **NATURAL JOIN**: Evita el seu ús en taules amb múltiples columnes amb noms idèntics per evitar resultats inesperats.