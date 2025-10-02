**Operadores Y Funciones**

Veremos algunos de los operadores y funciones que se pueden utilizar en las cláusulas SELECT y WHERE para formar expresiones. Aunque algunos son estándar, cada SGBD suele proporcionar otros operadores y funciones propias que dan mucha potencia al lenguaje. Es muy aconsejable consultar siempre los manuales para saber qué ofrece cada sistema concreto.

**1\. Tipos de datos**

Los tipos de datos disponibles en PostgreSQL puedes consultarlos en su manual de usuario. En este apartado comentamos brevemente los tipos de datos que se han usado para definir la base de datos de prácticas (todos son tipos del estándar de SQL).  
	• VARCHAR(n) : Cadena de hasta n caracteres.  
	• NUMERIC(n,m) : Número con n dígitos, de los cuales m se encuentran a la derecha del punto decimal.  
	• DATE : Fecha. Para guardar fecha y hora se debe utilizar el tipo TIMESTAMP.  
	• BOOLEAN : Aunque este tipo no se ha utilizado en la base de datos de prácticas, es interesante conocer su existencia. El valor verdadero se representa mediante TRUE y el falso mediante FALSE. Cuando se imprimen estos valores, se muestra el carácter ’t’ para verdadero y el carácter ’f’ para falso.

Hay que tener siempre en cuenta que el nulo no es un valor, sino que implica ausencia de valor. El nulo se representa mediante NULL y cuando se imprime no se muestra nada. En la sesión anterior vimos cómo se pueden cambiar los nulos por valores mediante la función COALESCE.

**2\. Operadores lógicos**

Estos operadores son AND, OR y NOT. PostgreSQL utiliza una lógica booleana de tres valores:

**a     		b     		a AND b    	 a OR b     	NOT b**  
True     	True     	True    	 	True    	 	False  
True     	False     	False    	True    	 	True  
True     	Null     		Null    		True    	 	Null  
False    	False     	False    	False   		True  
False     	Null     		False    	Null   	 	Null  
Null     		Null     		Null    	 	Null   		Null

**3\. Operadores de comparación**  
	• \< Menor que.  
	• \> Mayor que  
	• \<= Menor o igual que.  
	• \>= Mayor o igual que.  
	• \= Igual que.  
	• \!= Distinto de.  
	• a BETWEEN x AND y Equivale a: a \>= x AND a \<= y  
	• a NOT BETWEEN x AND y Equivale a: a \< x OR a \> y  
	• a IS NULL Devuelve True si a es nulo.  
	• a IS NOT NULL Devuelve True si a es no nulo.  
	• a IN (v1, v2, ...) Equivale a: a \= v1 OR a \= v2 OR ...

**4\. Operadores matemáticos**  
	• \+ Suma.  
	• \- Resta.  
	• \* Multiplicación.  
	• / División (si es entre enteros, trunca el resultado).  
	• % Resto de la división entera.  
	• ^ Potencia (3ˆ2 \= 9).  
	• |/ Raíz cuadrada (|/25 \= 5).  
	• ||/ Raíz cúbica (||/27 \= 3).  
	• \! Factorial (5\! \= 120).  
	• \!\! Factorial como operador prefijo (\!\!5 \= 120).  
	• @ Valor absoluto.

No se han incluido en esta lista los operadores que realizan operaciones sobre tipos de datos binarios.

**5\. Funciones matemáticas**  
	• ABS(x) Valor absoluto de x.  
	• SIGN(x) Devuelve el signo de x (-1, 0, 1).  
	• MOD(x,y) Resto de la división entera de x entre y.  
	• SQRT(x) Raíz cuadrada de x.  
	• CBRT(x) Raíz cúbica de x.  
	• CEIL(x) Entero más cercano por encima de x.  
	• FLOOR(x) Entero más cercano por debajo de x.  
	• ROUND(x) Redondea al entero más cercano.  
	• ROUND(x,n) Redondea x a n dígitos decimales, si n es positivo. Si n es negativo, redondea al entero más cercano a x y múltiplo de 10n.  
	• TRUNC(x) Trunca x.  
	• TRUNC(x,n) Trunca x a n dígitos decimales, si n es positvo. Si n es negativo, trunca al entero más cercano por debajo de x y múltiplo de 10n.

Además de éstas, PostgreSQL incluye otras muchas funciones para: calcular logaritmos, convertir entre grados y radianes, funciones trigonométricas, etc.

**6\. Operadores y funciones de cadenas de caracteres**

