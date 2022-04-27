SELECT * FROM bd_bha_sci.stage_data_historica limit 0,10; 
SELECT DISTINCT(dato_02) FROM bd_bha_sci.stage_data_historica;

-- VERIFICAR SI ESTA EXPRESION REGULAR CUMPLE SU FUNCION
-- para reemplazar cualquier no alfanumérico con espacios. 
-- Si solo desea eliminar caracteres en su lista, usaría algo como
-- https://dbfiddle.uk/?rdbms=mysql_8.0&fiddle=695fe924cf2cc90251a51a435ac9d703
UPDATE bd_bha_sci.stage_data_historica SET nombre_1 = REGEXP_REPLACE(your_column, '[\]\\[!@#$%.&*`~^_{}:;<>/\\|()-]+', ' ') ;
/*LISTAR REGISTROS FULL TEXTO QUE INCLUYEN NUMEROS*/
/* DEVUELVE SOLO NUMEROS O LETRAS MAS NUMEROS*/
SELECT id_dh, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, proyecto
FROM bd_bha_sci.data_historica where nombre_1 REGEXP '[[:digit:]]' OR nombre_2 REGEXP '[[:digit:]]' OR apellido_1 REGEXP '[[:digit:]]' OR apellido_2 REGEXP '[[:digit:]]' OR tipo_documento REGEXP '[[:digit:]]'; /*OR proyecto REGEXP '[[:digit:]]';
/*LISTAR REGISTROS NUMERICOS QUE CONTENGAN ALGUNA CADENA*/
SELECT id_stage_dh, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as nombre, tipo_documento, numero_documento 
FROM bd_bha_sci.stage_data_historica where numero_documento REGEXP '.*[^0-9].*' ;
/*remover todos los SALTOS DE LINEA de una columna*/
UPDATE bd_bha_sci.stage_data_historica SET nombre_1 = REGEXP_REPLACE(nombre_1, '\\n', ''), nombre_2 = REGEXP_REPLACE(nombre_2, '\\n', ''), apellido_1 = REGEXP_REPLACE(apellido_1, '\\n', ''), apellido_2 = REGEXP_REPLACE(apellido_2, '\\n', ''), tipo_documento = REGEXP_REPLACE(tipo_documento, '\\n', ''), numero_documento = REGEXP_REPLACE(numero_documento, '\\n', ''), proyecto = REGEXP_REPLACE(proyecto, '\\n', '') ;
/*remover todos los BACK SLASH de una columna*/
UPDATE bd_bha_sci.stage_data_historica SET nombre_1 = REPLACE(nombre_1, '\\', ''), nombre_2 = REPLACE(nombre_2, '\\', ''), apellido_1 = REPLACE(apellido_1, '\\', ''), apellido_2 = REPLACE(apellido_2, '\\', ''), tipo_documento = REPLACE(tipo_documento, '\\', ''), numero_documento = REPLACE(numero_documento, '\\', ''), proyecto = REPLACE(proyecto, '\\', '');
/*SOLO DEJA ALFANUMERICO Y VOCALES ACENTUADAS, TODO LO DEMAS LO ELIMINA*/
UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '[^[:alnum:]]+', ' '), tipo_documento = REGEXP_REPLACE(tipo_documento, '[^[:alnum:]]+', ' ');

UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '[A-Za-z]', ''), numero_documento = REGEXP_REPLACE(numero_documento, '[áéíóú]', '');
/*ACTUALIZAR DOBLE ESPACIOS EN BLANCO */
UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '\\s', '');

UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' WHERE tipo_documento = 'Carnet de extranjería';
UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' WHERE tipo_documento = 'Carnet de Extranjería';
UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de refugio' WHERE tipo_documento = 'Carnet de Solicitante de Refugio';

UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = REGEXP_REPLACE(tipo_documento, '[0-9]', '');

/*remover todos los espacios en blanco de una columna*/
UPDATE bd_bha_sci.stage_data_historica SET nombre_1=TRIM(nombre_1), nombre_2=TRIM(nombre_2), apellido_1=TRIM(apellido_1), apellido_2=TRIM(apellido_2), tipo_documento=TRIM(tipo_documento), numero_documento=TRIM(numero_documento), proyecto=TRIM(proyecto) ;
/* ++++++++++++++++++++++++++++++++++ */
truncate table bd_bha_sci.stage_00;

SET @total = 0;
call SP_LimpiarTablaStage(@total);
SELECT @total;

SET @total = 0;
call SP_LimpiarTablaStageDataHistorica(@total);
SELECT @total;

SET @total = 0;
call SP_UpdateDobleEspacioBlanco(@total);
SELECT @total;

SET @total = 0;
call SP_UpdateTab(@total);
SELECT @total;

SET @total = 0;
call SP_UpdateSaltoLinea(@total);
SELECT @total;

SET @total = 0;
call SP_UpdateLetrasPuntoGuion(@total);
SELECT @total;

call SP_UpdateBackSlash;
call SP_UpdateTrim;
call SP_UpdateRecodificarSiNo;
call SP_UpdateInfoTransito;
call SP_SelectDHDocIdentConIncidencias();
call SP_SelectDHNombresConDigitos();

call SP_SelectNumeroIdentificacionConIncidencias(@total);
SELECT @total;
call SP_UpdateNewLineReturnLine(@total);
SELECT @total;

select chr(10);
