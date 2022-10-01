
/*******************************
  CREACION DE STORE PROCEDUE 
*******************************/

DROP PROCEDURE IF EXISTS `SP_LimpiarTablaStage`;
DELIMITER |
CREATE PROCEDURE `SP_LimpiarTablaStage`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		delete from stage_00 where dato_145 = usuario;
        delete from stage_find where usuario = usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_LimpiarTablaStage_dataproyecto`;
DELIMITER |
CREATE PROCEDURE `SP_LimpiarTablaStage_dataproyecto`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		delete from stage_data_proyectos;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_LimpiarTablaStageDataHistorica`;
DELIMITER |
CREATE PROCEDURE `SP_LimpiarTablaStageDataHistorica`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		delete from stage_data_historica where nom_usuario = usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDobleEspacioBlanco`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDobleEspacioBlanco`(in usuario varchar(50), OUT success INT)
BEGIN
	/* ELIMINAMOS EL DOBLE ESPACIO EN BLANCO*/
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		UPDATE stage_00 
		SET
dato_02 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_02, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''),
dato_23 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_23, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_26 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_26, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_34 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_34, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_35 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_35, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_74 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_74, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_84 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_84, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_94 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_94, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_104 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_104, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_114 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_114, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_124 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_124, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), ''), 
dato_134 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dato_134, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), '')
        where dato_145=usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHDobleEspacioBlanco`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHDobleEspacioBlanco`(in usuario varchar(50), OUT success INT)
BEGIN
	/* ELIMINAMOS EL DOBLE ESPACIO EN BLANCO*/
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		UPDATE stage_data_historica 
		SET
numero_documento = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(numero_documento, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), ''),CHAR(32), '')
        where nom_usuario=usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateTab`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateTab`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_00 SET 
    dato_01 = user_regex_replace('\t','', dato_01), dato_02 = user_regex_replace('\t','', dato_02), 
	dato_03 = user_regex_replace('\t','', dato_03), dato_04 = user_regex_replace('\t','', dato_04), 
	dato_05 = user_regex_replace('\t','', dato_05), dato_06 = user_regex_replace('\t','', dato_06), 
	dato_07 = user_regex_replace('\t','', dato_07), dato_08 = user_regex_replace('\t','', dato_08), 
	dato_09 = user_regex_replace('\t','', dato_09), dato_10 = user_regex_replace('\t','', dato_10), 
	dato_11 = user_regex_replace('\t','', dato_11), dato_12 = user_regex_replace('\t','', dato_12), 
	dato_13 = user_regex_replace('\t','', dato_13), dato_14 = user_regex_replace('\t','', dato_14), 
	dato_15 = user_regex_replace('\t','', dato_15), dato_16 = user_regex_replace('\t','', dato_16), 
	dato_17 = user_regex_replace('\t','', dato_17), dato_18 = user_regex_replace('\t','', dato_18), 
	dato_19 = user_regex_replace('\t','', dato_19), dato_20 = user_regex_replace('\t','', dato_20), 
	dato_21 = user_regex_replace('\t','', dato_21), dato_22 = user_regex_replace('\t','', dato_22), 
	dato_23 = user_regex_replace('\t','', dato_23), dato_24 = user_regex_replace('\t','', dato_24), 
	dato_25 = user_regex_replace('\t','', dato_25), dato_26 = user_regex_replace('\t','', dato_26), 
	dato_27 = user_regex_replace('\t','', dato_27), dato_28 = user_regex_replace('\t','', dato_28), 
	dato_29 = user_regex_replace('\t','', dato_29), dato_30 = user_regex_replace('\t','', dato_30), 
	dato_31 = user_regex_replace('\t','', dato_31), dato_32 = user_regex_replace('\t','', dato_32), 
	dato_33 = user_regex_replace('\t','', dato_33), dato_34 = user_regex_replace('\t','', dato_34), 
	dato_35 = user_regex_replace('\t','', dato_35), dato_36 = user_regex_replace('\t','', dato_36), 
	dato_37 = user_regex_replace('\t','', dato_37), dato_38 = user_regex_replace('\t','', dato_38), 
	dato_39 = user_regex_replace('\t','', dato_39), dato_40 = user_regex_replace('\t','', dato_40), 
	dato_41 = user_regex_replace('\t','', dato_41), dato_42 = user_regex_replace('\t','', dato_42), 
	dato_43 = user_regex_replace('\t','', dato_43), dato_44 = user_regex_replace('\t','', dato_44), 
	dato_45 = user_regex_replace('\t','', dato_45), dato_46 = user_regex_replace('\t','', dato_46), 
	dato_47 = user_regex_replace('\t','', dato_47), dato_48 = user_regex_replace('\t','', dato_48), 
	dato_49 = user_regex_replace('\t','', dato_49), dato_50 = user_regex_replace('\t','', dato_50), 
	dato_51 = user_regex_replace('\t','', dato_51), dato_52 = user_regex_replace('\t','', dato_52), 
	dato_53 = user_regex_replace('\t','', dato_53), dato_54 = user_regex_replace('\t','', dato_54), 
	dato_55 = user_regex_replace('\t','', dato_55), dato_56 = user_regex_replace('\t','', dato_56), 
	dato_57 = user_regex_replace('\t','', dato_57), dato_58 = user_regex_replace('\t','', dato_58), 
	dato_59 = user_regex_replace('\t','', dato_59), dato_60 = user_regex_replace('\t','', dato_60), 
	dato_61 = user_regex_replace('\t','', dato_61), dato_62 = user_regex_replace('\t','', dato_62), 
	dato_63 = user_regex_replace('\t','', dato_63), dato_64 = user_regex_replace('\t','', dato_64), 
	dato_65 = user_regex_replace('\t','', dato_65), dato_66 = user_regex_replace('\t','', dato_66), 
	dato_67 = user_regex_replace('\t','', dato_67), dato_68 = user_regex_replace('\t','', dato_68), 
	dato_69 = user_regex_replace('\t','', dato_69), dato_70 = user_regex_replace('\t','', dato_70), 
	dato_71 = user_regex_replace('\t','', dato_71), dato_72 = user_regex_replace('\t','', dato_72), 
	dato_73 = user_regex_replace('\t','', dato_73), dato_74 = user_regex_replace('\t','', dato_74), 
	dato_75 = user_regex_replace('\t','', dato_75), dato_76 = user_regex_replace('\t','', dato_76), 
	dato_77 = user_regex_replace('\t','', dato_77), dato_78 = user_regex_replace('\t','', dato_78), 
	dato_79 = user_regex_replace('\t','', dato_79), dato_80 = user_regex_replace('\t','', dato_80), 
	dato_81 = user_regex_replace('\t','', dato_81), dato_82 = user_regex_replace('\t','', dato_82), 
	dato_83 = user_regex_replace('\t','', dato_83), dato_84 = user_regex_replace('\t','', dato_84), 
	dato_85 = user_regex_replace('\t','', dato_85), dato_86 = user_regex_replace('\t','', dato_86), 
	dato_87 = user_regex_replace('\t','', dato_87), dato_88 = user_regex_replace('\t','', dato_88), 
	dato_89 = user_regex_replace('\t','', dato_89), dato_90 = user_regex_replace('\t','', dato_90), 
	dato_91 = user_regex_replace('\t','', dato_91), dato_92 = user_regex_replace('\t','', dato_92), 
	dato_93 = user_regex_replace('\t','', dato_93), dato_94 = user_regex_replace('\t','', dato_94), 
	dato_95 = user_regex_replace('\t','', dato_95), dato_96 = user_regex_replace('\t','', dato_96), 
	dato_97 = user_regex_replace('\t','', dato_97), dato_98 = user_regex_replace('\t','', dato_98), 
	dato_99 = user_regex_replace('\t','', dato_99), dato_100 = user_regex_replace('\t','', dato_100), 
	dato_101 = user_regex_replace('\t','', dato_101), dato_102 = user_regex_replace('\t','', dato_102), 
	dato_103 = user_regex_replace('\t','', dato_103), dato_104 = user_regex_replace('\t','', dato_104), 
	dato_105 = user_regex_replace('\t','', dato_105), dato_106 = user_regex_replace('\t','', dato_106), 
	dato_107 = user_regex_replace('\t','', dato_107), dato_108 = user_regex_replace('\t','', dato_108), 
	dato_109 = user_regex_replace('\t','', dato_109), dato_110 = user_regex_replace('\t','', dato_110), 
	dato_111 = user_regex_replace('\t','', dato_111), dato_112 = user_regex_replace('\t','', dato_112), 
	dato_113 = user_regex_replace('\t','', dato_113), dato_114 = user_regex_replace('\t','', dato_114), 
	dato_115 = user_regex_replace('\t','', dato_115), dato_116 = user_regex_replace('\t','', dato_116), 
	dato_117 = user_regex_replace('\t','', dato_117), dato_118 = user_regex_replace('\t','', dato_118), 
	dato_119 = user_regex_replace('\t','', dato_119), dato_120 = user_regex_replace('\t','', dato_120), 
	dato_121 = user_regex_replace('\t','', dato_121), dato_122 = user_regex_replace('\t','', dato_122), 
	dato_123 = user_regex_replace('\t','', dato_123), dato_124 = user_regex_replace('\t','', dato_124), 
	dato_125 = user_regex_replace('\t','', dato_125), dato_126 = user_regex_replace('\t','', dato_126), 
	dato_127 = user_regex_replace('\t','', dato_127), dato_128 = user_regex_replace('\t','', dato_128), 
	dato_129 = user_regex_replace('\t','', dato_129), dato_130 = user_regex_replace('\t','', dato_130), 
	dato_131 = user_regex_replace('\t','', dato_131), dato_132 = user_regex_replace('\t','', dato_132), 
	dato_133 = user_regex_replace('\t','', dato_133), dato_134 = user_regex_replace('\t','', dato_134), 
	dato_135 = user_regex_replace('\t','', dato_135), dato_136 = user_regex_replace('\t','', dato_136), 
	dato_137 = user_regex_replace('\t','', dato_137), dato_138 = user_regex_replace('\t','', dato_138), 
	dato_139 = user_regex_replace('\t','', dato_139), dato_140 = user_regex_replace('\t','', dato_140), 
	dato_141 = user_regex_replace('\t','', dato_141), dato_142 = user_regex_replace('\t','', dato_142), 
	dato_143 = user_regex_replace('\t','', dato_143), dato_144 = user_regex_replace('\t','', dato_144)
    where dato_145 = usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHTab`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHTab`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_data_historica SET 
    nombre_1 = user_regex_replace('\t','', nombre_1), nombre_2 = user_regex_replace('\t','', nombre_2), 
