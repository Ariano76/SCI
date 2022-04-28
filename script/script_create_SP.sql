/* CREACION DE STORE PROCEDUE */

DROP PROCEDURE IF EXISTS `SP_LimpiarTablaStage`;
DELIMITER ;;
CREATE PROCEDURE `SP_LimpiarTablaStage`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		truncate table bd_bha_sci.stage_00;
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_LimpiarTablaStageDataHistorica`;
DELIMITER ;;
CREATE PROCEDURE `SP_LimpiarTablaStageDataHistorica`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		truncate table bd_bha_sci.stage_data_historica;
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_UpdateDobleEspacioBlanco`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDobleEspacioBlanco`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
		UPDATE bd_bha_sci.stage_00 
		SET 
        dato_02 = REGEXP_REPLACE(dato_02, '\\s', ''), dato_23 = REGEXP_REPLACE(dato_23, '\\s', ''), 
        dato_26 = REGEXP_REPLACE(dato_26, '\\s', ''), dato_34 = REGEXP_REPLACE(dato_34, '\\s', ''), 
        dato_35 = REGEXP_REPLACE(dato_35, '\\s', ''), dato_74 = REGEXP_REPLACE(dato_74, '\\s', ''), 
        dato_84 = REGEXP_REPLACE(dato_84, '\\s', ''), dato_94 = REGEXP_REPLACE(dato_94, '\\s', ''), 
        dato_104 = REGEXP_REPLACE(dato_104, '\\s', ''), dato_114 = REGEXP_REPLACE(dato_114, '\\s', ''), 
        dato_124 = REGEXP_REPLACE(dato_124, '\\s', ''), dato_134 = REGEXP_REPLACE(dato_134, '\\s', '');
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateTab`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateTab`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
	UPDATE bd_bha_sci.stage_00 SET 
	dato_01 = REGEXP_REPLACE(dato_01, '\t', ''), dato_02 = REGEXP_REPLACE(dato_02, '\t', ''), dato_03 = REGEXP_REPLACE(dato_03, '\t', ''), dato_04 = REGEXP_REPLACE(dato_04, '\t', ''), 
	dato_05 = REGEXP_REPLACE(dato_05, '\t', ''), dato_06 = REGEXP_REPLACE(dato_06, '\t', ''), dato_07 = REGEXP_REPLACE(dato_07, '\t', ''), dato_08 = REGEXP_REPLACE(dato_08, '\t', ''), 
	dato_09 = REGEXP_REPLACE(dato_09, '\t', ''), dato_10 = REGEXP_REPLACE(dato_10, '\t', ''), dato_11 = REGEXP_REPLACE(dato_11, '\t', ''), dato_12 = REGEXP_REPLACE(dato_12, '\t', ''), 
	dato_13 = REGEXP_REPLACE(dato_13, '\t', ''), dato_14 = REGEXP_REPLACE(dato_14, '\t', ''), dato_15 = REGEXP_REPLACE(dato_15, '\t', ''), dato_16 = REGEXP_REPLACE(dato_16, '\t', ''), 
	dato_17 = REGEXP_REPLACE(dato_17, '\t', ''), dato_18 = REGEXP_REPLACE(dato_18, '\t', ''), dato_19 = REGEXP_REPLACE(dato_19, '\t', ''), dato_20 = REGEXP_REPLACE(dato_20, '\t', ''), 
	dato_21 = REGEXP_REPLACE(dato_21, '\t', ''), dato_22 = REGEXP_REPLACE(dato_22, '\t', ''), dato_23 = REGEXP_REPLACE(dato_23, '\t', ''), dato_24 = REGEXP_REPLACE(dato_24, '\t', ''), 
	dato_25 = REGEXP_REPLACE(dato_25, '\t', ''), dato_26 = REGEXP_REPLACE(dato_26, '\t', ''), dato_27 = REGEXP_REPLACE(dato_27, '\t', ''), dato_28 = REGEXP_REPLACE(dato_28, '\t', ''), 
	dato_29 = REGEXP_REPLACE(dato_29, '\t', ''), dato_30 = REGEXP_REPLACE(dato_30, '\t', ''), dato_31 = REGEXP_REPLACE(dato_31, '\t', ''), dato_32 = REGEXP_REPLACE(dato_32, '\t', ''), 
	dato_33 = REGEXP_REPLACE(dato_33, '\t', ''), dato_34 = REGEXP_REPLACE(dato_34, '\t', ''), dato_35 = REGEXP_REPLACE(dato_35, '\t', ''), dato_36 = REGEXP_REPLACE(dato_36, '\t', ''), 
	dato_37 = REGEXP_REPLACE(dato_37, '\t', ''), dato_38 = REGEXP_REPLACE(dato_38, '\t', ''), dato_39 = REGEXP_REPLACE(dato_39, '\t', ''), dato_40 = REGEXP_REPLACE(dato_40, '\t', ''), 
	dato_41 = REGEXP_REPLACE(dato_41, '\t', ''), dato_42 = REGEXP_REPLACE(dato_42, '\t', ''), dato_43 = REGEXP_REPLACE(dato_43, '\t', ''), dato_44 = REGEXP_REPLACE(dato_44, '\t', ''), 
	dato_45 = REGEXP_REPLACE(dato_45, '\t', ''), dato_46 = REGEXP_REPLACE(dato_46, '\t', ''), dato_47 = REGEXP_REPLACE(dato_47, '\t', ''), dato_48 = REGEXP_REPLACE(dato_48, '\t', ''), 
	dato_49 = REGEXP_REPLACE(dato_49, '\t', ''), dato_50 = REGEXP_REPLACE(dato_50, '\t', ''), dato_51 = REGEXP_REPLACE(dato_51, '\t', ''), dato_52 = REGEXP_REPLACE(dato_52, '\t', ''), 
	dato_53 = REGEXP_REPLACE(dato_53, '\t', ''), dato_54 = REGEXP_REPLACE(dato_54, '\t', ''), dato_55 = REGEXP_REPLACE(dato_55, '\t', ''), dato_56 = REGEXP_REPLACE(dato_56, '\t', ''), 
	dato_57 = REGEXP_REPLACE(dato_57, '\t', ''), dato_58 = REGEXP_REPLACE(dato_58, '\t', ''), dato_59 = REGEXP_REPLACE(dato_59, '\t', ''), dato_60 = REGEXP_REPLACE(dato_60, '\t', ''), 
	dato_61 = REGEXP_REPLACE(dato_61, '\t', ''), dato_62 = REGEXP_REPLACE(dato_62, '\t', ''), dato_63 = REGEXP_REPLACE(dato_63, '\t', ''), dato_64 = REGEXP_REPLACE(dato_64, '\t', ''), 
	dato_65 = REGEXP_REPLACE(dato_65, '\t', ''), dato_66 = REGEXP_REPLACE(dato_66, '\t', ''), dato_67 = REGEXP_REPLACE(dato_67, '\t', ''), dato_68 = REGEXP_REPLACE(dato_68, '\t', ''), 
	dato_69 = REGEXP_REPLACE(dato_69, '\t', ''), dato_70 = REGEXP_REPLACE(dato_70, '\t', ''), dato_71 = REGEXP_REPLACE(dato_71, '\t', ''), dato_72 = REGEXP_REPLACE(dato_72, '\t', ''), 
	dato_73 = REGEXP_REPLACE(dato_73, '\t', ''), dato_74 = REGEXP_REPLACE(dato_74, '\t', ''), dato_75 = REGEXP_REPLACE(dato_75, '\t', ''), dato_76 = REGEXP_REPLACE(dato_76, '\t', ''), 
	dato_77 = REGEXP_REPLACE(dato_77, '\t', ''), dato_78 = REGEXP_REPLACE(dato_78, '\t', ''), dato_79 = REGEXP_REPLACE(dato_79, '\t', ''), dato_80 = REGEXP_REPLACE(dato_80, '\t', ''), 
	dato_81 = REGEXP_REPLACE(dato_81, '\t', ''), dato_82 = REGEXP_REPLACE(dato_82, '\t', ''), dato_83 = REGEXP_REPLACE(dato_83, '\t', ''), dato_84 = REGEXP_REPLACE(dato_84, '\t', ''), 
	dato_85 = REGEXP_REPLACE(dato_85, '\t', ''), dato_86 = REGEXP_REPLACE(dato_86, '\t', ''), dato_87 = REGEXP_REPLACE(dato_87, '\t', ''), dato_88 = REGEXP_REPLACE(dato_88, '\t', ''), 
	dato_89 = REGEXP_REPLACE(dato_89, '\t', ''), dato_90 = REGEXP_REPLACE(dato_90, '\t', ''), dato_91 = REGEXP_REPLACE(dato_91, '\t', ''), dato_92 = REGEXP_REPLACE(dato_92, '\t', ''), 
	dato_93 = REGEXP_REPLACE(dato_93, '\t', ''), dato_94 = REGEXP_REPLACE(dato_94, '\t', ''), dato_95 = REGEXP_REPLACE(dato_95, '\t', ''), dato_96 = REGEXP_REPLACE(dato_96, '\t', ''), 
	dato_97 = REGEXP_REPLACE(dato_97, '\t', ''), dato_98 = REGEXP_REPLACE(dato_98, '\t', ''), dato_99 = REGEXP_REPLACE(dato_99, '\t', ''), dato_100 = REGEXP_REPLACE(dato_100, '\t', ''), 
	dato_101 = REGEXP_REPLACE(dato_101, '\t', ''), dato_102 = REGEXP_REPLACE(dato_102, '\t', ''), dato_103 = REGEXP_REPLACE(dato_103, '\t', ''), 
	dato_104 = REGEXP_REPLACE(dato_104, '\t', ''), dato_105 = REGEXP_REPLACE(dato_105, '\t', ''), dato_106 = REGEXP_REPLACE(dato_106, '\t', ''), 
	dato_107 = REGEXP_REPLACE(dato_107, '\t', ''), dato_108 = REGEXP_REPLACE(dato_108, '\t', ''), dato_109 = REGEXP_REPLACE(dato_109, '\t', ''), 
	dato_110 = REGEXP_REPLACE(dato_110, '\t', ''), dato_111 = REGEXP_REPLACE(dato_111, '\t', ''), dato_112 = REGEXP_REPLACE(dato_112, '\t', ''), 
	dato_113 = REGEXP_REPLACE(dato_113, '\t', ''), dato_114 = REGEXP_REPLACE(dato_114, '\t', ''), dato_115 = REGEXP_REPLACE(dato_115, '\t', ''), 
	dato_116 = REGEXP_REPLACE(dato_116, '\t', ''), dato_117 = REGEXP_REPLACE(dato_117, '\t', ''), dato_118 = REGEXP_REPLACE(dato_118, '\t', ''), 
	dato_119 = REGEXP_REPLACE(dato_119, '\t', ''), dato_120 = REGEXP_REPLACE(dato_120, '\t', ''), dato_121 = REGEXP_REPLACE(dato_121, '\t', ''), 
	dato_122 = REGEXP_REPLACE(dato_122, '\t', ''), dato_123 = REGEXP_REPLACE(dato_123, '\t', ''), dato_124 = REGEXP_REPLACE(dato_124, '\t', ''), 
	dato_125 = REGEXP_REPLACE(dato_125, '\t', ''), dato_126 = REGEXP_REPLACE(dato_126, '\t', ''), dato_127 = REGEXP_REPLACE(dato_127, '\t', ''), 
	dato_128 = REGEXP_REPLACE(dato_128, '\t', ''), dato_129 = REGEXP_REPLACE(dato_129, '\t', ''), dato_130 = REGEXP_REPLACE(dato_130, '\t', ''), 
	dato_131 = REGEXP_REPLACE(dato_131, '\t', ''), dato_132 = REGEXP_REPLACE(dato_132, '\t', ''), dato_133 = REGEXP_REPLACE(dato_133, '\t', ''), 
	dato_134 = REGEXP_REPLACE(dato_134, '\t', ''), dato_135 = REGEXP_REPLACE(dato_135, '\t', ''), dato_136 = REGEXP_REPLACE(dato_136, '\t', ''), 
	dato_137 = REGEXP_REPLACE(dato_137, '\t', ''), dato_138 = REGEXP_REPLACE(dato_138, '\t', ''), dato_139 = REGEXP_REPLACE(dato_139, '\t', ''), 
	dato_140 = REGEXP_REPLACE(dato_140, '\t', ''), dato_141 = REGEXP_REPLACE(dato_141, '\t', ''), dato_142 = REGEXP_REPLACE(dato_142, '\t', ''),
    dato_143 = REGEXP_REPLACE(dato_143, '\t', ''), dato_144 = REGEXP_REPLACE(dato_144, '\t', '');
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateSaltoLinea`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateSaltoLinea`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 SET dato_134 = REGEXP_REPLACE(dato_134, '\\n', ''), dato_124 = REGEXP_REPLACE(dato_124, '\\n', ''), dato_114 = REGEXP_REPLACE(dato_114, '\\n', ''), dato_104 = REGEXP_REPLACE(dato_104, '\\n', ''), dato_94 = REGEXP_REPLACE(dato_94, '\\n', ''), dato_84 = REGEXP_REPLACE(dato_84, '\\n', ''), dato_74 = REGEXP_REPLACE(dato_74, '\\n', ''), dato_34 = REGEXP_REPLACE(dato_34, '\\n', ''), dato_35 = REGEXP_REPLACE(dato_35, '\\n', ''), dato_26 = REGEXP_REPLACE(dato_26, '\\n', ''), dato_23 = REGEXP_REPLACE(dato_23, '\\n', ''), dato_02 = REGEXP_REPLACE(dato_02, '\\n', ''), 
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
    dato_105 = replace(dato_105, '\\n', ''), dato_106 = replace(dato_106, '\\n', ''), dato_107 = replace(dato_107, '\\n', ''), 
    dato_108 = replace(dato_108, '\\n', ''), 
    dato_115 = replace(dato_115, '\\n', ''), dato_116 = replace(dato_116, '\\n', ''), dato_117 = replace(dato_117, '\\n', ''),
    dato_118 = replace(dato_118, '\\n', ''), 
    dato_125 = replace(dato_125, '\\n', ''), dato_126 = replace(dato_126, '\\n', ''), dato_127 = replace(dato_127, '\\n', ''),
    dato_128 = replace(dato_128, '\\n', '')  ;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_UpdateNewLineReturnLine`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateNewLineReturnLine`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 SET dato_01 = REGEXP_REPLACE(dato_01, '[\\n]', ''), dato_02 = REGEXP_REPLACE(dato_02, '[\\n]', ''), dato_03 = REGEXP_REPLACE(dato_03, '[\\n]', ''), dato_04 = REGEXP_REPLACE(dato_04, '[\\n]', ''), dato_05 = REGEXP_REPLACE(dato_05, '[\\n]', ''), dato_06 = REGEXP_REPLACE(dato_06, '[\\n]', ''), dato_07 = REGEXP_REPLACE(dato_07, '[\\n]', ''), dato_08 = REGEXP_REPLACE(dato_08, '[\\n]', ''), dato_09 = REGEXP_REPLACE(dato_09, '[\\n]', ''), dato_10 = REGEXP_REPLACE(dato_10, '[\\n]', ''), dato_11 = REGEXP_REPLACE(dato_11, '[\\n]', ''), dato_12 = REGEXP_REPLACE(dato_12, '[\\n]', ''), dato_13 = REGEXP_REPLACE(dato_13, '[\\n]', ''), dato_14 = REGEXP_REPLACE(dato_14, '[\\n]', ''), dato_15 = REGEXP_REPLACE(dato_15, '[\\n]', ''), dato_16 = REGEXP_REPLACE(dato_16, '[\\n]', ''), dato_17 = REGEXP_REPLACE(dato_17, '[\\n]', ''), dato_18 = REGEXP_REPLACE(dato_18, '[\\n]', ''), dato_19 = REGEXP_REPLACE(dato_19, '[\\n]', ''), dato_20 = REGEXP_REPLACE(dato_20, '[\\n]', ''), dato_21 = REGEXP_REPLACE(dato_21, '[\\n]', ''), dato_22 = REGEXP_REPLACE(dato_22, '[\\n]', ''), dato_23 = REGEXP_REPLACE(dato_23, '[\\n]', ''), dato_24 = REGEXP_REPLACE(dato_24, '[\\n]', ''), dato_25 = REGEXP_REPLACE(dato_25, '[\\n]', ''), dato_26 = REGEXP_REPLACE(dato_26, '[\\n]', ''), dato_27 = REGEXP_REPLACE(dato_27, '[\\n]', ''), dato_28 = REGEXP_REPLACE(dato_28, '[\\n]', ''), dato_29 = REGEXP_REPLACE(dato_29, '[\\n]', ''), dato_30 = REGEXP_REPLACE(dato_30, '[\\n]', ''), dato_31 = REGEXP_REPLACE(dato_31, '[\\n]', ''), dato_32 = REGEXP_REPLACE(dato_32, '[\\n]', ''), dato_33 = REGEXP_REPLACE(dato_33, '[\\n]', ''), dato_34 = REGEXP_REPLACE(dato_34, '[\\n]', ''), dato_35 = REGEXP_REPLACE(dato_35, '[\\n]', ''), dato_36 = REGEXP_REPLACE(dato_36, '[\\n]', ''), dato_37 = REGEXP_REPLACE(dato_37, '[\\n]', ''), dato_38 = REGEXP_REPLACE(dato_38, '[\\n]', ''), dato_39 = REGEXP_REPLACE(dato_39, '[\\n]', ''), dato_40 = REGEXP_REPLACE(dato_40, '[\\n]', ''), dato_41 = REGEXP_REPLACE(dato_41, '[\\n]', ''), dato_42 = REGEXP_REPLACE(dato_42, '[\\n]', ''), dato_43 = REGEXP_REPLACE(dato_43, '[\\n]', ''), dato_44 = REGEXP_REPLACE(dato_44, '[\\n]', ''), dato_45 = REGEXP_REPLACE(dato_45, '[\\n]', ''), dato_46 = REGEXP_REPLACE(dato_46, '[\\n]', ''), dato_47 = REGEXP_REPLACE(dato_47, '[\\n]', ''), dato_48 = REGEXP_REPLACE(dato_48, '[\\n]', ''), dato_49 = REGEXP_REPLACE(dato_49, '[\\n]', ''), dato_50 = REGEXP_REPLACE(dato_50, '[\\n]', ''), dato_51 = REGEXP_REPLACE(dato_51, '[\\n]', ''), dato_52 = REGEXP_REPLACE(dato_52, '[\\n]', ''), dato_53 = REGEXP_REPLACE(dato_53, '[\\n]', ''), dato_54 = REGEXP_REPLACE(dato_54, '[\\n]', ''), dato_55 = REGEXP_REPLACE(dato_55, '[\\n]', ''), dato_56 = REGEXP_REPLACE(dato_56, '[\\n]', ''), dato_57 = REGEXP_REPLACE(dato_57, '[\\n]', ''), dato_58 = REGEXP_REPLACE(dato_58, '[\\n]', ''), dato_59 = REGEXP_REPLACE(dato_59, '[\\n]', ''), dato_60 = REGEXP_REPLACE(dato_60, '[\\n]', ''), dato_61 = REGEXP_REPLACE(dato_61, '[\\n]', ''), dato_62 = REGEXP_REPLACE(dato_62, '[\\n]', ''), dato_63 = REGEXP_REPLACE(dato_63, '[\\n]', ''), dato_64 = REGEXP_REPLACE(dato_64, '[\\n]', ''), dato_65 = REGEXP_REPLACE(dato_65, '[\\n]', ''), dato_66 = REGEXP_REPLACE(dato_66, '[\\n]', ''), dato_67 = REGEXP_REPLACE(dato_67, '[\\n]', ''), dato_68 = REGEXP_REPLACE(dato_68, '[\\n]', ''), dato_69 = REGEXP_REPLACE(dato_69, '[\\n]', ''), dato_70 = REGEXP_REPLACE(dato_70, '[\\n]', ''), dato_71 = REGEXP_REPLACE(dato_71, '[\\n]', ''), dato_72 = REGEXP_REPLACE(dato_72, '[\\n]', ''), dato_73 = REGEXP_REPLACE(dato_73, '[\\n]', ''), dato_74 = REGEXP_REPLACE(dato_74, '[\\n]', ''), dato_75 = REGEXP_REPLACE(dato_75, '[\\n]', ''), dato_76 = REGEXP_REPLACE(dato_76, '[\\n]', ''), dato_77 = REGEXP_REPLACE(dato_77, '[\\n]', ''), dato_78 = REGEXP_REPLACE(dato_78, '[\\n]', ''), dato_79 = REGEXP_REPLACE(dato_79, '[\\n]', ''), dato_80 = REGEXP_REPLACE(dato_80, '[\\n]', ''), dato_81 = REGEXP_REPLACE(dato_81, '[\\n]', ''), dato_82 = REGEXP_REPLACE(dato_82, '[\\n]', ''), dato_83 = REGEXP_REPLACE(dato_83, '[\\n]', ''), dato_84 = REGEXP_REPLACE(dato_84, '[\\n]', ''), dato_85 = REGEXP_REPLACE(dato_85, '[\\n]', ''), dato_86 = REGEXP_REPLACE(dato_86, '[\\n]', ''), dato_87 = REGEXP_REPLACE(dato_87, '[\\n]', ''), dato_88 = REGEXP_REPLACE(dato_88, '[\\n]', ''), dato_89 = REGEXP_REPLACE(dato_89, '[\\n]', ''), dato_90 = REGEXP_REPLACE(dato_90, '[\\n]', ''), dato_91 = REGEXP_REPLACE(dato_91, '[\\n]', ''), dato_92 = REGEXP_REPLACE(dato_92, '[\\n]', ''), dato_93 = REGEXP_REPLACE(dato_93, '[\\n]', ''), dato_94 = REGEXP_REPLACE(dato_94, '[\\n]', ''), dato_95 = REGEXP_REPLACE(dato_95, '[\\n]', ''), dato_96 = REGEXP_REPLACE(dato_96, '[\\n]', ''), dato_97 = REGEXP_REPLACE(dato_97, '[\\n]', ''), dato_98 = REGEXP_REPLACE(dato_98, '[\\n]', ''), dato_99 = REGEXP_REPLACE(dato_99, '[\\n]', ''), dato_100 = REGEXP_REPLACE(dato_100, '[\\n]', ''), dato_101 = REGEXP_REPLACE(dato_101, '[\\n]', ''), dato_102 = REGEXP_REPLACE(dato_102, '[\\n]', ''), dato_103 = REGEXP_REPLACE(dato_103, '[\\n]', ''), dato_104 = REGEXP_REPLACE(dato_104, '[\\n]', ''), dato_105 = REGEXP_REPLACE(dato_105, '[\\n]', ''), dato_106 = REGEXP_REPLACE(dato_106, '[\\n]', ''), dato_107 = REGEXP_REPLACE(dato_107, '[\\n]', ''), dato_108 = REGEXP_REPLACE(dato_108, '[\\n]', ''), dato_109 = REGEXP_REPLACE(dato_109, '[\\n]', ''), dato_110 = REGEXP_REPLACE(dato_110, '[\\n]', ''), dato_111 = REGEXP_REPLACE(dato_111, '[\\n]', ''), dato_112 = REGEXP_REPLACE(dato_112, '[\\n]', ''), dato_113 = REGEXP_REPLACE(dato_113, '[\\n]', ''), dato_114 = REGEXP_REPLACE(dato_114, '[\\n]', ''), dato_115 = REGEXP_REPLACE(dato_115, '[\\n]', ''), dato_116 = REGEXP_REPLACE(dato_116, '[\\n]', ''), dato_117 = REGEXP_REPLACE(dato_117, '[\\n]', ''), dato_118 = REGEXP_REPLACE(dato_118, '[\\n]', ''), dato_119 = REGEXP_REPLACE(dato_119, '[\\n]', ''), dato_120 = REGEXP_REPLACE(dato_120, '[\\n]', ''), dato_121 = REGEXP_REPLACE(dato_121, '[\\n]', ''), dato_122 = REGEXP_REPLACE(dato_122, '[\\n]', ''), dato_123 = REGEXP_REPLACE(dato_123, '[\\n]', ''), dato_124 = REGEXP_REPLACE(dato_124, '[\\n]', ''), dato_125 = REGEXP_REPLACE(dato_125, '[\\n]', ''), dato_126 = REGEXP_REPLACE(dato_126, '[\\n]', ''), dato_127 = REGEXP_REPLACE(dato_127, '[\\n]', ''), dato_128 = REGEXP_REPLACE(dato_128, '[\\n]', ''), dato_129 = REGEXP_REPLACE(dato_129, '[\\n]', ''), dato_130 = REGEXP_REPLACE(dato_130, '[\\n]', ''), dato_131 = REGEXP_REPLACE(dato_131, '[\\n]', ''), dato_132 = REGEXP_REPLACE(dato_132, '[\\n]', ''), dato_133 = REGEXP_REPLACE(dato_133, '[\\n]', ''), dato_134 = REGEXP_REPLACE(dato_134, '[\\n]', ''), dato_135 = REGEXP_REPLACE(dato_135, '[\\n]', ''), dato_136 = REGEXP_REPLACE(dato_136, '[\\n]', ''), dato_137 = REGEXP_REPLACE(dato_137, '[\\n]', ''), dato_138 = REGEXP_REPLACE(dato_138, '[\\n]', ''), dato_139 = REGEXP_REPLACE(dato_139, '[\\n]', ''), dato_140 = REGEXP_REPLACE(dato_140, '[\\n]', ''), dato_141 = REGEXP_REPLACE(dato_141, '[\\n]', ''), dato_142 = REGEXP_REPLACE(dato_142, '[\\n]', ''), dato_143 = REGEXP_REPLACE(dato_143, '[\\n]', ''), dato_144 = REGEXP_REPLACE(dato_144, '[\\n]', '');
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_UpdateLetrasPuntoGuion`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateLetrasPuntoGuion`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 
	SET DATO_134 = REGEXP_REPLACE(DATO_134, '[A-Za-z._-]', ''), DATO_124 = REGEXP_REPLACE(DATO_124, '[A-Za-z._-]', ''), 
	DATO_114 = REGEXP_REPLACE(DATO_114, '[A-Za-z._-]', ''), DATO_104 = REGEXP_REPLACE(DATO_104, '[A-Za-z._-]', ''),
	DATO_94 = REGEXP_REPLACE(DATO_94, '[A-Za-z._-]', ''), DATO_84 = REGEXP_REPLACE(DATO_84, '[A-Za-z._-]', ''),
	DATO_74 = REGEXP_REPLACE(DATO_74, '[A-Za-z._-]', ''), DATO_35 = REGEXP_REPLACE(DATO_35, '[A-Za-z._-]', ''),
	DATO_34 = REGEXP_REPLACE(DATO_34, '[A-Za-z._-]', ''), DATO_26 = REGEXP_REPLACE(DATO_26, '[A-Za-z._-]', ''),
	DATO_23 = REGEXP_REPLACE(DATO_23, '[A-Za-z._-]', ''), DATO_02 = REGEXP_REPLACE(DATO_02, '[A-Za-z._-]', '');
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateAscii`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateAscii`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 
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
    dato_143=replace(dato_143, UNHEX('C2A0'),  ''), dato_144=replace(dato_144, UNHEX('C2A0'),  '');

    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateBackSlash`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateBackSlash`(OUT success INT)
BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
     SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
     SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 
	SET DATO_134 = REPLACE(DATO_134, '\\', ''), DATO_124 = REPLACE(DATO_124, '\\', ''), DATO_114 = REPLACE(DATO_114, '\\', ''), 
    DATO_104 = REPLACE(DATO_104, '\\', ''),	DATO_94 = REPLACE(DATO_94, '\\', ''), DATO_84 = REPLACE(DATO_84, '\\', ''),
	DATO_74 = REPLACE(DATO_74, '\\', ''), DATO_35 = REPLACE(DATO_35, '\\', ''),	DATO_34 = REPLACE(DATO_34, '\\', ''), 
    DATO_26 = REPLACE(DATO_26, '\\', ''), DATO_23 = REPLACE(DATO_23, '\\', ''), DATO_02 = REPLACE(DATO_02, '\\', '');
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateTrim`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateTrim`(OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
     SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
     SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 SET dato_01=TRIM(dato_01), dato_02=TRIM(dato_02), dato_03=TRIM(dato_03), dato_04=TRIM(dato_04), 
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
	dato_140=TRIM(dato_140), dato_141=TRIM(dato_141), dato_142=TRIM(dato_142), dato_143=TRIM(dato_143), dato_144=TRIM(dato_144);
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateRecodificarSiNo`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateRecodificarSiNo`(OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 SET dato_06 = 0 WHERE dato_06 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_06 = 1 WHERE dato_06 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_09 = 0 WHERE dato_09 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_09 = 1 WHERE dato_09 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_22 = 0 WHERE dato_22 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_22 = 1 WHERE dato_22 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_37 = 0 WHERE dato_37 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_37 = 1 WHERE dato_37 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_40 = 0 WHERE dato_40 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_40 = 1 WHERE dato_40 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_43 = 0 WHERE dato_43 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_43 = 1 WHERE dato_43 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_45 = 0 WHERE dato_45 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_45 = 1 WHERE dato_45 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_51 = 0 WHERE dato_51 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_51 = 1 WHERE dato_51 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_52 = 0 WHERE dato_52 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_52 = 1 WHERE dato_52 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_137 = 0 WHERE dato_137 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_137 = 1 WHERE dato_137 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_138 = 0 WHERE dato_138 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_138 = 1 WHERE dato_138 = 'Si';
	UPDATE bd_bha_sci.stage_00 SET dato_139 = 0 WHERE dato_139 = 'No';
	UPDATE bd_bha_sci.stage_00 SET dato_139 = 1 WHERE dato_139 = 'Si';
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateInfoTransito`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateInfoTransito`(OUT success INT)
BEGIN
DECLARE exit handler for sqlexception
	BEGIN
     -- ERROR
		SET success = 0;
	ROLLBACK;
	END;
   
	DECLARE exit handler for sqlwarning
	BEGIN
     -- WARNING
		SET success = -1;
	ROLLBACK;
	END;
 
	START TRANSACTION;
    UPDATE bd_bha_sci.stage_00 SET dato_11 = 'Transito' WHERE dato_11 = 'transit' or dato_11 = 'transito' or dato_11 = 'Tránsito';
	UPDATE bd_bha_sci.stage_00 SET dato_11 = 'Estadia' WHERE dato_11 = 'Estadía' or dato_11 = 'estadia' or dato_11 = 'settlement';
	UPDATE bd_bha_sci.stage_00 SET dato_26 = null WHERE dato_26 = 'Ninguno' ;
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 'REGISTRO VALIDO' WHERE dato_143 = 'valido' or dato_143 = 'Registro válido' or dato_143 = 'Registro Válido' or dato_143 = 'VÁLIDO' or dato_143 = 'REGISTRO VÁLIDO' or dato_143 = 'Registro valido' or dato_143 = 'Registro Valido' or dato_143 = 'registro valido';
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 'REGISTRO INVALIDO' WHERE dato_143 = 'Registro inválido' or dato_143 = 'REGISTRO INVÁLIDO' or dato_143 = 'Registro Inválido' or dato_143 = 'Registro invalido';
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 'REGISTRO EN ESPERA' WHERE dato_143 = 'REG. EN ESPERA' or dato_143 = 'Registro en espera';
    
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 1 WHERE dato_143 = 'REGISTRO VALIDO';
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 2 WHERE dato_143 = 'REGISTRO INVALIDO';
    UPDATE bd_bha_sci.stage_00 SET dato_143 = 3 WHERE dato_143 = 'REGISTRO EN ESPERA';
	/*SELECT ROW_COUNT() AS 'Affected rows';*/
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectDocIdentConIncidencias`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectDocIdentConIncidencias`()
BEGIN	    
    SELECT ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
FROM bd_bha_sci.stage_00 where DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
OR DATO_134 REGEXP '.*[^0-9].*';
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNombresConDigitos`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectNombresConDigitos`()
BEGIN	    
    SELECT ID_STAGE, DATO_03, DATO_16, DATO_17, DATO_18, DATO_19, DATO_65, DATO_66, DATO_67, DATO_68, DATO_75, DATO_76, DATO_77, DATO_78, DATO_85,
DATO_86, DATO_87, DATO_88, DATO_95, DATO_96, DATO_97, DATO_98, DATO_105, DATO_106, DATO_107, DATO_108, DATO_115, DATO_116, DATO_117, 
DATO_118, DATO_125, DATO_126, DATO_127, DATO_128
FROM bd_bha_sci.stage_00 where DATO_03 REGEXP '[[:digit:]]' OR DATO_16 REGEXP '[[:digit:]]' OR DATO_17 REGEXP '[[:digit:]]' OR
DATO_18 REGEXP '[[:digit:]]' OR DATO_19 REGEXP '[[:digit:]]' OR DATO_65 REGEXP '[[:digit:]]' OR DATO_66 REGEXP '[[:digit:]]' OR
DATO_67 REGEXP '[[:digit:]]' OR DATO_68 REGEXP '[[:digit:]]' OR DATO_75 REGEXP '[[:digit:]]' OR DATO_76 REGEXP '[[:digit:]]' OR
DATO_77 REGEXP '[[:digit:]]' OR DATO_78 REGEXP '[[:digit:]]' OR DATO_85 REGEXP '[[:digit:]]' OR DATO_86 REGEXP '[[:digit:]]' OR 
DATO_87 REGEXP '[[:digit:]]' OR DATO_88 REGEXP '[[:digit:]]' OR DATO_95 REGEXP '[[:digit:]]' OR DATO_96 REGEXP '[[:digit:]]' OR
DATO_97 REGEXP '[[:digit:]]' OR DATO_98 REGEXP '[[:digit:]]' OR DATO_105 REGEXP '[[:digit:]]' OR DATO_106 REGEXP '[[:digit:]]' OR
DATO_107 REGEXP '[[:digit:]]' OR DATO_108 REGEXP '[[:digit:]]' OR DATO_115 REGEXP '[[:digit:]]' OR DATO_116 REGEXP '[[:digit:]]' OR
DATO_117 REGEXP '[[:digit:]]' OR DATO_118 REGEXP '[[:digit:]]' OR DATO_125 REGEXP '[[:digit:]]' OR DATO_126 REGEXP '[[:digit:]]' OR
DATO_127 REGEXP '[[:digit:]]' OR DATO_128 REGEXP '[[:digit:]]'; 
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNumeroIdentificacionConIncidencias`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectNumeroIdentificacionConIncidencias`(OUT _total INT)
BEGIN	    
    SELECT SQL_CALC_FOUND_ROWS  ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
	FROM bd_bha_sci.stage_00 where DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
	OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
	OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
	OR DATO_134 REGEXP '.*[^0-9].*';
	SET _total = FOUND_ROWS();    
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectNumeroIdentificacionConIncidencias_1`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectNumeroIdentificacionConIncidencias_1`()
BEGIN	    
    SELECT SQL_CALC_FOUND_ROWS  ID_STAGE,DATO_02, DATO_23, DATO_26,DATO_34,DATO_35 ,DATO_74 ,DATO_84,DATO_94,DATO_104,DATO_114,DATO_124,DATO_134 
	FROM bd_bha_sci.stage_00 where DATO_02 REGEXP '.*[^0-9].*' OR DATO_23 REGEXP '.*[^0-9].*' OR DATO_26 REGEXP '.*[^0-9].*' 
	OR DATO_34 REGEXP '.*[^0-9].*' OR DATO_35 REGEXP '.*[^0-9].*' OR DATO_74 REGEXP '.*[^0-9].*' OR DATO_84 REGEXP '.*[^0-9].*' 
	OR DATO_94 REGEXP '.*[^0-9].*' OR DATO_104 REGEXP '.*[^0-9].*' OR DATO_114 REGEXP '.*[^0-9].*' OR DATO_124 REGEXP '.*[^0-9].*' 
	OR DATO_134 REGEXP '.*[^0-9].*';
	SELECT ROW_COUNT() AS 'Affected rows';    
END ;;
DELIMITER ;



/* 
CREACION DE STORED PROCEDURE 
TABLA DATA HISTORICA	 
*/

DROP PROCEDURE IF EXISTS `SP_SelectDHDocIdentConIncidencias`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectDHDocIdentConIncidencias`()
BEGIN	    
    SELECT id_stage_dh, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as nombre, tipo_documento, numero_documento 
