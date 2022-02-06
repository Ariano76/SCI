DROP PROCEDURE IF EXISTS `SP_Insert_beneficiario`;
DELIMITER ;;
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
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_encuesta`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
    
    START TRANSACTION;
	INSERT INTO encuesta(fecha_encuesta, id_encuestador, nombre_encuestador, region_encuestador, como_realizo_encuesta, esta_de_acuerdo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);    
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_comunicacion`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO comunicacion(tiene_los_siguientes_medios_comunicacion, celular_basico, smartphone, laptop, ninguno, cual_es_su_numero_whatsapp, cual_es_su_numero_recibir_sms, cual_numero_usa_con_frecuencia, es_telefono_propio, como_accede_a_internet, cual_es_su_direccion, vive_o_viaja_con_otros_familiares, cuantos_viven_o_viajan_con_usted, cuantos_tienen_ingreso_por_trabajo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13, dato_14, dato_15);    
    SET success = 1;
    COMMIT;   
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_nutricion`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO nutricion(alguien_de_su_hogar_esta_embarazada, tiempo_de_gestacion, lleva_su_control_en_centro_de_salud, alguien_de_su_hogar_tiene_siguientes_condiciones, lactando_con_nn_menor_2_anios, no_lactando_con_nn_menor_2_anios, madre_nn_2_a_5_anios, ninguno, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09);    
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_educacion`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO educacion(viaja_con_menores_de_17_anios, todos_los_nna_estan_matriculados, que_dispositvo_utilizan_en_clases_virtuales, celular_basico, smartphone, laptop, ninguno, que_dificultades_tuvo_al_matricular_nna, no_conocia_procedimiento_matricula, no_cuento_con_los_documentos, no_habia_vacantes, otro, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13);    
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Insert_salud`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO salud(algun_miembro_tiene_discapacidad, algun_miembro_tiene_problemas_salud, derivacion_salud, derivacion_proteccion, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05);    
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_derivacion_sectores`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	INSERT INTO derivacion_sectores(interesado_participar_nutricion, interesado_participar_salud, interesado_participar_medios_vida, actividades_interesado_participar, interesado_entrenamiento_vocacional, interesado_emprendimiento, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);    
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_integrantes`;
DELIMITER ;;
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
   
	DECLARE exit handler for sqlwarning
	BEGIN     -- WARNING
		SET success = -1;
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
END ;;
DELIMITER ;

/*

STORED PROCEDURE SIN TRANSACCIONES

*/

DROP PROCEDURE IF EXISTS `SP_Insert_beneficiario_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_beneficiario_00`(OUT success INT,
	In dato_01  VARCHAR(250), In dato_02 VARCHAR(250) , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 VARCHAR(250) ,	In dato_06 VARCHAR(250) , 
    In dato_07 VARCHAR(250) , In dato_08 VARCHAR(250) , In dato_09 VARCHAR(250) ,
	In dato_10 VARCHAR(250) , In dato_11 VARCHAR(250) ,	In dato_12 VARCHAR(250) , 
    In dato_13 VARCHAR(250) , In dato_14 VARCHAR(250) , In dato_15 DATE ,
	In dato_16 boolean , In dato_17 VARCHAR(25) , In dato_18 DATE , In dato_19  VARCHAR(250) ,
	In dato_20 VARCHAR(25) , In dato_21 DATE , In dato_22 VARCHAR(250) 
)
BEGIN	
	INSERT INTO beneficiario(region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, primer_nombre, segundo_nombre, primer_apellido,segundo_apellido, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13,dato_14, dato_15, dato_16, dato_17, dato_18, dato_19, dato_20, dato_21, dato_22);    
    SET success := last_insert_id();    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_encuesta_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_encuesta_00`(In dato_01 date, In dato_02 int , In dato_03 VARCHAR(250) ,	
    In dato_04 VARCHAR(100) , In dato_05 VARCHAR(100) ,	In dato_06 boolean , 
    In dato_07 int 
)
BEGIN
	INSERT INTO encuesta(fecha_encuesta, id_encuestador, nombre_encuestador, region_encuestador, como_realizo_encuesta, esta_de_acuerdo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);        
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_comunicacion_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_comunicacion_00`(In dato_01 VARCHAR(250), In dato_02 boolean , In dato_03 boolean ,	
    In dato_04 boolean , In dato_05 boolean , In dato_06 VARCHAR(250) , 
    In dato_07 VARCHAR(250), In dato_08 VARCHAR(250) , In dato_09 boolean ,
    In dato_10 VARCHAR(250), In dato_11 VARCHAR(250) , In dato_12 boolean , 
    In dato_13 VARCHAR(250), In dato_14 VARCHAR(250) , In dato_15 int 
)
BEGIN	
	INSERT INTO comunicacion(tiene_los_siguientes_medios_comunicacion, celular_basico, smartphone, laptop, ninguno, cual_es_su_numero_whatsapp, cual_es_su_numero_recibir_sms, cual_numero_usa_con_frecuencia, es_telefono_propio, como_accede_a_internet, cual_es_su_direccion, vive_o_viaja_con_otros_familiares, cuantos_viven_o_viajan_con_usted, cuantos_tienen_ingreso_por_trabajo, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13, dato_14, dato_15);    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_nutricion_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_nutricion_00`(In dato_01 boolean, In dato_02 VARCHAR(250) , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 boolean , In dato_06 boolean , 
    In dato_07 boolean, In dato_08 boolean , In dato_09 int 
)
BEGIN
	INSERT INTO nutricion(alguien_de_su_hogar_esta_embarazada, tiempo_de_gestacion, lleva_su_control_en_centro_de_salud, alguien_de_su_hogar_tiene_siguientes_condiciones, lactando_con_nn_menor_2_anios, no_lactando_con_nn_menor_2_anios, madre_nn_2_a_5_anios, ninguno, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09);    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_educacion_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_educacion_00`(In dato_01 boolean, In dato_02 boolean , In dato_03 VARCHAR(250) ,	
    In dato_04 boolean , In dato_05 boolean , In dato_06 boolean , 
    In dato_07 boolean, In dato_08 VARCHAR(250) , In dato_09 boolean,
    In dato_10 boolean, In dato_11 boolean , In dato_12 boolean, In dato_13 int  
)
BEGIN
	INSERT INTO educacion(viaja_con_menores_de_17_anios, todos_los_nna_estan_matriculados, que_dispositvo_utilizan_en_clases_virtuales, celular_basico, smartphone, laptop, ninguno, que_dificultades_tuvo_al_matricular_nna, no_conocia_procedimiento_matricula, no_cuento_con_los_documentos, no_habia_vacantes, otro, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13);    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_salud_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_salud_00`(In dato_01 VARCHAR(250), In dato_02 VARCHAR(250) , In dato_03 VARCHAR(250) ,	
    In dato_04 VARCHAR(250) , In dato_05 int 
)
BEGIN
	INSERT INTO salud(algun_miembro_tiene_discapacidad, algun_miembro_tiene_problemas_salud, derivacion_salud, derivacion_proteccion, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05);    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_derivacion_sectores_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_derivacion_sectores_00`(In dato_01 boolean, In dato_02 boolean , In dato_03 boolean ,	
    In dato_04 VARCHAR(250) , In dato_05 boolean , In dato_06 boolean , In dato_07 int 
)
BEGIN
	INSERT INTO derivacion_sectores(interesado_participar_nutricion, interesado_participar_salud, interesado_participar_medios_vida, actividades_interesado_participar, interesado_entrenamiento_vocacional, interesado_emprendimiento, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07);    
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_Insert_integrantes_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Insert_integrantes_00`(
	In dato_01 VARCHAR(250), In dato_02 VARCHAR(250), In dato_03 VARCHAR(250), In dato_04 VARCHAR(250), In dato_05 VARCHAR(250), In dato_06 date, In dato_07 VARCHAR(250), In dato_08 VARCHAR(250), In dato_09 VARCHAR(250), In dato_10 VARCHAR(25), 
    In dato_11 VARCHAR(250), In dato_12 VARCHAR(250), In dato_13 VARCHAR(250), In dato_14 VARCHAR(250), In dato_15 VARCHAR(250), In dato_16 date, In dato_17 VARCHAR(250), In dato_18 VARCHAR(250), In dato_19 VARCHAR(250), dato_20 VARCHAR(25),
    In dato_21 VARCHAR(250), In dato_22 VARCHAR(250), In dato_23 VARCHAR(250), In dato_24 VARCHAR(250), In dato_25 VARCHAR(250), In dato_26 date, In dato_27 VARCHAR(250), In dato_28 VARCHAR(250), In dato_29 VARCHAR(250), dato_30 VARCHAR(25),
    In dato_31 VARCHAR(250), In dato_32 VARCHAR(250), In dato_33 VARCHAR(250), In dato_34 VARCHAR(250), In dato_35 VARCHAR(250), In dato_36 date, In dato_37 VARCHAR(250), In dato_38 VARCHAR(250), In dato_39 VARCHAR(250), dato_40 VARCHAR(25),
    In dato_41 VARCHAR(250), In dato_42 VARCHAR(250), In dato_43 VARCHAR(250), In dato_44 VARCHAR(250), In dato_45 VARCHAR(250), In dato_46 date, In dato_47 VARCHAR(250), In dato_48 VARCHAR(250), In dato_49 VARCHAR(250), dato_50 VARCHAR(25),
    In dato_51 VARCHAR(250), In dato_52 VARCHAR(250), In dato_53 VARCHAR(250), In dato_54 VARCHAR(250), In dato_55 VARCHAR(250), In dato_56 date, In dato_57 VARCHAR(250), In dato_58 VARCHAR(250), In dato_59 VARCHAR(250), dato_60 VARCHAR(25),
    In dato_61 VARCHAR(250), In dato_62 VARCHAR(250), In dato_63 VARCHAR(250), In dato_64 VARCHAR(250), In dato_65 VARCHAR(250), In dato_66 date, In dato_67 VARCHAR(250), In dato_68 VARCHAR(250), In dato_69 VARCHAR(250), dato_70 VARCHAR(25), In dato_71 int 
)
BEGIN
	INSERT INTO integrantes(
    nombre_1a, nombre_1b, apellido_1a, apellido_1b, genero_1, fecha_nacimiento_1, relacion_1, otro_1, tipo_identificacion_1, numero_identificacion_1, nombre_2a, nombre_2b, apellido_2a, apellido_2b, genero_2, fecha_nacimiento_2, relacion_2, otro_2, tipo_identificacion_2, numero_identificacion_2, nombre_3a, nombre_3b, apellido_3a, apellido_3b, genero_3, fecha_nacimiento_3, relacion_3, otro_3, tipo_identificacion_3, numero_identificacion_3, nombre_4a, nombre_4b, apellido_4a, apellido_4b, genero_4, fecha_nacimiento_4, relacion_4, otro_4, tipo_identificacion_4, numero_identificacion_4, nombre_5a, nombre_5b, apellido_5a, apellido_5b, genero_5, fecha_nacimiento_5, relacion_5, otro_5, tipo_identificacion_5, numero_identificacion_5, nombre_6a, nombre_6b, apellido_6a, apellido_6b, genero_6, fecha_nacimiento_6, relacion_6, otro_6, tipo_identificacion_6, numero_identificacion_6, nombre_7a, nombre_7b, apellido_7a, apellido_7b, genero_7, fecha_nacimiento_7, relacion_7, otro_7, tipo_identificacion_7, numero_identificacion_7, id_beneficiario)
    VALUES (dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
    dato_11, dato_12, dato_13, dato_14, dato_15, dato_16, dato_17, dato_18, dato_19, dato_20, 
    dato_21, dato_22, dato_23, dato_24, dato_25, dato_26, dato_27, dato_28, dato_29, dato_30, 
    dato_31, dato_32, dato_33, dato_34, dato_35, dato_36, dato_37, dato_38, dato_39, dato_40, 
    dato_41, dato_42, dato_43, dato_44, dato_45, dato_46, dato_47, dato_48, dato_49, dato_50, 
    dato_51, dato_52, dato_53, dato_54, dato_55, dato_56, dato_57, dato_58, dato_59, dato_60, 
    dato_61, dato_62, dato_63, dato_64, dato_65, dato_66, dato_67, dato_68, dato_69, dato_70, dato_71);    
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Select_stage_00`;
DELIMITER ;;
CREATE PROCEDURE `SP_Select_stage_00`()
BEGIN
	SELECT * FROM stage_00;
END ;;
DELIMITER ;


call SP_Select_stage_00();
describe integrantes;
call SP_Insert_integrantes(@total, 
'MEYER ',' ',' ',' HERRERA ',' Hombre ',' 1995-02-11 ',' Pareja ',' ',' Carnet de Extranjeria ',' 001896958 ',' LUISSAJER ',' JOSE ',' PACHECO ',' PIÑA ',' Hombre ',' 2010-05-12 ',' Hijo ',' ',' Acta de Nacimiento ',' 4113 ',' MEYLEM ',' JIREH ',' SULUAGA ',' PIÑA ',' Mujer ',' 2020-09-28 ',' Hijo ',' ',' DNI ',' 92037639 ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' 2000/01/01 ',' ',' ',' ',' ', 1 );
select @total as resultado;

INSERT INTO beneficiario(region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, primer_nombre, segundo_nombre, primer_apellido,segundo_apellido, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original)
    VALUES ('Arequipa', NULL, '1', 'Arequipa', 'Estadia', NULL, 'Cerro Colorado', NULL, NULL, 'LUISIANDRI', 'CAROLINA', NULL, NULL, 'Mujer', '1992-12-30', NULL, '20189895', '2026-04-30', NULL, NULL, NULL, 'Primero');    

/* REINICIAR EL AUTO INCREMENTE DE LAS TABLAS */
ALTER TABLE bd_bha_sci.beneficiario AUTO_INCREMENT = 1;