En SQL, las cadenas de caracteres se delimitan por comitas simples: ’cadena’.  
	• cadena || cadena : Concatena dos cadenas.  
	• cadena LIKE expr : Devuelve TRUE si la cadena sigue el patrón de la cadena que se pasa en expr. En exp. se puede utilizar comodines: \_ para un solo carácter y % para cero ó varios caracteres.  
	• LENGTH(cadena) : Número de caracteres que tiene la cadena.  
	• CHAR LENGTH(cadena) : Es la función del estándar que funciona igual que LENGTH.  
	• POSITION(subcadena IN cadena) : Posición de inicio de la subcadena en la cadena.  
	• SUBSTR(cadena, n \[, long\]) : Devuelve la subcadena de la cadena que empieza en la posición n (long fija el tamaño máximo de la subcadena; si no se especifica, devuelve hasta el final).  
	• SUBSTRING(cadena FROM n \[FOR long\]) : Es la función del estándar que funciona igual que SUBSTR: devuelve la subcadena de la cadena que empieza en la posición n (long fija el tamaño máximo de la subcadena; si no se especifica, devuelve hasta el final).  
	• LOWER(cadena) : Devuelve la cadena en minúsculas.  
	• UPPER(cadena) : Devuelve la cadena en mayúsculas.  
	• BTRIM(cadena) : Elimina los espacios que aparecen por delante y por detrás en la cadena.  
	• LTRIM(cadena) : Elimina los espacios que aparecen por delante (izquierda) en la cadena.  
	• RTRIM(cadena) : Elimina los espacios que aparecen por detrás (derecha) de la cadena.  
	• BTRIM(cadena, lista) : Elimina en la cadena la subcadena formada sólo por caracteres que aparecen en la lista, tanto por delante como por detrás.

Ejemplo: SELECT BTRIM(’--++-+Hola+-cara-+cola++--+-’, ’+-’);

	• LTRIM(cadena, lista) : Funciona como BTRIM pero sólo por delante (izquierda).  
	• RTRIM(cadena, subcadena) : Funciona como BTRIM pero sólo por detrás (derecha).  
	• TRIM(lado lista FROM cadena) : Es la función del estándar que funciona como BTRIM si lado es BOTH, funciona como LTRIM si lado es LEADING y funciona como RTRIM si lado es TRAILING.

Ejemplo: SELECT TRIM(BOTH ’+-’ FROM ’--++-+Hola+-cara-+cola++--+-’);

	• CHR(n) : Devuelve el carácter cuyo código ASCII viene dado por n.  
	• INITCAP(cadena) : Devuelve la cadena con la primera letra de cada palabra en mayúscula.  
	• LPAD(cadena, n, \[, c\]) : Devuelve la cadena rellenada por la izquierda con el carácter c hasta completar la longitud especificada por n (si no se especifica c, se rellena de espacios). Si la longitud de la cadena es de más de n caracteres, se trunca por el final.  
	• RPAD(cadena, n, \[, c\]) : Devuelve la cadena rellenada por la derecha con el carácter c hasta completar la longitud especificada por n (si no se especifica c, se rellena de espacios). Si la longitud de la cadena es de más de n caracteres, se trunca por el final.

**7\. Operadores y funciones de fecha**

En PostgreSQL se puede escoger el modo de visualizar las fechas mediante SET DATESTYLE. Concretamente, para visualizar las fechas al estilo europeo (el día antes del mes) y separando día, mes y año por el carácter / (estilo SQL), utilizaremos la orden:

SET DATESTYLE TO EUROPEAN, SQL;

El tipo de datos DATE tiene sus operadores y funciones, como el resto de tipos, de los que veremos aquí sólo algunos. En primer lugar veremos las funciones que nos permiten convertir entre distintos tipos de datos. Todas ellas tienen la misma estructura: se les pasa un dato de un tipo, que se ha de convertir a otro tipo según el patrón indicado mediante un formato.  
	• TO CHAR(dato, formato) : Convierte el dato de cualquier tipo a cadena de caracteres.  
	• TO DATE(dato, formato) : Convierte el dato de tipo cadena a fecha.  
	• TO NUMBER(dato, formato) : Convierte el dato de tipo cadena a número.  