FROM bd_bha_sci.stage_data_historica where numero_documento REGEXP '.*[^0-9].*' ;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectDHNombresConDigitos`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectDHNombresConDigitos`()
BEGIN	    
    SELECT id_stage_dh, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, proyecto
FROM bd_bha_sci.stage_data_historica where nombre_1 REGEXP '[[:digit:]]' OR nombre_2 REGEXP '[[:digit:]]' OR apellido_1 REGEXP '[[:digit:]]' OR apellido_2 REGEXP '[[:digit:]]' OR tipo_documento REGEXP '[[:digit:]]' ;
END ;;
DELIMITER ;


DROP PROCEDURE IF EXISTS `SP_UpdateDHSaltoLinea`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHSaltoLinea`(OUT success INT)
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
		UPDATE bd_bha_sci.stage_data_historica SET nombre_1 = REGEXP_REPLACE(nombre_1, '\\n', ''), nombre_2 = REGEXP_REPLACE(nombre_2, '\\n', ''), apellido_1 = REGEXP_REPLACE(apellido_1, '\\n', ''), apellido_2 = REGEXP_REPLACE(apellido_2, '\\n', ''), tipo_documento = REGEXP_REPLACE(tipo_documento, '\\n', ''), numero_documento = REGEXP_REPLACE(numero_documento, '\\n', '') ;
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHBackSlash`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHBackSlash`(OUT success INT)
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
		UPDATE bd_bha_sci.stage_data_historica SET nombre_1 = REPLACE(nombre_1, '\\', ''), nombre_2 = REPLACE(nombre_2, '\\', ''), apellido_1 = REPLACE(apellido_1, '\\', ''), apellido_2 = REPLACE(apellido_2, '\\', ''), tipo_documento = REPLACE(tipo_documento, '\\', ''), numero_documento = REPLACE(numero_documento, '\\', ''), proyecto = REPLACE(proyecto, '\\', '');
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHSoloAlfanumericos`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHSoloAlfanumericos`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '[^[:alnum:]]+', ' '), tipo_documento = REGEXP_REPLACE(tipo_documento, '[^[:alnum:]]+', ' ');
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHLimpiarCaracteres_acentos`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHLimpiarCaracteres_acentos`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '[A-Za-z]', ''), numero_documento = REGEXP_REPLACE(numero_documento, '[áéíóú]', '');
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHLimpiarDobleEspacioBlanco`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHLimpiarDobleEspacioBlanco`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET numero_documento = REGEXP_REPLACE(numero_documento, '\\s', '');
        SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHTipoDocumento`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHTipoDocumento`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' WHERE tipo_documento = 'Carnet de extranjería';
	UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de Extranjeria' WHERE tipo_documento = 'Carnet de Extranjería';
	UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = 'Carnet de refugio' WHERE tipo_documento = 'Carnet de Solicitante de Refugio';
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHSoloTextoTipoDocumento`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHSoloTextoTipoDocumento`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET tipo_documento = REGEXP_REPLACE(tipo_documento, '[0-9]', '');
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_UpdateDHTrim`;
DELIMITER ;;
CREATE PROCEDURE `SP_UpdateDHTrim`(OUT success INT)
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
	UPDATE bd_bha_sci.stage_data_historica SET nombre_1=TRIM(nombre_1), nombre_2=TRIM(nombre_2), apellido_1=TRIM(apellido_1), apellido_2=TRIM(apellido_2), tipo_documento=TRIM(tipo_documento), numero_documento=TRIM(numero_documento), proyecto=TRIM(proyecto) ;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

