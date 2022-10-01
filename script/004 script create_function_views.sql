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
DELIMITER ;
drop view IF EXISTS vista_beneficiario;
CREATE VIEW `vista_beneficiario` AS
	SELECT id_beneficiario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original
    FROM beneficiario;    
DELIMITER ;
drop view IF EXISTS vista_comunicacion;
CREATE VIEW `vista_comunicacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.tiene_los_siguientes_medios_comunicacion, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.cual_es_su_numero_whatsapp, e.cual_es_su_numero_recibir_sms, e.cual_numero_usa_con_frecuencia, e.es_telefono_propio, e.como_accede_a_internet, e.cual_es_su_direccion, e.vive_o_viaja_con_otros_familiares, e.cuantos_viven_o_viajan_con_usted, e.cuantos_tienen_ingreso_por_trabajo
    FROM comunicacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
DELIMITER ;
drop view IF EXISTS vista_nutricion;
CREATE VIEW `vista_nutricion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.alguien_de_su_hogar_esta_embarazada, e.tiempo_de_gestacion, e.lleva_su_control_en_centro_de_salud, e.alguien_de_su_hogar_tiene_siguientes_condiciones, e.lactando_con_nn_menor_2_anios, e.no_lactando_con_nn_menor_2_anios, e.madre_nn_2_a_5_anios, e.ninguno
    FROM nutricion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
DELIMITER ;
drop view IF EXISTS vista_salud;
CREATE VIEW `vista_salud` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.algun_miembro_tiene_discapacidad, e.algun_miembro_tiene_problemas_salud, e.derivacion_salud, e.derivacion_proteccion
    FROM salud e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
