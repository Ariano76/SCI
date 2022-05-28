/* CREACION DE FUNCIONES */

DROP FUNCTION IF EXISTS CheckPassword;
DELIMITER |
CREATE FUNCTION CheckPassword (usuario VARCHAR(50), password_p VARCHAR(100))
    RETURNS BOOL
    NOT DETERMINISTIC
    READS SQL DATA
BEGIN
	SET @clave = password(password_p);
    RETURN EXISTS (SELECT id_usuario FROM usuarios where nombre_usuario = usuario and contrasenia = @clave);
END |
DELIMITER ;
DROP FUNCTION IF EXISTS `F_AGE`;
DELIMITER |
CREATE FUNCTION `F_AGE`(in_dob datetime) RETURNS int(11)
	NO SQL
BEGIN
	DECLARE l_age INT;
       /*IF DATE_FORMAT(NOW(  ),'00-%m-%d') >= DATE_FORMAT(in_dob,'00-%m-%d') THEN
          -- This person has had a birthday this year
          SET l_age=DATE_FORMAT(NOW(  ),'%Y')-DATE_FORMAT(in_dob,'%Y');
        ELSE
          -- Yet to have a birthday this year
          SET l_age=DATE_FORMAT(NOW(  ),'%Y')-DATE_FORMAT(in_dob,'%Y')-1;
       END IF; */
	IF in_dob = '1900-01-01' THEN
		return 0;
	ELSE
		SET l_age = (select TIMESTAMPDIFF(YEAR, in_dob, CURDATE()));
		RETURN(l_age);
	END IF; 
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `F_MES`;
DELIMITER |
CREATE FUNCTION `F_MES`(in_dob datetime) RETURNS int(11)
	NO SQL
BEGIN
	DECLARE l_age INT;      
	IF in_dob = '1900-01-01' THEN
		return 0;
	ELSE
		SET l_age = (select TIMESTAMPDIFF(MONTH, in_dob, CURDATE()));
		RETURN(l_age);
	END IF; 
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `F_SINO`;
DELIMITER |
CREATE FUNCTION `F_SINO`(in_dob int) RETURNS varchar(2)       
BEGIN
	DECLARE resp varchar(2);		
	IF (in_dob = 1) THEN
		SET resp='SI';
	ELSEIF (in_dob = 0) THEN
		SET resp='NO';
	ELSE
		SET resp='NN';
	END IF;       
       RETURN(resp);
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `user_regex_replace`;
DELIMITER |
CREATE FUNCTION `user_regex_replace`(`pattern` VARCHAR(1000), `replacement` VARCHAR(1000), `original` VARCHAR(1000)) RETURNS VARCHAR(1000) 
CHARSET latin1 DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
BEGIN 
	DECLARE temp VARCHAR(1000);
	DECLARE ch VARCHAR(1);
	DECLARE i INT; 
    SET i = 1; 
	SET temp = ''; 
	IF original REGEXP pattern THEN 
		loop_label: LOOP 
        IF i>CHAR_LENGTH(original) THEN 
			LEAVE loop_label; 
		END IF; 
        SET ch = SUBSTRING(original,i,1); 
        IF NOT ch REGEXP pattern THEN 
			SET temp = CONCAT(temp,ch); 
		ELSE 
			SET temp = CONCAT(temp,replacement); 
		END IF; 
        SET i=i+1; 
	END LOOP; 
	ELSE 
		SET temp = original; 
	END IF; 
	RETURN temp; 
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `udf_strip_alphanum`;
DELIMITER |
CREATE FUNCTION `udf_strip_alphanum`(as_arg VARCHAR(2000)
) RETURNS varchar(2000) CHARSET latin1
    DETERMINISTIC
BEGIN
-- #############################################################################
-- Purpose: return string contains only specified set of characters
-- other characters removed
-- #############################################################################
   DECLARE ls_char CHAR(1)        DEFAULT '';
   DECLARE ls_ret  VARCHAR(2000)  DEFAULT '';
   DECLARE _i      INT            DEFAULT 0;
   DECLARE _len    INT            DEFAULT 0;
   SET _len := CHAR_LENGTH(as_arg);
   -- early exit for zero length or null
   IF _len IS NULL OR _len = 0 THEN
      RETURN as_arg;
   END IF;
   -- safety net for input string over 2000 character limit:
   IF _len > 2000 THEN
      SET _len := 2000;
   END IF;
   WHILE _i < _len DO
      SET _i := _i + 1;
      SET ls_char := SUBSTRING(as_arg,_i,1);
      IF INSTR('0123456789abcdefghijklmñnopqrstuvwxyzABCDEFGHIJKLMÑNOPQRSTUVWXYZáéíóúÁÉÍÓÚ_',ls_char) THEN
         SET ls_ret := CONCAT(ls_ret,ls_char);
      END IF;
   END WHILE;
   RETURN ls_ret;
