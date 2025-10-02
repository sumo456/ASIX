# Operadores y Funciones en SQL

Este documento presenta una descripción detallada de los operadores y funciones disponibles en SQL, con un enfoque en PostgreSQL. Se incluyen los tipos de datos más comunes, operadores lógicos, de comparación, matemáticos, funciones para cadenas de caracteres, fechas y estructuras condicionales. Aunque muchos son estándar, cada SGBD puede ofrecer funcionalidades adicionales, por lo que es recomendable consultar el manual oficial de PostgreSQL para obtener información específica.

## 1. Tipos de Datos

Los tipos de datos más relevantes utilizados en la base de datos de prácticas son los siguientes (todos cumplen con el estándar SQL):

- **VARCHAR(n)**: Cadena de caracteres de longitud máxima *n*.
- **NUMERIC(n,m)**: Número con *n* dígitos totales, de los cuales *m* son decimales.
- **DATE**: Almacena fechas. Para incluir hora, se usa **TIMESTAMP**.
- **BOOLEAN**: Representa valores lógicos **TRUE** (verdadero, se muestra como 't') o **FALSE** (falso, se muestra como 'f'). Aunque no se usa en la base de datos de prácticas, es un tipo relevante.

**Nota**: El valor **NULL** indica ausencia de valor y no se visualiza al imprimirse. La función **COALESCE** permite reemplazar valores nulos por un valor específico.

## 2. Operadores Lógicos

Los operadores lógicos en PostgreSQL (**AND**, **OR**, **NOT**) siguen una lógica booleana de tres valores, considerando **TRUE**, **FALSE** y **NULL**. A continuación, se muestra la tabla de verdad:

| a       | b       | a AND b | a OR b | NOT b  |
|---------|---------|---------|--------|--------|
| True    | True    | True    | True   | False  |
| True    | False   | False   | True   | True   |
| True    | Null    | Null    | True   | Null   |
| False   | False   | False   | False  | True   |
| False   | Null    | False   | Null   | Null   |
| Null    | Null    | Null    | Null   | Null   |

## 3. Operadores de Comparación

Los operadores de comparación permiten evaluar condiciones en las cláusulas **SELECT** y **WHERE**:

- **<**: Menor que.
- **>**: Mayor que.
- **<=**: Menor o igual que.
- **>=**: Mayor o igual que.
- **=**: Igual que.
- **!=**: Distinto de.
- **BETWEEN x AND y**: Equivale a `>= x AND <= y`.
- **NOT BETWEEN x AND y**: Equivale a `< x OR > y`.
- **IS NULL**: Devuelve **TRUE** si el valor es nulo.
- **IS NOT NULL**: Devuelve **TRUE** si el valor no es nulo.
- **IN (v1, v2, ...)**: Equivale a `= v1 OR = v2 OR ...`.

## 4. Operadores Matemáticos

Los operadores matemáticos permiten realizar cálculos numéricos:

