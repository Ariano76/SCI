-- CREANDO TABLA STAGE DATA HISTORICA
-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists stage_data_historica;
-- CREACION DE TABLAS
CREATE TABLE stage_data_historica
(
	id_stage_dh      INTEGER NOT NULL,
    nombre_1   TEXT NULL,
	nombre_2   TEXT NULL,
	apellido_1   TEXT NULL,
	apellido_2   TEXT NULL,
	tipo_documento   TEXT NULL,
	numero_documento   TEXT NULL,
    proyecto	TEXT NULL,
    cod_familia	TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE stage_data_historica
ADD PRIMARY KEY (id_stage_dh);

ALTER TABLE stage_data_historica
MODIFY id_stage_dh INT NOT NULL AUTO_INCREMENT;

/* CREANDO TABLA DATA HISTORICA */
DROP TABLE if exists data_historica;
-- CREACION DE TABLAS
CREATE TABLE data_historica
(
	id_dh      INTEGER NOT NULL,
    nombre_1   TEXT NULL,
	nombre_2   TEXT NULL,
	apellido_1   TEXT NULL,
	apellido_2   TEXT NULL,
	beneficiario   TEXT NULL,    
	tipo_documento   TEXT NULL,
	numero_documento   TEXT NULL,
    proyecto	TEXT NULL,
    fecha date,
    cod_familia	TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin ENGINE=MyISAM;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE data_historica ADD PRIMARY KEY (id_dh);
ALTER TABLE data_historica MODIFY id_dh INT NOT NULL AUTO_INCREMENT;

ALTER TABLE data_historica ADD FULLTEXT idxFullText (beneficiario, numero_documento);

DROP INDEX idxFullText ON data_historica;
truncate table data_historica;
--
-- COPIANDO DATOS DE LA TABLA STAGE A LA TABLA DATA_HISTORICA --
INSERT INTO data_historica (nombre_1, nombre_2, apellido_1, apellido_2, beneficiario, tipo_documento, numero_documento, proyecto, fecha, cod_familia) 
SELECT nombre_1, nombre_2, apellido_1, apellido_2, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as beneficiario, tipo_documento, numero_documento, proyecto, curdate(), cod_damilia from stage_data_historica;

REPAIR TABLE data_historica QUICK;
-- CREANDO TABLA COTEJO_DATOS_HISTORICOS
-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists resultado_cotejo_datos_historicos;
-- CREACION DE TABLAS
CREATE TABLE resultado_cotejo_datos_historicos
(
	id_busqueda      INTEGER NOT NULL,
	id_cotejo      INTEGER NOT NULL,
    id_caso      INTEGER NOT NULL,
    id_resultado      INTEGER NOT NULL,
    tipo_busqueda   TEXT NULL,
    nombre_1   TEXT NULL,
	nombre_2   TEXT NULL,
	apellido_1   TEXT NULL,
	apellido_2   TEXT NULL,
	tipo_documento   TEXT NULL,
	numero_documento   TEXT NULL,
    cod_familia TEXT NULL,
    proyecto	TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE resultado_cotejo_datos_historicos
ADD PRIMARY KEY (id_cotejo);

ALTER TABLE resultado_cotejo_datos_historicos
MODIFY id_cotejo INT NOT NULL AUTO_INCREMENT;

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

/* CONOCER LOS DETALLE DE UNA TABLA */
SHOW TABLE STATUS where name like 'data_historica';
/**/
SHOW VARIABLES LIKE "%VERSION%";

show tables;
DESCRIBE DATA_HISTORICA;
