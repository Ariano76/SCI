
DROP PROCEDURE IF EXISTS `SP_Insert_beneficiario`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_beneficiario`(
	In dato_01  VARCHAR(250), In dato_02 VARCHAR(250) , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 VARCHAR(250) ,
	In dato_06 VARCHAR(250) , In dato_07 VARCHAR(250) ,
	In dato_08 VARCHAR(250) , In dato_09 VARCHAR(250) ,
	In dato_10 VARCHAR(250) , In dato_11 VARCHAR(250) ,
	In dato_12 VARCHAR(250) , In dato_13 VARCHAR(250) ,
	In dato_14 VARCHAR(250) , In dato_15 DATE ,
	In dato_16 boolean , In dato_17 VARCHAR(25) ,
	In dato_18 DATE , In dato_19  VARCHAR(250) ,
	In dato_20 VARCHAR(25) , In dato_21 DATE ,
	In dato_22 VARCHAR(250), OUT success INTEGER 
)
BEGIN
	
	INSERT INTO beneficiario(region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, primer_nombre, segundo_nombre, primer_apellido,segundo_apellido, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13,dato_14, dato_15, dato_16, dato_17, dato_18, dato_19, dato_20, dato_21, dato_22);    
    SET success := last_insert_id();
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_encuesta`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_encuesta`(OUT success INT,
	In dato_01 date, In dato_02 int , In dato_03 VARCHAR(250) ,	
    In dato_04 VARCHAR(100) , In dato_05 VARCHAR(100) ,	In dato_06 boolean , 
    In dato_07 int 
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
    
    START TRANSACTION;
	INSERT INTO encuesta(fecha_encuesta, id_encuestador, nombre_encuestador, region_encuestador, como_realizo_encuesta, esta_de_acuerdo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_comunicacion`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_comunicacion`(OUT success INT,
	In dato_01 VARCHAR(250), In dato_02 boolean , In dato_03 boolean ,	
    In dato_04 boolean , In dato_05 boolean , In dato_06 VARCHAR(250) , 
    In dato_07 VARCHAR(250), In dato_08 VARCHAR(250) , In dato_09 boolean ,
    In dato_10 VARCHAR(250), In dato_11 VARCHAR(250) , In dato_12 boolean , 
    In dato_13 VARCHAR(250), In dato_14 VARCHAR(250) , In dato_15 int 
)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO comunicacion(tiene_los_siguientes_medios_comunicacion, celular_basico, smartphone, laptop, ninguno, cual_es_su_numero_whatsapp, cual_es_su_numero_recibir_sms, cual_numero_usa_con_frecuencia, es_telefono_propio, como_accede_a_internet, cual_es_su_direccion, vive_o_viaja_con_otros_familiares, cuantos_viven_o_viajan_con_usted, cuantos_tienen_ingreso_por_trabajo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13, dato_14, dato_15);    
    SET success = 1;
    COMMIT;   
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_nutricion`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_nutricion`(OUT success INT,
	In dato_01 boolean, In dato_02 VARCHAR(250) , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 boolean , In dato_06 boolean , 
    In dato_07 boolean, In dato_08 boolean , In dato_09 int 
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO nutricion(alguien_de_su_hogar_esta_embarazada, tiempo_de_gestacion, lleva_su_control_en_centro_de_salud, alguien_de_su_hogar_tiene_siguientes_condiciones, lactando_con_nn_menor_2_anios, no_lactando_con_nn_menor_2_anios, madre_nn_2_a_5_anios, ninguno, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_educacion`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_educacion`(OUT success INT,
	In dato_01 boolean, In dato_02 boolean , In dato_03 VARCHAR(250) ,	
    In dato_04 boolean , In dato_05 boolean , In dato_06 boolean , 
    In dato_07 boolean, In dato_08 VARCHAR(250) , In dato_09 boolean,
    In dato_10 boolean, In dato_11 boolean , In dato_12 boolean, In dato_13 int  
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	START TRANSACTION;
	INSERT INTO educacion(viaja_con_menores_de_17_anios, todos_los_nna_estan_matriculados, que_dispositvo_utilizan_en_clases_virtuales, celular_basico, smartphone, laptop, ninguno, que_dificultades_tuvo_al_matricular_nna, no_conocia_procedimiento_matricula, no_cuento_con_los_documentos, no_habia_vacantes, otro, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_salud`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_salud`(OUT success INT,
	In dato_01 VARCHAR(250), In dato_02 VARCHAR(250) , In dato_03 VARCHAR(250) ,	
    In dato_04 VARCHAR(250) , In dato_05 int 
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	START TRANSACTION;
	INSERT INTO salud(algun_miembro_tiene_discapacidad, algun_miembro_tiene_problemas_salud, derivacion_salud, derivacion_proteccion, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_derivacion_sectores`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_derivacion_sectores`(OUT success INT,
	In dato_01 boolean, In dato_02 boolean , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 boolean , In dato_06 boolean , In dato_07 int 
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO derivacion_sectores(interesado_participar_nutricion, interesado_participar_salud, interesado_participar_medios_vida, actividades_interesado_participar, interesado_entrenamiento_vocacional, interesado_emprendimiento, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_integrantes`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_integrantes`(OUT success INT,
	In dato_01 VARCHAR(250), In dato_02 VARCHAR(250), In dato_03 VARCHAR(250), In dato_04 VARCHAR(250), In dato_05 VARCHAR(250), In dato_06 date, In dato_07 VARCHAR(250), In dato_08 VARCHAR(250), In dato_09 VARCHAR(250), dato_10 VARCHAR(25),
    In dato_11 VARCHAR(250), In dato_12 VARCHAR(250), In dato_13 VARCHAR(250), In dato_14 VARCHAR(250), In dato_15 VARCHAR(250), In dato_16 date, In dato_17 VARCHAR(250), In dato_18 VARCHAR(250), In dato_19 VARCHAR(250), dato_20 VARCHAR(25),
    In dato_21 VARCHAR(250), In dato_22 VARCHAR(250), In dato_23 VARCHAR(250), In dato_24 VARCHAR(250), In dato_25 VARCHAR(250), In dato_26 date, In dato_27 VARCHAR(250), In dato_28 VARCHAR(250), In dato_29 VARCHAR(250), dato_30 VARCHAR(25),
    In dato_31 VARCHAR(250), In dato_32 VARCHAR(250), In dato_33 VARCHAR(250), In dato_34 VARCHAR(250), In dato_35 VARCHAR(250), In dato_36 date, In dato_37 VARCHAR(250), In dato_38 VARCHAR(250), In dato_39 VARCHAR(250), dato_40 VARCHAR(25),
    In dato_41 VARCHAR(250), In dato_42 VARCHAR(250), In dato_43 VARCHAR(250), In dato_44 VARCHAR(250), In dato_45 VARCHAR(250), In dato_46 date, In dato_47 VARCHAR(250), In dato_48 VARCHAR(250), In dato_49 VARCHAR(250), dato_50 VARCHAR(25),
    In dato_51 VARCHAR(250), In dato_52 VARCHAR(250), In dato_53 VARCHAR(250), In dato_54 VARCHAR(250), In dato_55 VARCHAR(250), In dato_56 date, In dato_57 VARCHAR(250), In dato_58 VARCHAR(250), In dato_59 VARCHAR(250), dato_60 VARCHAR(25),
    In dato_61 VARCHAR(250), In dato_62 VARCHAR(250), In dato_63 VARCHAR(250), In dato_64 VARCHAR(250), In dato_65 VARCHAR(250), In dato_66 date, In dato_67 VARCHAR(250), In dato_68 VARCHAR(250), In dato_69 VARCHAR(250), dato_70 VARCHAR(25), In dato_71 int 
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO integrantes(
    nombre_1a, nombre_1b, apellido_1a, apellido_1b, genero_1, fecha_nacimiento_1, relacion_1, otro_1, tipo_identificacion_1, numero_identificacion_1, 
    nombre_2a, nombre_2b, apellido_2a, apellido_2b, genero_2, fecha_nacimiento_2, relacion_2, otro_2, tipo_identificacion_2, numero_identificacion_2, 
    nombre_3a, nombre_3b, apellido_3a, apellido_3b, genero_3, fecha_nacimiento_3, relacion_3, otro_3, tipo_identificacion_3, numero_identificacion_3, 
    nombre_4a, nombre_4b, apellido_4a, apellido_4b, genero_4, fecha_nacimiento_4, relacion_4, otro_4, tipo_identificacion_4, numero_identificacion_4, 
    nombre_5a, nombre_5b, apellido_5a, apellido_5b, genero_5, fecha_nacimiento_5, relacion_5, otro_5, tipo_identificacion_5, numero_identificacion_5, 
    nombre_6a, nombre_6b, apellido_6a, apellido_6b, genero_6, fecha_nacimiento_6, relacion_6, otro_6, tipo_identificacion_6, numero_identificacion_6, 
    nombre_7a, nombre_7b, apellido_7a, apellido_7b, genero_7, fecha_nacimiento_7, relacion_7, otro_7, tipo_identificacion_7, numero_identificacion_7, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
    dato_11, dato_12, dato_13, dato_14, dato_15, dato_16, dato_17, dato_18, dato_19, dato_20, 
    dato_21, dato_22, dato_23, dato_24, dato_25, dato_26, dato_27, dato_28, dato_29, dato_30, 
    dato_31, dato_32, dato_33, dato_34, dato_35, dato_36, dato_37, dato_38, dato_39, dato_40, 
    dato_41, dato_42, dato_43, dato_44, dato_45, dato_46, dato_47, dato_48, dato_49, dato_50, 
    dato_51, dato_52, dato_53, dato_54, dato_55, dato_56, dato_57, dato_58, dato_59, dato_60, 
    dato_61, dato_62, dato_63, dato_64, dato_65, dato_66, dato_67, dato_68, dato_69, dato_70, dato_71);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_estatus`;
