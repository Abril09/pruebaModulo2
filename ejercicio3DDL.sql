CREATE TABLE calificacion (
    id      INTEGER
        CONSTRAINT nnc_rolv1_id NOT NULL,
    nombre  VARCHAR2(250)
);

ALTER TABLE calificacion ADD CONSTRAINT rolv1_pkv1 PRIMARY KEY ( id );

CREATE TABLE cine (
    id         INTEGER NOT NULL,
    nombre     VARCHAR2(250),
    direccion  VARCHAR2(400),
    telefono   INTEGER
);

ALTER TABLE cine ADD CONSTRAINT cine_pk PRIMARY KEY ( id );

CREATE TABLE descuentos (
    id                 INTEGER NOT NULL,
    funciones_id       INTEGER NOT NULL,
    tipodescuentos_id  INTEGER NOT NULL
);

ALTER TABLE descuentos ADD CONSTRAINT tipodescuentosv2_pk PRIMARY KEY ( id );

CREATE TABLE espectador (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(300),
    edad    INTEGER
);

ALTER TABLE espectador ADD CONSTRAINT espectador_pk PRIMARY KEY ( id );

CREATE TABLE funciones (
    id           INTEGER NOT NULL,
    fechayhora   TIMESTAMP,
    sala_id      INTEGER NOT NULL,
    pelicula_id  INTEGER NOT NULL
);

ALTER TABLE funciones ADD CONSTRAINT funciones_pk PRIMARY KEY ( id );

CREATE TABLE genero (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(200)
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( id );

CREATE TABLE idioma (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(250)
);

ALTER TABLE idioma ADD CONSTRAINT idioma_pk PRIMARY KEY ( id );

CREATE TABLE opinion (
    id               INTEGER NOT NULL,
    fecha            DATE,
    espectador_id    INTEGER NOT NULL,
    calificacion_id  INTEGER NOT NULL,
    funciones_id     INTEGER NOT NULL
);

ALTER TABLE opinion ADD CONSTRAINT opinion_pk PRIMARY KEY ( id );

CREATE TABLE pais (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(250)
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id );

CREATE TABLE pelicula (
    id                  INTEGER NOT NULL,
    titulo              VARCHAR2(200 CHAR),
    titulodistribucion  VARCHAR2(200 CHAR),
    año                 DATE,
    duracion            TIMESTAMP,
    url                 VARCHAR2(200),
    resumen             VARCHAR2(400),
    genero_id           INTEGER NOT NULL,
    pais_id             INTEGER NOT NULL,
    idioma_id           INTEGER NOT NULL,
    subtitulado         CHAR(1)
);

ALTER TABLE pelicula ADD CONSTRAINT pelicula_pk PRIMARY KEY ( id );

CREATE TABLE persona_pelicula (
    id       INTEGER NOT NULL,
    nombre   VARCHAR2(250),
    pais_id  INTEGER NOT NULL
);

ALTER TABLE persona_pelicula ADD CONSTRAINT persona_pk PRIMARY KEY ( id );

CREATE TABLE personajes (
    id           INTEGER
        CONSTRAINT nnc_rolv1_id NOT NULL,
    nombre       VARCHAR2(250),
    persona_id   INTEGER NOT NULL,
    pelicula_id  INTEGER NOT NULL
);

ALTER TABLE personajes ADD CONSTRAINT rolv1_pk PRIMARY KEY ( id );

CREATE TABLE reparto (
    id           INTEGER NOT NULL,
    persona_id   INTEGER NOT NULL,
    rol_id       INTEGER NOT NULL,
    pelicula_id  INTEGER NOT NULL
);

ALTER TABLE reparto ADD CONSTRAINT reparto_pk PRIMARY KEY ( id );

CREATE TABLE rol (
    id      INTEGER
        CONSTRAINT nnc_personav1_id NOT NULL,
    nombre  VARCHAR2(250)
);

ALTER TABLE rol ADD CONSTRAINT personav1_pk PRIMARY KEY ( id );

CREATE TABLE sala (
    id       INTEGER NOT NULL,
    nombre   VARCHAR2(100),
    cine_id  INTEGER NOT NULL,
    butacas  INTEGER
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( id );

CREATE TABLE tipodescuentos (
    id           INTEGER NOT NULL,
    descripcion  VARCHAR2(400),
    descuento    NUMBER
);

ALTER TABLE tipodescuentos ADD CONSTRAINT id_pk PRIMARY KEY ( id );

ALTER TABLE descuentos
    ADD CONSTRAINT descuentos_funciones_fk FOREIGN KEY ( funciones_id )
        REFERENCES funciones ( id );

ALTER TABLE descuentos
    ADD CONSTRAINT descuentos_tipodescuentos_fk FOREIGN KEY ( tipodescuentos_id )
        REFERENCES tipodescuentos ( id );

ALTER TABLE funciones
    ADD CONSTRAINT funciones_pelicula_fk FOREIGN KEY ( pelicula_id )
        REFERENCES pelicula ( id );

ALTER TABLE funciones
    ADD CONSTRAINT funciones_sala_fk FOREIGN KEY ( sala_id )
        REFERENCES sala ( id );

ALTER TABLE opinion
    ADD CONSTRAINT opinion_calificacion_fk FOREIGN KEY ( calificacion_id )
        REFERENCES calificacion ( id );

ALTER TABLE opinion
    ADD CONSTRAINT opinion_espectador_fk FOREIGN KEY ( espectador_id )
        REFERENCES espectador ( id );

ALTER TABLE opinion
    ADD CONSTRAINT opinion_funciones_fk FOREIGN KEY ( funciones_id )
        REFERENCES funciones ( id );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_genero_fk FOREIGN KEY ( genero_id )
        REFERENCES genero ( id );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_idioma_fk FOREIGN KEY ( idioma_id )
        REFERENCES idioma ( id );

ALTER TABLE pelicula
    ADD CONSTRAINT pelicula_pais_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id );

ALTER TABLE persona_pelicula
    ADD CONSTRAINT persona_pais_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id );

ALTER TABLE personajes
    ADD CONSTRAINT personajes_pelicula_fk FOREIGN KEY ( pelicula_id )
        REFERENCES pelicula ( id );

ALTER TABLE personajes
    ADD CONSTRAINT personajes_persona_fk FOREIGN KEY ( persona_id )
        REFERENCES persona_pelicula ( id );

ALTER TABLE reparto
    ADD CONSTRAINT reparto_pelicula_fk FOREIGN KEY ( pelicula_id )
        REFERENCES pelicula ( id );

ALTER TABLE reparto
    ADD CONSTRAINT reparto_persona_fk FOREIGN KEY ( persona_id )
        REFERENCES persona_pelicula ( id );

ALTER TABLE reparto
    ADD CONSTRAINT reparto_rol_fk FOREIGN KEY ( rol_id )
        REFERENCES rol ( id );

ALTER TABLE sala
    ADD CONSTRAINT sala_cine_fk FOREIGN KEY ( cine_id )
        REFERENCES cine ( id );