DELIMITER ;
drop view IF EXISTS vista_educacion;
CREATE VIEW `vista_educacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.viaja_con_menores_de_17_anios, e.todos_los_nna_estan_matriculados, e.que_dispositvo_utilizan_en_clases_virtuales, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.que_dificultades_tuvo_al_matricular_nna, e.no_conocia_procedimiento_matricula, e.no_cuento_con_los_documentos, e.no_habia_vacantes, e.otro
    FROM educacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
DELIMITER ;
drop view IF EXISTS vista_derivacion_sectores;
CREATE VIEW `vista_derivacion_sectores` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.interesado_participar_nutricion, e.interesado_participar_salud, e.interesado_participar_medios_vida, e.actividades_interesado_participar, e.interesado_entrenamiento_vocacional, e.interesado_emprendimiento 
    FROM derivacion_sectores e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
DELIMITER ;
drop view IF EXISTS vista_estatus;
CREATE VIEW `vista_estatus` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.observaciones, es.estado as id_estado
    FROM estatus e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario 
    inner join estados es on e.id_estado = es.id_estado;  
DELIMITER ;
drop view IF EXISTS vista_acciones;
CREATE VIEW `vista_acciones` AS
	SELECT a.id_accion, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.numero_cedula, e.nombre as entidad, a.fecha
    FROM acciones a inner join beneficiario b on a.id_beneficiario = b.id_beneficiario 
    inner join entidades e on a.id_entidad = e.id_entidad order by a.fecha DESC;  
DELIMITER ;
drop view IF EXISTS vista_general;
CREATE VIEW `vista_general` AS
	SELECT b.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.numero_cedula, b.tipo_identificacion, b.numero_identificacion, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, b.fecha_nacimiento, e.observaciones, 
    CONCAT(UCASE(LEFT(es.estado, 1)), LCASE(SUBSTRING(es.estado, 2))) as id_estado
    FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
    inner join estatus e on b.id_beneficiario = e.id_beneficiario inner join estados es on e.id_estado = es.id_estado;  
DELIMITER ;
drop view IF EXISTS vista_integrante;
CREATE VIEW `vista_integrante` AS
	SELECT b.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.numero_cedula, i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, i.relacion_1, i.otro_1, i.tipo_identificacion_1, i.numero_identificacion_1, i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, i.relacion_2, i.otro_2, i.tipo_identificacion_2, i.numero_identificacion_2,
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, i.relacion_3, i.otro_3, i.tipo_identificacion_3, i.numero_identificacion_3, i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, i.relacion_4, i.otro_4, i.tipo_identificacion_4, i.numero_identificacion_4,
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, i.relacion_5, i.otro_5, i.tipo_identificacion_5, i.numero_identificacion_5,
	i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, i.relacion_6, i.otro_6, i.tipo_identificacion_6, i.numero_identificacion_6,
	i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, i.relacion_7, i.otro_7, i.tipo_identificacion_7, i.numero_identificacion_7
    FROM beneficiario b inner join integrantes i on b.id_beneficiario = i.id_beneficiario;
DELIMITER ;
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
DELIMITER ;
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
DELIMITER ;
drop view IF EXISTS vista_actividades;
CREATE VIEW `vista_actividades` AS
	SELECT id_actividad, nom_actividad, fecha_actividad
    FROM actividad;
DELIMITER ;
drop view IF EXISTS vista_adulto;
CREATE VIEW `vista_adulto` AS
	SELECT id_adulto, nom_adulto
    FROM adulto;
DELIMITER ;
drop view IF EXISTS vista_discapacidad;
CREATE VIEW `vista_discapacidad` AS
	SELECT id_discapacidad, nom_discapacidad
    FROM discapacidad;
DELIMITER ;
drop view IF EXISTS vista_genero;
CREATE VIEW `vista_genero` AS
	SELECT id_genero, nom_genero
    FROM genero;

drop view IF EXISTS vista_gestante;
CREATE VIEW `vista_gestante` AS
	SELECT id_gestante, nom_gestante
    FROM gestante;
DELIMITER ;
drop view IF EXISTS vista_indigena;
CREATE VIEW `vista_indigena` AS
	SELECT id_indigena, nom_indigena
    FROM indigena;
DELIMITER ;
drop view IF EXISTS vista_nacionalidad;
CREATE VIEW `vista_nacionalidad` AS
	SELECT id_nacionalidad, nom_nacionalidad
    FROM nacionalidad;
DELIMITER ;
drop view IF EXISTS vista_proyecto;
CREATE VIEW `vista_proyecto` AS
	SELECT id_proyecto, nom_proyecto
    FROM proyecto;
DELIMITER ;
drop view IF EXISTS vista_tema;
CREATE VIEW `vista_tema` AS
	SELECT id_tema, nom_tema
    FROM tema;
DELIMITER ;
drop view IF EXISTS vista_tiempo_gestacion;
CREATE VIEW `vista_tiempo_gestacion` AS
	SELECT id_tiempo_gestacion, nom_tiempo_gestacion
    FROM tiempo_gestacion;
DELIMITER ;
drop view IF EXISTS vista_tipo_discapacidad;
CREATE VIEW `vista_tipo_discapacidad` AS
	SELECT id_tipo_discapacidad, nom_tipo_discapacidad
    FROM tipo_discapacidad;
DELIMITER ;
drop view IF EXISTS vista_tipo_documento;
CREATE VIEW `vista_tipo_documento` AS
	SELECT id_tipo_documento, nom_documento
    FROM tipo_documento;
DELIMITER ;
drop view IF EXISTS vista_tipo_organizacion;
CREATE VIEW `vista_tipo_organizacion` AS
	SELECT id_tipo_organizacion, nom_tipo_organizacion
    FROM tipo_organizacion;
DELIMITER ;
drop view IF EXISTS vista_tipo_proyecto;
CREATE VIEW `vista_tipo_proyecto` AS
	SELECT id_tipo_proyecto, nom_tipo_proyecto
    FROM tipo_proyecto;
DELIMITER ;
drop view IF EXISTS vista_subtema;
CREATE VIEW `vista_subtema` AS
	SELECT s.id_subtema, s.nom_subtema, t.nom_tema, t.id_tema
    FROM subtema s inner join tema t on s.id_tema = t.id_tema;
DELIMITER ;
drop view IF EXISTS vista_region;
CREATE VIEW `vista_region` AS
	SELECT id_region, nom_region
    FROM region;
DELIMITER ;
drop view IF EXISTS vista_responsable_registro;
CREATE VIEW `vista_responsable_registro` AS
	SELECT id_persona_registro, nom_persona_registro
    FROM responsable_registro;
DELIMITER ;


/******************/
/* VISTA GERENCIA */
/******************/

drop view IF EXISTS vista_repo_total_reach_actividades;
CREATE VIEW `vista_repo_total_reach_actividades` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto as Proyecto, t.id_tema, t.nom_tema as Tema, st.id_subtema, st.nom_subtema as Subtema, a.id_actividad, a.nom_actividad as Actividad, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join proyecto p on rp.id_proyecto = p.id_proyecto
inner join tema t on rp.id_tema = t.id_tema
inner join subtema st on st.id_subtema = rp.id_subtema and st.id_tema = rp.id_tema
inner join actividad a on rp.id_actividad = a.id_actividad
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto, t.id_tema, t.nom_tema, st.id_subtema, st.nom_subtema, a.id_actividad, a.nom_actividad, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, p.nom_proyecto, t.nom_tema, st.nom_subtema, a.nom_actividad, r.nom_region;

/*
drop view IF EXISTS vista_repo_total_reach_subtemas;
CREATE VIEW `vista_repo_total_reach_subtemas` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto as Proyecto, t.id_tema, t.nom_tema as Tema, st.id_subtema, st.nom_subtema as Subtema, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join proyecto p on rp.id_proyecto = p.id_proyecto
inner join tema t on rp.id_tema = t.id_tema
inner join subtema st on st.id_subtema = rp.id_subtema and st.id_tema = rp.id_tema
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto, t.id_tema, t.nom_tema, st.id_subtema, st.nom_subtema, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, p.nom_proyecto, t.nom_tema, st.nom_subtema, r.nom_region;

drop view IF EXISTS vista_repo_total_reach_temas;
CREATE VIEW `vista_repo_total_reach_temas` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto as Proyecto, t.id_tema, t.nom_tema as Tema, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join proyecto p on rp.id_proyecto = p.id_proyecto
inner join tema t on rp.id_tema = t.id_tema
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto, t.id_tema, t.nom_tema, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, p.nom_proyecto, t.nom_tema, r.nom_region;

drop view IF EXISTS vista_repo_total_reach_proyectos;
CREATE VIEW `vista_repo_total_reach_proyectos` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto as Proyecto, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join proyecto p on rp.id_proyecto = p.id_proyecto
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, p.id_proyecto, p.nom_proyecto, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, p.nom_proyecto, r.nom_region;


drop view IF EXISTS vista_repo_total_reach_tipoproyectos;
CREATE VIEW `vista_repo_total_reach_tipoproyectos` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_tipo_proyecto, tp.nom_tipo_proyecto, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, r.nom_region;

drop view IF EXISTS vista_repo_total_reach_region_tri;
CREATE VIEW `vista_repo_total_reach_region_tri` AS
	SELECT rp.anio_actividad, rp.trimestre_actividad, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.trimestre_actividad, rp.id_region, r.nom_region
order by rp.anio_actividad, rp.trimestre_actividad, r.nom_region;

drop view IF EXISTS vista_repo_total_reach_region;
CREATE VIEW `vista_repo_total_reach_region` AS
	SELECT rp.anio_actividad, rp.id_region as Región, r.nom_region, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
inner join region r on rp.id_region = r.id_region
group by rp.anio_actividad, rp.id_region, r.nom_region
order by rp.anio_actividad, r.nom_region;

drop view IF EXISTS vista_repo_total_reach_pais;
CREATE VIEW `vista_repo_total_reach_pais` AS
	SELECT rp.anio_actividad, 
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 1 , 1, NULL)) AS 'Niñas',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 2 , 1, NULL)) AS 'Niños',
COUNT(IF(rp.id_adulto = 2 and rp.id_genero = 3 , 1, NULL)) AS 'Otros menores',
COUNT(IF(rp.id_adulto = 2 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal menores',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 1 , 1, NULL)) AS 'Mujeres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 2 , 1, NULL)) AS 'Hombres',
COUNT(IF(rp.id_adulto = 1 and rp.id_genero = 3 , 1, NULL)) AS 'Otros adultos',
COUNT(IF(rp.id_adulto = 1 and (rp.id_genero=3 or rp.id_genero=2 or rp.id_genero=1), 1, NULL)) AS 'Subtotal adultos'
FROM resultado_proyectos rp 
group by rp.anio_actividad
order by rp.anio_actividad;


drop view IF EXISTS vista_repo_total_reach_powerbi;
CREATE VIEW `vista_repo_total_reach_powerbi` AS
SELECT rp.anio_actividad as Anio, rp.trimestre_actividad as Trimestre, tp.nom_tipo_proyecto as Tipo_Proyecto, t.nom_tema as Tema, st.nom_subtema as Subtema, a.nom_actividad as Actividad, rp.fecha_actividad, g.nom_genero as Sexo, r.nom_region as Region,  p.nom_proyecto as Proyecto, ad.nom_adulto as Grupo_Edad, count(rp.id_resultado_proyectos) as conteo
FROM resultado_proyectos rp 
inner join proyecto p on rp.id_proyecto = p.id_proyecto
inner join tema t on rp.id_tema = t.id_tema
inner join subtema st on st.id_subtema = rp.id_subtema and st.id_tema = rp.id_tema
inner join actividad a on rp.id_actividad = a.id_actividad
inner join tipo_proyecto tp on rp.id_tipo_proyecto = tp.id_tipo_proyecto
inner join region r on rp.id_region = r.id_region
inner join genero g on rp.id_genero = g.id_genero
inner join adulto ad on rp.id_adulto = ad.id_adulto
group by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, t.nom_tema, st.nom_subtema, a.nom_actividad, rp.fecha_actividad, g.nom_genero, r.nom_region, p.nom_proyecto, ad.nom_adulto
order by rp.anio_actividad, rp.trimestre_actividad, tp.nom_tipo_proyecto, p.nom_proyecto, t.nom_tema, st.nom_subtema, a.nom_actividad, r.nom_region, rp.fecha_actividad, g.nom_genero;

*/


drop view IF EXISTS vista_periodos_data_proyectos;
CREATE VIEW `vista_periodos_data_proyectos` AS
	SELECT distinct(year(STR_TO_DATE(dato_34,'%m/%d/%Y'))) as periodos 
    FROM stage_data_proyectos ;

drop view IF EXISTS vista_periodo_y_proyecto_migracion_stage_data_proyecto;
CREATE VIEW `vista_periodo_y_proyecto_migracion_stage_data_proyecto` AS
	SELECT anio, idproy, nom_proyecto, sum(regstage) as nuevos, sum(regresult) as existente FROM (
    SELECT year(STR_TO_DATE(sdp.dato_34,'%m/%d/%Y')) as anio, sdp.dato_30 as idproy, p.nom_proyecto, count(sdp.dato_30) as regstage, 0 as regresult
    FROM stage_data_proyectos sdp inner join proyecto p on sdp.dato_30 = p.id_proyecto
    group by anio, sdp.dato_30, p.nom_proyecto
    union all
    SELECT anio_actividad, rdp.id_proyecto as idproy, p.nom_proyecto,  0 as regstage, count(rdp.id_proyecto) as regresult
    FROM resultado_proyectos rdp inner join proyecto p on rdp.id_proyecto = p.id_proyecto
    group by rdp.anio_actividad, rdp.id_proyecto, p.nom_proyecto) AS combined
    group by anio, idproy, nom_proyecto HAVING SUM(regstage) > 0 ;


/***********/
/* PRUEBAS */
/***********/


select * from vista_periodo_y_proyecto_migracion_stage_data_proyecto;
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

    
    
    