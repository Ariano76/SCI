SELECT dato_07, dato_08, dato_09, dato_10, dato_11, dato_12, dato_13, dato_14, dato_15, dato_16, dato_17, dato_18, dato_19, dato_20, dato_21, dato_22, dato_23, dato_24, dato_25, dato_26, dato_27, dato_28 FROM bd_bha_sci.stage_00;
SELECT dato_01, dato_02, dato_03, dato_04, dato_05, dato_06 FROM bd_bha_sci.stage_00;

SELECT * FROM bd_bha_sci.beneficiario;
SELECT * FROM bd_bha_sci.encuesta;
SELECT * FROM bd_bha_sci.comunicacion;
SELECT * FROM bd_bha_sci.nutricion;
SELECT * FROM bd_bha_sci.educacion;
SELECT * FROM bd_bha_sci.salud;
SELECT * FROM bd_bha_sci.derivacion_sectores;
SELECT * FROM bd_bha_sci.integrantes;


ALTER TABLE bd_bha_sci.beneficiario AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.encuesta AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.comunicacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.nutricion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.educacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.salud AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.derivacion_sectores AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.integrantes AUTO_INCREMENT = 1;

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
delete from bd_bha_sci.beneficiario where id_beneficiario>0;