DELIMITER |
CREATE PROCEDURE `SP_Insert_estatus`(OUT success INT, In dato_01 VARCHAR(250), In dato_02 int, In dato_03 int
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO estatus(observaciones, id_estado, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03);    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_stage_00`;
DELIMITER |
CREATE PROCEDURE `SP_Select_stage_00`(In usuario VARCHAR(250))
BEGIN
	SELECT * FROM stage_00 where dato_145 = usuario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_encuesta`;
DELIMITER |
CREATE PROCEDURE `SP_Select_encuesta`()
BEGIN
	SELECT concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, /*e.fecha_encuesta, e.id_encuestador, e.nombre_encuestador, e.region_encuestador, e.como_realizo_encuesta, e.esta_de_acuerdo, */ e.id_beneficiario
    FROM encuesta e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Update_General`;
DELIMITER |
CREATE PROCEDURE `SP_Update_General`(
	In dato_01 VARCHAR(250), In dato_02 VARCHAR(250), In dato_03 VARCHAR(250), In dato_04 VARCHAR(250), 
    In dato_05 VARCHAR(25), In dato_06 VARCHAR(250), In dato_07 VARCHAR(25), In dato_08 VARCHAR(250), 
    In dato_09 VARCHAR(250), In dato_10 date, In dato_11 VARCHAR(250), In dato_12 INT, In dato_13 INT, OUT success INT
)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
    
    START TRANSACTION;
    
	UPDATE comunicacion SET cual_es_su_numero_whatsapp=dato_08, cual_es_su_numero_recibir_sms=dato_09
    WHERE id_beneficiario=dato_13; 
    
    UPDATE estatus SET observaciones=dato_11, id_estado=dato_12 WHERE id_beneficiario=dato_13;    

	UPDATE beneficiario SET primer_nombre=dato_01, segundo_nombre=dato_02, primer_apellido=dato_03, segundo_apellido=dato_04, numero_cedula=dato_05, tipo_identificacion=dato_06, numero_identificacion=dato_07, fecha_nacimiento=dato_10 
    WHERE id_beneficiario=dato_13;        
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_Mera_Proteccion`;
DELIMITER |
CREATE PROCEDURE `SP_Select_Mera_Proteccion`(in depa varchar(50))
BEGIN
	SELECT enc.fecha_encuesta, b.region_beneficiario, b.en_que_provincia, b.transit_settle, b.en_que_distrito, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.genero, b.fecha_nacimiento, F_AGE(fecha_nacimiento) AS edad, b.numero_cedula, b.fecha_caducidad_cedula, c.tiene_los_siguientes_medios_comunicacion, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, c.cual_numero_usa_con_frecuencia, F_SINO(c.es_telefono_propio), c.como_accede_a_internet, F_SINO(c.vive_o_viaja_con_otros_familiares), c.cuantos_viven_o_viajan_con_usted, F_SINO(n.alguien_de_su_hogar_esta_embarazada), n.alguien_de_su_hogar_tiene_siguientes_condiciones, F_SINO(e.viaja_con_menores_de_17_anios), F_SINO(e.todos_los_nna_estan_matriculados), e.que_dispositvo_utilizan_en_clases_virtuales, e.que_dificultades_tuvo_al_matricular_nna, s.algun_miembro_tiene_discapacidad, 
    i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, F_AGE(i.fecha_nacimiento_1) as Edad, concat(i.relacion_1,' ',i.otro_1) as Parentesco,
    i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, F_AGE(i.fecha_nacimiento_2) as Edad, concat(i.relacion_2,' ',i.otro_2) as Parentesco,
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, F_AGE(i.fecha_nacimiento_3) as Edad, concat(i.relacion_3,' ',i.otro_3) as Parentesco,
    i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, F_AGE(i.fecha_nacimiento_4) as Edad, concat(i.relacion_4,' ',i.otro_4) as Parentesco,
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, F_AGE(i.fecha_nacimiento_5) as Edad, concat(i.relacion_5,' ',i.otro_5) as Parentesco,
    i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, F_AGE(i.fecha_nacimiento_6) as Edad, concat(i.relacion_6,' ',i.otro_6) as Parentesco,
    i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, F_AGE(i.fecha_nacimiento_7) as Edad, concat(i.relacion_7,' ',i.otro_7) as Parentesco, s.derivacion_proteccion
FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
inner join nutricion n on b.id_beneficiario = n.id_beneficiario
inner join educacion e on b.id_beneficiario = e.id_beneficiario
inner join salud s on b.id_beneficiario = s.id_beneficiario 
inner join integrantes i on b.id_beneficiario = i.id_beneficiario 
inner join encuesta enc on b.id_beneficiario = enc.id_beneficiario 
where b.region_beneficiario=depa;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_Salud`;
DELIMITER |
CREATE PROCEDURE `SP_Select_Salud`(in depa varchar(50))
BEGIN
	SELECT enc.fecha_encuesta, enc.id_encuestador, enc.nombre_encuestador, b.region_beneficiario, F_SINO(b.se_instalara_en_esta_region), b.en_que_provincia, b.transit_settle, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.genero, b.fecha_nacimiento, F_AGE(fecha_nacimiento) AS edad, 
    b.numero_cedula, b.fecha_caducidad_cedula, b.tipo_identificacion, b.numero_identificacion, b.fecha_caducidad_identificacion, b.documentos_fisico_original, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, c.cual_numero_usa_con_frecuencia, F_SINO(c.es_telefono_propio), c.como_accede_a_internet, c.cual_es_su_direccion, F_SINO(c.vive_o_viaja_con_otros_familiares), c.cuantos_viven_o_viajan_con_usted, F_SINO(n.alguien_de_su_hogar_esta_embarazada), n.tiempo_de_gestacion, F_SINO(n.lleva_su_control_en_centro_de_salud), n.alguien_de_su_hogar_tiene_siguientes_condiciones, F_SINO(n.lactando_con_nn_menor_2_anios), F_SINO(n.no_lactando_con_nn_menor_2_anios), F_SINO(n.madre_nn_2_a_5_anios), F_SINO(n.ninguno), 
    F_SINO(e.viaja_con_menores_de_17_anios), s.algun_miembro_tiene_discapacidad, s.algun_miembro_tiene_problemas_salud,     
    i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, F_AGE(i.fecha_nacimiento_1) as Edad, concat(i.relacion_1,' ',i.otro_1) as Parentesco, i.tipo_identificacion_1, i.numero_identificacion_1, 
    i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, F_AGE(i.fecha_nacimiento_2) as Edad, concat(i.relacion_2,' ',i.otro_2) as Parentesco, i.tipo_identificacion_2, i.numero_identificacion_2, 
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, F_AGE(i.fecha_nacimiento_3) as Edad, concat(i.relacion_3,' ',i.otro_3) as Parentesco, i.tipo_identificacion_3, i.numero_identificacion_3, 
    i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, F_AGE(i.fecha_nacimiento_4) as Edad, concat(i.relacion_4,' ',i.otro_4) as Parentesco, i.tipo_identificacion_4, i.numero_identificacion_4, 
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, F_AGE(i.fecha_nacimiento_5) as Edad, concat(i.relacion_5,' ',i.otro_5) as Parentesco, i.tipo_identificacion_5, i.numero_identificacion_5, 
    i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, F_AGE(i.fecha_nacimiento_6) as Edad, concat(i.relacion_6,' ',i.otro_6) as Parentesco, i.tipo_identificacion_6, i.numero_identificacion_6, 
    i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, F_AGE(i.fecha_nacimiento_7) as Edad, concat(i.relacion_7,' ',i.otro_7) as Parentesco, i.tipo_identificacion_7, i.numero_identificacion_7,
    s.derivacion_salud, F_SINO(dersec.interesado_participar_salud)
FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
inner join nutricion n on b.id_beneficiario = n.id_beneficiario
inner join educacion e on b.id_beneficiario = e.id_beneficiario
inner join salud s on b.id_beneficiario = s.id_beneficiario 
inner join integrantes i on b.id_beneficiario = i.id_beneficiario 
inner join encuesta enc on b.id_beneficiario = enc.id_beneficiario 
inner join derivacion_sectores dersec on b.id_beneficiario = dersec.id_beneficiario 
where b.region_beneficiario=depa;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_Nutricion`;
DELIMITER |
CREATE PROCEDURE `SP_Select_Nutricion`(in depa varchar(50))
BEGIN
	SELECT enc.fecha_encuesta, b.region_beneficiario, b.en_que_provincia, b.en_que_distrito, b.transit_settle, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.genero, b.fecha_nacimiento, F_AGE(fecha_nacimiento) AS edad, 
    b.numero_cedula, b.tipo_identificacion, b.numero_identificacion, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, F_SINO(c.es_telefono_propio), c.cual_es_su_direccion, F_SINO(c.vive_o_viaja_con_otros_familiares), c.cuantos_viven_o_viajan_con_usted, F_SINO(n.alguien_de_su_hogar_esta_embarazada), n.tiempo_de_gestacion, F_SINO(n.lleva_su_control_en_centro_de_salud), n.alguien_de_su_hogar_tiene_siguientes_condiciones, s.algun_miembro_tiene_discapacidad, 
    i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, F_AGE(i.fecha_nacimiento_1) as Edad, concat(i.relacion_1,' ',i.otro_1) as Parentesco, i.tipo_identificacion_1, i.numero_identificacion_1, 
    i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, F_AGE(i.fecha_nacimiento_2) as Edad, concat(i.relacion_2,' ',i.otro_2) as Parentesco, i.tipo_identificacion_2, i.numero_identificacion_2, 
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, F_AGE(i.fecha_nacimiento_3) as Edad, concat(i.relacion_3,' ',i.otro_3) as Parentesco, i.tipo_identificacion_3, i.numero_identificacion_3, 
    i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, F_AGE(i.fecha_nacimiento_4) as Edad, concat(i.relacion_4,' ',i.otro_4) as Parentesco, i.tipo_identificacion_4, i.numero_identificacion_4, 
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, F_AGE(i.fecha_nacimiento_5) as Edad, concat(i.relacion_5,' ',i.otro_5) as Parentesco, i.tipo_identificacion_5, i.numero_identificacion_5, 
    i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, F_AGE(i.fecha_nacimiento_6) as Edad, concat(i.relacion_6,' ',i.otro_6) as Parentesco, i.tipo_identificacion_6, i.numero_identificacion_6, 
    i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, F_AGE(i.fecha_nacimiento_7) as Edad, concat(i.relacion_7,' ',i.otro_7) as Parentesco, i.tipo_identificacion_7, i.numero_identificacion_7,
    F_SINO(dersec.interesado_participar_nutricion)
FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
inner join nutricion n on b.id_beneficiario = n.id_beneficiario
inner join educacion e on b.id_beneficiario = e.id_beneficiario
inner join salud s on b.id_beneficiario = s.id_beneficiario 
inner join integrantes i on b.id_beneficiario = i.id_beneficiario 
inner join encuesta enc on b.id_beneficiario = enc.id_beneficiario 
inner join derivacion_sectores dersec on b.id_beneficiario = dersec.id_beneficiario 
where b.region_beneficiario=depa;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_MDV`;
DELIMITER |
CREATE PROCEDURE `SP_Select_MDV`(in depa varchar(50))
BEGIN
	SELECT enc.fecha_encuesta, b.region_beneficiario, b.en_que_provincia, b.en_que_distrito, b.transit_settle, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.genero, b.fecha_nacimiento, F_AGE(fecha_nacimiento) AS edad, 
    b.numero_cedula, b.fecha_caducidad_cedula, b.tipo_identificacion, b.numero_identificacion, b.fecha_caducidad_identificacion, b.documentos_fisico_original, c.tiene_los_siguientes_medios_comunicacion, F_SINO(c.celular_basico), F_SINO(c.smartphone), F_SINO(c.laptop), F_SINO(c.ninguno), 
    c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, c.cual_numero_usa_con_frecuencia, F_SINO(c.es_telefono_propio), c.como_accede_a_internet, c.cual_es_su_direccion, c.cuantos_viven_o_viajan_con_usted, F_SINO(n.alguien_de_su_hogar_esta_embarazada), n.tiempo_de_gestacion, n.alguien_de_su_hogar_tiene_siguientes_condiciones, F_SINO(n.lactando_con_nn_menor_2_anios), F_SINO(n.no_lactando_con_nn_menor_2_anios), F_SINO(n.madre_nn_2_a_5_anios), F_SINO(n.ninguno), F_SINO(e.viaja_con_menores_de_17_anios), F_SINO(e.todos_los_nna_estan_matriculados), s.algun_miembro_tiene_discapacidad, 
    i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, F_AGE(i.fecha_nacimiento_1) as Edad, concat(i.relacion_1,' ',i.otro_1) as Parentesco, i.tipo_identificacion_1, i.numero_identificacion_1, 
    i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, F_AGE(i.fecha_nacimiento_2) as Edad, concat(i.relacion_2,' ',i.otro_2) as Parentesco, i.tipo_identificacion_2, i.numero_identificacion_2, 
    i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, F_AGE(i.fecha_nacimiento_3) as Edad, concat(i.relacion_3,' ',i.otro_3) as Parentesco, i.tipo_identificacion_3, i.numero_identificacion_3, 
    i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, F_AGE(i.fecha_nacimiento_4) as Edad, concat(i.relacion_4,' ',i.otro_4) as Parentesco, i.tipo_identificacion_4, i.numero_identificacion_4, 
    i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, F_AGE(i.fecha_nacimiento_5) as Edad, concat(i.relacion_5,' ',i.otro_5) as Parentesco, i.tipo_identificacion_5, i.numero_identificacion_5, 
    i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, F_AGE(i.fecha_nacimiento_6) as Edad, concat(i.relacion_6,' ',i.otro_6) as Parentesco, i.tipo_identificacion_6, i.numero_identificacion_6, 
    i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, F_AGE(i.fecha_nacimiento_7) as Edad, concat(i.relacion_7,' ',i.otro_7) as Parentesco, i.tipo_identificacion_7, i.numero_identificacion_7,
    F_SINO(dersec.interesado_participar_medios_vida), dersec.actividades_interesado_participar, F_SINO(dersec.interesado_entrenamiento_vocacional), F_SINO(dersec.interesado_emprendimiento)
FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
inner join nutricion n on b.id_beneficiario = n.id_beneficiario
inner join educacion e on b.id_beneficiario = e.id_beneficiario
inner join salud s on b.id_beneficiario = s.id_beneficiario 
inner join integrantes i on b.id_beneficiario = i.id_beneficiario 
inner join encuesta enc on b.id_beneficiario = enc.id_beneficiario 
inner join derivacion_sectores dersec on b.id_beneficiario = dersec.id_beneficiario 
where b.region_beneficiario=depa;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_Finanzas`;
DELIMITER |
CREATE PROCEDURE `SP_Select_Finanzas`(in depa varchar(50))
BEGIN
	SELECT enc.fecha_encuesta, b.region_beneficiario, b.en_que_provincia, b.transit_settle, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, 'Cedula', b.numero_cedula, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, c.cual_es_su_direccion, c.cuantos_viven_o_viajan_con_usted, c.tiene_los_siguientes_medios_comunicacion, c.como_accede_a_internet, F_SINO(dersec.interesado_participar_nutricion), IF((c.laptop=1 or c.smartphone=1) and dersec.interesado_participar_nutricion=1 
    and (c.como_accede_a_internet="Por wifi  por horas" or c.como_accede_a_internet="Un conocido le provee acceso wifi o plan de datos en celular, por algunas horas/días" or c.como_accede_a_internet="Por datos de celular que recarga de forma interdiaria (prepago)" or c.como_accede_a_internet="Ninguna de las anteriores"),"Si","No") as bono, b.id_beneficiario
FROM beneficiario b inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
inner join educacion e on b.id_beneficiario = e.id_beneficiario
inner join encuesta enc on b.id_beneficiario = enc.id_beneficiario 
inner join derivacion_sectores dersec on b.id_beneficiario = dersec.id_beneficiario 
inner join estatus est on b.id_beneficiario = est.id_beneficiario 
inner join estados on estados.id_estado = est.id_estado 
where estados.id_estado=1 and b.region_beneficiario=depa;
END |
DELIMITER ;

/* STORED PROCEDURE PARA LA GENERACION DE REPORTES */
DROP PROCEDURE IF EXISTS `SP_reporte_regiones`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_regiones`()
BEGIN
	drop table if exists total_beneficiarios ;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarios AS 
	(SELECT b.numero_identificacion, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3
		ELSE 4
		END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1
	);
    
    select distinct(region_beneficiario) region
    from total_beneficiarios order by region_beneficiario;

END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_01`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_01`()
BEGIN
    select region_beneficiario, genero, rango_edad, count(rango_edad) as total
	from total_beneficiarios group by region_beneficiario, genero, rango_edad
	order by region_beneficiario, genero, rango_edad;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_01_beneficiario_x_region`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_01_beneficiario_x_region`(In region VARCHAR(250))
BEGIN
    select region_beneficiario, genero, rango_edad, count(rango_edad) as total
	from total_beneficiarios where region_beneficiario = region
    group by region_beneficiario, genero, rango_edad    
	order by region_beneficiario, genero, rango_edad;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_01_beneficiario_x_region_01`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_01_beneficiario_x_region_01`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarios ;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarios AS 
	(SELECT b.numero_identificacion, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4
		END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1 and b.transit_settle = situacion
	);
    SELECT  genero,  
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18'
    FROM  total_beneficiarios p where region_beneficiario = region GROUP BY genero;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_01_beneficiario_x_region_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_01_beneficiario_x_region_00`(In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarios ;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarios AS 
	(SELECT b.numero_identificacion, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4
		END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
		where e.esta_de_acuerdo = 1 and b.transit_settle=situacion
	);
    SELECT  region_beneficiario as region,genero,  
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18', COUNT(IF(rango_edad <= 4, 1, NULL)) AS 'Total'
    FROM  total_beneficiarios p GROUP BY region_beneficiario,genero;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_02_embarazadas_x_region`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_02_embarazadas_x_region`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarias_embarazada ;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarias_embarazada AS 
	(SELECT b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4
		END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join nutricion n on b.id_beneficiario = n.id_beneficiario
		where e.esta_de_acuerdo = 1 and n.alguien_de_su_hogar_esta_embarazada=1 and b.transit_settle=situacion
	);
    SELECT 'Total',  
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18'
    FROM total_beneficiarias_embarazada p where region_beneficiario = region;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_02_embarazadas_x_region_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_02_embarazadas_x_region_00`(In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarias_embarazada ;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarias_embarazada AS 
	(SELECT b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4
		END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join nutricion n on b.id_beneficiario = n.id_beneficiario
		where e.esta_de_acuerdo = 1 and n.alguien_de_su_hogar_esta_embarazada=1 and b.transit_settle=situacion
	);
    SELECT region_beneficiario as region, 
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18', COUNT(IF(rango_edad <= 4, 1, NULL)) AS 'Total'
    FROM total_beneficiarias_embarazada GROUP BY region_beneficiario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_03_discapacidad_x_region`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_03_discapacidad_x_region`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarias_discapacidad;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarias_discapacidad AS 
	(SELECT s.algun_miembro_tiene_discapacidad, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4 END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join salud s on b.id_beneficiario = s.id_beneficiario 
        where e.esta_de_acuerdo = 1 and s.algun_miembro_tiene_discapacidad <> 'Ninguno' and b.transit_settle=situacion
	);
    SELECT algun_miembro_tiene_discapacidad,  
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18'
    FROM total_beneficiarias_discapacidad where region_beneficiario = region group by algun_miembro_tiene_discapacidad;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_03_discapacidad_x_region_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_03_discapacidad_x_region_00`(In situacion VARCHAR(250))
BEGIN
drop table if exists total_beneficiarias_discapacidad;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_beneficiarias_discapacidad AS 
	(SELECT s.algun_miembro_tiene_discapacidad, b.region_beneficiario, b.genero, F_AGE(b.fecha_nacimiento) as edad,
		CASE WHEN F_AGE(b.fecha_nacimiento) > 17 and F_AGE(b.fecha_nacimiento) < 25 THEN 1
		WHEN F_AGE(b.fecha_nacimiento) > 24 and F_AGE(b.fecha_nacimiento) < 50 THEN 2
		WHEN F_AGE(b.fecha_nacimiento) > 49 THEN 3 ELSE 4 END AS rango_edad
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join salud s on b.id_beneficiario = s.id_beneficiario 
        where e.esta_de_acuerdo = 1 and s.algun_miembro_tiene_discapacidad <> 'Ninguno' and b.transit_settle=situacion
	);
    SELECT region_beneficiario as region, algun_miembro_tiene_discapacidad as problema,  
    COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24', COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
    COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+', COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18', COUNT(IF(rango_edad <= 4, 1, NULL)) AS 'Total'
    FROM total_beneficiarias_discapacidad group by region_beneficiario, algun_miembro_tiene_discapacidad order by region_beneficiario, algun_miembro_tiene_discapacidad;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_04_matriculados`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_04_matriculados`(In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario as region, sum(ed.todos_los_nna_estan_matriculados) as total
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join educacion ed on b.id_beneficiario = ed.id_beneficiario 
        where e.esta_de_acuerdo = 1 and ed.todos_los_nna_estan_matriculados = 1 and b.transit_settle=situacion
        group by b.region_beneficiario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_05_viajan_con_menores`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_05_viajan_con_menores`(In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario, sum(ed.viaja_con_menores_de_17_anios) as total
		FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
        inner join educacion ed on b.id_beneficiario = ed.id_beneficiario 
        where e.esta_de_acuerdo = 1 and ed.viaja_con_menores_de_17_anios = 1 and b.transit_settle=situacion
        group by b.region_beneficiario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_06_obtienen_ingresos`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_06_obtienen_ingresos`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo,  
    COUNT(c.cuantos_tienen_ingreso_por_trabajo) AS 'total'
    FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	inner join comunicacion c on b.id_beneficiario = c.id_beneficiario 
	where e.esta_de_acuerdo = 1 and c.cuantos_tienen_ingreso_por_trabajo > 0 and b.region_beneficiario = region and b.transit_settle=situacion
	group by b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_06_obtienen_ingresos_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_06_obtienen_ingresos_00`(In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario as region,  
    COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo = 1, 1, NULL)) AS '01', COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo = 2, 1, NULL)) AS '02',
    COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo = 3, 1, NULL)) AS '03', COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo = 4, 1, NULL)) AS '04', COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo > 4, 1, NULL)) AS '5 ó más', COUNT(IF(c.cuantos_tienen_ingreso_por_trabajo > 0, 1, NULL)) AS 'Total'
    FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
    where e.esta_de_acuerdo = 1 and c.cuantos_tienen_ingreso_por_trabajo > 0 and b.transit_settle=situacion 
    group by b.region_beneficiario order by b.region_beneficiario ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_07_miembros_en_familia`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_07_miembros_en_familia`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario, c.cuantos_viven_o_viajan_con_usted,  
    COUNT(c.cuantos_viven_o_viajan_con_usted) AS 'total'
    FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	inner join comunicacion c on b.id_beneficiario = c.id_beneficiario 
	where e.esta_de_acuerdo = 1 and b.region_beneficiario = region and b.transit_settle=situacion
	group by b.region_beneficiario, c.cuantos_viven_o_viajan_con_usted;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_07_miembros_en_familia_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_07_miembros_en_familia_00`(In situacion VARCHAR(250))
BEGIN
SELECT b.region_beneficiario as region,  
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted = 1, 1, NULL)) AS '01', 
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted = 2, 1, NULL)) AS '02',
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted = 3, 1, NULL)) AS '03', 
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted = 4, 1, NULL)) AS '04', 
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted > 4, 1, NULL)) AS '5 ó más', 
    COUNT(IF(c.cuantos_viven_o_viajan_con_usted > 0, 1, NULL)) AS 'Total'
    FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario 
    inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
    where e.esta_de_acuerdo = 1 and c.cuantos_viven_o_viajan_con_usted > 0 and b.transit_settle=situacion
    group by b.region_beneficiario order by b.region_beneficiario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_08_cantidad_menores`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_08_cantidad_menores`(In region VARCHAR(250), In situacion VARCHAR(250))
