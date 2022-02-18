USE bd_bha_sci;

-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists encuesta;
DROP TABLE if exists derivacion_sectores;
DROP TABLE if exists educacion;
DROP TABLE if exists salud;
DROP TABLE if exists nutricion;
DROP TABLE if exists comunicacion;
DROP TABLE if exists integrantes;
DROP TABLE if exists estatus;
DROP TABLE if exists beneficiario;
DROP TABLE if exists estados;
DROP TABLE if exists usuarios;
DROP TABLE if exists roles;
DROP TABLE if exists acciones;
DROP TABLE if exists entidades;

-- CREACION DE TABLAS

CREATE TABLE beneficiario
(
	id_beneficiario      INTEGER NOT NULL,
	region_beneficiario  VARCHAR(250) NULL,
	otra_region          VARCHAR(250) NULL,
	se_instalara_en_esta_region boolean NULL,
	en_que_provincia     VARCHAR(250) NULL,
	transit_settle       VARCHAR(250) NULL,
	en_que_otro_caso_1   VARCHAR(250) NULL,
	en_que_distrito      VARCHAR(250) NULL,
	en_que_otro_caso_2   VARCHAR(250) NULL,
	en_que_otro_caso_3   VARCHAR(250) NULL,
	primer_nombre        VARCHAR(250) NULL,
	segundo_nombre       VARCHAR(250) NULL,
	primer_apellido      VARCHAR(250) NULL,
	segundo_apellido     VARCHAR(250) NULL,
	genero               VARCHAR(250) NULL,
	fecha_nacimiento     DATE NULL,
	tiene_carne_extranjeria boolean NULL,
	numero_cedula        VARCHAR(25) NULL,
	fecha_caducidad_cedula DATE NULL ,
	tipo_identificacion  VARCHAR(250) NULL,
	numero_identificacion VARCHAR(25) NULL,
	fecha_caducidad_identificacion DATE NULL ,
	documentos_fisico_original VARCHAR(250) NULL
);

ALTER TABLE beneficiario
ADD PRIMARY KEY (id_beneficiario);