END |
DELIMITER ;

DROP FUNCTION IF EXISTS `udf_remove_alpha`;
DELIMITER |
CREATE FUNCTION `udf_remove_alpha`(inputPhoneNumber VARCHAR(1000))
  RETURNS VARCHAR(1000)
  CHARSET latin1
DETERMINISTIC
  BEGIN
-- #############################################################################
-- Purpose: function removes non numeric characters from input
-- return only the numbers in the string
-- #############################################################################
    DECLARE inputLenght INT DEFAULT 0;
    -- var for our iteration 
    DECLARE counter INT DEFAULT 1;
    -- if null is passed, we still return an tempty string
    DECLARE sanitizedText VARCHAR(1000) DEFAULT '';
    -- holder of each character during the iteration
    DECLARE oneChar VARCHAR(1) DEFAULT '';
    -- we'll process only if it is not null.
    IF NOT ISNULL(inputPhoneNumber)
    THEN
      SET inputLenght = LENGTH(inputPhoneNumber);
      WHILE counter <= inputLenght DO
        SET oneChar = SUBSTRING(inputPhoneNumber, counter, 1);
        IF (oneChar REGEXP ('^[0-9]+$'))
        THEN
          SET sanitizedText = Concat(sanitizedText, oneChar);
        END IF;
        SET counter = counter + 1;
      END WHILE;
    END IF;
    RETURN sanitizedText;
 END |
 DELIMITER ;



/* CREATE VIEWS */

drop view IF EXISTS vista_encuesta;
CREATE VIEW `vista_encuesta` AS
	SELECT concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.fecha_encuesta, e.id_encuestador, e.nombre_encuestador, e.region_encuestador, e.como_realizo_encuesta, e.esta_de_acuerdo, e.id_beneficiario
    FROM encuesta e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;    

drop view IF EXISTS vista_beneficiario;
CREATE VIEW `vista_beneficiario` AS
	SELECT id_beneficiario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original
    FROM beneficiario;    

drop view IF EXISTS vista_comunicacion;
CREATE VIEW `vista_comunicacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.tiene_los_siguientes_medios_comunicacion, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.cual_es_su_numero_whatsapp, e.cual_es_su_numero_recibir_sms, e.cual_numero_usa_con_frecuencia, e.es_telefono_propio, e.como_accede_a_internet, e.cual_es_su_direccion, e.vive_o_viaja_con_otros_familiares, e.cuantos_viven_o_viajan_con_usted, e.cuantos_tienen_ingreso_por_trabajo
    FROM comunicacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_nutricion;
CREATE VIEW `vista_nutricion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.alguien_de_su_hogar_esta_embarazada, e.tiempo_de_gestacion, e.lleva_su_control_en_centro_de_salud, e.alguien_de_su_hogar_tiene_siguientes_condiciones, e.lactando_con_nn_menor_2_anios, e.no_lactando_con_nn_menor_2_anios, e.madre_nn_2_a_5_anios, e.ninguno
    FROM nutricion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_salud;
CREATE VIEW `vista_salud` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.algun_miembro_tiene_discapacidad, e.algun_miembro_tiene_problemas_salud, e.derivacion_salud, e.derivacion_proteccion
    FROM salud e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_educacion;