BEGIN
drop table if exists total_menores;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_menores AS (select * from vista_cantidad_ninos);
    SELECT genero, COUNT(IF(meses < 7,  1, NULL)) AS '0-6 meses', COUNT(IF(meses > 6 and meses < 25, 1, NULL)) AS '7-24 meses',
    COUNT(IF(meses > 24 and meses < 49, 1, NULL)) AS '25-48 meses',
    COUNT(IF(meses > 48 and meses < 156, 1, NULL)) AS '5-12 años', COUNT(IF(meses > 155 , 1, NULL)) AS '13-17 años'
    FROM total_menores where region_beneficiario = region and transit_settle=situacion group by genero;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_08_cantidad_menores_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_08_cantidad_menores_00`(In situacion VARCHAR(250))
BEGIN
drop table if exists total_menores;
	CREATE TEMPORARY TABLE IF NOT EXISTS total_menores AS 
	(select * from vista_cantidad_ninos);
    SELECT region_beneficiario as region, genero, COUNT(IF(meses < 7,  1, NULL)) AS '0-6 meses', 
    COUNT(IF(meses > 6 and meses < 25, 1, NULL)) AS '7-24 meses', COUNT(IF(meses > 24 and meses < 49, 1, NULL)) AS '25-48 meses',
    COUNT(IF(meses > 48 and meses < 156, 1, NULL)) AS '5-12 años', COUNT(IF(meses > 155 , 1, NULL)) AS '13-17 años',
    COUNT(IF(meses > 0, 1, NULL)) AS 'total'
    FROM total_menores where transit_settle=situacion
    group by region_beneficiario, genero order by region_beneficiario, genero;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_00`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_00`()
BEGIN
	SELECT b.region_beneficiario as region, count(b.id_beneficiario) as total
	FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	where e.esta_de_acuerdo = 1 group by b.region_beneficiario ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_000`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_000`(In region VARCHAR(250))
BEGIN
	SELECT b.region_beneficiario as region, count(b.id_beneficiario) as total
	FROM beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	where e.esta_de_acuerdo = 1 and b.region_beneficiario = region group by b.region_beneficiario ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_reporte_all_records`;
