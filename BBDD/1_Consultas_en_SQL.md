# Consultas en SQL: SELECT, FROM y WHERE

Este documento presenta una guía clara y estructurada sobre cómo formular consultas básicas en SQL utilizando la sentencia **SELECT**, con un enfoque en las cláusulas **FROM**, **WHERE** y **ORDER BY**, así como el manejo de valores nulos y el modificador **DISTINCT**. Está diseñado para facilitar la comprensión y práctica de consultas en una base de datos, específicamente en PostgreSQL.

## Objetivos

- Formular consultas simples en SQL usando la sentencia **SELECT** sobre una sola tabla, empleando las cláusulas **FROM**, **WHERE** y **ORDER BY**.
- Determinar cuándo es necesario usar el modificador **DISTINCT**.
- Gestionar valores nulos con el operador **IS NULL** y la función **COALESCE**.

## Estructura de la Sentencia SELECT

La sentencia **SELECT** se compone de varias cláusulas que se procesan en el siguiente orden lógico:

```sql
SELECT [DISTINCT] { * | columna [, columna] }
FROM taula
[WHERE condición_de_búsqueda]
[ORDER BY columna [ASC|DESC] [, columna [ASC|DESC]];
```

### Desglose de Cláusulas
- **FROM**: Especifica la tabla sobre la que se realiza la consulta.
- **WHERE**: Filtra las filas que cumplen una condición booleana, combinando comparaciones con operadores lógicos **AND** y **OR**.
- **SELECT**: Define las columnas o expresiones a mostrar en el resultado. El asterisco (*) selecciona todas las columnas de la tabla.
- **DISTINCT**: Elimina filas duplicadas del resultado. Esto es relevante cuando las columnas seleccionadas no incluyen la clave primaria (o parte de ella, si es compuesta).
- **ORDER BY**: Ordena el resultado según una o más columnas, en orden ascendente (**ASC**) o descendente (**DESC**).

**Ejemplo**:
```sql
SELECT *
FROM clientes
ORDER BY codpue DESC, codcli;
```
Este ejemplo muestra todos los datos de la tabla **clientes**, ordenados por **codpue** (descendente) y, dentro de cada pueblo, por **codcli** (ascendente).

## Cláusula ORDER BY

- **Uso**: Ordena los resultados de la consulta según una o más columnas.
- **Opciones**: **ASC** (ascendente, por defecto) o **DESC** (descendente).
- **Múltiples columnas**: Las filas se ordenan primero por la primera columna mencionada, luego por la segunda, y así sucesivamente.

## Expresiones en SELECT y WHERE

- Las cláusulas **SELECT** y **WHERE** pueden incluir expresiones con columnas, constantes y operadores.
- En **SELECT**, las expresiones se pueden renombrar con el operador **AS** para mejorar la legibilidad del resultado.
- En **ORDER BY**, una expresión de la cláusula **SELECT** se puede referenciar por su posición numérica en la lista de selección.

**Ejemplo**:
```sql
SELECT precio, ROUND(precio * 0.8, 2) AS rebajado
FROM articulos
ORDER BY 2;
```
Este ejemplo muestra el precio original y un precio con un 20% de descuento (redondeado a 2 decimales), ordenado por el precio rebajado.

## Manejo de Valores Nulos

- Un valor **NULL** indica la ausencia de un valor en una columna, no un valor en sí mismo.
- Operadores para manejar nulos:
  - **IS NULL**: Verifica si una columna es nula.
  - **IS NOT NULL**: Verifica si una columna no es nula.
- **COALESCE(columna, valor_por_defecto)**: Devuelve el valor de la columna si no es nulo; de lo contrario, devuelve el valor por defecto especificado.

**Ejemplo**:
```sql
SELECT codcli, nombre, COALESCE(codpostal, 0) AS postal, codpostal AS postal_null
FROM clientes
WHERE codcli < 150
AND (codpostal = 0 OR codpostal IS NULL);
```
- Este ejemplo muestra el código, nombre y código postal de los clientes con **codcli** menor a 150, reemplazando los valores nulos en **codpostal** por 0.
- La condición `(codpostal = 0 OR codpostal IS NULL)` puede simplificarse usando `COALESCE(codpostal, 0) = 0`.

## Consideraciones Importantes

- **Precaución con nulos**: Si una columna acepta valores nulos, siempre considera su manejo en las condiciones de la cláusula **WHERE** para evitar resultados inesperados.
- **Uso de DISTINCT**: Determina si es necesario usar **DISTINCT** analizando si las columnas seleccionadas podrían generar duplicados (por ejemplo, si no incluyen la clave primaria). Evita pruebas innecesarias ejecutando la consulta.
- **Optimización con DISTINCT**: En muchos SGBD, **DISTINCT** implica un algoritmo de ordenación. Si el resultado debe mostrarse ordenado, puedes evitar **ORDER BY** ajustando el orden de las columnas en **SELECT**, ya que **DISTINCT** ya ordena internamente.
