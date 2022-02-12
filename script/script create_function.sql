/* CREACION DE FUNCIONES */
drop function CheckPassword;
DELIMITER ||
CREATE FUNCTION CheckPassword (usuario VARCHAR(50), password_p VARCHAR(100))
    RETURNS BOOL
    NOT DETERMINISTIC
    READS SQL DATA
BEGIN
	SET @clave = password(password_p);
    RETURN EXISTS (SELECT id_usuario FROM bd_bha_sci.usuarios where nombre_usuario = usuario and contrasenia = @clave);
END;
||
DELIMITER ;

SELECT CheckPassword('PERCY','abc') as valor;

drop view IF EXISTS vista_encuesta;
CREATE VIEW `bd_bha_sci`.`vista_encuesta` AS
	SELECT concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.fecha_encuesta, e.id_encuestador, e.nombre_encuestador, e.region_encuestador, e.como_realizo_encuesta, e.esta_de_acuerdo, e.id_beneficiario
    FROM encuesta e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;    

drop view IF EXISTS vista_beneficiario;
CREATE VIEW `bd_bha_sci`.`vista_beneficiario` AS
	SELECT id_beneficiario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original
    FROM beneficiario;    
    
drop view IF EXISTS vista_comunicacion;
CREATE VIEW `bd_bha_sci`.`vista_comunicacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.tiene_los_siguientes_medios_comunicacion, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.cual_es_su_numero_whatsapp, e.cual_es_su_numero_recibir_sms, e.cual_numero_usa_con_frecuencia, e.es_telefono_propio, e.como_accede_a_internet, e.cual_es_su_direccion, e.vive_o_viaja_con_otros_familiares, e.cuantos_viven_o_viajan_con_usted, e.cuantos_tienen_ingreso_por_trabajo
    FROM comunicacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_nutricion;
CREATE VIEW `bd_bha_sci`.`vista_nutricion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.alguien_de_su_hogar_esta_embarazada, e.tiempo_de_gestacion, e.lleva_su_control_en_centro_de_salud, e.alguien_de_su_hogar_tiene_siguientes_condiciones, e.lactando_con_nn_menor_2_anios, e.no_lactando_con_nn_menor_2_anios, e.madre_nn_2_a_5_anios, e.ninguno
    FROM nutricion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_salud;
CREATE VIEW `bd_bha_sci`.`vista_salud` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.algun_miembro_tiene_discapacidad, e.algun_miembro_tiene_problemas_salud, e.derivacion_salud, e.derivacion_proteccion
    FROM salud e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  
    
drop view IF EXISTS vista_educacion;
CREATE VIEW `bd_bha_sci`.`vista_educacion` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.viaja_con_menores_de_17_anios, e.todos_los_nna_estan_matriculados, e.que_dispositvo_utilizan_en_clases_virtuales, e.celular_basico, e.smartphone, e.laptop, e.ninguno, e.que_dificultades_tuvo_al_matricular_nna, e.no_conocia_procedimiento_matricula, e.no_cuento_con_los_documentos, e.no_habia_vacantes, e.otro
    FROM educacion e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  

drop view IF EXISTS vista_derivacion_sectores;
CREATE VIEW `bd_bha_sci`.`vista_derivacion_sectores` AS
	SELECT e.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, b.numero_cedula, e.interesado_participar_nutricion, e.interesado_participar_salud, e.interesado_participar_medios_vida, e.actividades_interesado_participar, e.interesado_entrenamiento_vocacional, e.interesado_emprendimiento 
    FROM derivacion_sectores e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;  



select * from vista_derivacion_sectores;
    
    
    