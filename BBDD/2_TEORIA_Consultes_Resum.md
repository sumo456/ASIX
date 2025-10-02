# Resumen de Consultas en SQL

Este documento ofrece un resumen claro y estructurado sobre las funciones de agregación en SQL, con un enfoque en su comportamiento, manejo de valores NULL, uso de DISTINCT, y las reglas para procesar consultas. Se incluyen explicaciones detalladas para facilitar su comprensión.

## 1. Funciones de Agregación

Las funciones de agregación procesan un conjunto de valores para devolver un único resultado. Las principales son:

- **SUM**: Calcula la suma de los valores de una columna numérica.
- **AVG**: Calcula el promedio de los valores de una columna numérica.
- **MIN** y **MAX**: Determinan el valor mínimo y máximo, respectivamente.
  - Para valores numéricos, el cálculo es directo.
  - Para valores alfanuméricos, el orden depende de la codificación de la máquina (ASCII, EBCDIC, etc.).
  - Para fechas y horas, la comparación es cronológica.
- **COUNT**: Cuenta el número de filas o valores no nulos.
  - **COUNT(*)**: Cuenta todas las filas, independientemente de si contienen valores NULL.
  - **COUNT(columna)**: Cuenta solo las filas donde la columna especificada no es NULL.

### Comportamiento con Valores NULL
- Según el estándar ANSI, las funciones de agregación (excepto **COUNT(*)**) ignoran los valores NULL.
- **Ejemplo de inconsistencia**:
  - Si una columna tiene valores NULL, `SUM(A) - SUM(B)` no es necesariamente igual a `SUM(A - B)`.
  - Supongamos dos columnas, A y B, con 10 filas, donde B tiene un valor NULL:
    - `SUM(A)` suma 10 valores, `SUM(B)` suma 9 valores (ignora el NULL).
    - `SUM(A - B)` suma solo 9 valores, ya que `A - NULL` resulta en NULL.
  - Por lo tanto, `SUM(A) - SUM(B)` calcula la diferencia entre sumas, mientras que `SUM(A - B)` suma los resultados de restas individuales.

### Reglas para Valores NULL y Columnas Vacías
- Si todos los valores de una columna son NULL:
  - **SUM**, **AVG**, **MIN**, **MAX** devuelven NULL.
  - **COUNT(columna)** devuelve 0.
- Si la columna está vacía (sin filas):
  - **SUM**, **AVG**, **MIN**, **MAX** devuelven 0.
  - **COUNT(*)** devuelve 0.
- **COUNT(*)** siempre cuenta filas, ignorando si las columnas contienen NULL.

### Uso de DISTINCT
- Para eliminar valores duplicados antes de aplicar una función de agregación, se usa **DISTINCT** dentro de la función.
  - Ejemplo: `COUNT(DISTINCT TITULO)` cuenta solo los valores únicos de la columna TITULO.

### Restricciones
- No se permite anidar funciones de agregación (por ejemplo, `SUM(AVG(columna))` es ilegal).
- No se puede mezclar funciones de agregación con columnas ordinarias en la lista de selección, salvo que se usen cláusulas como **GROUP BY**.

## 2. Reglas para Procesar Consultas SQL

El procesamiento de una consulta SQL sigue un orden lógico definido por el estándar. A continuación, se describen los pasos:

1. **UNION**: Si la consulta incluye un **UNION**, procesar cada sentencia **SELECT** individualmente (pasos 2 a 5) para generar sus resultados parciales.

2. **FROM**: Formar el producto cartesiano de las tablas especificadas en la cláusula **FROM**. Si solo hay una tabla, el resultado es la tabla misma.

3. **WHERE**: Aplicar la condición de la cláusula **WHERE** a cada fila del producto cartesiano, reteniendo solo las filas donde la condición es **TRUE**. Las filas con condiciones **FALSE** o **NULL** se descartan.

4. **SELECT**: Para cada fila restante, calcular los valores de la lista de selección:
   - Para columnas simples, usar el valor de la columna en la fila actual.
   - Para funciones de agregación, usar el conjunto completo de filas (o grupos si se usa **GROUP BY**).

5. **DISTINCT**: Si se especifica **SELECT DISTINCT**, eliminar las filas duplicadas del resultado.

6. **UNION**: Si la consulta es un **UNION**, combinar los resultados de las sentencias **SELECT** individuales en una sola tabla. Eliminar duplicados, salvo que se use **UNION ALL**.

7. **ORDER BY**: Si hay una cláusula **ORDER BY**, ordenar los resultados según los criterios especificados.