/* 
CREACION DE STORED PROCEDURE 
PROCESO COTEJO DE RESULTADO CON DATA HISTORICA
*/
DROP PROCEDURE IF EXISTS `SP_SelectCotejo`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectCotejo`()
BEGIN	    
    SELECT nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia
	FROM bd_bha_sci.stage_data_historica ; 
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_InsertResultadoCotejo`;
DELIMITER ;;
CREATE PROCEDURE `SP_InsertResultadoCotejo`(  In id_busqueda int, In id_caso int, In id_result int, In tipo_busqueda text,
    In nomb_1 text, In nomb_2 text, In ape_1 text, In ape_2 text, In tipo_doc text, In numero_doc text, In proyecto text, In cod_familia text
)
BEGIN
    insert into resultado_cotejo_datos_historicos (id_busqueda, id_caso, id_resultado, tipo_busqueda, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia)
    values (id_busqueda, id_caso, id_result, tipo_busqueda, nomb_1, nomb_2, ape_1, ape_2, tipo_doc, numero_doc, proyecto, cod_familia); 
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_SelectResultadoCotejo`;
DELIMITER ;;
CREATE PROCEDURE `SP_SelectResultadoCotejo`(in codigo int)
BEGIN	    
    SELECT id_busqueda, id_cotejo, id_caso, id_resultado, tipo_busqueda, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia FROM bd_bha_sci.resultado_cotejo_datos_historicos where id_busqueda = codigo order by id_busqueda, id_caso, tipo_busqueda, apellido_1, apellido_2, nombre_1; 
END ;;
DELIMITER ;

-- CREACION DE USUARIOS
DROP PROCEDURE IF EXISTS `SP_Usuario_Insert`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Insert`(in nombre varchar(50), in email varchar(100), in pass varchar(50), in idrol int, in idestado int, OUT success INT)
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
	SET @clave = password(pass);
    insert into bd_bha_sci.usuarios(nombre_usuario, correo, contrasenia, id_rol, id_estado) values (nombre, email, @clave, idrol, idestado);
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Update`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Update`(in iduser int, in nombre varchar(50), in email varchar(100), in idrol int, in idestado int, OUT success INT)
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
    update bd_bha_sci.usuarios 
    set nombre_usuario = nombre, correo = email, id_rol = idrol, id_estado = idestado
    where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Update_Password`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Update_Password`(in iduser int, in pass varchar(50), OUT success INT)
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
	SET @clave = password(pass);
    update bd_bha_sci.usuarios 
    set contrasenia = @clave where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Reset_Password`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Reset_Password`(in usuario varchar(50), in pass varchar(50), OUT success INT)
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
    set @codigo = 0;
    select @codigo := id_usuario from bd_bha_sci.usuarios where nombre_usuario = usuario;
    
    if @codigo>0 then
    	SET @clave = password(pass);
		update bd_bha_sci.usuarios 
		set contrasenia = @clave where id_usuario = @codigo;
		SET success = 1;
	end if;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Delete`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Delete`(in iduser int, OUT success INT)
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
    delete from bd_bha_sci.usuarios where id_usuario = iduser;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Login_validar`;
DELIMITER ;;
CREATE PROCEDURE `SP_Login_validar`(in usuario varchar(50), in pass varchar(100), OUT success INT)
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
    SET @clave = password(pass);
    SELECT id_usuario into success FROM bd_bha_sci.usuarios where nombre_usuario = usuario and contrasenia = @clave;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuarios_Select`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuarios_Select`()
BEGIN	    
    SELECT A1.id_usuario, A1.nombre_usuario, A1.correo, A1.id_rol, A2.nombre_rol
	FROM bd_bha_sci.usuarios AS a1 INNER JOIN bd_bha_sci.roles AS A2 ON A1.id_rol = A2.id_rol 
    ORDER BY A1.nombre_usuario;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Usuario_Select`;