A continuación se muestran algunos de los patrones que se pueden especificar en los formatos:  
Conversiones fecha/hora:  
	• HH Hora del día (1-12).  
	• HH12 Hora del día (1-12).  
	• HH24 Hora del día (1-24).  
	• MI Minuto (00-59).  
	• SS Segundo (00-59).  
	• YYYY Año.  
	• YYY Ultimos tres dígitos del año.  
	• YY Ultimos dos dígitos del año.  
	• Y Ultimo dígito del año.  
	• MONTH Nombre del mes.  
	• MON Nombre del mes abreviado.  
	• DAY Nombre del día.  
	• DY Nombre del día abreviado.  
	• DDD Número del día dentro del año (001-366).  
	• DD Número del día dentro del mes (01-31).  
	• D Número del día dentro de la semana (1-7 empezando en domingo).  
	• WW Número de la semana en el año (1-53).  
	• W Número de la semana en el mes (1-5).  
	• Q Número del trimestre (1-4).  
	• Conversiones numéricas:  
	• 9 Dígito numérico.  
	• S Valor negativo con signo menos.  
	• . Punto decimal.  
	• , Separador de miles.

Cuando el formato muestra un nombre, utilizando en el patrón de forma adecuada las mayúsculas y minúsculas, se cambia el modo en que se muestra la salida. Por ejemplo, MONTH muestra el nombre del mes en mayúsculas, Month lo muestra sólo con la inicial en mayúscula y month lo muestra todo en minúsculas.

Cualquier carácter que se especifique en el formato y que no coincida con ningún patrón, se copia en la salida del mismo modo en que está escrito. A continuación se muestran algunos ejemplos:

SELECT TO\_CHAR(CURRENT\_TIMESTAMP, ’HH12 horas MI m. SS seg.’);

SELECT TO\_NUMBER(’-12,454.8’,’S999,999.9’);

Las funciones más habituales que utilizaremos son las siguientes:  
	• CURRENT DATE : Función del estándar que devuelve la fecha actual (el resultado es de tipo DATE).  
	• CURRENT TIME : Función del estándar que devuelve la hora actual (el resultado es de tipo TIME).  
	• CURRENT TIMESTAMP : Función del estándar que devuelve la fecha y hora actuales (el resultado es de tipo TIMESTAMP).  
	• EXTRACT(campo FROM dato) : Función estándar que devuelve la parte del dato indicada por campo; dato que puede ser de tipo fecha u hora. El resultado es de tipo DOUBLE PRECISION. En campo se pueden especificar las siguientes partes:  
        	▪ day : día del mes (1:31)  
        	▪ dow : día de la semana (0:6 empezando en domingo)  
        	▪ doy : día del año (1:366)  
        	▪ week : semana del año  
        	▪ month : mes del año (1:12)  
        	▪ quarter : trimestre del año (1:4)  
        	▪ year : año  
        	▪ hour : hora  
        	▪ minute : minutos  
        	▪ second : segundos

A continuación se muestran algunos ejemplos de uso de estas funciones:

SELECT CURRENT\_TIMESTAMP;

SELECT 365 \- EXTRACT(doy FROM CURRENT\_DATE) AS dias\_faltan;

SELECT EXTRACT(week FROM TO\_DATE(’7/11/2005’,’dd/mm/yyyy’));  
Para sumar o restar días a una fecha se utilizan los operadores \+ y \-. Por ejemplo, para sumar 7 días a la fecha actual escribiremos CURRENT DATE \+ 7\.

**8\. Función CASE**

Los lenguajes de programación procedurales suelen tener sentencias condicionales: si una condición es cierta entonces se realiza una acción, sino se realiza otra acción distinta. SQL no es un lenguaje procedural, sin embargo permite un control condicional sobre los datos devueltos en una consulta, mediante la función CASE.

A continuación se muestra un ejemplo que nos servirá para explicar el modo de uso de esta función:

SELECT codart, precio,  
CASE WHEN stock \> 500 THEN precio \* 0.8  
WHEN stock between 200 and 500 THEN precio \* 0.9  
ELSE precio  
END AS precio\_con\_descuento  
FROM articulos;

Esta sentencia muestra, para cada artículo, su código, su precio y un precio con descuento que se obtiene en función de su stock: si el stock es superior a 500 unidades, el descuento es del 20% (multiplicamos el precio por 0.8), si el stock está entre las 200 y las 500 unidades, el descuento es del 10% (multiplicamos el precio por 0.9) y sino, el precio se mantiene sin descuento.  
La columna con el precio de descuento se renombra (precio con descuento). La función CASE termina con END y puede tener tantas cláusulas WHEN ...THEN como se precise.

**9\. Funciones COALESCE y NULLIF**

COALESCE(valor \[, ...\])  
NULLIF(valor1, valor2)

La función COALESCE devuelve el primero de sus parámetros que es no nulo. La función NULLIF devuelve un nulo si valor1 y valor2 son iguales; si no, devuelve valor1. Estas dos funciones se transforman internamente a expresiones equivalentes con la función CASE.

SELECT COALESCE(stock, stock\_min, \-1) FROM articulos;  
SELECT NULLIF(stock, stock\_min) FROM articulos;