apellido_1 = user_regex_replace('\t','', apellido_1), 
apellido_2 = user_regex_replace('\t','', apellido_2), 
tipo_documento = user_regex_replace('\t','', tipo_documento)
    where nom_usuario = usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateSaltoLinea`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateSaltoLinea`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 SET 
    dato_134 = replace(dato_134, '\\n', ''), dato_124 = replace(dato_124, '\\n', ''), dato_114 = replace(dato_114, '\\n', ''), 
    dato_104 = replace(dato_104, '\\n', ''), dato_94 = replace(dato_94, '\\n', ''), dato_84 = replace(dato_84, '\\n', ''), 
    dato_74 = replace(dato_74, '\\n', ''), dato_34 = replace(dato_34, '\\n', ''), dato_35 = replace(dato_35, '\\n', ''), 
    dato_26 = replace(dato_26, '\\n', ''), dato_23 = replace(dato_23, '\\n', ''), dato_02 = replace(dato_02, '\\n', ''), 
    dato_03 = replace(dato_03, '\\n', ''), 
    dato_16 = replace(dato_16, '\\n', ''), dato_17 = replace(dato_17, '\\n', ''), dato_18 = replace(dato_18, '\\n', ''), 
    dato_19 = replace(dato_19, '\\n', ''), 
    dato_39 = replace(dato_39, '\\n', ''),
    dato_65 = replace(dato_65, '\\n', ''), dato_66 = replace(dato_66, '\\n', ''), dato_67 = replace(dato_67, '\\n', ''),
    dato_68 = replace(dato_68, '\\n', ''), 
    dato_75 = replace(dato_75, '\\n', ''), dato_76 = replace(dato_76, '\\n', ''), dato_77 = replace(dato_77, '\\n', ''), 
    dato_78 = replace(dato_78, '\\n', ''), 
    dato_85 = replace(dato_85, '\\n', ''), dato_86 = replace(dato_86, '\\n', ''), dato_87 = replace(dato_87, '\\n', ''), 
    dato_88 = replace(dato_88, '\\n', ''),
    dato_95 = replace(dato_95, '\\n', ''), dato_96 = replace(dato_96, '\\n', ''), dato_97 = replace(dato_97, '\\n', ''), 
    dato_98 = replace(dato_98, '\\n', ''), 
    dato_105 = replace(dato_105, '\\n', ''), dato_106 = replace(dato_106, '\\n', ''), dato_107 = replace(dato_107, '\\n', ''), dato_108 = replace(dato_108, '\\n', ''), 
    dato_115 = replace(dato_115, '\\n', ''), dato_116 = replace(dato_116, '\\n', ''), dato_117 = replace(dato_117, '\\n', ''), dato_118 = replace(dato_118, '\\n', ''), 
    dato_125 = replace(dato_125, '\\n', ''), dato_126 = replace(dato_126, '\\n', ''), dato_127 = replace(dato_127, '\\n', ''), dato_128 = replace(dato_128, '\\n', '')  
    where dato_145=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHSaltoLinea`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHSaltoLinea`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
  
	START TRANSACTION;
		UPDATE stage_data_historica SET 
        nombre_1 = REPLACE(nombre_1, '\\n', ''),  nombre_2 = REPLACE(nombre_2, '\\n', ''), 
		apellido_1 = REPLACE(apellido_1, '\\n', ''), apellido_2 = REPLACE(apellido_2, '\\n', ''), 
		tipo_documento = REPLACE(tipo_documento, '\\n', ''), numero_documento = REPLACE(numero_documento, '\\n', '') 
        WHERE nom_usuario=usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateNewLineReturnLine`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateNewLineReturnLine`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	START TRANSACTION;
    UPDATE stage_00 SET 
