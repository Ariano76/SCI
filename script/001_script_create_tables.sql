USE bd_bha_sci;

-- ELIMINAR FOREIGN KEY Y CONSTRAINS
call DropFK();
call DropViews();

-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists encuesta;
DROP TABLE if exists derivacion_sectores;
DROP TABLE if exists educacion;
DROP TABLE if exists salud;
DROP TABLE if exists nutricion;
DROP TABLE if exists comunicacion;
DROP TABLE if exists integrantes;
DROP TABLE if exists estatus;
DROP TABLE if exists estados;
DROP TABLE if exists usuarios;
DROP TABLE if exists roles;
DROP TABLE if exists acciones;
DROP TABLE if exists entidades;
DROP TABLE if exists beneficiario;
DROP TABLE if exists stage_data_historica;
DROP TABLE if exists data_historica;
DROP TABLE if exists resultado_cotejo_datos_historicos;
DROP TABLE if exists beneficiario;
DROP TABLE if exists stage_00;

-- CREACION DE TABLAS

CREATE TABLE beneficiario
(	id_beneficiario      INTEGER NOT NULL,
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
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;  

ALTER TABLE beneficiario ADD PRIMARY KEY (id_beneficiario);
ALTER TABLE beneficiario MODIFY id_beneficiario INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE comunicacion
(	id_comunicacion      INTEGER NOT NULL,
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
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE comunicacion ADD PRIMARY KEY (id_comunicacion);
ALTER TABLE comunicacion MODIFY id_comunicacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE derivacion_sectores
(	id_derivacion INTEGER NOT NULL,
	interesado_participar_nutricion boolean NULL,
	interesado_participar_salud boolean NULL,
	interesado_participar_medios_vida boolean NULL,
	actividades_interesado_participar VARCHAR(250) NULL,
	interesado_entrenamiento_vocacional boolean NULL,
	interesado_emprendimiento boolean NULL,
	id_beneficiario INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE derivacion_sectores ADD PRIMARY KEY (id_derivacion);
ALTER TABLE derivacion_sectores MODIFY id_derivacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE educacion
(	id_educacion         INTEGER NOT NULL,
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
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE educacion ADD PRIMARY KEY (id_educacion);
ALTER TABLE educacion MODIFY id_educacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE encuesta
(	id_encuesta          INTEGER NOT NULL,
	fecha_encuesta       DATE NULL,
	id_encuestador       INTEGER NULL,
	nombre_encuestador   VARCHAR(250) NULL,
	region_encuestador   VARCHAR(100) NULL,
	como_realizo_encuesta VARCHAR(100) NULL,
	esta_de_acuerdo      boolean NULL,
	id_beneficiario      INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE encuesta ADD PRIMARY KEY (id_encuesta);
ALTER TABLE encuesta MODIFY id_encuesta INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE integrantes
(	id_integrantes       INTEGER NOT NULL,
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
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE integrantes ADD PRIMARY KEY (id_integrantes);
ALTER TABLE integrantes MODIFY id_integrantes INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE nutricion
(	id_nutricion         INTEGER NOT NULL,
	alguien_de_su_hogar_esta_embarazada boolean NULL,
	tiempo_de_gestacion  VARCHAR(250) NULL,
	lleva_su_control_en_centro_de_salud boolean NULL,
	alguien_de_su_hogar_tiene_siguientes_condiciones VARCHAR(250) NULL,
	lactando_con_nn_menor_2_anios boolean NULL,
	no_lactando_con_nn_menor_2_anios boolean NULL,
	madre_nn_2_a_5_anios boolean NULL,
	ninguno              boolean NULL,
	id_beneficiario      INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE nutricion ADD PRIMARY KEY (id_nutricion);
ALTER TABLE nutricion MODIFY id_nutricion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE salud
(	id_salud             INTEGER NOT NULL,
	algun_miembro_tiene_discapacidad VARCHAR(250) NULL,
	algun_miembro_tiene_problemas_salud VARCHAR(250) NULL,
	derivacion_salud     VARCHAR(250) NULL,
	derivacion_proteccion VARCHAR(250) NULL,
	id_beneficiario      INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE salud ADD PRIMARY KEY (id_salud);
ALTER TABLE salud MODIFY id_salud INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE estados
(	id_estado            INTEGER NOT NULL,
	estado               VARCHAR(100) NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE estados ADD PRIMARY KEY (id_estado);
ALTER TABLE estados MODIFY id_estado INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE estatus
(	id_estatus           INTEGER NOT NULL,
	observaciones        VARCHAR(250) NULL,
	id_beneficiario      INTEGER NULL,
	id_estado            INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE estatus ADD PRIMARY KEY (id_estatus);
ALTER TABLE estatus MODIFY id_estatus INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE usuarios
(	id_usuario		INTEGER NOT NULL,
	nombre_usuario	VARCHAR(50) NULL,
    correo 			VARCHAR(100) NULL,
	contrasenia	    VARCHAR(50) NULL,
    id_rol          INTEGER NULL,
	id_estado       INTEGER NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE usuarios ADD PRIMARY KEY (id_usuario);
ALTER TABLE usuarios MODIFY id_usuario INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE roles
(	id_rol           INTEGER NOT NULL,
	nombre_rol        VARCHAR(50) NULL
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  

ALTER TABLE roles ADD PRIMARY KEY (id_rol);
ALTER TABLE roles MODIFY id_rol INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE acciones
(	id_accion		INTEGER NOT NULL,
	id_entidad			INTEGER NOT NULL,
    id_beneficiario	INTEGER NOT NULL,
    fecha 		DATETIME NULL DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  
ALTER TABLE acciones ADD PRIMARY KEY (id_accion);
ALTER TABLE acciones MODIFY id_accion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE entidades
(	id_entidad	INTEGER NOT NULL,
	nombre		VARCHAR(50) NULL    
) DEFAULT CHARSET=utf8 COLLATE=latin1_spanish_ci;  
ALTER TABLE entidades ADD PRIMARY KEY (id_entidad);
ALTER TABLE entidades MODIFY id_entidad INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE stage_data_historica (
    id_stage_dh INTEGER NOT NULL,
    nombre_1 TEXT NULL,
    nombre_2 TEXT NULL,
    apellido_1 TEXT NULL,
    apellido_2 TEXT NULL,
    tipo_documento TEXT NULL,
    numero_documento TEXT NULL,
    proyecto TEXT NULL,
    cod_familia TEXT NULL,
    nom_usuario TEXT NULL
)  DEFAULT CHARSET=UTF8 COLLATE = UTF8_BIN;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE stage_data_historica ADD PRIMARY KEY (id_stage_dh);
ALTER TABLE stage_data_historica MODIFY id_stage_dh INT NOT NULL AUTO_INCREMENT;


CREATE TABLE data_historica
(	id_dh      INTEGER NOT NULL,
    nombre_1   TEXT NULL,
	nombre_2   TEXT NULL,
	apellido_1   TEXT NULL,
	apellido_2   TEXT NULL,
	beneficiario   TEXT NULL,    
	tipo_documento   TEXT NULL,
	numero_documento   TEXT NULL,
    proyecto	TEXT NULL,
    fecha date,
    cod_familia	TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin ENGINE=MyISAM;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE data_historica ADD PRIMARY KEY (id_dh);
ALTER TABLE data_historica MODIFY id_dh INT NOT NULL AUTO_INCREMENT;
ALTER TABLE data_historica ADD FULLTEXT idxFullText (beneficiario, numero_documento);


CREATE TABLE resultado_cotejo_datos_historicos
(	id_busqueda      INTEGER NOT NULL,
	id_cotejo      INTEGER NOT NULL,
    id_caso      INTEGER NOT NULL,
    id_resultado      INTEGER NOT NULL,
    tipo_busqueda   TEXT NULL,
    nombre_1   TEXT NULL,
	nombre_2   TEXT NULL,
	apellido_1   TEXT NULL,
	apellido_2   TEXT NULL,
	tipo_documento   TEXT NULL,
	numero_documento   TEXT NULL,
    cod_familia TEXT NULL,
    proyecto	TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */
ALTER TABLE resultado_cotejo_datos_historicos ADD PRIMARY KEY (id_cotejo);
ALTER TABLE resultado_cotejo_datos_historicos MODIFY id_cotejo INT NOT NULL AUTO_INCREMENT;



CREATE TABLE stage_00
(
	id_stage      INTEGER NOT NULL,
    dato_01   TEXT NULL,
dato_02   TEXT NULL,
dato_03   TEXT NULL,
dato_04   TEXT NULL,
dato_05   TEXT NULL,
dato_06   TEXT NULL,
dato_07   TEXT NULL,
dato_08   TEXT NULL,
dato_09   TEXT NULL,
dato_10   TEXT NULL,
dato_11   TEXT NULL,
dato_12   TEXT NULL,
dato_13   TEXT NULL,
dato_14   TEXT NULL,
dato_15   TEXT NULL,
dato_16   TEXT NULL,
dato_17   TEXT NULL,
dato_18   TEXT NULL,
dato_19   TEXT NULL,
dato_20   TEXT NULL,
dato_21   TEXT NULL,
dato_22   TEXT NULL,
dato_23   TEXT NULL,
dato_24   TEXT NULL,
dato_25   TEXT NULL,
dato_26   TEXT NULL,
dato_27   TEXT NULL,
dato_28   TEXT NULL,
dato_29   TEXT NULL,
dato_30   TEXT NULL,
dato_31   TEXT NULL,
dato_32   TEXT NULL,
dato_33   TEXT NULL,
dato_34   TEXT NULL,
dato_35   TEXT NULL,
dato_36   TEXT NULL,
dato_37   TEXT NULL,
dato_38   TEXT NULL,
dato_39   TEXT NULL,
dato_40   TEXT NULL,
dato_41   TEXT NULL,
dato_42   TEXT NULL,
dato_43   TEXT NULL,
dato_44   TEXT NULL,
dato_45   TEXT NULL,
dato_46   TEXT NULL,
dato_47   TEXT NULL,
dato_48   TEXT NULL,
dato_49   TEXT NULL,
dato_50   TEXT NULL,
dato_51   TEXT NULL,
dato_52   TEXT NULL,
dato_53   TEXT NULL,
dato_54   TEXT NULL,
dato_55   TEXT NULL,
dato_56   TEXT NULL,
dato_57   TEXT NULL,
dato_58   TEXT NULL,
dato_59   TEXT NULL,
dato_60   TEXT NULL,
dato_61   TEXT NULL,
dato_62   TEXT NULL,
dato_63   TEXT NULL,
dato_64   TEXT NULL,
dato_65   TEXT NULL,
dato_66   TEXT NULL,
dato_67   TEXT NULL,
dato_68   TEXT NULL,
dato_69   TEXT NULL,
dato_70   TEXT NULL,
dato_71   TEXT NULL,
dato_72   TEXT NULL,
dato_73   TEXT NULL,
dato_74   TEXT NULL,
dato_75   TEXT NULL,
dato_76   TEXT NULL,
dato_77   TEXT NULL,
dato_78   TEXT NULL,
dato_79   TEXT NULL,
dato_80   TEXT NULL,
dato_81   TEXT NULL,
dato_82   TEXT NULL,
dato_83   TEXT NULL,
dato_84   TEXT NULL,
dato_85   TEXT NULL,
dato_86   TEXT NULL,
dato_87   TEXT NULL,
dato_88   TEXT NULL,
dato_89   TEXT NULL,
dato_90   TEXT NULL,
dato_91   TEXT NULL,
dato_92   TEXT NULL,
dato_93   TEXT NULL,
dato_94   TEXT NULL,
dato_95   TEXT NULL,
dato_96   TEXT NULL,
dato_97   TEXT NULL,
dato_98   TEXT NULL,
dato_99   TEXT NULL,
dato_100   TEXT NULL,
dato_101   TEXT NULL,
dato_102   TEXT NULL,
dato_103   TEXT NULL,
dato_104   TEXT NULL,
dato_105   TEXT NULL,
dato_106   TEXT NULL,
dato_107   TEXT NULL,
dato_108   TEXT NULL,
dato_109   TEXT NULL,
dato_110   TEXT NULL,
dato_111   TEXT NULL,
dato_112   TEXT NULL,
dato_113   TEXT NULL,
dato_114   TEXT NULL,
dato_115   TEXT NULL,
dato_116   TEXT NULL,
dato_117   TEXT NULL,
dato_118   TEXT NULL,
dato_119   TEXT NULL,
dato_120   TEXT NULL,
dato_121   TEXT NULL,
dato_122   TEXT NULL,
dato_123   TEXT NULL,
dato_124   TEXT NULL,
dato_125   TEXT NULL,
dato_126   TEXT NULL,
dato_127   TEXT NULL,
dato_128   TEXT NULL,
dato_129   TEXT NULL,
dato_130   TEXT NULL,
dato_131   TEXT NULL,
dato_132   TEXT NULL,
dato_133   TEXT NULL,
dato_134   TEXT NULL,
dato_135   TEXT NULL,
dato_136   TEXT NULL,
dato_137   TEXT NULL,
dato_138   TEXT NULL,
dato_139   TEXT NULL,
dato_140   TEXT NULL,
dato_141   TEXT NULL,
dato_142   TEXT NULL,
dato_143   TEXT NULL,
dato_144   TEXT NULL,
dato_145   TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;  
/* AL UTILIZAR UTF8 Y UTO8_BIN PODEMOS DISTINGUIR ENTRE TILDES Y NO TILDES */

ALTER TABLE stage_00 ADD PRIMARY KEY (id_stage);
ALTER TABLE stage_00 MODIFY id_stage INT NOT NULL AUTO_INCREMENT;


/*********************************
-- CREACION DE LLAVES FORANEAS 
*********************************/

ALTER TABLE comunicacion ADD FOREIGN KEY R_22 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE derivacion_sectores ADD FOREIGN KEY R_20 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE educacion ADD FOREIGN KEY R_21 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE encuesta ADD FOREIGN KEY R_19 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE integrantes ADD FOREIGN KEY R_23 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE nutricion ADD FOREIGN KEY R_24 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE salud ADD FOREIGN KEY R_25 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE estatus ADD FOREIGN KEY R_37 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE estatus ADD FOREIGN KEY R_38 (id_estado) REFERENCES estados (id_estado);
ALTER TABLE usuarios ADD FOREIGN KEY R_39 (id_rol) REFERENCES roles (id_rol);
ALTER TABLE usuarios ADD CONSTRAINT UC_usuarios UNIQUE (nombre_usuario);
ALTER TABLE acciones ADD FOREIGN KEY R_40 (id_beneficiario) REFERENCES beneficiario (id_beneficiario);
ALTER TABLE acciones ADD FOREIGN KEY R_41 (id_entidad) REFERENCES entidades (id_entidad);

/* CREACION DE TRIGGERS */

drop trigger if exists logAcciones_1;
create trigger logAcciones_1 after update on beneficiario
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (1, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_2;
create trigger logAcciones_2 after update on comunicacion
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (2, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_3;
create trigger logAcciones_3 after update on derivacion_sectores
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (3, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_4;
delimiter ;
create trigger logAcciones_4 after update on educacion
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (4, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_5;
create trigger logAcciones_5 after update on encuesta
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (5, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_6;
create trigger logAcciones_6 after update on integrantes
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (6, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_7;
create trigger logAcciones_7 after update on nutricion
for each row 
  insert into acciones(id_enbeneficiariotidad, id_beneficiario) value (7, NEW.id_beneficiario);
delimiter ;
drop trigger if exists logAcciones_8;
create trigger logAcciones_8 after update on salud
for each row 
  insert into acciones(id_entidad, id_beneficiario) value (8, NEW.id_beneficiario);
delimiter ;

/*********************************
-- INSERTANDO DATOS BASICOS
*********************************/
insert into roles(nombre_rol) values('Administrador');
insert into roles(nombre_rol) values('Analista');

insert into estados (estado) values('VALIDO'),('INVALIDO'),('EN ESPERA');
insert into entidades (nombre) values('beneficiario'),('comunicacion'),('derivacion_sectores'),('educacion'),('encuesta'),('integrantes'),('nutricion'),('salud');

call SP_Usuario_Insert('Percy', 'PERCY@gmail.com', '123456', 1, 1, @total);
call SP_Usuario_Insert('Salvador', 'Salvador@gmail.com', '123456', 1, 1, @total);
call SP_Usuario_Insert('Ricardo', 'Ricardo@gmail.com', '123456', 1, 1, @total);
select @total;

/** creando usuario en BD **/
CREATE USER 'consulta'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON * . * TO 'consulta'@'localhost';
FLUSH PRIVILEGES;

SET @clave = password('123');
select @clave;
insert into usuarios(nombre_usuario, correo, contrasenia, id_rol, id_estado) values ('Salvador', 'PERCY@gmail.com', @clave, 1, 1);