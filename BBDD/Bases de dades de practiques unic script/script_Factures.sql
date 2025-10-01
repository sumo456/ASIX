\c template1
drop database facturas;
create database facturas /*WITH ENCODING 'UTF8'
   LC_COLLATE = 'es_ES.UTF-8'
   LC_CTYPE = 'es_ES.UTF-8'
   TEMPLATE = template1
   CONNECTION LIMIT = -1*/;
\c facturas
\i Facturas_full.sql

