SELECT * FROM bd_bha_sci.stage_00 limit 1;
/* PARA VER LA CONFIGURACION DE LAS VARIABLES*/
SHOW VARIABLES LIKE 'sql_mode';
select version();

SELECT * FROM bd_bha_sci.beneficiario ;
SELECT * FROM bd_bha_sci.encuesta ;
SELECT * FROM bd_bha_sci.comunicacion;
SELECT * FROM bd_bha_sci.nutricion;
SELECT * FROM bd_bha_sci.educacion;
SELECT * FROM bd_bha_sci.salud;
SELECT * FROM bd_bha_sci.derivacion_sectores;
SELECT * FROM bd_bha_sci.integrantes;
SELECT * FROM bd_bha_sci.estatus;




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
delete from bd_bha_sci.acciones where id_accion>0;
DELIMITER ;
delete from bd_bha_sci.estatus where id_estatus>0;
DELIMITER ;
delete from bd_bha_sci.beneficiario where id_beneficiario>0;

ALTER TABLE bd_bha_sci.beneficiario AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.encuesta AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.comunicacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.nutricion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.educacion AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.salud AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.derivacion_sectores AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.integrantes AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.acciones AUTO_INCREMENT = 1;
ALTER TABLE bd_bha_sci.estatus AUTO_INCREMENT = 1;