
DROP INDEX idxFullText ON data_historica;
truncate table data_historica;
--
REPAIR TABLE data_historica QUICK;

-- CONSULTA DATOS EN TABLA DATA HISTORICA --

SELECT * FROM DATA_HISTORICA WHERE MATCH(nombre_1, nombre_2, apellido_1, apellido_2, numero_documento)
AGAINST('ISABELLA MONTILLA');

SELECT ID_DH, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto,
MATCH(nombre_1, nombre_2, apellido_1, apellido_2, numero_documento) AGAINST('CARIS* +ALEXANDER* +PEREZ* +DELPINO*') as relevancia
FROM DATA_HISTORICA WHERE MATCH(nombre_1, nombre_2, apellido_1, apellido_2, numero_documento) AGAINST('ISABELLA MONTILLA') ;

SELECT ID_DH, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto,
MATCH(beneficiario, numero_documento) AGAINST('15707926') as relevancia
FROM DATA_HISTORICA WHERE MATCH(beneficiario, numero_documento) 
AGAINST('15707926' IN BOOLEAN MODE) ;

/*** CONOCER LOS DETALLE DE UNA TABLA ***/
SHOW TABLE STATUS where name like 'stage_00';
SHOW TABLE STATUS where name like 'data_historica';
SHOW VARIABLES LIKE "%VERSION%";
show tables;
DESCRIBE DATA_HISTORICA;
