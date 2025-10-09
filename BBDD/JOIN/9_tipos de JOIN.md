Tipus de combinacions múltiples.

**,**   
Totes les combinacions possibles entre dos taules, es pot fer servir la relació entre taules al where

* select nombre, codfac   
  from clientes, facturas;  
    
* select nombre, codfac   
  from clientes, facturas   
  where clientes.codcli=facturas.codcli;

**self join**   
Fa servir el using sols.

* select nombre, codfac   
  from clientes self join facturas using (codcli);

**cross join**   
Funciona com la , 

* select nombre, codfac   
  from clientes cross join facturas;  
    
* select nombre, codfac   
  from clientes cross join facturas   
  where clientes.codcli=facturas.codcli;

**Join**   
Per a camps amb el mateix nom a diferents taules

* select nombre, codfac   
  from clientes join facturas using (codcli);  
    
* select nombre, codfac   
  from clientes join facturas on (clientes.codcli=facturas.codcli);

**natural join**    
Funciona com el join però sense tenir que especificar els camps a relacionar, cal tenir les relacions de claus foranies correctament fetes al create, si hi ha més d’una clau foranea en la taula pot no funcionar correctament.

* select nombre, codfac   
  from clientes natural join facturas;

**inner join**   
Com el join, es l’opcio per defecte, quan fem servir el join estem fent servir el inner join

* select nombre, codfac   
  from clientes inner join facturas on (clientes.codcli=facturas.codcli);  
    
* select nombre, codfac   
  from clientes inner join facturas using (codcli);

**left join**   
Fa com el join, però a més agrega tots els camps de la taula que esta a la esquerra del join que no estan relacionats amb la taula de la dreta

* select nombre, codfac   
  from clientes left join facturas on (clientes.codcli=facturas.codcli);  
    
* select nombre, codfac   
  from clientes left join facturas using (codcli);

**right join**   
Fa com el join, però a més agrega tots els camps de la taula que esta a la dreta del join que no estan relacionats amb la taula de la esquerra.

* select nombre, codfac   
  from clientes right join facturas on (clientes.codcli=facturas.codcli);  
    
* select nombre, codfac   
  from clientes right join facturas using (codcli);

**full join**   
Fa com el join, però a més agrega tots els camps de les dues taules no estan relacionades entre les taules.

* select nombre, codfac   
  from clientes full join facturas on (clientes.codcli=facturas.codcli);  
    
* select nombre, codfac   
  from clientes full join facturas using (codcli);