DELIMITER |
CREATE PROCEDURE `SP_reporte_all_records`(In region VARCHAR(250))
BEGIN
	SELECT e.id_encuesta, e.fecha_encuesta, e.id_encuestador, e.nombre_encuestador, e.region_encuestador, e.como_realizo_encuesta, 
e.esta_de_acuerdo, 
b.region_beneficiario, b.otra_region, b.se_instalara_en_esta_region, b.en_que_provincia, b.transit_settle, b.en_que_otro_caso_1, b.en_que_distrito, b.en_que_otro_caso_2, b.en_que_otro_caso_3, b.primer_nombre, b.segundo_nombre, b.primer_apellido, b.segundo_apellido, b.genero, b.fecha_nacimiento, b.tiene_carne_extranjeria, b.numero_cedula, b.fecha_caducidad_cedula, b.tipo_identificacion, b.numero_identificacion, fecha_caducidad_identificacion, b.documentos_fisico_original, 
i.nombre_1a, i.nombre_1b, i.apellido_1a, i.apellido_1b, i.genero_1, i.fecha_nacimiento_1, i.relacion_1, i.otro_1, i.tipo_identificacion_1, i.numero_identificacion_1, 
i.nombre_2a, i.nombre_2b, i.apellido_2a, i.apellido_2b, i.genero_2, i.fecha_nacimiento_2, i.relacion_2, i.otro_2, i.tipo_identificacion_2, i.numero_identificacion_2, 
i.nombre_3a, i.nombre_3b, i.apellido_3a, i.apellido_3b, i.genero_3, i.fecha_nacimiento_3, i.relacion_3, i.otro_3, i.tipo_identificacion_3, i.numero_identificacion_3,
i.nombre_4a, i.nombre_4b, i.apellido_4a, i.apellido_4b, i.genero_4, i.fecha_nacimiento_4, i.relacion_4, i.otro_4, i.tipo_identificacion_4, i.numero_identificacion_4,
i.nombre_5a, i.nombre_5b, i.apellido_5a, i.apellido_5b, i.genero_5, i.fecha_nacimiento_5, i.relacion_5, i.otro_5, i.tipo_identificacion_5, i.numero_identificacion_5,
i.nombre_6a, i.nombre_6b, i.apellido_6a, i.apellido_6b, i.genero_6, i.fecha_nacimiento_6, i.relacion_6, i.otro_6, i.tipo_identificacion_6, i.numero_identificacion_6,
i.nombre_7a, i.nombre_7b, i.apellido_7a, i.apellido_7b, i.genero_7, i.fecha_nacimiento_7, i.relacion_7, i.otro_7, i.tipo_identificacion_7, i.numero_identificacion_7,
c.tiene_los_siguientes_medios_comunicacion, c.celular_basico, c.smartphone, c.laptop, c.ninguno, c.cual_es_su_numero_whatsapp, c.cual_es_su_numero_recibir_sms, c.cual_numero_usa_con_frecuencia, c.es_telefono_propio, c.como_accede_a_internet, c.cual_es_su_direccion, c.vive_o_viaja_con_otros_familiares, c.cuantos_viven_o_viajan_con_usted, c.cuantos_tienen_ingreso_por_trabajo,
edu.viaja_con_menores_de_17_anios, edu.todos_los_nna_estan_matriculados, edu.que_dispositvo_utilizan_en_clases_virtuales, edu.celular_basico, edu.smartphone, edu.laptop, edu.ninguno, edu.que_dificultades_tuvo_al_matricular_nna, edu.no_conocia_procedimiento_matricula, edu.no_cuento_con_los_documentos, edu.no_habia_vacantes, edu.otro,
n.alguien_de_su_hogar_esta_embarazada, n.tiempo_de_gestacion, n.lleva_su_control_en_centro_de_salud, n.alguien_de_su_hogar_tiene_siguientes_condiciones, n.lactando_con_nn_menor_2_anios, n.no_lactando_con_nn_menor_2_anios, n.madre_nn_2_a_5_anios, n.ninguno,
s.algun_miembro_tiene_discapacidad, s.algun_miembro_tiene_problemas_salud, s.derivacion_salud, s.derivacion_proteccion,
est.observaciones, estados.estado
	FROM beneficiario b 
    inner join encuesta e on b.id_beneficiario = e.id_beneficiario
    inner join integrantes i on b.id_beneficiario = i.id_beneficiario
    inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
    inner join educacion edu on b.id_beneficiario = edu.id_beneficiario
    inner join nutricion n on b.id_beneficiario = n.id_beneficiario
    inner join salud s on b.id_beneficiario = s.id_beneficiario
    inner join estatus est on b.id_beneficiario = est.id_beneficiario
    inner join estados on est.id_estado = estados.id_estado
	where e.esta_de_acuerdo = 1 and b.region_beneficiario = region ;
