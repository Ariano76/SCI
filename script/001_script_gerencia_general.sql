USE bd_bha_sci;

-- ELIMINAR TABLAS EXISTENTES
DROP TABLE if exists resultado_proyectos;
DROP TABLE if exists actividad;
DROP TABLE if exists adulto;
DROP TABLE if exists discapacidad;
DROP TABLE if exists genero;
DROP TABLE if exists gestante;
DROP TABLE if exists indigena;
DROP TABLE if exists nacionalidad;
DROP TABLE if exists region;
DROP TABLE if exists tipo_proyecto;
DROP TABLE if exists proyecto;
DROP TABLE if exists subtema;
DROP TABLE if exists tema;
DROP TABLE if exists tiempo_gestacion;
DROP TABLE if exists tipo_discapacidad;
DROP TABLE if exists tipo_documento;
DROP TABLE if exists tipo_organizacion;
DROP TABLE if exists responsable_registro;
DROP TABLE if exists stage_data_proyectos;
-- CREACION DE TABLAS

CREATE TABLE actividad
(
	id_actividad         INTEGER NOT NULL,
	nom_actividad        VARCHAR(250) NOT NULL,
	fecha_actividad		DATE NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE actividad ADD PRIMARY KEY (id_actividad);
ALTER TABLE actividad MODIFY id_actividad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE adulto
(
	id_adulto            INTEGER NOT NULL,
	nom_adulto           VARCHAR(50) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE adulto ADD PRIMARY KEY (id_adulto);
ALTER TABLE adulto MODIFY id_adulto INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE discapacidad
(
	id_discapacidad      INTEGER NOT NULL,
	nom_discapacidad     VARCHAR(50) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE discapacidad ADD PRIMARY KEY (id_discapacidad);
ALTER TABLE discapacidad MODIFY id_discapacidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE genero
(
	id_genero            INTEGER NOT NULL,
	nom_genero           VARCHAR(50) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE genero ADD PRIMARY KEY (id_genero);
ALTER TABLE genero MODIFY id_genero INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE gestante
(
	id_gestante          INTEGER NOT NULL,
	nom_gestante         VARCHAR(50) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE gestante ADD PRIMARY KEY (id_gestante);
ALTER TABLE gestante MODIFY id_gestante INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE indigena
(
	id_indigena          INTEGER NOT NULL,
	nom_indigena         VARCHAR(50) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE indigena ADD PRIMARY KEY (id_indigena);
ALTER TABLE indigena MODIFY id_indigena INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE nacionalidad
(
	id_nacionalidad      INTEGER NOT NULL,
	nom_nacionalidad     VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE nacionalidad ADD PRIMARY KEY (id_nacionalidad);
ALTER TABLE nacionalidad MODIFY id_nacionalidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_proyecto
(
	id_tipo_proyecto          INTEGER NOT NULL,
	nom_tipo_proyecto         VARCHAR(250) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tipo_proyecto ADD PRIMARY KEY (id_tipo_proyecto);
ALTER TABLE tipo_proyecto MODIFY id_tipo_proyecto INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE proyecto
(
	id_proyecto          INTEGER NOT NULL,
	nom_proyecto         VARCHAR(250) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE proyecto ADD PRIMARY KEY (id_proyecto);
ALTER TABLE proyecto MODIFY id_proyecto INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE region
(
	id_region          INTEGER NOT NULL,
	nom_region         VARCHAR(250) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE region ADD PRIMARY KEY (id_region);
ALTER TABLE region MODIFY id_region INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE subtema
(
	id_subtema           INTEGER NOT NULL,
	nom_subtema          VARCHAR(250) NOT NULL,
    id_tema              INTEGER NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE subtema ADD PRIMARY KEY (id_subtema);
ALTER TABLE subtema MODIFY id_subtema INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tema
(
	id_tema              INTEGER NOT NULL,
	nom_tema             VARCHAR(250) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tema ADD PRIMARY KEY (id_tema);
ALTER TABLE tema MODIFY id_tema INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tiempo_gestacion
(
	id_tiempo_gestacion  INTEGER NOT NULL,
	nom_tiempo_gestacion VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tiempo_gestacion ADD PRIMARY KEY (id_tiempo_gestacion);
ALTER TABLE tiempo_gestacion MODIFY id_tiempo_gestacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_discapacidad
(
	id_tipo_discapacidad INTEGER NOT NULL,
	nom_tipo_discapacidad VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tipo_discapacidad ADD PRIMARY KEY (id_tipo_discapacidad);
ALTER TABLE tipo_discapacidad MODIFY id_tipo_discapacidad INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_documento
(
	id_tipo_documento    INTEGER NOT NULL,
	nom_documento        VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tipo_documento ADD PRIMARY KEY (id_tipo_documento);
ALTER TABLE tipo_documento MODIFY id_tipo_documento INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE tipo_organizacion
(
	id_tipo_organizacion INTEGER NOT NULL,
	nom_tipo_organizacion VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE tipo_organizacion ADD PRIMARY KEY (id_tipo_organizacion);
ALTER TABLE tipo_organizacion MODIFY id_tipo_organizacion INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE responsable_registro
(
	id_persona_registro INTEGER NOT NULL,
	nom_persona_registro VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE responsable_registro ADD PRIMARY KEY (id_persona_registro);
ALTER TABLE responsable_registro MODIFY id_persona_registro INT NOT NULL AUTO_INCREMENT ;

CREATE TABLE resultado_proyectos
(
	id_resultado_proyectos INTEGER NOT NULL,
	fecha_entrada        DATE NULL,
	organizacion         CHAR(18) NULL,
	categoria            VARCHAR(250) NULL,
	anio                 INTEGER NULL,
	id_region            INTEGER NOT NULL,
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
	id_tipo_proyecto     INTEGER NULL,
    id_proyecto          INTEGER NULL,
	fecha_actividad      DATE NOT NULL,
	id_persona_registro	 INTEGER NULL,
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
	id_actividad         INTEGER NULL,
    anio_actividad         INTEGER NULL ,
    trimestre_actividad         INTEGER NULL 
) DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE resultado_proyectos ADD PRIMARY KEY (id_resultado_proyectos);
ALTER TABLE resultado_proyectos MODIFY id_resultado_proyectos INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE resultado_proyectos ADD INDEX idx_busqueda (id_proyecto,id_tema,id_subtema,id_actividad,id_region);

/* COMANDO PARA BORRAR INDICE 
ALTER TABLE resultado_proyectos DROP INDEX idx_busqueda;
*/


CREATE TABLE stage_data_proyectos
(
	id_stage_dp	INTEGER NOT NULL,
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
    dato_35   TEXT NULL
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin; 
ALTER TABLE stage_data_proyectos ADD PRIMARY KEY (id_stage_dp);
ALTER TABLE stage_data_proyectos MODIFY id_stage_dp INT NOT NULL AUTO_INCREMENT;


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
ALTER TABLE resultado_proyectos ADD FOREIGN KEY R_64 (id_proyecto) REFERENCES proyecto (id_proyecto);
ALTER TABLE subtema ADD FOREIGN KEY R_65 (id_tema) REFERENCES tema (id_tema);

/* COMANDO PARA BORRAR FOREIGN KEY Y PODER CREAR INDICES PARA ACELARAR CONSULTAS
ALTER TABLE resultado_proyectos DROP FOREIGN KEY R_64 ;
ALTER TABLE resultado_proyectos DROP FOREIGN KEY R_61 ;
ALTER TABLE resultado_proyectos DROP FOREIGN KEY R_62 ;
ALTER TABLE resultado_proyectos DROP FOREIGN KEY R_63 ;
*/

/*********************************
-- INSERTANDO DATOS BASICOS
*********************************/
insert into tipo_documento(nom_documento) values('DNI'),('Cédula'),('Carnet de extranjería'),('Carnet de refugio'),('Pasaporte'),('Otro'),('Ninguno'),('Desconocido');

insert into nacionalidad(nom_nacionalidad) values('Peruana'),('Venezolana'),('Otra');

insert into tipo_organizacion(nom_tipo_organizacion) values('Institución Intergubernamental'),('Gobierno'),('ONG Internacional'),('Sociedad Civil'),('Comunidad'),('Otro'),('Desconocido');

insert into genero (nom_genero) values('Femenino'),('Masculino'),('Otro');

insert into adulto (nom_adulto) values('Adultos (>=18)'),('Niños - Niñas (<18)');

insert into indigena (nom_indigena) values('Sí'),('No');

insert into discapacidad (nom_discapacidad) values('Sí'),('No'),('Desconocido'),('No reportado');

insert into gestante (nom_gestante) values('Sí'),('No');

insert into region (nom_region) values('Amazonas'),('Arequipa'),('Cajamarca'),('Huancavelica'),('Junín'),('La Libertad'),('Lambayeque'),('Lima'),('Loreto'),('Piura'),('San Martín'),('Tumbes');

insert into responsable_registro(nom_persona_registro) values('Yasmin Salinas'),('Jean Carlos Alejos'),('Cristian Castillo'),('Yanina Gonzales'),('Rosemarie Caldas'),('Diana Orellana'),('Jonatan Graus'),('Katherine Flores');

insert into tipo_discapacidad (nom_tipo_discapacidad) values('Física'),('Auditiva'),('Visual'),('Intelectual'),('Psicológica'),('Otro'),('Desconocido');

insert into tiempo_gestacion (nom_tiempo_gestacion) values('1 mes'),('2 meses'),('3 meses'),('4 meses'),('5 meses'),('6 meses'),('7 meses'),('8 meses'),('9 meses'),('Desconocido');

insert into tema (nom_tema) values('Child Protection'),('Education'),('Health and Nutrition'),('Child Rights Governance'),('Child Poverty');

insert into subtema (nom_subtema,id_tema) values('Appropriate care',1), ('Protection of children from violence',1), ('Child protection systems',1), ('Protection of children from harmful work',1), ('Other child protection',1), ('Early childhood care and development',2), ('Basic education',2), ('Other education',2), ('Maternal, neonatal and reproductive health',3), ('Child health',3), ('Maternal, infant and young child nutrition',3), ('Adolescent sexual and reproductive health',3), ('Water, sanitation and hygiene',3), ('HIV',3), ('Other health and nutrition',3), ('Good governance delivers childrens rights',4), ('Monitoring and demanding child rights with children',4), ('Public investment in children',4), ('Other child rights governance',4), ('Child-sensitive social protection',5), ('Food security and livelihoods',5),('Adolescent skills for successful transitions',5), ('Other child poverty',5);

insert into tipo_proyecto (nom_tipo_proyecto) values('Desarrollo'),('Emergencia'),('Ayuda Humanitaria');

insert into proyecto (nom_proyecto) values('Start Fund Amazonas'), ('Start Fund Herramientas Anticipatorias'), ('COVID-19 BHA (San Juan de Lurigancho, Lima)'), ('LACT'), ('BHA Migrantes'), ('BPRM Migrantes'), ('GIRD MMLN BHA'), ('GIRD MRNO BHA'), ('(+)Diversidad ECW'), ('Pooled Funds'), ('CHLOE'), ('Covid-19 Swiss Solidarity'), ('ECHO HI - 2020'), ('Niarchos'), ('Prevención De La Violencia Sexual En Entornos Virtuales (Sida)'), ('COVID-19 BHA (Lima y Piura)'), ('COVID-19 Global Central Fund');

insert into actividad (nom_actividad, fecha_actividad) values 
('Concurso de carteles sobre la prevención del embarazo adolescente. Fecha: 26/05/2019','2019-5-26'),
('Encuentro de Municipios Escolares y Diálogo con autoridades. Fecha: 21, 22 y 23/07/2019','2019-7-23'),
('Encuentro de Adolscentes de la Red Nacional Encuentro Macro Región Sur "Voces de adolescentes" - Red Nacional de Participación. Fecha: 24 y 25 de julio 2019','2019-7-25'),
('Foro Regional de Prevención de Embarazo en Adolescentes. Fecha: 20/09/2019','2019-9-20'),
('Diálogo de autoridades y representantes del CCONNA. Fecha: 19/11/2019','2019-11-19'),
('Taller sobre proyecto de vida. Fecha: 10/12/2019','2019-12-10'),
('Programa de formación para adolescentes. Fecha: 22/08/2019','2019-8-22'),
('Taller de capacitación sobre Protocoles de Atención en Casos de Violencia Escolar. Fecha: 6/12/2019','2019-12-6'),
('Reunión con Adolescentes de la Organización ADILIT. Fecha: 02/03/2020','2020-3-2'),
('Reunión de socialización del plan de trabajo. Fecha: 19/02/2020','2020-2-19'),
('Reunión con las autoridades educativas sobre el Programa de formación para adolescentes. Fecha: Marzo 2020','2020-3-30'),
('Programa de formación para adolescentes en la promoción de una vida saludable. Fecha: 05/03/2020','2020-3-5'),
('Presentación de resultados de estudio. Fecha: 6/11/2019','2019-11-6'),
('Presentación proyecto sesión de consejo. Fecha: 9/07/2019','2019-7-9'),
('Reunión para la difusión del spot. Fecha: 4/09/2019','2019-9-4'),
('Entrega de los kits Escolares. Fecha: 21/09/2020','2020-9-21'),
('I Conversatorio Virtual "Los adolescentes también somos urgentes". Fecha: 16/09/2020','2020-9-16'),
('Encuentro Macro Regional de Participación estudiantil Norte Centro -Red Nacional de Participación. Fecha: 24 y 25 de julio 2020','2020-7-25'),
('Taller virtual : "Aprende a conocer y regular tus emociones". Fecha: 16/10/2020','2020-10-16'),
('Foro Regional: Los Niños, Niñas y Adolescentes Conversamos y Proponemos. Fecha: 20/11/2020','2020-11-20'),
('5° Encuentro Nacional "Voces de Niños, Niñas y Adolescentes en la Pandemia - Violencia de Género". Fecha: 02/12/2020','2020-12-2'),
('Dialogo de los Adolescentes con los candidatos a la Presidencia de la República - Igualdad de Género en la escuela, desafio del Bicentenario". Fecha: 18/03/2021','2021-3-18'),
('Taller sobre Disciplina Positiva con los Agentes Comunitarios. Fecha: 08, 09 y 10 /03/2021','2021-3-10'),
('Nombre Entrega del Diario "El Futuro que yo quiero". Fecha: marzo y abril de 2021','2021-4-30'),
('Curso de formación virtual en Contenidos del diario el Futuro que yo Quiero. Fecha: Abril 2021','2021-4-30'),
('Curso de Formación Virtual para los Voluntarios. Fecha: 22, 29 de mayo y 05 de junio','1900-1-1'),
('Encuentro de Adolescentes ADILIT - Yauli. Fecha: 22 de junio','1900-1-1'),
('Taller con Madres Adolescentes sobre Disciplina Positiva y Nutrición y Cuidado de la Salud de los Niños.  Fecha: Abril y Mayo','1900-1-1'),
('Sesión 01: Curso de vida. Fecha: junio','1900-1-1'),
('Sesión 02: La adolescencia. Fecha: julio','1900-1-1'),
('Sesión 03: : Conociendo sobre mis vínculos afectivos y la reproducción. Fecha: julio','1900-1-1'),
('Docentes tutores participantes en el curso de formación replican las sesiones. Fecha: julio-setiembre','1900-1-1'),
('Sesión 04: Relaciones Intersonales libres de Violencia. Fecha: agosto','1900-1-1'),
('Sesión 05: Violencia basada en género. Fecha: agosto','1900-1-1'),
('Taller sobre Disciplina Positiva con las madres y padres de familia. Fecha: agosto y setiembre','1900-1-1'),
('Sesión 06: Nuevas masculinidades. Fecha: setiembre','1900-1-1'),
('I Diálogo Virtual de NNAs "Voces del Bicentenario". Fecha: 20 setiembre','1900-1-1'),
('Feria Informativa sobre la Prevención del Embarazo Adolescente. Fecha: setiembre','1900-1-1'),
('Curso virtual para facilitadores sobre Disciplina Positiva. Fecha: 27, 28 y 29 de setiembre (MIDIS)','1900-1-1'),
('Reunión con líderes comunitarios para promover el plan de prevención del embarazo adolescente. Fecha: 13 de setiembre','1900-1-1'),
('Taller de Violencia Basada en Género - docentes. Setiembre 2021','2021-9-30'),
('Sesión 07: Proyecto de vida. Fecha: 09/11/2021','2021-11-9'),
('Conversatorio virtual: “Niñas y adolescentes en la pandemia”. Fecha: 11 de noviembre','1900-1-1'),
('Curso virtual "La adolescencia, un reto para la salud pública”. Fecha: Diciembre-enero','1900-1-1'),
('Taller de elaboración del plan de prevención del embarazo adolescente con la ADILIT Yauli. Fecha: 21 y 28 de enero','1900-1-1'),
('Elaboración del plan de prevención del embarazo adolescente con las autoridades comunales. Fecha: 17, 18 y 24 de febero','1900-1-1'),
('Taller de prepación de los adolescentes de ADILIT-Yauli para el encuentro cn las autoridades y presentar el plan de prevención del embarazo. Fecha: 07 y 08 de marzo','1900-1-1'),
('Encuentro de los adolescentes con las autoridades para promover el plan de prevención del embarazo. Fecha: 10 de marzo','1900-1-1'),
('Taller sobre Disciplina Positiva. Fecha: 11 de marzo','1900-1-1'),
('Taller sobre Disciplina Positiva a los usuarios del Programa Juntos. Fecha: 16 y 17 de marzo','1900-1-1'),
('Taller de capacitación a los jueces de paz sobre prevencion y erradicación de la violencia. Fecha: 18 de marzo','1900-1-1'),
('Niños y Niñas menores de 36 meses. 31 Marzo: bebes de padres del taller de disciplina positiva.','1900-1-1'),
('Taller sobre Disciplina Positiva dirigido a los Actores Sociales de CUNA MAS. Fecha: 30 de marzo','1900-1-1'),
('Conversatorio Virtual "Retorno a una escuela segura y transformada". Fecha: 24 de marzo','1900-1-1'),
('Entrega de Kits a madres adole scentes (Calendario informativo sobre ley 29600,mochila abrazo y set de alimentación). Mes de marzo','1900-1-1');



/*********************************
-- CONSULTAR ESTRUCTURA DE TABLAS 
*********************************/
SHOW TABLE STATUS where name like 'resultado_proyectos';
DESCRIBE resultado_proyectos; -- LISTA TODAS LAS CARACTERISTICAS DE UNA TABLA