- **+**: Suma.
- **-**: Resta.
- *** : Multiplicación.
- **/**: División (trunca el resultado en divisiones entre enteros).
- **%**: Resto de la división entera.
- **^**: Potencia (ejemplo: `3^2 = 9`).
- **|/**: Raíz cuadrada (ejemplo: `|/25 = 5`).
- **||/**: Raíz cúbica (ejemplo: `||/27 = 3`).
- **!**: Factorial (ejemplo: `5! = 120`).
- **!!**: Factorial como operador prefijo (ejemplo: `!!5 = 120`).
- **@**: Valor absoluto.

**Nota**: No se incluyen operadores para datos binarios.

## 5. Funciones Matemáticas

Algunas funciones matemáticas comunes en PostgreSQL son:

- **ABS(x)**: Valor absoluto de *x*.
- **SIGN(x)**: Signo de *x* (-1, 0, o 1).
- **MOD(x, y)**: Resto de la división de *x* entre *y*.
- **SQRT(x)**: Raíz cuadrada de *x*.
- **CBRT(x)**: Raíz cúbica de *x*.
- **CEIL(x)**: Entero más cercano por encima de *x*.
- **FLOOR(x)**: Entero más cercano por debajo de *x*.
- **ROUND(x)**: Redondea *x* al entero más cercano.
- **ROUND(x, n)**: Redondea *x* a *n* dígitos decimales (si *n* es positivo) o al múltiplo de `10^n` más cercano (si *n* es negativo).
- **TRUNC(x)**: Trunca *x* al entero.
- **TRUNC(x, n)**: Trunca *x* a *n* dígitos decimales (si *n* es positivo) o al múltiplo de `10^n` más cercano por debajo (si *n* es negativo).

PostgreSQL también ofrece funciones para logaritmos, trigonometría y conversiones entre grados y radianes.

## 6. Operadores y Funciones de Cadenas de Caracteres

Las cadenas de caracteres en SQL se delimitan con comillas simples ('cadena'). Las principales operaciones son:

- **||**: Concatena dos cadenas.
- **LIKE expr**: Devuelve **TRUE** si la cadena coincide con el patrón *expr*. Comodines: `_` (un carácter), `%` (cero o más caracteres).
- **LENGTH(cadena)**: Devuelve el número de caracteres.
- **CHAR_LENGTH(cadena)**: Equivalente a **LENGTH** (estándar SQL).
- **POSITION(subcadena IN cadena)**: Posición inicial de *subcadena* en *cadena*.
- **SUBSTR(cadena, n [, long])**: Extrae la subcadena desde la posición *n* con longitud máxima *long* (si no se especifica, hasta el final).
- **SUBSTRING(cadena FROM n [FOR long])**: Equivalente a **SUBSTR** (estándar SQL).
- **LOWER(cadena)**: Convierte la cadena a minúsculas.
- **UPPER(cadena)**: Convierte la cadena a mayúsculas.
- **BTRIM(cadena)**: Elimina espacios al inicio y final.
- **LTRIM(cadena)**: Elimina espacios al inicio.
- **RTRIM(cadena)**: Elimina espacios al final.
- **BTRIM(cadena, lista)**: Elimina caracteres de *lista* al inicio y final.
- **LTRIM(cadena, lista)**: Elimina caracteres de *lista* al inicio.
- **RTRIM(cadena, lista)**: Elimina caracteres de *lista* al final.
- **TRIM([BOTH | LEADING | TRAILING] lista FROM cadena)**: Estándar SQL para **BTRIM**, **LTRIM** o **RTRIM**.
- **CHR(n)**: Devuelve el carácter correspondiente al código ASCII *n*.
- **INITCAP(cadena)**: Convierte la primera letra de cada palabra a mayúscula.
- **LPAD(cadena, n [, c])**: Rellena la cadena por la izquierda con el carácter *c* (o espacios) hasta alcanzar longitud *n*. Trunca si excede *n*.
- **RPAD(cadena, n [, c])**: Similar a **LPAD**, pero rellena por la derecha.

**Ejemplo**:
```sql
SELECT BTRIM('--++-+Hola+-cara-+cola++--+-', '+-');
SELECT TRIM(BOTH '+-' FROM '--++-+Hola+-cara-+cola++--+-');
```

## 7. Operadores y Funciones de Fecha

Para configurar el formato de fecha en PostgreSQL al estilo europeo (día/mes/año con separador '/'):
```sql
SET DATESTYLE TO EUROPEAN, SQL;
```

Funciones de conversión entre tipos:
- **TO_CHAR(dato, formato)**: Convierte *dato* a cadena según *formato*.
- **TO_DATE(dato, formato)**: Convierte una cadena a fecha según *formato*.
- **TO_NUMBER(dato, formato)**: Convierte una cadena a número según *formato*.

**Patrones de formato**:
- **Fecha/hora**: `HH` (hora 1-12), `HH24` (hora 0-23), `MI` (minutos), `SS` (segundos), `YYYY` (año), `MONTH` (nombre del mes), `DD` (día del mes), etc.
- **Numéricos**: `9` (dígito), `S` (signo), `.` (punto decimal), `,` (separador de miles).

**Ejemplo**:
```sql
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH12 horas MI m. SS seg.');
SELECT TO_NUMBER('-12,454.8', 'S999,999.9');
```

Funciones comunes:
- **CURRENT_DATE**: Devuelve la fecha actual (tipo **DATE**).
- **CURRENT_TIME**: Devuelve la hora actual (tipo **TIME**).
- **CURRENT_TIMESTAMP**: Devuelve fecha y hora actuales (tipo **TIMESTAMP**).
- **EXTRACT(campo FROM dato)**: Extrae una parte de una fecha/hora (ejemplo: `day`, `month`, `year`, `hour`).
  - Ejemplo: `SELECT EXTRACT(week FROM TO_DATE('7/11/2005', 'dd/mm/yyyy'));`
- Sumar/restar días: Usa `+` o `-` (ejemplo: `CURRENT_DATE + 7`).

## 8. Función CASE

La función **CASE** permite lógica condicional en consultas SQL, similar a sentencias condicionales en lenguajes procedurales.

**Ejemplo**:
```sql
SELECT codart, precio,
       CASE WHEN stock > 500 THEN precio * 0.8
            WHEN stock BETWEEN 200 AND 500 THEN precio * 0.9
            ELSE precio
       END AS precio_con_descuento
FROM articulos;
```

Este ejemplo aplica descuentos según el stock: 20% si es mayor a 500, 10% si está entre 200 y 500, o sin descuento en otros casos.

## 9. Funciones COALESCE y NULLIF

- **COALESCE(valor [, ...])**: Devuelve el primer valor no nulo de la lista.
- **NULLIF(valor1, valor2)**: Devuelve **NULL** si *valor1* y *valor2* son iguales; de lo contrario, devuelve *valor1*.

**Ejemplo**:
```sql
SELECT COALESCE(stock, stock_min, -1) FROM articulos;
SELECT NULLIF(stock, stock_min) FROM articulos;
```

Ambas funciones se convierten internamente en expresiones **CASE**.