ALTER TABLE beneficiario
MODIFY id_beneficiario INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE comunicacion
(
	id_comunicacion      INTEGER NOT NULL,
	tiene_los_siguientes_medios_comunicacion VARCHAR(250) NULL,
	celular_basico       boolean NULL,
	smartphone           boolean NULL,
	laptop               boolean NULL,
	ninguno              boolean NULL,
	cual_es_su_numero_whatsapp VARCHAR(250) NULL,
	cual_es_su_numero_recibir_sms VARCHAR(250) NULL,
	cual_numero_usa_con_frecuencia VARCHAR(250) NULL,
	es_telefono_propio   boolean NULL,
	como_accede_a_internet VARCHAR(250) NULL,
	cual_es_su_direccion VARCHAR(250) NULL,
	vive_o_viaja_con_otros_familiares boolean NULL,
	cuantos_viven_o_viajan_con_usted VARCHAR(250) NULL,
	cuantos_tienen_ingreso_por_trabajo VARCHAR(250) NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE comunicacion
ADD PRIMARY KEY (id_comunicacion);

ALTER TABLE comunicacion
MODIFY id_comunicacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE derivacion_sectores
(
	id_derivacion        INTEGER NOT NULL,
	interesado_participar_nutricion boolean NULL,
	interesado_participar_salud boolean NULL,
	interesado_participar_medios_vida boolean NULL,
	actividades_interesado_participar VARCHAR(250) NULL,
	interesado_entrenamiento_vocacional boolean NULL,
	interesado_emprendimiento boolean NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE derivacion_sectores
ADD PRIMARY KEY (id_derivacion);

ALTER TABLE derivacion_sectores
MODIFY id_derivacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE educacion
(
	id_educacion         INTEGER NOT NULL,
	viaja_con_menores_de_17_anios boolean NULL,
	todos_los_nna_estan_matriculados boolean NULL,
	que_dispositvo_utilizan_en_clases_virtuales VARCHAR(250) NULL,
	celular_basico       boolean NULL,
	smartphone           boolean NULL,
	laptop               boolean NULL,
	ninguno              boolean NULL,
	que_dificultades_tuvo_al_matricular_nna VARCHAR(250) NULL,
	no_conocia_procedimiento_matricula boolean NULL,
	no_cuento_con_los_documentos boolean NULL,
	no_habia_vacantes    boolean NULL,
	otro                 boolean NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE educacion
ADD PRIMARY KEY (id_educacion);

ALTER TABLE educacion
MODIFY id_educacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE encuesta
(
	id_encuesta          INTEGER NOT NULL,
	fecha_encuesta       DATE NULL,
	id_encuestador       INTEGER NULL,
	nombre_encuestador   VARCHAR(250) NULL,
	region_encuestador   VARCHAR(100) NULL,
	como_realizo_encuesta VARCHAR(100) NULL,
	esta_de_acuerdo      boolean NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE encuesta
ADD PRIMARY KEY (id_encuesta);

ALTER TABLE encuesta
MODIFY id_encuesta INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE integrantes
(
	id_integrantes       INTEGER NOT NULL,
	nombre_1a            VARCHAR(250) NULL,
	nombre_1b            VARCHAR(250) NULL,
	apellido_1a          VARCHAR(250) NULL,
	apellido_1b          VARCHAR(250) NULL,
	genero_1             VARCHAR(250) NULL,
	fecha_nacimiento_1   DATE NULL,
	relacion_1           VARCHAR(250) NULL,
	otro_1               VARCHAR(250) NULL,
	tipo_identificacion_1 VARCHAR(250) NULL,
	numero_identificacion_1 VARCHAR(25) NULL,
	nombre_2a            VARCHAR(250) NULL,
	nombre_2b            VARCHAR(250) NULL,
	apellido_2a          VARCHAR(250) NULL,
	apellido_2b          VARCHAR(250) NULL,
	genero_2             VARCHAR(250) NULL,
	fecha_nacimiento_2   DATE NULL,
	relacion_2           VARCHAR(250) NULL,
	otro_2               VARCHAR(250) NULL,
	tipo_identificacion_2 VARCHAR(250) NULL,
	numero_identificacion_2 VARCHAR(25) NULL,
    nombre_3a            VARCHAR(250) NULL,
	nombre_3b            VARCHAR(250) NULL,
	apellido_3a          VARCHAR(250) NULL,
	apellido_3b          VARCHAR(250) NULL,
	genero_3             VARCHAR(250) NULL,
	fecha_nacimiento_3   DATE NULL,
	relacion_3           VARCHAR(250) NULL,
	otro_3               VARCHAR(250) NULL,
	tipo_identificacion_3 VARCHAR(250) NULL,
	numero_identificacion_3 VARCHAR(25) NULL,
    nombre_4a            VARCHAR(250) NULL,
	nombre_4b            VARCHAR(250) NULL,
	apellido_4a          VARCHAR(250) NULL,
	apellido_4b          VARCHAR(250) NULL,
	genero_4             VARCHAR(250) NULL,
	fecha_nacimiento_4   DATE NULL,
	relacion_4           VARCHAR(250) NULL,
	otro_4               VARCHAR(250) NULL,
	tipo_identificacion_4 VARCHAR(250) NULL,
	numero_identificacion_4 VARCHAR(25) NULL,
    nombre_5a            VARCHAR(250) NULL,
	nombre_5b            VARCHAR(250) NULL,
	apellido_5a          VARCHAR(250) NULL,
	apellido_5b          VARCHAR(250) NULL,
	genero_5             VARCHAR(250) NULL,
	fecha_nacimiento_5   DATE NULL,
	relacion_5           VARCHAR(250) NULL,
	otro_5               VARCHAR(250) NULL,
	tipo_identificacion_5 VARCHAR(250) NULL,
	numero_identificacion_5 VARCHAR(25) NULL,
    nombre_6a            VARCHAR(250) NULL,
	nombre_6b            VARCHAR(250) NULL,
	apellido_6a          VARCHAR(250) NULL,
	apellido_6b          VARCHAR(250) NULL,
	genero_6             VARCHAR(250) NULL,
	fecha_nacimiento_6   DATE NULL,
	relacion_6           VARCHAR(250) NULL,
	otro_6               VARCHAR(250) NULL,
	tipo_identificacion_6 VARCHAR(250) NULL,
	numero_identificacion_6 VARCHAR(25) NULL,
    nombre_7a            VARCHAR(250) NULL,
	nombre_7b            VARCHAR(250) NULL,
	apellido_7a          VARCHAR(250) NULL,
	apellido_7b          VARCHAR(250) NULL,
	genero_7             VARCHAR(250) NULL,
	fecha_nacimiento_7   DATE NULL,
	relacion_7           VARCHAR(250) NULL,
	otro_7               VARCHAR(250) NULL,
	tipo_identificacion_7 VARCHAR(250) NULL,
	numero_identificacion_7 VARCHAR(25) NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE integrantes
ADD PRIMARY KEY (id_integrantes);

ALTER TABLE integrantes
MODIFY id_integrantes INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE nutricion
(
	id_nutricion         INTEGER NOT NULL,
	alguien_de_su_hogar_esta_embarazada boolean NULL,
	tiempo_de_gestacion  VARCHAR(250) NULL,
	lleva_su_control_en_centro_de_salud boolean NULL,
	alguien_de_su_hogar_tiene_siguientes_condiciones VARCHAR(250) NULL,
	lactando_con_nn_menor_2_anios boolean NULL,
	no_lactando_con_nn_menor_2_anios boolean NULL,
	madre_nn_2_a_5_anios boolean NULL,
	ninguno              boolean NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE nutricion
ADD PRIMARY KEY (id_nutricion);

ALTER TABLE nutricion
MODIFY id_nutricion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE salud
(
	id_salud             INTEGER NOT NULL,
	algun_miembro_tiene_discapacidad VARCHAR(250) NULL,
	algun_miembro_tiene_problemas_salud VARCHAR(250) NULL,
	derivacion_salud     VARCHAR(250) NULL,
	derivacion_proteccion VARCHAR(250) NULL,
	id_beneficiario      INTEGER NULL
);

ALTER TABLE salud
ADD PRIMARY KEY (id_salud);

ALTER TABLE salud
MODIFY id_salud INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE estados
(
	id_estado            INTEGER NOT NULL,
	estado               VARCHAR(100) NULL
);

ALTER TABLE estados
ADD PRIMARY KEY (id_estado);

ALTER TABLE estados
MODIFY id_estado INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE estatus
(
	id_estatus           INTEGER NOT NULL,
	observaciones        VARCHAR(250) NULL,
	id_beneficiario      INTEGER NULL,
	id_estado            INTEGER NULL
);

ALTER TABLE estatus
ADD PRIMARY KEY (id_estatus);

ALTER TABLE estatus
MODIFY id_estatus INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE usuarios
(
	id_usuario		INTEGER NOT NULL,
	nombre_usuario	VARCHAR(50) NULL,
    correo 			VARCHAR(100) NULL,
	contrasenia	    VARCHAR(50) NULL,
    id_rol          INTEGER NULL,
	id_estado       INTEGER NULL
);

ALTER TABLE usuarios
ADD PRIMARY KEY (id_usuario);

ALTER TABLE usuarios
MODIFY id_usuario INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE roles
(
	id_rol           INTEGER NOT NULL,
	nombre_rol        VARCHAR(50) NULL
);

ALTER TABLE roles
ADD PRIMARY KEY (id_rol);

ALTER TABLE roles
MODIFY id_rol INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE acciones
(
	id_accion		INTEGER NOT NULL,
	id_entidad			INTEGER NOT NULL,
    id_beneficiario	INTEGER NOT NULL,
    fecha 		DATETIME NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE acciones
ADD PRIMARY KEY (id_accion);
ALTER TABLE acciones
MODIFY id_accion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE entidades
(
	id_entidad	INTEGER NOT NULL,
	nombre		VARCHAR(50) NULL    
);
ALTER TABLE entidades
ADD PRIMARY KEY (id_entidad);
ALTER TABLE entidades
MODIFY id_entidad INT NOT NULL AUTO_INCREMENT ;

/*********************************
-- CREACION DE LLAVES FORANEAS 
*********************************/

ALTER TABLE comunicacion
ADD FOREIGN KEY R_22 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE derivacion_sectores
ADD FOREIGN KEY R_20 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE educacion
ADD FOREIGN KEY R_21 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE encuesta
ADD FOREIGN KEY R_19 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE Integrantes
ADD FOREIGN KEY R_23 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE nutricion
ADD FOREIGN KEY R_24 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE salud
ADD FOREIGN KEY R_25 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE estatus
ADD FOREIGN KEY R_37 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);

ALTER TABLE estatus
ADD FOREIGN KEY R_38 (id_estado) REFERENCES estados (id_estado);

ALTER TABLE usuarios
ADD FOREIGN KEY R_39 (id_rol) REFERENCES roles (id_rol);
ALTER TABLE usuarios
ADD CONSTRAINT UC_usuarios UNIQUE (nombre_usuario);

ALTER TABLE acciones
ADD FOREIGN KEY R_40 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE acciones
ADD FOREIGN KEY R_41 (id_entidad) REFERENCES entidades (id_entidad);




