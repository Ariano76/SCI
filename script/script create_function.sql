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

CREATE VIEW `bd_bha_sci`.`vista_encuesta` AS
	SELECT concat(b.primer_nombre,' ',b.segundo_nombre,' ',b.primer_apellido,' ',b.segundo_apellido) AS nombre, e.fecha_encuesta, e.id_encuestador, e.nombre_encuestador, e.region_encuestador, e.como_realizo_encuesta, e.esta_de_acuerdo, e.id_beneficiario
    FROM encuesta e inner join beneficiario b on e.id_beneficiario = b.id_beneficiario ;    

drop view vista_beneficiario;
CREATE VIEW `bd_bha_sci`.`vista_beneficiario` AS
	SELECT id_beneficiario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, region_beneficiario, otra_region, se_instalara_en_esta_region, en_que_provincia, transit_settle, en_que_otro_caso_1, en_que_distrito, en_que_otro_caso_2, en_que_otro_caso_3, genero, fecha_nacimiento, tiene_carne_extranjeria, numero_cedula, fecha_caducidad_cedula, tipo_identificacion, numero_identificacion, fecha_caducidad_identificacion, documentos_fisico_original
    FROM beneficiario;    


    
    
    