DELIMITER ;;
CREATE PROCEDURE `SP_Usuario_Select`(in id int)
BEGIN	    
    SELECT A1.id_usuario, A1.nombre_usuario, A1.correo, A1.id_rol, A2.nombre_rol
	FROM bd_bha_sci.usuarios AS a1 INNER JOIN bd_bha_sci.roles AS A2 ON A1.id_rol = A2.id_rol
    WHERE A1.id_usuario = id; 
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `SP_Migrar_Data_Historica`;
DELIMITER ;;
CREATE PROCEDURE `SP_Migrar_Data_Historica`(OUT success INT)
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
    truncate table data_historica;
    INSERT INTO data_historica (nombre_1, nombre_2, apellido_1, apellido_2, beneficiario, tipo_documento, numero_documento, proyecto, cod_familia, fecha) SELECT nombre_1, nombre_2, apellido_1, apellido_2, concat_ws(' ', nombre_1, nombre_2, apellido_1, apellido_2) as beneficiario, tipo_documento, numero_documento, proyecto, cod_familia, curdate() from stage_data_historica;
    truncate table stage_data_historica;
    SET success = 1;
    COMMIT;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `DropFK` ;
DELIMITER ;;
CREATE PROCEDURE `DropFK`()
-- ELIMINANDO LOS FOREIGN KEY y CONSTRAINT
BEGIN
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_22') THEN ALTER TABLE `comunicacion` DROP FOREIGN KEY `R_22`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_20') THEN	ALTER TABLE `derivacion_sectores` DROP FOREIGN KEY `R_20`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_21') THEN	ALTER TABLE `educacion` DROP FOREIGN KEY `R_21`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_19') THEN	ALTER TABLE `encuesta` DROP FOREIGN KEY `R_19`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_23') THEN	ALTER TABLE `Integrantes` DROP FOREIGN KEY `R_23`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_24') THEN	ALTER TABLE `nutricion` DROP FOREIGN KEY `R_24`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_25') THEN	ALTER TABLE `salud` DROP FOREIGN KEY `R_25`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_37') THEN	ALTER TABLE `estatus` DROP FOREIGN KEY `R_37`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_38') THEN	ALTER TABLE `estatus` DROP FOREIGN KEY `R_38`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_39') THEN	ALTER TABLE `usuarios` DROP FOREIGN KEY `R_39`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'UC_usuarios') THEN	ALTER TABLE `usuarios` DROP CONSTRAINT `UC_usuarios`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_40') THEN	ALTER TABLE `acciones` DROP FOREIGN KEY `R_40`; 
END IF;
IF EXISTS (SELECT NULL FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = DATABASE() AND CONSTRAINT_NAME = 'R_41') THEN	ALTER TABLE `acciones` DROP FOREIGN KEY `R_41`; 
END IF;
END;;
DELIMITER ;

/*****************************
PROBANDO LOS STORED PROCEDURE
******************************/
SET @total = 9;
call SP_Migrar_Data_Historica(@total);
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