END |
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_resumen`;
DELIMITER |
CREATE PROCEDURE `SP_resumen`(in numero varchar(50))
BEGIN
	SELECT b.id_beneficiario, concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre_beneficiario, b.genero, b.fecha_nacimiento, b.transit_settle as Estado, b.numero_cedula, b.tipo_identificacion as Tipo_Identificacion_2, b.numero_identificacion as Numero_Identificacion_2, c.cual_es_su_numero_whatsapp as Nro_Whatsapp, c.cual_es_su_numero_recibir_sms as Nro_SMS, b.region_beneficiario as Región, b.en_que_distrito as Distrito, c.cual_es_su_direccion as Dirección, c.cuantos_viven_o_viajan_con_usted as '¿Cuántos viven o viajan con usted?', F_SINO(n.alguien_de_su_hogar_esta_embarazada) as alguien_de_su_hogar_esta_embarazada, n.tiempo_de_gestacion, F_SINO(n.lactando_con_nn_menor_2_anios), F_SINO(n.no_lactando_con_nn_menor_2_anios), F_SINO(n.madre_nn_2_a_5_anios), F_SINO(ed.viaja_con_menores_de_17_anios), s.algun_miembro_tiene_discapacidad, F_SINO(ds.interesado_participar_nutricion), F_SINO(ds.interesado_participar_salud), F_SINO(ds.interesado_participar_medios_vida),
    CONCAT(UCASE(LEFT(es.estado, 1)), LCASE(SUBSTRING(es.estado, 2))) as id_estado
    FROM beneficiario b 
    inner join comunicacion c on b.id_beneficiario = c.id_beneficiario
    inner join estatus e on b.id_beneficiario = e.id_beneficiario 
    inner join estados es on e.id_estado = es.id_estado
    inner join nutricion n on n.id_beneficiario = b.id_beneficiario
    inner join educacion ed on ed.id_beneficiario = b.id_beneficiario
    inner join salud s on s.id_beneficiario = b.id_beneficiario
    inner join derivacion_sectores ds on ds.id_beneficiario = b.id_beneficiario
	where b.numero_cedula = numero ;
END |
DELIMITER ;

/* STORED PROCEDURE PARA LA GENERACION DE REPORTES */
DROP PROCEDURE IF EXISTS `SP_list_tema`;
DELIMITER |
CREATE PROCEDURE `SP_list_tema`()
BEGIN
    select id_tema, nom_tema from vista_tema order by id_tema;
END |
DELIMITER ;

	

/**************************/
/***** VALIDACIONES *******/
/**************************/

call SP_list_tema();
call SP_reporte_000('Lima');
call SP_reporte_06_obtienen_ingresos('Lima','Estadia');

call SP_Select_Finanzas();
select distinct(como_accede_a_internet) from comunicacion ;
select * from comunicacion where id_beneficiario in (1104,2333,3540,4649,4671,4718);
select * from derivacion_sectores where id_beneficiario in (1104,2333,3540,4649,4671,4718);

/* QUERY PIVOT */
SELECT  region_beneficiario, genero,
  COUNT(IF(rango_edad = 1, 1, NULL)) AS '18-24',
  COUNT(IF(rango_edad = 2, 1, NULL)) AS '25-49',
  COUNT(IF(rango_edad = 3, 1, NULL)) AS '50+',
  COUNT(IF(rango_edad = 4, 1, NULL)) AS '<18'
FROM  total_beneficiarios p where region_beneficiario = 'Lambayeque'
GROUP BY  region_beneficiario, genero;

SELECT b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo,  
    COUNT(c.cuantos_tienen_ingreso_por_trabajo) AS 'total'
    FROM bd_bha_sci.beneficiario b inner join encuesta e on b.id_beneficiario = e.id_beneficiario
	inner join comunicacion c on b.id_beneficiario = c.id_beneficiario 
	where e.esta_de_acuerdo = 1 and c.cuantos_tienen_ingreso_por_trabajo > 0 
	group by b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo
    order by b.region_beneficiario, c.cuantos_tienen_ingreso_por_trabajo;


call SP_Select_inconsistencia_fecha_nacimiento();
call SP_reporte_04_matriculados();
call SP_reporte_07_miembros_en_familia_00();
call SP_reporte_08_cantidad_menores('Arequipa');
call SP_Update_General('Oswaldo', 'Percy','Mogrovejo','Herrera','010203040506','libreta militar', '98765432','99901020304','99909080706','1976/04/13' ,1, @total);
select @total as resultado;
select * from vista_general;
describe integrantes;
call SP_Insert_integrantes(@total, 
'MEYER ',' ',' ',' HERRERA ',' Hombre ',' 1995-02-11 ',' Pareja ',' ',' Carnet de Extranjeria ',' 001896958 ',' LUISSAJER ',' JOSE ',' PACHECO ',' PIÑA ',' Hombre ',' 2010-05-12 ',' Hijo ',' ',' Acta de Nacimiento ',' 4113 ',' MEYLEM ',' JIREH ',' SULUAGA ',' PIÑA ',' Mujer ',' 2020-09-28 ',' Hijo ',' ',' DNI ',' 92037639 ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ', 1 );
select @total as resultado;

INSERT INTO beneficiario(region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, primer_nombre, segundo_nombre, primer_apellido,segundo_apellido, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original)
    VALUES ('Arequipa', NULL, '1', 'Arequipa', 'Estadia', NULL, 'Cerro Colorado', NULL, NULL, 'LUISIANDRI', 'CAROLINA', NULL, NULL, 'Mujer', '1992-12-30', NULL, '20189895', '2026-04-30', NULL, NULL, NULL, 'Primero');    

/* REINICIAR EL AUTO INCREMENTE DE LAS TABLAS */
ALTER TABLE beneficiario AUTO_INCREMENT = 1;