dato_01 = replace(dato_01,'\r\n',''), dato_02 = replace(dato_02,'\r\n',''), 
dato_03 = replace(dato_03,'\r\n',''), 
dato_04 = replace(dato_04,'\r\n',''), 
dato_05 = replace(dato_05,'\r\n',''), 
dato_06 = replace(dato_06,'\r\n',''), 
dato_07 = replace(dato_07,'\r\n',''), 
dato_08 = replace(dato_08,'\r\n',''), 
dato_09 = replace(dato_09,'\r\n',''), 
dato_10 = replace(dato_10,'\r\n',''), 
dato_11 = replace(dato_11,'\r\n',''), 
dato_12 = replace(dato_12,'\r\n',''), 
dato_13 = replace(dato_13,'\r\n',''), 
dato_14 = replace(dato_14,'\r\n',''), 
dato_15 = replace(dato_15,'\r\n',''), 
dato_16 = replace(dato_16,'\r\n',''), 
dato_17 = replace(dato_17,'\r\n',''), 
dato_18 = replace(dato_18,'\r\n',''), 
dato_19 = replace(dato_19,'\r\n',''), 
dato_20 = replace(dato_20,'\r\n',''), 
dato_21 = replace(dato_21,'\r\n',''), 
dato_22 = replace(dato_22,'\r\n',''), 
dato_23 = replace(dato_23,'\r\n',''), 
dato_24 = replace(dato_24,'\r\n',''), 
dato_25 = replace(dato_25,'\r\n',''), 
dato_26 = replace(dato_26,'\r\n',''), 
dato_27 = replace(dato_27,'\r\n',''), 
dato_28 = replace(dato_28,'\r\n',''), 
dato_29 = replace(dato_29,'\r\n',''), 
dato_30 = replace(dato_30,'\r\n',''), 
dato_31 = replace(dato_31,'\r\n',''), 
dato_32 = replace(dato_32,'\r\n',''), 
dato_33 = replace(dato_33,'\r\n',''), 
dato_34 = replace(dato_34,'\r\n',''), 
dato_35 = replace(dato_35,'\r\n',''), 
dato_36 = replace(dato_36,'\r\n',''), 
dato_37 = replace(dato_37,'\r\n',''), 
dato_38 = replace(dato_38,'\r\n',''), 
dato_39 = replace(dato_39,'\r\n',''), 
dato_40 = replace(dato_40,'\r\n',''), 
dato_41 = replace(dato_41,'\r\n',''), 
dato_42 = replace(dato_42,'\r\n',''), 
dato_43 = replace(dato_43,'\r\n',''), 
dato_44 = replace(dato_44,'\r\n',''), 
dato_45 = replace(dato_45,'\r\n',''), 
dato_46 = replace(dato_46,'\r\n',''), 
dato_47 = replace(dato_47,'\r\n',''), 
dato_48 = replace(dato_48,'\r\n',''), 
dato_49 = replace(dato_49,'\r\n',''), 
dato_50 = replace(dato_50,'\r\n',''), 
dato_51 = replace(dato_51,'\r\n',''), 
dato_52 = replace(dato_52,'\r\n',''), 
dato_53 = replace(dato_53,'\r\n',''), 
dato_54 = replace(dato_54,'\r\n',''), 
dato_55 = replace(dato_55,'\r\n',''), 
dato_56 = replace(dato_56,'\r\n',''), 
dato_57 = replace(dato_57,'\r\n',''), 
dato_58 = replace(dato_58,'\r\n',''), 
dato_59 = replace(dato_59,'\r\n',''), 
dato_60 = replace(dato_60,'\r\n',''), 
dato_61 = replace(dato_61,'\r\n',''), 
dato_62 = replace(dato_62,'\r\n',''), 
dato_63 = replace(dato_63,'\r\n',''), 
dato_64 = replace(dato_64,'\r\n',''), 
dato_65 = replace(dato_65,'\r\n',''), 
dato_66 = replace(dato_66,'\r\n',''), 
dato_67 = replace(dato_67,'\r\n',''), 
dato_68 = replace(dato_68,'\r\n',''), 
dato_69 = replace(dato_69,'\r\n',''), 
dato_70 = replace(dato_70,'\r\n',''), 
dato_71 = replace(dato_71,'\r\n',''), 
dato_72 = replace(dato_72,'\r\n',''), 
dato_73 = replace(dato_73,'\r\n',''), 
dato_74 = replace(dato_74,'\r\n',''), 
dato_75 = replace(dato_75,'\r\n',''), 
dato_76 = replace(dato_76,'\r\n',''), 
dato_77 = replace(dato_77,'\r\n',''), 
dato_78 = replace(dato_78,'\r\n',''), 
dato_79 = replace(dato_79,'\r\n',''), 
dato_80 = replace(dato_80,'\r\n',''), 
dato_81 = replace(dato_81,'\r\n',''), 
dato_82 = replace(dato_82,'\r\n',''), 
dato_83 = replace(dato_83,'\r\n',''), 
dato_84 = replace(dato_84,'\r\n',''), 
dato_85 = replace(dato_85,'\r\n',''), 
dato_86 = replace(dato_86,'\r\n',''), 
dato_87 = replace(dato_87,'\r\n',''), 
dato_88 = replace(dato_88,'\r\n',''), 
dato_89 = replace(dato_89,'\r\n',''), 
dato_90 = replace(dato_90,'\r\n',''), 
dato_91 = replace(dato_91,'\r\n',''), 
dato_92 = replace(dato_92,'\r\n',''), 
dato_93 = replace(dato_93,'\r\n',''), 
dato_94 = replace(dato_94,'\r\n',''), 
dato_95 = replace(dato_95,'\r\n',''), 
dato_96 = replace(dato_96,'\r\n',''), 
dato_97 = replace(dato_97,'\r\n',''), 
dato_98 = replace(dato_98,'\r\n',''), 
dato_99 = replace(dato_99,'\r\n',''), 
dato_100 = replace(dato_100,'\r\n',''), 
dato_101 = replace(dato_101,'\r\n',''), 
dato_102 = replace(dato_102,'\r\n',''), 
dato_103 = replace(dato_103,'\r\n',''), 
dato_104 = replace(dato_104,'\r\n',''), 
dato_105 = replace(dato_105,'\r\n',''), 
dato_106 = replace(dato_106,'\r\n',''), 
dato_107 = replace(dato_107,'\r\n',''), 
dato_108 = replace(dato_108,'\r\n',''), 
dato_109 = replace(dato_109,'\r\n',''), 
dato_110 = replace(dato_110,'\r\n',''), 
dato_111 = replace(dato_111,'\r\n',''), 
dato_112 = replace(dato_112,'\r\n',''), 
dato_113 = replace(dato_113,'\r\n',''), 
dato_114 = replace(dato_114,'\r\n',''), 
dato_115 = replace(dato_115,'\r\n',''), 
dato_116 = replace(dato_116,'\r\n',''), 
dato_117 = replace(dato_117,'\r\n',''), 
dato_118 = replace(dato_118,'\r\n',''), 
dato_119 = replace(dato_119,'\r\n',''), 
dato_120 = replace(dato_120,'\r\n',''), 
dato_121 = replace(dato_121,'\r\n',''), 
dato_122 = replace(dato_122,'\r\n',''), 
dato_123 = replace(dato_123,'\r\n',''), 
dato_124 = replace(dato_124,'\r\n',''), 
dato_125 = replace(dato_125,'\r\n',''), 
dato_126 = replace(dato_126,'\r\n',''), 
dato_127 = replace(dato_127,'\r\n',''), 
dato_128 = replace(dato_128,'\r\n',''), 
dato_129 = replace(dato_129,'\r\n',''), 
dato_130 = replace(dato_130,'\r\n',''), 
dato_131 = replace(dato_131,'\r\n',''), 
dato_132 = replace(dato_132,'\r\n',''), 
dato_133 = replace(dato_133,'\r\n',''), 
dato_134 = replace(dato_134,'\r\n',''), 
dato_135 = replace(dato_135,'\r\n',''), 
dato_136 = replace(dato_136,'\r\n',''), 
dato_137 = replace(dato_137,'\r\n',''), 
dato_138 = replace(dato_138,'\r\n',''), 
dato_139 = replace(dato_139,'\r\n',''), 
dato_140 = replace(dato_140,'\r\n',''), 
dato_141 = replace(dato_141,'\r\n',''), 
dato_142 = replace(dato_142,'\r\n',''), 
dato_143 = replace(dato_143,'\r\n',''), 
dato_144 = replace(dato_144,'\r\n','')
    where dato_145=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHNewLineReturnLine`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHNewLineReturnLine`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	START TRANSACTION;
    UPDATE stage_data_historica SET 
	nombre_1 = replace(nombre_1,'\r\n',''), nombre_2 = replace(nombre_2,'\r\n',''), 
	apellido_1 = replace(apellido_1,'\r\n',''), apellido_2 = replace(apellido_2,'\r\n',''), 
	tipo_documento = replace(tipo_documento,'\r\n',''), numero_documento = replace(numero_documento,'\r\n',''), 
	proyecto = replace(proyecto,'\r\n',''), cod_familia = replace(cod_familia,'\r\n','')
    where nom_usuario=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateLetrasPuntoGuion`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateLetrasPuntoGuion`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 
	SET DATO_134 = user_regex_replace('[A-Za-z._-]', '', DATO_134), DATO_124 = user_regex_replace('[A-Za-z._-]', '', DATO_124), 
	DATO_114 = user_regex_replace('[A-Za-z._-]', '', DATO_114), DATO_104 = user_regex_replace('[A-Za-z._-]', '', DATO_104),
	DATO_94 = user_regex_replace('[A-Za-z._-]', '', DATO_94), DATO_84 = user_regex_replace('[A-Za-z._-]', '', DATO_84),
	DATO_74 = user_regex_replace('[A-Za-z._-]', '', DATO_74), DATO_35 = user_regex_replace('[A-Za-z._-]', '', DATO_35),
	DATO_34 = user_regex_replace('[A-Za-z._-]', '', DATO_34), DATO_26 = user_regex_replace('[A-Za-z._-]', '', DATO_26),
	DATO_23 = user_regex_replace('[A-Za-z._-]', '', DATO_23), DATO_02 = user_regex_replace('[A-Za-z._-]', '', DATO_02)
    where dato_145=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHLetrasPuntoGuion`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHLetrasPuntoGuion`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_data_historica 	
    SET 
    /* numero_documento = user_regex_replace('[A-Za-z._(/:),-]', '', numero_documento),
    numero_documento = user_regex_replace('[áéíóúÁÉÍÓÚ]', '', numero_documento),
    numero_documento = user_regex_replace('[—]', '', numero_documento) */
    numero_documento = udf_remove_alpha(numero_documento)
    where nom_usuario=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_UpdateAscii`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateAscii`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 
	SET    
    dato_01=replace(dato_01, UNHEX('C2A0'), ''), dato_02=replace(dato_02, UNHEX('C2A0'),  ''), 
    dato_03=replace(dato_03, UNHEX('C2A0'),  ''), dato_04=replace(dato_04, UNHEX('C2A0'),  ''), 
    dato_05=replace(dato_05, UNHEX('C2A0'),  ''), dato_06=replace(dato_06, UNHEX('C2A0'),  ''), 
    dato_07=replace(dato_07, UNHEX('C2A0'),  ''), dato_08=replace(dato_08, UNHEX('C2A0'),  ''), 
    dato_09=replace(dato_09, UNHEX('C2A0'),  ''), dato_10=replace(dato_10, UNHEX('C2A0'),  ''), 
    dato_11=replace(dato_11, UNHEX('C2A0'),  ''), dato_12=replace(dato_12, UNHEX('C2A0'),  ''), 
    dato_13=replace(dato_13, UNHEX('C2A0'),  ''), dato_14=replace(dato_14, UNHEX('C2A0'),  ''), 
    dato_15=replace(dato_15, UNHEX('C2A0'),  ''), dato_16=replace(dato_16, UNHEX('C2A0'),  ''), 
    dato_17=replace(dato_17, UNHEX('C2A0'),  ''), dato_18=replace(dato_18, UNHEX('C2A0'),  ''), 
    dato_19=replace(dato_19, UNHEX('C2A0'),  ''), dato_20=replace(dato_20, UNHEX('C2A0'),  ''), 
    dato_21=replace(dato_21, UNHEX('C2A0'),  ''), dato_22=replace(dato_22, UNHEX('C2A0'),  ''), 
    dato_23=replace(dato_23, UNHEX('C2A0'),  ''), dato_24=replace(dato_24, UNHEX('C2A0'),  ''), 
    dato_25=replace(dato_25, UNHEX('C2A0'),  ''), dato_26=replace(dato_26, UNHEX('C2A0'),  ''), 
    dato_27=replace(dato_27, UNHEX('C2A0'),  ''), dato_28=replace(dato_28, UNHEX('C2A0'),  ''), 
    dato_29=replace(dato_29, UNHEX('C2A0'),  ''), dato_30=replace(dato_30, UNHEX('C2A0'),  ''), 
    dato_31=replace(dato_31, UNHEX('C2A0'),  ''), dato_32=replace(dato_32, UNHEX('C2A0'),  ''), 
    dato_33=replace(dato_33, UNHEX('C2A0'),  ''), dato_34=replace(dato_34, UNHEX('C2A0'),  ''), 
    dato_35=replace(dato_35, UNHEX('C2A0'),  ''), dato_36=replace(dato_36, UNHEX('C2A0'),  ''), 
    dato_37=replace(dato_37, UNHEX('C2A0'),  ''), dato_38=replace(dato_38, UNHEX('C2A0'),  ''), 
    dato_39=replace(dato_39, UNHEX('C2A0'),  ''), dato_40=replace(dato_40, UNHEX('C2A0'),  ''), 
    dato_41=replace(dato_41, UNHEX('C2A0'),  ''), dato_42=replace(dato_42, UNHEX('C2A0'),  ''), 
    dato_43=replace(dato_43, UNHEX('C2A0'),  ''), dato_44=replace(dato_44, UNHEX('C2A0'),  ''), 
    dato_45=replace(dato_45, UNHEX('C2A0'),  ''), dato_46=replace(dato_46, UNHEX('C2A0'),  ''), 
    dato_47=replace(dato_47, UNHEX('C2A0'),  ''), dato_48=replace(dato_48, UNHEX('C2A0'),  ''), 
    dato_49=replace(dato_49, UNHEX('C2A0'),  ''), dato_50=replace(dato_50, UNHEX('C2A0'),  ''), 
    dato_51=replace(dato_51, UNHEX('C2A0'),  ''), dato_52=replace(dato_52, UNHEX('C2A0'),  ''), 
    dato_53=replace(dato_53, UNHEX('C2A0'),  ''), dato_54=replace(dato_54, UNHEX('C2A0'),  ''), 
    dato_55=replace(dato_55, UNHEX('C2A0'),  ''), dato_56=replace(dato_56, UNHEX('C2A0'),  ''), 
    dato_57=replace(dato_57, UNHEX('C2A0'),  ''), dato_58=replace(dato_58, UNHEX('C2A0'),  ''), 
    dato_59=replace(dato_59, UNHEX('C2A0'),  ''), dato_60=replace(dato_60, UNHEX('C2A0'),  ''), 
    dato_61=replace(dato_61, UNHEX('C2A0'),  ''), dato_62=replace(dato_62, UNHEX('C2A0'),  ''), 
    dato_63=replace(dato_63, UNHEX('C2A0'),  ''), dato_64=replace(dato_64, UNHEX('C2A0'),  ''), 
    dato_65=replace(dato_65, UNHEX('C2A0'),  ''), dato_66=replace(dato_66, UNHEX('C2A0'),  ''), 
    dato_67=replace(dato_67, UNHEX('C2A0'),  ''), dato_68=replace(dato_68, UNHEX('C2A0'),  ''), 
    dato_69=replace(dato_69, UNHEX('C2A0'),  ''), dato_70=replace(dato_70, UNHEX('C2A0'),  ''), 
    dato_71=replace(dato_71, UNHEX('C2A0'),  ''), dato_72=replace(dato_72, UNHEX('C2A0'),  ''), 
    dato_73=replace(dato_73, UNHEX('C2A0'),  ''), dato_74=replace(dato_74, UNHEX('C2A0'),  ''), 
    dato_75=replace(dato_75, UNHEX('C2A0'),  ''), dato_76=replace(dato_76, UNHEX('C2A0'),  ''), 
    dato_77=replace(dato_77, UNHEX('C2A0'),  ''), dato_78=replace(dato_78, UNHEX('C2A0'),  ''), 
    dato_79=replace(dato_79, UNHEX('C2A0'),  ''), dato_80=replace(dato_80, UNHEX('C2A0'),  ''), 
    dato_81=replace(dato_81, UNHEX('C2A0'),  ''), dato_82=replace(dato_82, UNHEX('C2A0'),  ''), 
    dato_83=replace(dato_83, UNHEX('C2A0'),  ''), dato_84=replace(dato_84, UNHEX('C2A0'),  ''), 
    dato_85=replace(dato_85, UNHEX('C2A0'),  ''), dato_86=replace(dato_86, UNHEX('C2A0'),  ''), 
    dato_87=replace(dato_87, UNHEX('C2A0'),  ''), dato_88=replace(dato_88, UNHEX('C2A0'),  ''), 
    dato_89=replace(dato_89, UNHEX('C2A0'),  ''), dato_90=replace(dato_90, UNHEX('C2A0'),  ''), 
    dato_91=replace(dato_91, UNHEX('C2A0'),  ''), dato_92=replace(dato_92, UNHEX('C2A0'),  ''), 
    dato_93=replace(dato_93, UNHEX('C2A0'),  ''), dato_94=replace(dato_94, UNHEX('C2A0'),  ''), 
    dato_95=replace(dato_95, UNHEX('C2A0'),  ''), dato_96=replace(dato_96, UNHEX('C2A0'),  ''), 
    dato_97=replace(dato_97, UNHEX('C2A0'),  ''), dato_98=replace(dato_98, UNHEX('C2A0'),  ''), 
    dato_99=replace(dato_99, UNHEX('C2A0'),  ''), dato_100=replace(dato_100, UNHEX('C2A0'),  ''), 
    dato_101=replace(dato_101, UNHEX('C2A0'),  ''), dato_102=replace(dato_102, UNHEX('C2A0'),  ''), 
    dato_103=replace(dato_103, UNHEX('C2A0'),  ''), dato_104=replace(dato_104, UNHEX('C2A0'),  ''), 
    dato_105=replace(dato_105, UNHEX('C2A0'),  ''), dato_106=replace(dato_106, UNHEX('C2A0'),  ''), 
    dato_107=replace(dato_107, UNHEX('C2A0'),  ''), dato_108=replace(dato_108, UNHEX('C2A0'),  ''), 
    dato_109=replace(dato_109, UNHEX('C2A0'),  ''), dato_110=replace(dato_110, UNHEX('C2A0'),  ''), 
    dato_111=replace(dato_111, UNHEX('C2A0'),  ''), dato_112=replace(dato_112, UNHEX('C2A0'),  ''), 
    dato_113=replace(dato_113, UNHEX('C2A0'),  ''), dato_114=replace(dato_114, UNHEX('C2A0'),  ''), 
    dato_115=replace(dato_115, UNHEX('C2A0'),  ''), dato_116=replace(dato_116, UNHEX('C2A0'),  ''), 
    dato_117=replace(dato_117, UNHEX('C2A0'),  ''), dato_118=replace(dato_118, UNHEX('C2A0'),  ''), 
    dato_119=replace(dato_119, UNHEX('C2A0'),  ''), dato_120=replace(dato_120, UNHEX('C2A0'),  ''), 
    dato_121=replace(dato_121, UNHEX('C2A0'),  ''), dato_122=replace(dato_122, UNHEX('C2A0'),  ''), 
    dato_123=replace(dato_123, UNHEX('C2A0'),  ''), dato_124=replace(dato_124, UNHEX('C2A0'),  ''), 
    dato_125=replace(dato_125, UNHEX('C2A0'),  ''), dato_126=replace(dato_126, UNHEX('C2A0'),  ''), 
    dato_127=replace(dato_127, UNHEX('C2A0'),  ''), dato_128=replace(dato_128, UNHEX('C2A0'),  ''), 
    dato_129=replace(dato_129, UNHEX('C2A0'),  ''), dato_130=replace(dato_130, UNHEX('C2A0'),  ''), 
    dato_131=replace(dato_131, UNHEX('C2A0'),  ''), dato_132=replace(dato_132, UNHEX('C2A0'),  ''), 
    dato_133=replace(dato_133, UNHEX('C2A0'),  ''), dato_134=replace(dato_134, UNHEX('C2A0'),  ''), 
    dato_135=replace(dato_135, UNHEX('C2A0'),  ''), dato_136=replace(dato_136, UNHEX('C2A0'),  ''), 
    dato_137=replace(dato_137, UNHEX('C2A0'),  ''), dato_138=replace(dato_138, UNHEX('C2A0'),  ''), 
    dato_139=replace(dato_139, UNHEX('C2A0'),  ''), dato_140=replace(dato_140, UNHEX('C2A0'),  ''), 
    dato_141=replace(dato_141, UNHEX('C2A0'),  ''), dato_142=replace(dato_142, UNHEX('C2A0'),  ''), 
    dato_143=replace(dato_143, UNHEX('C2A0'),  ''), dato_144=replace(dato_144, UNHEX('C2A0'),  '')
    where dato_145=usuario;

    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHAscii`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHAscii`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_data_historica 
	SET    
    nombre_1=replace(nombre_1, UNHEX('C2A0'), ''), nombre_2=replace(nombre_2, UNHEX('C2A0'),  ''), 
    apellido_1=replace(apellido_1, UNHEX('C2A0'),  ''), apellido_2=replace(apellido_2, UNHEX('C2A0'),  ''), 
    tipo_documento=replace(tipo_documento, UNHEX('C2A0'),  ''), numero_documento=replace(numero_documento, UNHEX('C2A0'),  ''), 
    proyecto=replace(proyecto, UNHEX('C2A0'),  '')
    where nom_usuario=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateBackSlash`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateBackSlash`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
     SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 
	SET DATO_134 = REPLACE(DATO_134, '\\', ''), DATO_124 = REPLACE(DATO_124, '\\', ''), DATO_114 = REPLACE(DATO_114, '\\', ''), 
    DATO_104 = REPLACE(DATO_104, '\\', ''),	DATO_94 = REPLACE(DATO_94, '\\', ''), DATO_84 = REPLACE(DATO_84, '\\', ''),
	DATO_74 = REPLACE(DATO_74, '\\', ''), DATO_35 = REPLACE(DATO_35, '\\', ''),	DATO_34 = REPLACE(DATO_34, '\\', ''), 
    DATO_26 = REPLACE(DATO_26, '\\', ''), DATO_23 = REPLACE(DATO_23, '\\', ''), DATO_02 = REPLACE(DATO_02, '\\', '')
    where dato_145=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateCerosIniciales`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateCerosIniciales`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
     SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 
	SET DATO_23 = CAST(`DATO_23` AS UNSIGNED), DATO_74 = CAST(`DATO_74` AS UNSIGNED), 
    DATO_84 = CAST(`DATO_84` AS UNSIGNED), DATO_94 = CAST(`DATO_94` AS UNSIGNED), 
    DATO_104 = CAST(`DATO_104` AS UNSIGNED), DATO_114 = CAST(`DATO_114` AS UNSIGNED), 
    DATO_124 = CAST(`DATO_124` AS UNSIGNED), DATO_134 = CAST(`DATO_134` AS UNSIGNED)
    WHERE dato_145=usuario;
    
    UPDATE stage_00 SET DATO_23 = '' WHERE DATO_23 = 0;
	UPDATE stage_00 SET DATO_74 = '' WHERE DATO_74 = 0;
	UPDATE stage_00 SET DATO_84 = '' WHERE DATO_84 = 0;
	UPDATE stage_00 SET DATO_94 = '' WHERE DATO_94 = 0;
	UPDATE stage_00 SET DATO_104 = '' WHERE DATO_104 = 0;
	UPDATE stage_00 SET DATO_114 = '' WHERE DATO_114 = 0;
	UPDATE stage_00 SET DATO_124 = '' WHERE DATO_124 = 0;
	UPDATE stage_00 SET DATO_134 = '' WHERE DATO_134 = 0;
    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHBackSlash`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHBackSlash`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		UPDATE stage_data_historica SET 
        nombre_1 = REPLACE(nombre_1, '\\', ''), nombre_2 = REPLACE(nombre_2, '\\', ''), 
        apellido_1 = REPLACE(apellido_1, '\\', ''), apellido_2 = REPLACE(apellido_2, '\\', ''), 
        tipo_documento = REPLACE(tipo_documento, '\\', ''), numero_documento = REPLACE(numero_documento, '\\', ''), 
        proyecto = REPLACE(proyecto, '\\', '') 
        WHERE nom_usuario=usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateTrim`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateTrim`(in usuario varchar(50), OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
     SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 SET dato_01=TRIM(dato_01), dato_02=TRIM(dato_02), dato_03=TRIM(dato_03), dato_04=TRIM(dato_04), 
	dato_05=TRIM(dato_05), dato_06=TRIM(dato_06), dato_07=TRIM(dato_07), dato_08=TRIM(dato_08), dato_09=TRIM(dato_09), 
	dato_10=TRIM(dato_10), dato_11=TRIM(dato_11), dato_12=TRIM(dato_12), dato_13=TRIM(dato_13), dato_14=TRIM(dato_14), 
	dato_15=TRIM(dato_15), dato_16=TRIM(dato_16), dato_17=TRIM(dato_17), dato_18=TRIM(dato_18), dato_19=TRIM(dato_19), 
	dato_20=TRIM(dato_20), dato_21=TRIM(dato_21), dato_22=TRIM(dato_22), dato_23=TRIM(dato_23), dato_24=TRIM(dato_24), 
	dato_25=TRIM(dato_25), dato_26=TRIM(dato_26), dato_27=TRIM(dato_27), dato_28=TRIM(dato_28), dato_29=TRIM(dato_29), 
	dato_30=TRIM(dato_30), dato_31=TRIM(dato_31), dato_32=TRIM(dato_32), dato_33=TRIM(dato_33), dato_34=TRIM(dato_34), 
	dato_35=TRIM(dato_35), dato_36=TRIM(dato_36), dato_37=TRIM(dato_37), dato_38=TRIM(dato_38), dato_39=TRIM(dato_39), 
	dato_40=TRIM(dato_40), dato_41=TRIM(dato_41), dato_42=TRIM(dato_42), dato_43=TRIM(dato_43), dato_44=TRIM(dato_44), 
	dato_45=TRIM(dato_45), dato_46=TRIM(dato_46), dato_47=TRIM(dato_47), dato_48=TRIM(dato_48), dato_49=TRIM(dato_49), 
	dato_50=TRIM(dato_50), dato_51=TRIM(dato_51), dato_52=TRIM(dato_52), dato_53=TRIM(dato_53), dato_54=TRIM(dato_54), 
	dato_55=TRIM(dato_55), dato_56=TRIM(dato_56), dato_57=TRIM(dato_57), dato_58=TRIM(dato_58), dato_59=TRIM(dato_59), 
	dato_60=TRIM(dato_60), dato_61=TRIM(dato_61), dato_62=TRIM(dato_62), dato_63=TRIM(dato_63), dato_64=TRIM(dato_64), 
	dato_65=TRIM(dato_65), dato_66=TRIM(dato_66), dato_67=TRIM(dato_67), dato_68=TRIM(dato_68), dato_69=TRIM(dato_69), 
	dato_70=TRIM(dato_70), dato_71=TRIM(dato_71), dato_72=TRIM(dato_72), dato_73=TRIM(dato_73), dato_74=TRIM(dato_74), 
	dato_75=TRIM(dato_75), dato_76=TRIM(dato_76), dato_77=TRIM(dato_77), dato_78=TRIM(dato_78), dato_79=TRIM(dato_79), 
	dato_80=TRIM(dato_80), dato_81=TRIM(dato_81), dato_82=TRIM(dato_82), dato_83=TRIM(dato_83), dato_84=TRIM(dato_84), 
	dato_85=TRIM(dato_85), dato_86=TRIM(dato_86), dato_87=TRIM(dato_87), dato_88=TRIM(dato_88), dato_89=TRIM(dato_89), 
	dato_90=TRIM(dato_90), dato_91=TRIM(dato_91), dato_92=TRIM(dato_92), dato_93=TRIM(dato_93), dato_94=TRIM(dato_94), 
	dato_95=TRIM(dato_95), dato_96=TRIM(dato_96), dato_97=TRIM(dato_97), dato_98=TRIM(dato_98), dato_99=TRIM(dato_99), 
	dato_100=TRIM(dato_100), dato_101=TRIM(dato_101), dato_102=TRIM(dato_102), dato_103=TRIM(dato_103), dato_104=TRIM(dato_104), 
	dato_105=TRIM(dato_105), dato_106=TRIM(dato_106), dato_107=TRIM(dato_107), dato_108=TRIM(dato_108), dato_109=TRIM(dato_109), 
	dato_110=TRIM(dato_110), dato_111=TRIM(dato_111), dato_112=TRIM(dato_112), dato_113=TRIM(dato_113), dato_114=TRIM(dato_114), 
	dato_115=TRIM(dato_115), dato_116=TRIM(dato_116), dato_117=TRIM(dato_117), dato_118=TRIM(dato_118), dato_119=TRIM(dato_119), 
	dato_120=TRIM(dato_120), dato_121=TRIM(dato_121), dato_122=TRIM(dato_122), dato_123=TRIM(dato_123), dato_124=TRIM(dato_124), 
	dato_125=TRIM(dato_125), dato_126=TRIM(dato_126), dato_127=TRIM(dato_127), dato_128=TRIM(dato_128), dato_129=TRIM(dato_129), 
	dato_130=TRIM(dato_130), dato_131=TRIM(dato_131), dato_132=TRIM(dato_132), dato_133=TRIM(dato_133), dato_134=TRIM(dato_134), 
	dato_135=TRIM(dato_135), dato_136=TRIM(dato_136), dato_137=TRIM(dato_137), dato_138=TRIM(dato_138), dato_139=TRIM(dato_139), 
	dato_140=TRIM(dato_140), dato_141=TRIM(dato_141), dato_142=TRIM(dato_142), dato_143=TRIM(dato_143), dato_144=TRIM(dato_144)
    where dato_145=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHTrim`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHTrim`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_data_historica SET 
    nombre_1=TRIM(nombre_1), nombre_2=TRIM(nombre_2), apellido_1=TRIM(apellido_1), apellido_2=TRIM(apellido_2), 
    tipo_documento=TRIM(tipo_documento), numero_documento=TRIM(numero_documento), proyecto=TRIM(proyecto) 
    WHERE nom_usuario = usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateRecodificarSiNo`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateRecodificarSiNo`(in usuario varchar(50), OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 SET dato_06 = 0 WHERE dato_06 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_06 = 1 WHERE dato_06 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_09 = 0 WHERE dato_09 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_09 = 1 WHERE dato_09 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_22 = 0 WHERE dato_22 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_22 = 1 WHERE dato_22 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_37 = 0 WHERE dato_37 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_37 = 1 WHERE dato_37 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_40 = 0 WHERE dato_40 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_40 = 1 WHERE dato_40 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_43 = 0 WHERE dato_43 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_43 = 1 WHERE dato_43 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_45 = 0 WHERE dato_45 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_45 = 1 WHERE dato_45 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_51 = 0 WHERE dato_51 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_51 = 1 WHERE dato_51 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_52 = 0 WHERE dato_52 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_52 = 1 WHERE dato_52 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_137 = 0 WHERE dato_137 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_137 = 1 WHERE dato_137 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_138 = 0 WHERE dato_138 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_138 = 1 WHERE dato_138 = 'Si' and dato_145 = usuario;
	UPDATE stage_00 SET dato_139 = 0 WHERE dato_139 = 'No' and dato_145 = usuario;
	UPDATE stage_00 SET dato_139 = 1 WHERE dato_139 = 'Si' and dato_145 = usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateInfoTransito`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateInfoTransito`(in usuario varchar(50), OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE stage_00 SET dato_11 = 'Transito' WHERE dato_145=usuario AND (dato_11 = 'transit' or dato_11 = 'transito' or dato_11 = 'Tránsito');
	UPDATE stage_00 SET dato_11 = 'Estadia' WHERE dato_145=usuario AND (dato_11 = 'Estadía' or dato_11 = 'estadia' or dato_11 = 'settlement');
	UPDATE stage_00 SET dato_26 = null WHERE dato_145=usuario AND dato_26 = 'Ninguno' ;
    UPDATE stage_00 SET dato_143 = 'REGISTRO VALIDO' WHERE dato_145=usuario AND (dato_143 = 'valido' or dato_143 = 'Registro válido' or dato_143 = 'Registro Válido' or dato_143 = 'VÁLIDO' or dato_143 = 'REGISTRO VÁLIDO' or dato_143 = 'Registro valido' or dato_143 = 'Registro Valido' or dato_143 = 'registro valido');
    UPDATE stage_00 SET dato_143 = 'REGISTRO INVALIDO' WHERE dato_145=usuario AND (dato_143 = 'Registro inválido' or dato_143 = 'REGISTRO INVÁLIDO' or dato_143 = 'Registro Inválido' or dato_143 = 'Registro invalido');
    UPDATE stage_00 SET dato_143 = 'REGISTRO EN ESPERA' WHERE dato_145=usuario AND (dato_143 = 'REG. EN ESPERA' or dato_143 = 'Registro en espera');
    
    UPDATE stage_00 SET dato_143 = 1 WHERE dato_145=usuario and dato_143 = 'REGISTRO VALIDO';
    UPDATE stage_00 SET dato_143 = 2 WHERE dato_145=usuario and dato_143 = 'REGISTRO INVALIDO';
    UPDATE stage_00 SET dato_143 = 3 WHERE dato_145=usuario and dato_143 = 'REGISTRO EN ESPERA';
	/*SELECT ROW_COUNT() AS 'Affected rows';*/
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectDocIdentConIncidencias`;
DELIMITER |
CREATE PROCEDURE `SP_SelectDocIdentConIncidencias`(in usuario varchar(50))
BEGIN	    
    SELECT ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
FROM stage_00 where dato_145=usuario and (DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
OR DATO_134 REGEXP '.*[^0-9].*');
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNombresConDigitos`;
DELIMITER |
CREATE PROCEDURE `SP_SelectNombresConDigitos`(in usuario varchar(50))
BEGIN	    
    SELECT ID_STAGE, DATO_03, DATO_16, DATO_17, DATO_18, DATO_19, DATO_65, DATO_66, DATO_67, DATO_68, DATO_75, DATO_76, DATO_77, DATO_78, DATO_85,
DATO_86, DATO_87, DATO_88, DATO_95, DATO_96, DATO_97, DATO_98, DATO_105, DATO_106, DATO_107, DATO_108, DATO_115, DATO_116, DATO_117, 
DATO_118, DATO_125, DATO_126, DATO_127, DATO_128
FROM stage_00 where dato_145=usuario and (DATO_03 REGEXP '[[:digit:]]' OR DATO_16 REGEXP '[[:digit:]]' OR DATO_17 REGEXP '[[:digit:]]' OR
DATO_18 REGEXP '[[:digit:]]' OR DATO_19 REGEXP '[[:digit:]]' OR DATO_65 REGEXP '[[:digit:]]' OR DATO_66 REGEXP '[[:digit:]]' OR
DATO_67 REGEXP '[[:digit:]]' OR DATO_68 REGEXP '[[:digit:]]' OR DATO_75 REGEXP '[[:digit:]]' OR DATO_76 REGEXP '[[:digit:]]' OR
DATO_77 REGEXP '[[:digit:]]' OR DATO_78 REGEXP '[[:digit:]]' OR DATO_85 REGEXP '[[:digit:]]' OR DATO_86 REGEXP '[[:digit:]]' OR 
DATO_87 REGEXP '[[:digit:]]' OR DATO_88 REGEXP '[[:digit:]]' OR DATO_95 REGEXP '[[:digit:]]' OR DATO_96 REGEXP '[[:digit:]]' OR
DATO_97 REGEXP '[[:digit:]]' OR DATO_98 REGEXP '[[:digit:]]' OR DATO_105 REGEXP '[[:digit:]]' OR DATO_106 REGEXP '[[:digit:]]' OR
DATO_107 REGEXP '[[:digit:]]' OR DATO_108 REGEXP '[[:digit:]]' OR DATO_115 REGEXP '[[:digit:]]' OR DATO_116 REGEXP '[[:digit:]]' OR
DATO_117 REGEXP '[[:digit:]]' OR DATO_118 REGEXP '[[:digit:]]' OR DATO_125 REGEXP '[[:digit:]]' OR DATO_126 REGEXP '[[:digit:]]' OR
DATO_127 REGEXP '[[:digit:]]' OR DATO_128 REGEXP '[[:digit:]]'); 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNumeroIdentificacionConIncidencias`;
DELIMITER |
CREATE PROCEDURE `SP_SelectNumeroIdentificacionConIncidencias`(OUT _total INT)
BEGIN	    
    SELECT SQL_CALC_FOUND_ROWS  ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
	FROM stage_00 where DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
	OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
	OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
	OR DATO_134 REGEXP '.*[^0-9].*';
	SET _total = FOUND_ROWS();    
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNumeroIdentificacionConIncidencias_1`;
DELIMITER |
CREATE PROCEDURE `SP_SelectNumeroIdentificacionConIncidencias_1`()
BEGIN	    
    SELECT SQL_CALC_FOUND_ROWS  ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
	FROM stage_00 where DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
	OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
	OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
	OR DATO_134 REGEXP '.*[^0-9].*';
	SELECT ROW_COUNT() AS 'Affected rows';    
END |
DELIMITER ;

/*********************************************************/
/* CREACION DE STORED PROCEDURE TABLA DATA HISTORICA	 */
/*********************************************************/

DROP PROCEDURE IF EXISTS `SP_SelectDHDocIdentConIncidencias`;
DELIMITER |
CREATE PROCEDURE `SP_SelectDHDocIdentConIncidencias`(in usuario varchar(50))
BEGIN	    
    SELECT id_stage_dh, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as nombre, tipo_documento, numero_documento 
FROM stage_data_historica where numero_documento REGEXP '.*[^0-9].*' and nom_usuario=usuario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectDHNombresConDigitos`;
DELIMITER |
CREATE PROCEDURE `SP_SelectDHNombresConDigitos`(in usuario varchar(50))
BEGIN	    
    SELECT id_stage_dh, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, proyecto
FROM stage_data_historica where nom_usuario=usuario and (nombre_1 REGEXP '[[:digit:]]' OR nombre_2 REGEXP '[[:digit:]]' OR apellido_1 REGEXP '[[:digit:]]' OR apellido_2 REGEXP '[[:digit:]]' OR tipo_documento REGEXP '[[:digit:]]');
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHSoloAlfanumericos`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHSoloAlfanumericos`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
	-- [^[:alnum:]] coincide con culaquier caracter que no sea una letra o un numero
	START TRANSACTION;
	UPDATE stage_data_historica SET 
    numero_documento = user_regex_replace('[^[:alnum:]]+', '', numero_documento)
    -- tipo_documento = user_regex_replace('[^[:alnum:]]+', '', tipo_documento) 
    WHERE nom_usuario=usuario;
	SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHLimpiarCaracteres_acentos`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHLimpiarCaracteres_acentos`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_data_historica SET 
    numero_documento = user_regex_replace('[A-Za-z]', '', numero_documento), 
    numero_documento = user_regex_replace('[áéíóúÁÉÍÓÚ]', '', numero_documento) 
    WHERE nom_usuario = usuario;
        SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHLimpiarDobleEspacioBlanco`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHLimpiarDobleEspacioBlanco`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    /* numero_documento = REGEXP_REPLACE(numero_documento, '\\s', '') WHERE nom_usuario=usuario; 
    nombre_1 = user_regex_replace('\\s', '', nombre_1) -- reemplaza los espacios en blanco.
    */
	UPDATE stage_data_historica SET 
    numero_documento = user_regex_replace('\\s', '', numero_documento),
    nombre_1 = user_regex_replace('[!"#$%&()*+,\-./:;<=>?@[\\\]^_`{|}~]', '', nombre_1),
    nombre_2 = user_regex_replace('[!"#$%&()*+,\-./:;<=>?@[\\\]^_`{|}~]', '', nombre_2),
    apellido_1 = user_regex_replace('[!"#$%&()*+,\-./:;<=>?@[\\\]^_`{|}~]', '', apellido_1),
    apellido_2 = user_regex_replace('[!"#$%&()*+,\-./:;<=>?@[\\\]^_`{|}~]', '', apellido_2),
    tipo_documento = user_regex_replace('[!"#$%&()*+,\-./:;<=>?@[\\\]^_`{|}~]', '', tipo_documento)
    WHERE nom_usuario=usuario; 
	SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHTipoDocumento`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHTipoDocumento`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' 
    WHERE tipo_documento = 'Carnet de extranjería' and nom_usuario = usuario;
	UPDATE stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' 
    WHERE tipo_documento = 'Carnet de Extranjería' and nom_usuario = usuario;
	UPDATE stage_data_historica SET tipo_documento = 'Carnet de refugio' 
    WHERE tipo_documento = 'Carnet de Solicitante de Refugio' and nom_usuario = usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHSoloTextoTipoDocumento`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateDHSoloTextoTipoDocumento`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE stage_data_historica SET 
    tipo_documento = user_regex_replace('[0-9]', '', tipo_documento) WHERE nom_usuario=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateChar`;
DELIMITER |
CREATE PROCEDURE `SP_UpdateChar`(in usuario varchar(50), OUT success INT)
BEGIN
	/* ELIMINAMOS EL DOBLE ESPACIO EN BLANCO*/
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
		ROLLBACK;
	END;
	/* CHAR(10)=LF New Line), CHAR(13)=CR retorno de carro), CHAR(9)=TAB), CHAR(160)=á),
    CHAR(32) y CHAR(160) SON espacioS en blanco */
	START TRANSACTION;
	UPDATE stage_data_historica SET
	nombre_1 = REPLACE(convert(nombre_1 USING ASCII),'?','') ,
    nombre_1 = REPLACE(REPLACE(REPLACE(REPLACE(nombre_1, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), ''),
    nombre_2 = REPLACE(convert(nombre_2 USING ASCII),'?','') ,
	nombre_2 = REPLACE(REPLACE(REPLACE(REPLACE(nombre_2, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), ''),
    apellido_1 = REPLACE(convert(apellido_1 USING ASCII),'?','') ,
	apellido_1 = REPLACE(REPLACE(REPLACE(REPLACE(apellido_1, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), ''),
	apellido_2 = REPLACE(convert(apellido_2 USING ASCII),'?','') ,
    apellido_2 = REPLACE(REPLACE(REPLACE(REPLACE(apellido_2, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), ''),
    tipo_documento = REPLACE(convert(tipo_documento USING ASCII),'?','') ,
	tipo_documento = REPLACE(REPLACE(REPLACE(REPLACE(tipo_documento, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), ''),
	numero_documento = REPLACE(REPLACE(REPLACE(REPLACE(numero_documento, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(196), '')
	where nom_usuario=usuario;
    COMMIT;
    SET success = 1;
END |
DELIMITER ;


/*****************************************************************************/
/* CREACION DE STORED PROCEDURE PROCESO COTEJO DE RESULTADO CON DATA HISTORICA
/*****************************************************************************/


DROP PROCEDURE IF EXISTS `SP_SelectCotejo`;
DELIMITER |
CREATE PROCEDURE `SP_SelectCotejo`(in usuario varchar(50))
BEGIN	    
    SELECT nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia
	FROM stage_data_historica WHERE nom_usuario=usuario; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectCotejoNuevoBeneficiario_mas_integranteshogar`;
DELIMITER |
CREATE PROCEDURE `SP_SelectCotejoNuevoBeneficiario_mas_integranteshogar`(in usuario varchar(50))
BEGIN	    
    CREATE TEMPORARY TABLE IF NOT EXISTS total_parientes AS 
	(SELECT dato_16 as nom1, dato_17 as nom2, dato_18 as ape1, dato_19 as ape2, '' as tipo_documento, dato_23 as numdocu, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_65, dato_66, dato_67, dato_68, dato_73, dato_74, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_75, dato_76, dato_77, dato_78, dato_83, dato_84, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_85, dato_86, dato_87, dato_88, dato_93, dato_94, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_95, dato_96, dato_97, dato_98, dato_103, dato_104, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_105, dato_106, dato_107, dato_108, dato_113, dato_114, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_115, dato_116, dato_117, dato_118, dato_123, dato_124, id_stage FROM stage_00 WHERE dato_145=usuario)
	UNION ALL
	(SELECT dato_125, dato_126, dato_127, dato_128, dato_133, dato_134, id_stage FROM stage_00 WHERE dato_145=usuario);
    DELETE FROM total_parientes WHERE numdocu='';
    SELECT nom1, nom2, ape1, ape2, tipo_documento, numdocu, id_stage FROM total_parientes;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectCotejoNuevoBeneficiario`;
DELIMITER |
CREATE PROCEDURE `SP_SelectCotejoNuevoBeneficiario`(in usuario varchar(50))
BEGIN	    
    SELECT dato_16, dato_17, dato_18, dato_19, '' as tipo_documento, dato_23, id_stage
	FROM stage_00 WHERE dato_145=usuario; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectCotejoInicial`;
DELIMITER |
CREATE PROCEDURE `SP_SelectCotejoInicial`(in usuario varchar(50))
BEGIN	    
	insert into stage_find
	(SELECT id_stage, dato_16, dato_17, dato_18, dato_19, dato_23, 'Principal', '', dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_65, dato_66, dato_67, dato_68, dato_74, dato_71, dato_72, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_75, dato_76, dato_77, dato_78, dato_84, dato_81, dato_82, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_85, dato_86, dato_87, dato_88, dato_94, dato_91, dato_92, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_95, dato_96, dato_97, dato_98, dato_104, dato_101, dato_102, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_105, dato_106, dato_107, dato_108, dato_114, dato_111, dato_112, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_115, dato_116, dato_117, dato_118, dato_124, dato_121, dato_122, dato_145 FROM stage_00 where dato_145=usuario)
	union all
	(SELECT id_stage, dato_125, dato_126, dato_127, dato_128, dato_134, dato_131, dato_132, dato_145 FROM stage_00 where dato_145=usuario);
	
    delete from stage_find where cedula='';
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_InsertResultadoCotejo`;
DELIMITER |
CREATE PROCEDURE `SP_InsertResultadoCotejo`(  In id_busqueda int, In id_caso int, In id_result int, In tipo_busqueda text,
    In nomb_1 text, In nomb_2 text, In ape_1 text, In ape_2 text, In tipo_doc text, In numero_doc text, In proyecto text, In cod_familia text
)
BEGIN
    insert into resultado_cotejo_datos_historicos (id_busqueda, id_caso, id_resultado, tipo_busqueda, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia)
    values (id_busqueda, id_caso, id_result, tipo_busqueda, nomb_1, nomb_2, ape_1, ape_2, tipo_doc, numero_doc, proyecto, cod_familia); 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_InsertResultadoCotejoNuevoBeneficiario`;
DELIMITER |
CREATE PROCEDURE `SP_InsertResultadoCotejoNuevoBeneficiario`(  In id_busqueda int, In id_caso int, In id_result int, In tipo_busqueda text,
    In nomb_1 text, In nomb_2 text, In ape_1 text, In ape_2 text, In tipo_doc text, In numero_doc text, In proyecto text, In cod_familia text, in id_stage_00 int
)
BEGIN
    insert into resultado_cotejo_datos_historicos (id_busqueda, id_caso, id_resultado, tipo_busqueda, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia, id_stage_00)
    values (id_busqueda, id_caso, id_result, tipo_busqueda, nomb_1, nomb_2, ape_1, ape_2, tipo_doc, numero_doc, proyecto, cod_familia, id_stage_00); 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectResultadoCotejo`;
DELIMITER |
CREATE PROCEDURE `SP_SelectResultadoCotejo`(in codigo int)
BEGIN	    
    SELECT id_busqueda, id_cotejo, id_caso, id_resultado, tipo_busqueda, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia, id_stage_00 FROM resultado_cotejo_datos_historicos where id_busqueda = codigo order by id_busqueda, id_caso, tipo_busqueda, id_resultado, apellido_1, apellido_2, nombre_1; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectResultadoCotejoInicial`;
DELIMITER |
CREATE PROCEDURE `SP_SelectResultadoCotejoInicial`(in usuario varchar(50))
BEGIN	    
	select id_stage, nom_01, nom_02, ape_01, ape_02, cedula, relacion, otro, usuario from stage_find where cedula in 
	(SELECT cedula FROM stage_find where usuario=usuario GROUP BY cedula having COUNT(cedula) >1) order by cedula; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_DeleteResultadoCotejo`;
DELIMITER |
CREATE PROCEDURE `SP_DeleteResultadoCotejo`(in codigo int)
BEGIN	    
    delete from resultado_cotejo_datos_historicos where id_busqueda = codigo; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_DeleteResultadoCotejoInicial`;
DELIMITER |
CREATE PROCEDURE `SP_DeleteResultadoCotejoInicial`(in usuario varchar(50))
BEGIN	    
    delete from stage_find where usuario = usuario; 
END |
DELIMITER ;


/************************/
/* CREACION DE USUARIOS */
/************************/


DROP PROCEDURE IF EXISTS `SP_Usuario_Insert`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Insert`(in nombre varchar(50), in email varchar(100), in pass varchar(50), in idrol int, in idestado int, OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	SET @clave = password(pass);
    insert into usuarios(nombre_usuario, correo, contrasenia, id_rol, id_estado) values (nombre, email, @clave, idrol, idestado);
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Update`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Update`(in iduser int, in nombre varchar(50), in email varchar(100), in idrol int, in idestado int, OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;	
    update usuarios 
    set nombre_usuario = nombre, correo = email, id_rol = idrol, id_estado = idestado
    where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Update_Password`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Update_Password`(in iduser int, in pass varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	SET @clave = password(pass);
    update usuarios 
    set contrasenia = @clave where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Reset_Password`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Reset_Password`(in usuario varchar(50), in pass varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    set @codigo = 0;
    select @codigo := id_usuario from usuarios where nombre_usuario = usuario;
    
    if @codigo>0 then
    	SET @clave = password(pass);
		update usuarios 
		set contrasenia = @clave where id_usuario = @codigo;
		SET success = 1;
	end if;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Delete`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Delete`(in iduser int, OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
    
	START TRANSACTION;
    delete from usuarios where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Login_validar`;
DELIMITER |
CREATE PROCEDURE `SP_Login_validar`(in usuario varchar(50), in pass varchar(100), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    SET @clave = password(pass);
    SELECT id_usuario into success FROM usuarios where nombre_usuario = usuario and contrasenia = @clave;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_user_rol`;
DELIMITER |
CREATE PROCEDURE `SP_user_rol`(in codusuario int, OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;    
    SELECT id_rol into success FROM usuarios where id_usuario = codusuario;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuarios_Select`;
DELIMITER |
CREATE PROCEDURE `SP_Usuarios_Select`()
BEGIN	    
    SELECT A1.id_usuario, A1.nombre_usuario, A1.correo, A1.id_rol, A2.nombre_rol
	FROM usuarios AS A1 INNER JOIN roles AS A2 ON A1.id_rol = A2.id_rol 
    ORDER BY A1.nombre_usuario;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Select`;
DELIMITER |
CREATE PROCEDURE `SP_Usuario_Select`(in id int)
BEGIN	    
    SELECT A1.id_usuario, A1.nombre_usuario, A1.correo, A1.id_rol, A2.nombre_rol
	FROM usuarios AS A1 INNER JOIN roles AS A2 ON A1.id_rol = A2.id_rol
    WHERE A1.id_usuario = id; 
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Migrar_Data_Historica`;
DELIMITER |
CREATE PROCEDURE `SP_Migrar_Data_Historica`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    INSERT INTO data_historica (nombre_1, nombre_2, apellido_1, apellido_2, beneficiario, tipo_documento, numero_documento, proyecto, cod_familia, fecha) SELECT nombre_1, nombre_2, apellido_1, apellido_2, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as beneficiario, tipo_documento, numero_documento, proyecto, cod_familia, curdate() 
    from stage_data_historica WHERE nom_usuario=usuario;
    delete from stage_data_historica where nom_usuario=usuario;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Migrar_Data_Gerencia`;
DELIMITER |
CREATE PROCEDURE `SP_Migrar_Data_Gerencia`(IN accion INT, IN anios varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
		ROLLBACK;
	END;
 
	START TRANSACTION;
    /* ACCION = 1, Inserta datos en la tabla resultado_proyectos
    ACCION = 2, Elimina los registros del año indicado e inserta datos en la tabla resultado_proyectos */
    IF accion = 1 THEN
	 INSERT INTO resultado_proyectos (
	 fecha_entrada, organizacion, categoria, anio, id_region, distrito, comunidad, nombre_1, nombre_2, apellido_1, 
     apellido_2, cod_grupo_familiar, numero_documento, nombre_organizacion, correo_electronico, celular_1, celular_2, 
     edad, id_tipo_proyecto, id_proyecto, fecha_actividad, id_persona_registro, id_tipo_documento, id_nacionalidad,
     id_tipo_organizacion, id_genero, id_adulto, id_indigena, id_discapacidad, id_tipo_discapacidad, id_gestante,
     id_tiempo_gestacion, id_tema, id_subtema, id_actividad) SELECT 
     dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
     dato_11, dato_12, dato_14, dato_16, dato_18, dato_19, dato_20, 
     dato_22, dato_29, dato_30, DATE_FORMAT(STR_TO_DATE(dato_34,'%m/%d/%Y'), '%Y-%m-%d'), dato_35, dato_13, dato_15, 
     dato_17, dato_21, dato_23, dato_24, dato_25, dato_26, dato_27, 
     dato_28, dato_31, dato_32, dato_33 
     from stage_data_proyectos ;
     UPDATE resultado_proyectos SET anio = YEAR(fecha_actividad), anio_actividad = YEAR(fecha_actividad), 
     trimestre_actividad = QUARTER(fecha_actividad);     
	ELSE
	 -- DELETE FROM resultado_proyectos WHERE anio_actividad IN (anios);
     SET @s = CONCAT('DELETE FROM resultado_proyectos WHERE anio_actividad IN (',anios,');' );
	 PREPARE stmt FROM @s;
	 EXECUTE stmt;
     
	 INSERT INTO resultado_proyectos (
	 fecha_entrada, organizacion, categoria, anio, id_region, distrito, comunidad, nombre_1, nombre_2, apellido_1, 
     apellido_2, cod_grupo_familiar, numero_documento, nombre_organizacion, correo_electronico, celular_1, celular_2, 
     edad, id_tipo_proyecto, id_proyecto, fecha_actividad, id_persona_registro, id_tipo_documento, id_nacionalidad,
     id_tipo_organizacion, id_genero, id_adulto, id_indigena, id_discapacidad, id_tipo_discapacidad, id_gestante,
     id_tiempo_gestacion, id_tema, id_subtema, id_actividad) SELECT 
     dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
     dato_11, dato_12, dato_14, dato_16, dato_18, dato_19, dato_20, 
     dato_22, dato_29, dato_30, DATE_FORMAT(STR_TO_DATE(dato_34,'%m/%d/%Y'), '%Y-%m-%d'), dato_35, dato_13, dato_15, 
     dato_17, dato_21, dato_23, dato_24, dato_25, dato_26, dato_27, 
     dato_28, dato_31, dato_32, dato_33 
     FROM stage_data_proyectos ;
     UPDATE resultado_proyectos SET anio = YEAR(fecha_actividad), anio_actividad = YEAR(fecha_actividad), 
     trimestre_actividad = QUARTER(fecha_actividad);
	END IF;
    UPDATE resultado_proyectos SET id_adulto = IF(edad > 17, 1, 2);
    DELETE FROM stage_data_proyectos WHERE id_stage_dp >0;  
    -- ALTER TABLE resultado_proyectos AUTO_INCREMENT = 1;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Migrar_Data_Gerencia_v1`;
DELIMITER |
CREATE PROCEDURE `SP_Migrar_Data_Gerencia_v1`(IN accion INT, IN anios varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
		ROLLBACK;
	END;
 
	START TRANSACTION;
    /* ACCION = 1, Inserta datos en la tabla resultado_proyectos
    ACCION = 2, Elimina los registros del año indicado e inserta datos en la tabla resultado_proyectos */
    IF accion = 1 THEN
	 INSERT INTO resultado_proyectos (
	 fecha_entrada, organizacion, categoria, anio, id_region, distrito, comunidad, nombre_1, nombre_2, apellido_1, 
     apellido_2, cod_grupo_familiar, numero_documento, nombre_organizacion, correo_electronico, celular_1, celular_2, 
     edad, id_tipo_proyecto, id_proyecto, fecha_actividad, id_persona_registro, id_tipo_documento, id_nacionalidad,
     id_tipo_organizacion, id_genero, id_adulto, id_indigena, id_discapacidad, id_tipo_discapacidad, id_gestante,
     id_tiempo_gestacion, id_tema, id_subtema, id_actividad) SELECT 
     dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
     dato_11, dato_12, dato_14, dato_16, dato_18, dato_19, dato_20, 
     dato_22, dato_29, dato_30, DATE_FORMAT(STR_TO_DATE(dato_34,'%m/%d/%Y'), '%Y-%m-%d'), dato_35, dato_13, dato_15, 
     dato_17, dato_21, dato_23, dato_24, dato_25, dato_26, dato_27, 
     dato_28, dato_31, dato_32, dato_33 
     from stage_data_proyectos ;
	ELSE
     SET @s = CONCAT('DELETE FROM resultado_proyectos WHERE anio_actividad IN (',anios,');' );
	 PREPARE stmt FROM @s;
	 EXECUTE stmt;
	 INSERT INTO resultado_proyectos (
	 fecha_entrada, organizacion, categoria, anio, id_region, distrito, comunidad, nombre_1, nombre_2, apellido_1, 
     apellido_2, cod_grupo_familiar, numero_documento, nombre_organizacion, correo_electronico, celular_1, celular_2, 
     edad, id_tipo_proyecto, id_proyecto, fecha_actividad, id_persona_registro, id_tipo_documento, id_nacionalidad,
     id_tipo_organizacion, id_genero, id_adulto, id_indigena, id_discapacidad, id_tipo_discapacidad, id_gestante,
     id_tiempo_gestacion, id_tema, id_subtema, id_actividad) SELECT 
     dato_01, dato_02, dato_03, dato_04, dato_05, dato_06, dato_07, dato_08, dato_09, dato_10, 
     dato_11, dato_12, dato_14, dato_16, dato_18, dato_19, dato_20, 
     dato_22, dato_29, dato_30, DATE_FORMAT(STR_TO_DATE(dato_34,'%m/%d/%Y'), '%Y-%m-%d'), dato_35, dato_13, dato_15, 
     dato_17, dato_21, dato_23, dato_24, dato_25, dato_26, dato_27, 
     dato_28, dato_31, dato_32, dato_33 
     FROM stage_data_proyectos ;
	END IF;
    UPDATE resultado_proyectos SET anio_actividad = YEAR(fecha_actividad), trimestre_actividad = QUARTER(fecha_actividad);
    UPDATE resultado_proyectos SET id_adulto = IF(edad > 17, 1, 2);
    DELETE FROM stage_data_proyectos WHERE id_stage_dp >0;  
    -- ALTER TABLE resultado_proyectos AUTO_INCREMENT = 1;
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Migrar_NvosBeneficiarios_stage_data_historica`;
DELIMITER |
CREATE PROCEDURE `SP_Migrar_NvosBeneficiarios_stage_data_historica`(in usuario varchar(50), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    INSERT INTO stage_data_historica (nombre_1, nombre_2, apellido_1, apellido_2, numero_documento, nom_usuario, id_stage_00) 
    SELECT dato_16, dato_17, dato_18, dato_19, dato_23, dato_145, id_stage from stage_00 WHERE dato_145=usuario;    
    SET success = 1;
    COMMIT;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_update_observaciones`;
DELIMITER |
CREATE PROCEDURE `SP_update_observaciones`(in codigo int, in obs varchar(250), OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		SET @LastUpdateID := 0;
		update stage_00 set dato_144 = obs, dato_143 = 2, id_stage = (SELECT @LastUpdateID := id_stage) where id_stage = codigo;   
        SET success = @LastUpdateID ;
    COMMIT;
END |
DELIMITER ;


/********************************************************/
/* VALIDAR DATOS MODULO GERENCIA - PROYECTOS HISTORICOS */
/********************************************************/


DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_campos_numericos`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_campos_numericos`(in campo varchar(250), OUT success INT)
BEGIN
-- stored procedure dinamico para validar que los campos numericos no presenten caracteres
	SET @s = CONCAT('SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE ',campo, ' REGEXP "[[:alpha:]]" OR ',campo, ' ="" )' );
	PREPARE stmt FROM @s;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_campos_date`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_campos_date`(in campo varchar(250), OUT success INT)
BEGIN
-- SP dinamico para validar que los campos fecha tengan el formato correcto y no esten vacios
	SET @s = CONCAT('SET @total_reg := (
    SELECT count(*) FROM stage_data_proyectos 
	WHERE DATE(STR_TO_DATE(',campo, ', "%m/%d/%Y")) IS NULL AND ',campo, ' NOT REGEXP "^[0-9\.]+$"
    )' );
	PREPARE stmt FROM @s;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_tipo_documento`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_tipo_documento`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_13 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_nacionalidad`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_nacionalidad`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_15 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_tipo_organizacion`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_tipo_organizacion`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_17 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_genero`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_genero`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_21 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_edad`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_edad`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_22 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_esadulto`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_esadulto`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_23 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_indigena`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_indigena`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_24 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_discapacidad`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_discapacidad`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_25 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_tipo_discapacidad`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_tipo_discapacidad`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_26 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_gestante`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_gestante`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_27 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_tiempo_gestante`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_tiempo_gestante`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_28 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_cod_proyecto`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_cod_proyecto`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_29 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_cod_tema`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_cod_tema`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_30 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_cod_sub_tema`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_cod_sub_tema`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_31 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Gerencia_validar_cod_actividad`;
DELIMITER |
CREATE PROCEDURE `SP_Gerencia_validar_cod_actividad`(OUT success INT)
BEGIN
	SET @total_reg := (SELECT count(*) FROM stage_data_proyectos WHERE dato_32 REGEXP '[[:alpha:]]');
	SET success = @total_reg ;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS `DropViews` ;
DELIMITER ;;
CREATE PROCEDURE `DropViews`()
-- ELIMINANDO TODAS LAS VISTAS EXISTENTES EN LA BD
BEGIN
	SET FOREIGN_KEY_CHECKS = 0;
	SET GROUP_CONCAT_MAX_LEN=32768;
	SET @views = NULL;
	SELECT GROUP_CONCAT('`', TABLE_NAME, '`') INTO @views
	  FROM information_schema.views
	  WHERE table_schema = (SELECT DATABASE());
	SELECT IFNULL(@views,'dummy') INTO @views;

	SET @views = CONCAT('DROP VIEW IF EXISTS ', @views);
	PREPARE stmt FROM @views;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	SET FOREIGN_KEY_CHECKS = 1;
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `DropTables` ;
DELIMITER ;;
CREATE PROCEDURE `DropTables`()
-- ELIMINANDO TODAS LAS TABLAS EXISTENTES EN LA BD
BEGIN
	SET FOREIGN_KEY_CHECKS = 0;
	SET GROUP_CONCAT_MAX_LEN=32768;
	SET @tables = NULL;
	SELECT GROUP_CONCAT('`', table_name, '`') INTO @tables
	  FROM information_schema.tables
	  WHERE table_schema = (SELECT DATABASE());
	SELECT IFNULL(@tables,'dummy') INTO @tables;

	SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);
	PREPARE stmt FROM @tables;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	SET FOREIGN_KEY_CHECKS = 1;
END;;
DELIMITER ;




/*****************************
PROBANDO LOS STORED PROCEDURE
******************************/

SET @total = 0;
call SP_Migrar_Data_Gerencia(1,'2021',@total);
select @total;

call SP_Usuario_Select(10);

SET @total = password('percy');
select @total;

call SP_Usuario_Update(3,'Oswaldo', 'oswaldo@gmail.com', 2, 1, @total);
select @total;

SET @total = 3;
call SP_Usuario_Update_Password(13,'qwerty', @total);
select @total;

SET @total = 0;
call SP_Usuario_Reset_Password('percy','123',@total);
select @total;

SET @total = 3;
call SP_Usuario_Delete(4, @total);
select @total;

call SP_Login_validar('oswaldo', '123', @total);
select @total;

SET @total = 0;
call SP_Migrar_NvosBeneficiarios_stage_data_historica('percy',@total);
select @total;

UPDATE stage_00 SET dato_84 = user_regex_replace('\\s+', '', dato_84);
select dato_23, dato_84 from stage_00 where dato_23=25725477;


SET @total = 0;
call SP_Migrar_Data_Gerencia(2,'2020,2021',@total);
select @total;



