SELECT * FROM bd_bha_sci.stage_00 limit 1;
SELECT dato_01, dato_02, dato_03, dato_04, dato_05, dato_06 FROM bd_bha_sci.stage_00;
SELECT ascii(substr(dato_80,10,1)) FROM bd_bha_sci.stage_00 where id_stage=1983;
SELECT ascii(substr(dato_80,11,1)) FROM bd_bha_sci.stage_00 where id_stage=1983;
SELECT ascii(substr(dato_80,12,1)) FROM bd_bha_sci.stage_00 where id_stage=1983;
SELECT max(length(dato_80)) FROM bd_bha_sci.stage_00 where id_stage=1983;
SELECT dato_80 FROM bd_bha_sci.stage_00 where id_stage=1983;
select ascii(substr(' 473400',1,1)) as valor from dual; 
SELECT hex((RIGHT(dato_80,1))) FROM bd_bha_sci.stage_00 where id_stage=1983;
SELECT CONVERT(dato_80 USING utf8) FROM bd_bha_sci.stage_00 where id_stage=1983;


update bd_bha_sci.stage_00 set dato_80 = replace(dato_80, UNHEX('C2A0'),'');

SELECT dato_80 FROM bd_bha_sci.stage_00 where DATO_80 REGEXP('[^\xA,\xD,\x20-\x7e]+') ORDER BY DATO_80;
SELECT dato_80 FROM bd_bha_sci.stage_00 where DATO_80 REGEXP('[^\xA,\xD,\x20-\x7e]+') ORDER BY DATO_80;
SELECT dato_80 FROM bd_bha_sci.stage_00 where DATO_80 REGEXP('[^:space:]') ORDER BY DATO_80;

update bd_bha_sci.stage_00 set dato_80 = REGEXP_REPLACE(dato_80, '[^:space:]','');
update bd_bha_sci.stage_00 set dato_80 = REGEXP_REPLACE(dato_80, '[^\x20-\x7e]+','');
update bd_bha_sci.stage_00 set dato_80 = REGEXP_REPLACE(dato_80, '[^\xA,\xD,\x20-\x7e]+','');
update bd_bha_sci.stage_00 set dato_80 = replace(dato_80,  '[^0-9.\]','');
update bd_bha_sci.stage_00 set dato_80 = REGEXP_REPLACE(dato_80, '[^\xA0]+','');


 
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
