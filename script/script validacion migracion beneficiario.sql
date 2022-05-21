/* PARA VER LA CONFIGURACION DE LAS VARIABLES*/
SHOW VARIABLES LIKE 'sql_mode';
select version();
/*  */
SELECT * FROM bd_bha_sci.beneficiario ;
SELECT * FROM bd_bha_sci.encuesta ;
SELECT * FROM bd_bha_sci.comunicacion;
SELECT * FROM bd_bha_sci.nutricion;
SELECT * FROM bd_bha_sci.educacion;
SELECT * FROM bd_bha_sci.salud;
SELECT * FROM bd_bha_sci.derivacion_sectores;
SELECT * FROM bd_bha_sci.integrantes;
SELECT * FROM bd_bha_sci.estatus;

delete from bd_bha_sci.encuesta where id_encuesta>0;
DELIMITER ;
delete from bd_bha_sci.comunicacion where id_comunicacion>0;
DELIMITER ;
delete from bd_bha_sci.nutricion where id_nutricion>0;
DELIMITER ;
delete from bd_bha_sci.educacion where id_educacion>0;
DELIMITER ;
delete from bd_bha_sci.salud where id_salud>0;
DELIMITER ;
delete from bd_bha_sci.derivacion_sectores where id_derivacion>0;
DELIMITER ;
delete from bd_bha_sci.integrantes where id_integrantes>0;
DELIMITER ;
delete from bd_bha_sci.acciones where id_accion>0;
DELIMITER ;
delete from bd_bha_sci.estatus where id_estatus>0;
DELIMITER ;
delete from bd_bha_sci.beneficiario where id_beneficiario>0;

ALTER TABLE bd_bha_sci.beneficiario AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.encuesta AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.comunicacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.nutricion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.educacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.salud AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.derivacion_sectores AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.integrantes AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.acciones AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.estatus AUTO_INCREMENT = 1;

/*  CONSULTAS PARA VER LA CONFIGURACION DE LAS TABLAS */

DROP INDEX idxFullText ON data_historica;
truncate table data_historica;
--
REPAIR TABLE data_historica QUICK;

-- CONSULTA UTILIZANDO AGAINST SOBRE DATA HISTORICA --

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
SHOW TABLES;
SHOW TABLE STATUS; -- LISTA TODAS LAS TABLAS DE LA BD CON SUS CARACTERISTICAS
SHOW TABLE STATUS where name like 'data_historica';
DESCRIBE DATA_HISTORICA; -- LISTA TODAS LAS CARACTERISTICAS DE UNA TABLA
SHOW VARIABLES LIKE "%VERSION%";
SHOW CREATE TABLE beneficiario;
SHOW COLLATION;

/*** REPARANDO INDICES DE TABLAS ***/

SELECT * FROM mysql.global_priv;
CHECK TABLE mysql.global_priv;
REPAIR TABLE mysql.global_priv;

/*** SELECT ALL TABLAS DE UNA BD CON ENGINE=MyISAM LISTO PARA MODIFICAR A InnoDB ***/
SET @DATABASE_NAME = 'bd_bha_sci';
SELECT CONCAT('ALTER TABLE `', table_name, '` ENGINE=InnoDB;',' -- Engine Original: ', engine) AS sql_statements
FROM information_schema.tables AS tb
WHERE table_schema = @DATABASE_NAME AND `TABLE_TYPE` = 'BASE TABLE' -- AND `ENGINE` = 'MyISAM' 
ORDER BY table_name DESC;
