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