CREATE VIEW `vista_educacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.viaja_con_menores_de_17_anios, e.todos_los_nna_estan_matriculados, e.que_dispositvo_utilizan_en_clases_virtuales, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.que_dificultades_tuvo_al_matricular_nna, e.no_conocia_procedimiento_matricula, e.no_cuento_con_los_documentos, e.no_habia_vacantes, e.otro
    FROM educacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_derivacion_sectores;
CREATE VIEW `vista_derivacion_sectores` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.interesado_participar_nutricion, e.interesado_participar_salud, e.interesado_participar_medios_vida, e.actividades_interesado_participar, e.interesado_entrenamiento_vocacional, e.interesado_emprendimiento 
    FROM derivacion_sectores e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_estatus;
CREATE VIEW `vista_estatus` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.observaciones, es.estado as id_estado
    FROM estatus e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario 
    inner join estados es on e.id_estado = es.id_estado;  

drop view IF EXISTS vista_acciones;
CREATE VIEW `vista_acciones` AS
	SELECT a.id_accion, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.numero_cedula, e.nombre as entidad, a.fecha
    FROM acciones a inner join beneficiario b on a.id_beneficiario = b.id_beneficiario 
    inner join entidades e on a.id_entidad = e.id_entidad order by a.fecha DESC;  

drop view IF EXISTS vista_general;
CREATE VIEW `vista_general` AS
	SELECT b.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.numero_cedula, b.tipo_identificacion, b.numero_identificacion, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, b.fecha_nacimiento
    FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario; 

drop view IF EXISTS vista_integrante;
CREATE VIEW `vista_integrante` AS
	SELECT b.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.numero_cedula, i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, i.relacion_1, i.otro_1, i.tipo_identificacion_1, i.numero_identificacion_1, i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, i.relacion_2, i.otro_2, i.tipo_identificacion_2, i.numero_identificacion_2,
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, i.relacion_3, i.otro_3, i.tipo_identificacion_3, i.numero_identificacion_3, i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, i.relacion_4, i.otro_4, i.tipo_identificacion_4, i.numero_identificacion_4,
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, i.relacion_5, i.otro_5, i.tipo_identificacion_5, i.numero_identificacion_5,
	i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, i.relacion_6, i.otro_6, i.tipo_identificacion_6, i.numero_identificacion_6,
	i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, i.relacion_7, i.otro_7, i.tipo_identificacion_7, i.numero_identificacion_7
    FROM beneficiario b inner join integrantes i on b.id_beneficiario = i.id_beneficiario;

drop view IF EXISTS vista_inconsistencia_fecha_nacimiento;
CREATE VIEW `vista_inconsistencia_fecha_nacimiento` AS
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, b.primer_nombre as nombre, 
	b.genero, b.fecha_nacimiento, F_AGE(b.fecha_nacimiento) as edad, 'Beneficiario_Principal' as relacion
	FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and b.fecha_nacimiento='1900-01-01' or b.fecha_nacimiento>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_1a as nombre, 
	i.genero_1 as genero, i.fecha_nacimiento_1 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_1) as edad, i.relacion_1 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_1 <> '' and F_AGE(i.fecha_nacimiento_1)<19 
	and i.fecha_nacimiento_1='1900-01-01' or i.fecha_nacimiento_1>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_2a as nombre, 
	i.genero_2 as genero, i.fecha_nacimiento_2 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_2) as edad, i.relacion_2 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_2 <> '' and F_AGE(i.fecha_nacimiento_2)<19 
	and i.fecha_nacimiento_2='1900-01-01' or i.fecha_nacimiento_2>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_3a as nombre, 
	i.genero_3 as genero, i.fecha_nacimiento_3 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_3) as edad, i.relacion_3 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_3 <> '' and F_AGE(i.fecha_nacimiento_3)<19 
	and i.fecha_nacimiento_3='1900-01-01' or i.fecha_nacimiento_3>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_4a as nombre, 
	i.genero_4 as genero, i.fecha_nacimiento_4 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_4) as edad, i.relacion_4 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_4 <> '' and F_AGE(i.fecha_nacimiento_4)<19 
	and i.fecha_nacimiento_4='1900-01-01' or i.fecha_nacimiento_4>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_5a as nombre, 
	i.genero_5 as genero, i.fecha_nacimiento_5 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_5) as edad, i.relacion_5 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_5 <> '' and F_AGE(i.fecha_nacimiento_5)<19 
	and i.fecha_nacimiento_5='1900-01-01' or i.fecha_nacimiento_5>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_6a as nombre, 
	i.genero_6 as genero, i.fecha_nacimiento_6 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_6) as edad, i.relacion_6 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_6 <> '' and F_AGE(i.fecha_nacimiento_6)<19 
	and i.fecha_nacimiento_6='1900-01-01' or i.fecha_nacimiento_6>CURDATE()
	union all
	SELECT b.id_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_7a as nombre, 
	i.genero_7 as genero, i.fecha_nacimiento_7 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_7) as edad, i.relacion_7 as relacion
	FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_7 <> '' and F_AGE(i.fecha_nacimiento_7)<19 
	and i.fecha_nacimiento_7='1900-01-01' or i.fecha_nacimiento_7>CURDATE();

drop view IF EXISTS vista_cantidad_ninos;
CREATE VIEW `vista_cantidad_ninos` AS
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_1a as nombre, i.genero_1 as genero, i.fecha_nacimiento_1 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_1) as edad, F_MES(i.fecha_nacimiento_1) as meses, i.relacion_1 as relacion, b.transit_settle 
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_1 <> '' and F_AGE(i.fecha_nacimiento_1) <= 17 
	and i.fecha_nacimiento_1 <> '1900-01-01' and i.fecha_nacimiento_1 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_2a as nombre, i.genero_2 as genero, i.fecha_nacimiento_2 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_2) as edad, F_MES(i.fecha_nacimiento_2) as meses, i.relacion_2 as relacion, b.transit_settle 
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_2 <> '' and F_AGE(i.fecha_nacimiento_2) <= 17
	and i.fecha_nacimiento_2 <> '1900-01-01' and i.fecha_nacimiento_2 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_3a as nombre, i.genero_3 as genero, i.fecha_nacimiento_3 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_3) as edad, F_MES(i.fecha_nacimiento_3) as meses, i.relacion_3 as relacion, b.transit_settle 
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_3 <> '' and F_AGE(i.fecha_nacimiento_3) <= 17
	and i.fecha_nacimiento_3 <> '1900-01-01' and i.fecha_nacimiento_3 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_4a as nombre, i.genero_4 as genero, i.fecha_nacimiento_4 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_4) as edad, F_MES(i.fecha_nacimiento_4) as meses, i.relacion_4 as relacion, b.transit_settle	
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_4 <> '' and F_AGE(i.fecha_nacimiento_4) <= 17
	and i.fecha_nacimiento_4 <> '1900-01-01' and i.fecha_nacimiento_4 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_5a as nombre, i.genero_5 as genero, i.fecha_nacimiento_5 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_5) as edad, F_MES(i.fecha_nacimiento_5) as meses, i.relacion_5 as relacion, b.transit_settle	
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_5 <> '' and F_AGE(i.fecha_nacimiento_5) <= 17
	and i.fecha_nacimiento_5 <> '1900-01-01' and i.fecha_nacimiento_5 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_6a as nombre, i.genero_6 as genero, i.fecha_nacimiento_6 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_6) as edad, F_MES(i.fecha_nacimiento_6) as meses, i.relacion_6 as relacion, b.transit_settle 
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_6 <> '' and F_AGE(i.fecha_nacimiento_6) <= 17 
	and i.fecha_nacimiento_6 <> '1900-01-01' and i.fecha_nacimiento_6 < CURDATE()
	union all
	SELECT b.id_beneficiario, b.region_beneficiario, b.numero_cedula as cedula_beneficiario_principal, i.nombre_7a as nombre, i.genero_7 as genero, i.fecha_nacimiento_7 as fecha_nacimiento, F_AGE(i.fecha_nacimiento_7) as edad, F_MES(i.fecha_nacimiento_7) as meses, i.relacion_7 as relacion, b.transit_settle	
    FROM integrantes i inner join encuesta e on i.id_beneficiario = e.id_beneficiario 
	inner join beneficiario b on b.id_beneficiario = e.id_beneficiario 
	where e.esta_de_acuerdo = 1 and i.relacion_7 <> '' and F_AGE(i.fecha_nacimiento_7) <= 17 
	and i.fecha_nacimiento_7 <> '1900-01-01' and i.fecha_nacimiento_7 < CURDATE();



/* PRUEBAS */

select F_AGE('1900-01-01') as edad;
select F_SINO(2) as Respuesta;

select * from vista_cantidad_ninos ;
-- LISTAR TODAS LAS VISTAS DE LA BD
SHOW FULL TABLES IN bd_bha_sci WHERE TABLE_TYPE LIKE 'VIEW';
SELECT * FROM information_schema.`TABLES` WHERE TABLE_TYPE LIKE 'VIEW' AND TABLE_SCHEMA LIKE 'bd_bha_sci';
-- LISTAR TODAS LAS TABLAS DE LA BD
SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_TYPE LIKE 'BASE TABLE' AND TABLE_SCHEMA LIKE 'bd_bha_sci';
-- LISTAR TODOS LOS STORED PROCEDURE DE LA BD
SHOW PROCEDURE STATUS WHERE Db = 'bd_bha_sci';
SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE="PROCEDURE"  AND ROUTINE_SCHEMA="bd_bha_sci";
SELECT count(ROUTINE_NAME) FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE="PROCEDURE"  AND ROUTINE_SCHEMA="bd_bha_sci";

    
    
    