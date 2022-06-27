USE bd_bha_sci;

-- ELIMINAR FOREIGN KEY Y CONSTRAINS
call DropFK();
call DropViews();

-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists actividad;
DROP TABLE if exists adulto;
DROP TABLE if exists discapacidad;
DROP TABLE if exists genero;
DROP TABLE if exists gestante;
DROP TABLE if exists indigena;
DROP TABLE if exists nacionalidad;
DROP TABLE if exists proyecto;
DROP TABLE if exists resultado_proyectos;
DROP TABLE if exists subtema;
DROP TABLE if exists tema;
DROP TABLE if exists tiempo_gestacion;
DROP TABLE if exists tipo_discapacidad;
DROP TABLE if exists tipo_documento;
DROP TABLE if exists tipo_organizacion;

-- CREACION DE TABLAS

CREATE TABLE actividad
(
	id_actividad         INTEGER NOT NULL,
	nom_actividad        VARCHAR(250) NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE actividad ADD PRIMARY KEY (id_actividad);
ALTER TABLE actividad MODIFY id_actividad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE adulto
(
	id_adulto            INTEGER NOT NULL,
	nom_adulto           VARCHAR(50) NULL
);

ALTER TABLE adulto ADD PRIMARY KEY (id_adulto);
ALTER TABLE adulto MODIFY id_adulto INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE discapacidad
(
	id_discapacidad      INTEGER NOT NULL,
	nom_discapacidad     VARCHAR(50) NULL
);

ALTER TABLE discapacidad ADD PRIMARY KEY (id_discapacidad);
ALTER TABLE discapacidad MODIFY id_discapacidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE genero
(
	id_genero            INTEGER NOT NULL,
	nom_genero           VARCHAR(50) NULL
);

ALTER TABLE genero ADD PRIMARY KEY (id_genero);
ALTER TABLE genero MODIFY id_genero INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE gestante
(
	id_gestante          INTEGER NOT NULL,
	nom_gestante         VARCHAR(50) NULL
);

ALTER TABLE gestante ADD PRIMARY KEY (id_gestante);
ALTER TABLE gestante MODIFY id_gestante INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE indigena
(
	id_indigena          INTEGER NOT NULL,
	nom_indigena         VARCHAR(50) NULL
);

ALTER TABLE indigena ADD PRIMARY KEY (id_indigena);
ALTER TABLE indigena MODIFY id_indigena INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE nacionalidad
(
	id_nacionalidad      INTEGER AUTO_INCREMENT,
	nom_nacionalidad     VARCHAR(100) NULL
);

ALTER TABLE nacionalidad ADD PRIMARY KEY (id_nacionalidad);
ALTER TABLE nacionalidad MODIFY id_nacionalidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE proyecto
(
	id_proyecto          INTEGER NOT NULL,
	nom_proyecto         VARCHAR(250) NULL
);

CREATE TABLE resultado_proyectos
(
	id_resultado_proyectos INTEGER NOT NULL,
	fecha_entrada        DATE NULL,
	organizacion         CHAR(18) NULL,
	categoria            VARCHAR(250) NULL,
	anio                 INTEGER NULL,
	region               VARCHAR(100) NULL,
	distrito             VARCHAR(250) NULL,
	comunidad            VARCHAR(250) NULL,
	nombre_1             VARCHAR(250) NULL,
	nombre_2             VARCHAR(250) NULL,
	apellido_1           VARCHAR(250) NULL,
	apellido_2           VARCHAR(250) NULL,
	cod_grupo_familiar   VARCHAR(50) NULL,
	numero_documento     VARCHAR(50) NULL,
	nombre_organizacion  VARCHAR(250) NULL,
	correo_electronico   VARCHAR(250) NULL,
	celular_1            VARCHAR(15) NULL,
	celular_2            VARCHAR(15) NULL,
	edad                 INTEGER NULL,
	id_proyecto          INTEGER NULL,
	fecha_actividad      DATE NULL,
	persona_registro     VARCHAR(250) NULL,
	id_tipo_documento    INTEGER NULL,
	id_nacionalidad      INTEGER NULL,
	id_tipo_organizacion INTEGER NULL,
	id_genero            INTEGER NULL,
	id_adulto            INTEGER NULL,
	id_indigena          INTEGER NULL,
	id_discapacidad      INTEGER NULL,
	id_tipo_discapacidad INTEGER NULL,
	id_gestante          INTEGER NULL,
	id_tiempo_gestacion  INTEGER NULL,
	id_tema              INTEGER NULL,
	id_subtema           INTEGER NULL,
	id_actividad         INTEGER NULL
);

ALTER TABLE resultado_proyectos ADD PRIMARY KEY (id_resultado_proyectos);
ALTER TABLE resultado_proyectos MODIFY id_resultado_proyectos INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE subtema
(
	id_subtema           INTEGER NOT NULL,
	nom_subtema          VARCHAR(250) NULL
);

ALTER TABLE subtema ADD PRIMARY KEY (id_subtema);
ALTER TABLE subtema MODIFY id_subtema INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tema
(
	id_tema              INTEGER NOT NULL,
	nom_tema             VARCHAR(250) NULL
);

ALTER TABLE tema ADD PRIMARY KEY (id_tema);
ALTER TABLE tema MODIFY id_tema INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tiempo_gestacion
(
	id_tiempo_gestacion  INTEGER NOT NULL,
	nom_tiempo_gestacion VARCHAR(100) NULL
);

ALTER TABLE tiempo_gestacion ADD PRIMARY KEY (id_tiempo_gestacion);
ALTER TABLE tiempo_gestacion MODIFY id_tiempo_gestacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_discapacidad
(
	id_tipo_discapacidad INTEGER NOT NULL,
	nom_tipo_discapacidad VARCHAR(100) NULL
);

ALTER TABLE tipo_discapacidad ADD PRIMARY KEY (id_tipo_discapacidad);
ALTER TABLE tipo_discapacidad MODIFY id_tipo_discapacidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_documento
(
	id_tipo_documento    INTEGER AUTO_INCREMENT,
	nom_documento        VARCHAR(100) NOT NULL
);

ALTER TABLE tipo_documento ADD PRIMARY KEY (id_tipo_documento);
ALTER TABLE tipo_documento MODIFY id_tipo_documento INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_organizacion
(
	id_tipo_organizacion INTEGER NOT NULL,
	nom_tipo_organizacion VARCHAR(100) NULL
);

ALTER TABLE tipo_organizacion ADD PRIMARY KEY (id_tipo_organizacion);
ALTER TABLE tipo_organizacion MODIFY id_tipo_organizacion INT NOT NULL AUTO_INCREMENT ;

/*********************************
-- CREACION DE LLAVES FORANEAS 
*********************************/

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_51 (id_tipo_documento) REFERENCES tipo_documento (id_tipo_documento);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_52 (id_nacionalidad) REFERENCES nacionalidad (id_nacionalidad);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_53 (id_tipo_organizacion) REFERENCES tipo_organizacion (id_tipo_organizacion);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_54 (id_genero) REFERENCES genero (id_genero);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_55 (id_adulto) REFERENCES adulto (id_adulto);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_56 (id_indigena) REFERENCES indigena (id_indigena);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_57 (id_discapacidad) REFERENCES discapacidad (id_discapacidad);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_58 (id_tipo_discapacidad) REFERENCES tipo_discapacidad (id_tipo_discapacidad);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_59 (id_gestante) REFERENCES gestante (id_gestante);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_60 (id_tiempo_gestacion) REFERENCES tiempo_gestacion (id_tiempo_gestacion);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_61 (id_tema) REFERENCES tema (id_tema);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_62 (id_subtema) REFERENCES subtema (id_subtema);

ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_63 (id_actividad) REFERENCES actividad (id_actividad);

/*********************************
-- INSERTANDO DATOS BASICOS
*********************************/
insert into roles(nombre_rol) values('Administrador');
insert into roles(nombre_rol) values('Analista');

insert into estados (estado) values('VALIDO'),('INVALIDO'),('EN ESPERA'),('REGISTRO VALIDO POSIBLE FRAUDE'),('REGISTRO EN ESPERA POSIBLE FRAUDE'),('FRAUDE'),('ABANDONO');
insert into entidades (nombre) values('beneficiario'),('comunicacion'),('derivacion_sectores'),('educacion'),('encuesta'),('integrantes'),('nutricion'),('salud');

call SP_Usuario_Insert('Percy', 'PERCY@gmail.com', '123456', 1, 1, @total);
call SP_Usuario_Insert('Salvador', 'Salvador@gmail.com', '123456', 1, 1, @total);
call SP_Usuario_Insert('Ricardo', 'Ricardo@gmail.com', '123456', 1, 1, @total);
call SP_Usuario_Insert('Consultas', 'consultas@gmail.com', '123456', 1, 1, @total);
select @total;

/** creando usuario en BD **/
CREATE USER 'consulta'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON * . * TO 'consulta'@'localhost';
FLUSH PRIVILEGES;

SET @clave = password('123');
select @clave;
insert into usuarios(nombre_usuario, correo, contrasenia, id_rol, id_estado) values ('Salvador', 'PERCY@gmail.com', @clave, 1, 1);