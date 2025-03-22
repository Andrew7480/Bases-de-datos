-- XTablas
DROP TABLE tempMaxNumeroOfertas;
DROP TABLE tempMaxNumeroDemandas;
DROP TABLE tieneFotografia;
DROP TABLE interesEn;
DROP TABLE origenFondos;
DROP TABLE alertas;
DROP TABLE avisos;
DROP TABLE demandas;
DROP TABLE empresas;
DROP TABLE personasNaturales;
DROP TABLE contactos;
DROP TABLE fotografias;
DROP TABLE opcionesCredito;
DROP TABLE ofertas;
DROP TABLE usuarios;
DROP TABLE ubicaciones;


--Tablas

CREATE TABLE usuarios(
id VARCHAR (5) NOT NULL,
fechaRegistro TIMESTAMP NOT NULL,
correoElectronico VARCHAR(50) NOT NULL
);

CREATE TABLE contactos(
id VARCHAR(5) NOT NULL,
numeroContacto VARCHAR(10) NOT NULL
);

CREATE TABLE personasNaturales(
id VARCHAR (5) NOT NULL,
tipoDocumento VARCHAR(20) NOT NULL,
numeroDocumento VARCHAR(20) NOT NULL,
nombres VARCHAR(50) NOT NULL,
nacionalidad  VARCHAR(10)NOT NULL
);

CREATE TABLE empresas(
id VARCHAR(5) NOT NULL,
nit VARCHAR(12)NOT NULL,
razonSocial VARCHAR(100) NOT NULL,
representante VARCHAR(5)NOT NULL
);

CREATE TABLE ofertas(
numero NUMBER(9) NOT NULL,
fecha DATE NOT NULL,
direccion VARCHAR(50) NOT NULL,
tipoVivienda CHAR NOT NULL,
costo NUMBER(9) NOT NULL,
anexos XMLTYPE,
estado CHAR NOT NULL,
idUsuario VARCHAR(5) NOT NULL,
codigoUbicacion VARCHAR(11) NOT NULL
);

CREATE TABLE opcionesCredito(
numero NUMBER(9) NOT NULL,
plazo INT NOT NULL,
valorMensual NUMBER(9) NOT NULL
);

CREATE TABLE fotografias(
nombre VARCHAR(15) NOT NULL,
ruta VARCHAR(100) NOT NULL,
descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE tieneFotografia(
numero NUMBER(9) NOT NULL,
nombre VARCHAR(15) NOT NULL
);

CREATE TABLE demandas(
numero NUMBER(9) NOT NULL,
fecha DATE NOT NULL,
tipoVivienda CHAR NOT NULL,
maxCompra NUMBER(9) NOT NULL,
idUsuario VARCHAR(5) NOT NULL
);

CREATE TABLE origenFondos(
numero NUMBER(9) NOT NULL,
valor NUMBER(9) NOT NULL,
credito CHAR NOT NULL,
estaAprobado CHAR 
);

CREATE TABLE interesEn(
numero NUMBER(9) NOT NULL,
codigo VARCHAR(11) NOT NULL,
nivel CHAR NOT NULL 
);

CREATE TABLE ubicaciones(
codigo VARCHAR(11) NOT NULL,
latitud NUMBER(3) NOT NULL,
longitud NUMBER(3) NOT NULL,
ciudad VARCHAR(10) NOT NULL,
zona CHAR NOT NULL,
barrio VARCHAR(10) NOT NULL
);

CREATE TABLE avisos(
id VARCHAR(9) NOT NULL,
fechaCreacion DATE NOT NULL,
mensaje VARCHAR(200) NOT NULL,
estado VARCHAR(9) NOT NULL,
numero NUMBER(9) NOT NULL
);

CREATE TABLE alertas(
idAviso VARCHAR(9) NOT NULL,
estadoAlerta VARCHAR(6) NOT NULL,
dato XMLTYPE NOT NULL,
hora TIMESTAMP NOT NULL
);
















---PoblarOK (1)
---1

insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

insert into personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('U001', 'Cédula', '12345678', 'Juan Juanoso', 'Colombiano');

insert into empresas (id, nit,razonSocial, representante) 
VALUES ('U001', '123456789', 'Empresa Uno', 'U001');

insert into contactos (id, numeroContacto) 
VALUES ('U001','1040506789');

---2

insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (1,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into opcionesCredito (numero, plazo, valorMensual) 
VALUES (1, 12, 500);

insert into fotografias (nombre, ruta, descripcion)
VALUES ('Foto1', 'ruta de foto1', 'Descripción foto 1');

insert into tienefotografia (numero, nombre) 
VALUES (1, 'Foto1');

---3

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) VALUES ('UB001',12, -77, 'Bogotá', 'N', 'Barrio 3');

---4

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (1,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U001');

insert into origenFondos (numero, valor, credito, estaAprobado) 
VALUES (1,50000, 'T','T');

insert into interesEn(numero, codigo, nivel) 
VALUES (1, 'UB001','M');

--PoblarNoOK (2 y 3)
---No deberian y no deben

insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U002', '2024', 'usuario2@example.com');   --- no admite ese tipo de fecha

insert into personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad) 
VALUES ('U002', 'Cédula', '1236444', Null, 'Colombiano'); -- Nombre no debe ser nulo

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) 
VALUES ('UB002','12x', '-77y', 'Bogotá', 'N', 'Barrio 3'); --- La latitud y longitud deben ser numeros

---No deberian pero aun se permiten

-- maxCompra debe ser positivo

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (2,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',-10000,'U001');

-- Nivel debe ser segun el tipo asignado

insert into interesEn(numero, codigo, nivel) 
VALUES (1, 'UB002','X');

--correo deberia de tener un @ y minimo un punto

insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuari31examplecom');

--XPoblar

TRUNCATE TABLE tieneFotografia;
TRUNCATE TABLE interesEn;
TRUNCATE TABLE origenFondos;
TRUNCATE TABLE empresas;
TRUNCATE TABLE personasNaturales;
TRUNCATE TABLE contactos;
TRUNCATE TABLE fotografias;
TRUNCATE TABLE opcionesCredito;
TRUNCATE TABLE ofertas;
TRUNCATE TABLE ubicaciones;
TRUNCATE TABLE alertas;
TRUNCATE TABLE avisos;
TRUNCATE TABLE demandas;
TRUNCATE TABLE usuarios;











-- Atributos
-- Primarias

ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);

ALTER TABLE personasNaturales
ADD CONSTRAINT pk_personasNaturales PRIMARY KEY (id);

ALTER TABLE empresas
ADD CONSTRAINT pk_empresas PRIMARY KEY (id);

ALTER TABLE ofertas
ADD CONSTRAINT pk_ofertas PRIMARY KEY (numero);

ALTER TABLE fotografias
ADD CONSTRAINT pk_fotografias PRIMARY KEY (nombre);

ALTER TABLE opcionesCredito
ADD CONSTRAINT pk_opcionesCredito PRIMARY KEY (numero);

ALTER TABLE demandas
ADD CONSTRAINT pk_demandas PRIMARY KEY (numero);

ALTER TABLE origenFondos
ADD CONSTRAINT pk_origenFondos PRIMARY KEY (numero);

ALTER TABLE ubicaciones
ADD CONSTRAINT pk_ubicaciones PRIMARY KEY (codigo);

ALTER TABLE avisos
ADD CONSTRAINT pk_avisos PRIMARY KEY (id);

ALTER TABLE alertas
ADD CONSTRAINT pk_alertas PRIMARY KEY (idAviso);

-- Unicas

ALTER TABLE empresas
ADD CONSTRAINT uk_empresas_nit UNIQUE (nit);

-- Foraneas

ALTER TABLE contactos
ADD CONSTRAINT fk_contactos_usuarios FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE personasNaturales
ADD CONSTRAINT fk_personasNaturales_usuarios FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE empresas
ADD CONSTRAINT fk_empresas_usuarios FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE empresas
ADD CONSTRAINT fk_empresas_personasNaturales FOREIGN KEY (representante) REFERENCES personasNaturales(id);

ALTER TABLE ofertas
ADD CONSTRAINT fk_ofertas_usuarios FOREIGN KEY (idUsuario) REFERENCES usuarios(id);

ALTER TABLE ofertas
ADD CONSTRAINT fk_ofertas_ubicaciones FOREIGN KEY (codigoUbicacion) REFERENCES ubicaciones(codigo);

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_ofertas FOREIGN KEY (numero) REFERENCES ofertas(numero);

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_fotografias FOREIGN KEY (nombre) REFERENCES fotografias(nombre);

ALTER TABLE opcionesCredito
ADD CONSTRAINT fk_opcionesCredito_ofertas FOREIGN KEY (numero) REFERENCES ofertas(numero);

ALTER TABLE demandas
ADD CONSTRAINT fk_demandas_usuarios FOREIGN KEY (idUsuario) REFERENCES usuarios(id);

ALTER TABLE origenFondos
ADD CONSTRAINT fk_origenFondos_demandas FOREIGN KEY (numero) REFERENCES demandas(numero);

ALTER TABLE interesEn
ADD CONSTRAINT fk_interesEn_demandas FOREIGN KEY (numero) REFERENCES demandas(numero);

ALTER TABLE interesEn
ADD CONSTRAINT fk_interesEn_ubicaciones FOREIGN KEY (codigo) REFERENCES ubicaciones(codigo);
 
ALTER TABLE avisos
ADD CONSTRAINT fk_avisos_demandas FOREIGN KEY (numero) REFERENCES demandas(numero);

ALTER TABLE alertas
ADD CONSTRAINT fk_alertas_avisos FOREIGN KEY (idAviso) REFERENCES avisos(id);

-- Checks

ALTER TABLE usuarios
ADD CONSTRAINT ck_usuarios_correoElectronico CHECK (correoElectronico LIKE '%@%' AND correoElectronico LIKE '%.%');

ALTER TABLE ofertas
ADD CONSTRAINT ck_ofertas_tipoVivienda CHECK (tipoVivienda = 'C' OR tipoVivienda = 'A' OR tipoVivienda = 'B' OR tipoVivienda = 'F');

ALTER TABLE ofertas
ADD CONSTRAINT ck_ofertas_costo CHECK (costo > 0);

ALTER TABLE ofertas
ADD CONSTRAINT ck_ofertas_estado CHECK (estado = 'D' OR estado = 'N' OR estado = 'V');

ALTER TABLE opcionesCredito
ADD CONSTRAINT ck_opcionesCredito_valorMensual CHECK (valorMensual > 0);

ALTER TABLE opcionesCredito
ADD CONSTRAINT ck_opcionesCredito_plazo CHECK (plazo > 0);

ALTER TABLE demandas
ADD CONSTRAINT ck_demandas_tipoVivienda CHECK (tipoVivienda = 'C' OR tipoVivienda = 'A' OR tipoVivienda = 'B' OR tipoVivienda = 'F');

ALTER TABLE demandas
ADD CONSTRAINT ck_demandas_maxCompra CHECK (maxCompra > 0);

ALTER TABLE origenFondos
ADD CONSTRAINT ck_origenFondos_credito CHECK (credito = 'T' OR credito = 'F');

ALTER TABLE origenFondos
ADD CONSTRAINT ck_origenFondos_estaAprobado CHECK (estaAprobado = 'T' OR estaAprobado = 'F' OR estaAprobado = NULL); -- Puede indicar si el prestamo fue aprobado o no.

ALTER TABLE interesEn
ADD CONSTRAINT ck_interesEn_nivel CHECK (nivel = 'A' OR nivel = 'M' OR nivel = 'B');

ALTER TABLE ubicaciones
ADD CONSTRAINT ck_ubicaciones_zona CHECK (zona = 'N' OR zona = 'S' OR zona = 'O' OR zona = 'E');

ALTER TABLE avisos
ADD CONSTRAINT ck_avisos_estado CHECK (estado = 'enviada' OR estado = 'pendiente' OR estado = 'fallida');

ALTER TABLE alertas
ADD CONSTRAINT ck_alertas_estadoAlerta CHECK (estadoAlerta = 'basica' OR estadoAlerta = 'grave');


--Tuplas
-- Primarias

ALTER TABLE contactos
ADD CONSTRAINT pk_contactos PRIMARY KEY (id,numeroContacto);

ALTER TABLE tieneFotografia
ADD CONSTRAINT pk_tieneFotografia PRIMARY KEY (numero,nombre);

ALTER TABLE interesEn
ADD CONSTRAINT pk_interesEn PRIMARY KEY (numero,codigo);

-- Unicas 

ALTER TABLE personasNaturales
ADD CONSTRAINT uk_personasNaturales UNIQUE (tipoDocumento, numeroDocumento);









--Tuplasok
---1 Usuarios

insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

insert into personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('U001', 'Cédula', '1234567899', 'Juan Juanoso', 'Colombiano');

insert into empresas (id, nit,razonSocial, representante) 
VALUES ('U001', '123456789', 'Empresa Uno', 'U001');

insert into contactos (id, numeroContacto) 
VALUES ('U001','1040506789');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U004', TO_TIMESTAMP('2023-10-07 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario4@example.com');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('U004', 'Cédula', '34567890', 'Lucía Lucioso', 'Colombiana');

INSERT INTO empresas (id, nit, razonSocial, representante) 
VALUES ('U004', '246813579', 'Empresa Cuatro', 'U004');

INSERT INTO contactos (id, numeroContacto) 
VALUES ('U004', '1040506782');

---2 Ubicaciones

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) VALUES ('UB001',12, -77, 'Bogotá', 'N', 'Barrio 3');

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) VALUES ('UB004',12, 77, 'Cali', 'N', 'Barrio 7');

---3 Ofertas

insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (1,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (3,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into opcionesCredito (numero, plazo, valorMensual) 
VALUES (1, 12, 500);

insert into fotografias (nombre, ruta, descripcion)
VALUES ('Foto1', 'ruta de foto1', 'Descripción foto 1');

insert into tienefotografia (numero, nombre) 
VALUES (1, 'Foto1');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (2,TO_DATE('2024-01-04', 'YYYY-MM-DD'), 'Calle 2 # 2-2', 'A', 1500, '<record><nombre>Maria</nombre><numero>123</numero><url>http://example.com/photo.jpg</url></record>', 'N', 'U004', 'UB004');

INSERT INTO opcionesCredito (numero, plazo, valorMensual) 
VALUES (2, 24, 600);

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('Foto2', 'ruta de foto2', 'Descripción foto 2');

INSERT INTO tienefotografia (numero, nombre) 
VALUES (2, 'Foto2');

---4 Demandas

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (1,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U001');

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (3,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U004');

insert into origenFondos (numero, valor, credito, estaAprobado) 
VALUES (1,50000, 'T','T');

insert into interesEn(numero, codigo, nivel) 
VALUES (1, 'UB001','M');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (2,TO_DATE('2023-04-10', 'YYYY-MM-DD'), 'A', 20000, 'U004');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado) 
VALUES (2, 60000, 'F', 'F');

INSERT INTO interesEn (numero, codigo, nivel) 
VALUES (2, 'UB004', 'B');

---5 Avisos

INSERT INTO avisos (id, fechaCreacion, mensaje, estado, numero) 
VALUES ('Aviso1',TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'No se pudo procesar la demanda','enviada', 1);
INSERT INTO alertas (idAviso, estadoAlerta, dato, hora) 
VALUES ('Aviso1','basica','<alerta><tipo>error</tipo><mensaje>Se ha producido un error en el sistema.</mensaje><fecha>2024-01-01T14:30:00</fecha><prioridad>alta</prioridad></alerta>',TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'));

--PoblarNoOK

-- inserciones probadas anteriormente que funcionaron pero no deberian funcionar

insert into demandas (fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',-10000,'U001'); -- ck_demandas_maxcompra

insert into interesEn(numero, codigo, nivel) 
VALUES (1, 'UB002','X'); -- Ck_Interesen_Nivel

insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuari31examplecom'); -- ck_usuarios_correoElectronico

--Nuevas inserciones no posibles

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES ('20/12/1999', 'C', 100000, 3); -- fk_demandas_idusuario

INSERT INTO ubicaciones 
VALUES ('1', 100, 200, 'Bogotá', 'Z', 'Suba'); -- ck_ubicaciones_zona

INSERT INTO usuarios
VALUES ('1', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Daniel@gmailcom'); -- ck_usuarios_correoelectronico



------------------------------------------
--TuplasNoOk
INSERT INTO usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1example.com'); -- Falta '@' en el correo

INSERT INTO contactos (id, numeroContacto) 
VALUES ('C001', '1234567890'); -- NúmeroContacto demasiado largo

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad) 
VALUES ('P001', 'Cédula', '12345678', '', 'Colombiano'); -- Nombres nulos

INSERT INTO empresas (id, nit, razonSocial, representante) 
VALUES ('E001', '1234789', 'Empresa Uno', 'XYZ'); -- No tiene un representante y su id no existe en usuarios

INSERT INTO ofertas (numero, fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'X', 1000, NULL, 'D', 'U001', 'UB001'); -- tipoVivienda no válido

INSERT INTO opcionesCredito (numero, plazo, valorMensual) 
VALUES (3, -12, 500); -- Plazo negativo

INSERT INTO demandas (numero, fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'D', 10000, 'U001'); -- tipoVivienda no válido

INSERT INTO origenFondos (numero, valor, credito, estaAprobado) 
VALUES (1, 50000, 'X', 'T'); -- crédito no válido

INSERT INTO interesEn (numero, codigo, nivel) 
VALUES (1, 'UB001', 'Z'); -- Nivel no válido

--Xdatos

TRUNCATE TABLE tieneFotografia;
TRUNCATE TABLE interesEn;
TRUNCATE TABLE origenFondos;
TRUNCATE TABLE alertas;
TRUNCATE TABLE avisos;
TRUNCATE TABLE demandas;
TRUNCATE TABLE empresas;
TRUNCATE TABLE personasNaturales;
TRUNCATE TABLE contactos;
TRUNCATE TABLE fotografias;
TRUNCATE TABLE opcionesCredito;
TRUNCATE TABLE ofertas;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE ubicaciones;


-- PoblarOK

-- Poblando GC ubicaciones
-- Poblando ubicaciones

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD001', 101.5, 35.2, 'Ciudad1', 'N', 'Barrio1');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD002', 120.7, 40.3, 'Ciudad2', 'S', 'Barrio2');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD003', 110.0, 25.5, 'Ciudad3', 'O', 'Barrio3');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD004', 130.2, 15.8, 'Ciudad4', 'E', 'Barrio4');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD005', 150.3, 32.1, 'Ciudad5', 'N', 'Barrio5');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD006', 160.6, 28.9, 'Ciudad6', 'S', 'Barrio6');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD007', 175.4, 38.0, 'Ciudad7', 'O', 'Barrio7');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD008', 180.1, 45.7, 'Ciudad8', 'E', 'Barrio8');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD009', 190.8, 55.3, 'Ciudad9', 'N', 'Barrio9');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('COD010', 200.4, 60.1, 'Ciudad10', 'S', 'Barrio10');

-- Poblando GC usuarios

-- Poblando usuarios

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR01', TO_DATE('2024-10-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR02', TO_DATE('2024-10-02 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario2@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR03', TO_DATE('2024-10-03 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario3@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR04', TO_DATE('2024-10-04 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario4@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR05', TO_DATE('2024-10-05 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario5@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR06', TO_DATE('2024-10-06 12:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario6@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR07', TO_DATE('2024-10-07 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario7@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR08', TO_DATE('2024-10-08 13:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario8@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR09', TO_DATE('2024-10-09 16:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario9@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('USR10', TO_DATE('2024-10-10 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario10@example.com');

-- Poblando contactos

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR01', '1234567890');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR02', '0987654321');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR03', '1357924680');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR04', '2468013579');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR05', '9876543210');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR06', '5555555555');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR07', '4444444444');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR08', '3333333333');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR09', '2222222222');

INSERT INTO contactos (id, numeroContacto)
VALUES ('USR10', '1111111111');

-- Poblando personasNaturales

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('USR01', 'Cédula', '12345678', 'Juan Pérez', 'Colombiana');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('USR02', 'Cédula', '87654321', 'Ana Gómez', 'Colombiana');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('USR03', 'Pasaporte', 'A1234567', 'Carlos Ruiz', 'Mexicana');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('USR04', 'Cédula', '23456789', 'Laura Martínez', 'Colombiana');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('USR05', 'Pasaporte', 'B9876543', 'Luis Fernández', 'Colombiana');

-- Poblando empresas

INSERT INTO empresas (id, nit, razonSocial, representante)
VALUES ('USR06', 'NIT123456', 'Empresa Uno S.A.S.', 'USR01');

INSERT INTO empresas (id, nit, razonSocial, representante)
VALUES ('USR07', 'NIT987654', 'Empresa Dos S.A.S.', 'USR02');

INSERT INTO empresas (id, nit, razonSocial, representante)
VALUES ('USR08', 'NIT111222', 'Empresa Tres S.A.S.', 'USR03');

INSERT INTO empresas (id, nit, razonSocial, representante)
VALUES ('USR09', 'NIT333444', 'Empresa Cuatro S.A.S.', 'USR01');

INSERT INTO empresas (id, nit, razonSocial, representante)
VALUES ('USR10', 'NIT555666', 'Empresa Cinco S.A.S.', 'USR02');

-- Poblando GC demandas

-- Poblando demandas

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (1,TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'A', 180000, 'USR01');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (2,TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'C', 220000, 'USR02');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (3,TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'B', 300000, 'USR03');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (4,TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'F', 150000, 'USR04');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (5,TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'A', 275000, 'USR05');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (6,TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'C', 195000, 'USR06');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (7,TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'B', 250000, 'USR07');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (8,TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'F', 220000, 'USR08');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (9,TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'A', 185000, 'USR09');

INSERT INTO demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (10,TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'C', 210000, 'USR10');

-- Poblando origenFondos

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (1, 50000, 'T', 'T');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (2, 75000, 'F', NULL);

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (3, 120000, 'T', 'F');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (4, 30000, 'F', 'F');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (5, 45000, 'T', NULL);

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (6, 20000, 'F', 'T');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (7, 100000, 'T', NULL);

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (8, 85000, 'F', 'F');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (9, 90000, 'T', 'T');

INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
VALUES (10, 60000, 'F', NULL);

-- Poblando interesEn

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (1, 'COD001', 'A');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (2, 'COD002', 'M');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (3, 'COD003', 'B');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (4, 'COD004', 'A');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (5, 'COD005', 'M');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (6, 'COD006', 'B');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (7, 'COD007', 'A');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (8, 'COD008', 'M');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (9, 'COD009', 'B');

INSERT INTO interesEn (numero, codigo, nivel)
VALUES (10, 'COD010', 'A');

-- Poblando GC ofertas

-- Poblando ofertas 

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (1,TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Calle 123', 'A', 150000, NULL, 'D', 'USR01', 'COD001');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (2,TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'Avenida 456', 'C', 200000, XMLTYPE('<anexo><nombre>Anexo1</nombre><numero>001</numero><url>http://example.com/anexo1</url></anexo>'), 'N', 'USR02', 'COD002');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (3,TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'Plaza Central', 'B', 250000, XMLTYPE('<anexo><nombre>Anexo2</nombre><numero>002</numero><url>http://example.com/anexo2</url></anexo>'), 'V', 'USR03', 'COD003');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (4,TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'Calle Falsa 123', 'F', 180000, NULL, 'D', 'USR04', 'COD004');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (5,TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'Avenida Siempre Viva', 'A', 300000, XMLTYPE('<anexo><nombre>Anexo3</nombre><numero>003</numero><url>http://example.com/anexo3</url></anexo>'), 'N', 'USR05', 'COD005');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (6,TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Calle del Sol', 'C', 220000, NULL, 'V', 'USR06', 'COD006');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (7,TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'Calle Luna', 'B', 190000, XMLTYPE('<anexo><nombre>Anexo4</nombre><numero>004</numero><url>http://example.com/anexo4</url></anexo>'), 'D', 'USR03', 'COD007');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (8,TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'Calle de la Paz', 'F', 210000, NULL, 'N', 'USR08', 'COD008');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (9,TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Avenida Libertad', 'A', 175000, XMLTYPE('<anexo><nombre>Anexo5</nombre><numero>005</numero><url>http://example.com/anexo5</url></anexo>'), 'V', 'USR05', 'COD009');

INSERT INTO ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (10,TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Calle Victoria', 'C', 230000, XMLTYPE('<anexo><nombre>Anexo6</nombre><numero>006</numero><url>http://example.com/anexo6</url></anexo>'), 'D', 'USR10', 'COD010');

-- Poblando opcionCredito

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (1, 12, 3000);

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (3, 36, 2600);

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (5, 60, 2400);

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (6, 72, 2300);

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (8, 96, 2100);

INSERT INTO opcionesCredito (numero, plazo, valorMensual)
VALUES (10, 120, 1900);

-- Poblando fotografias 

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto1', 'www.ejemplo1.com/imagen1.jpg', 'Descripción de la foto 1');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto2', 'www.ejemplo2.com/imagen2.jpg', 'Descripción de la foto 2');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto3', 'www.ejemplo3.com/imagen3.jpg', 'Descripción de la foto 3');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto4', 'www.ejemplo4.com/imagen4.jpg', 'Descripción de la foto 4');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto5', 'www.ejemplo5.com/imagen5.jpg', 'Descripción de la foto 5');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto6', 'www.ejemplo6.com/imagen6.jpg', 'Descripción de la foto 6');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto7', 'www.ejemplo7.com/imagen7.jpg', 'Descripción de la foto 7');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto8', 'www.ejemplo8.com/imagen8.jpg', 'Descripción de la foto 8');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto9', 'www.ejemplo9.com/imagen9.jpg', 'Descripción de la foto 9');

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto10', 'www.ejemplo10.com/imagen10.jpg', 'Descripción de la foto 10');

-- Poblando tieneFotografia

INSERT INTO tieneFotografia (numero, nombre)
VALUES (1, 'foto1');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (2, 'foto2');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (4, 'foto4');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (5, 'foto5');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (6, 'foto6');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (7, 'foto7');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (9, 'foto9');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (10, 'foto10');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (3, 'foto3');

INSERT INTO tieneFotografia (numero, nombre)
VALUES (1, 'foto3');

-- Consultas

-- <Consultar los usuarios con la mayor cantidad de ofertas disponibles>

SELECT id, COUNT(*) AS ofertas_Vendedor
FROM usuarios us
JOIN ofertas ofr ON ofr.idUsuario = us.id
GROUP BY us.id
ORDER BY ofertas_Vendedor DESC ;

-- <Consultar las ofertas con un costo menor a 1000000, que tenga una latitud igual a 200 y este en la ciudad de Bogotá>

SELECT *
FROM ofertas ofr
JOIN ubicaciones ub ON ub.codigo = ofr.codigoUbicacion
WHERE (costo < 1000000) and (latitud = 200) AND (ciudad = 'Bogotá');

--Xdatos

TRUNCATE TABLE tieneFotografia;
TRUNCATE TABLE interesEn;
TRUNCATE TABLE origenFondos;
TRUNCATE TABLE alertas;
TRUNCATE TABLE avisos;
TRUNCATE TABLE demandas;
TRUNCATE TABLE fotografias;
TRUNCATE TABLE opcionesCredito;
TRUNCATE TABLE ofertas;








-- Acciones

ALTER TABLE opcionesCredito
DROP CONSTRAINT fk_opcionesCredito_ofertas;

ALTER TABLE tieneFotografia
DROP CONSTRAINT fk_tieneFotografia_ofertas;

ALTER TABLE tieneFotografia
DROP CONSTRAINT fk_tieneFotografia_fotografias;

ALTER TABLE origenFondos
DROP CONSTRAINT fk_origenFondos_demandas;

ALTER TABLE avisos
DROP CONSTRAINT fk_avisos_demandas;

ALTER TABLE alertas
DROP CONSTRAINT fk_alertas_avisos;


ALTER TABLE opcionesCredito
ADD CONSTRAINT fk_opcionesCredito_ofertas FOREIGN KEY (numero) REFERENCES ofertas(numero) ON DELETE CASCADE;

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_ofertas FOREIGN KEY (numero) REFERENCES ofertas(numero) ON DELETE CASCADE;

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_fotografias FOREIGN KEY (nombre) REFERENCES fotografias(nombre) ON DELETE CASCADE;

ALTER TABLE origenFondos
ADD CONSTRAINT fk_origenFondos_demandas FOREIGN KEY (numero) REFERENCES demandas(numero) ON DELETE CASCADE;

ALTER TABLE avisos
ADD CONSTRAINT fk_avisos_demandas FOREIGN KEY (numero) REFERENCES demandas(numero) ON DELETE CASCADE;

ALTER TABLE alertas
ADD CONSTRAINT fk_alertas_avisos FOREIGN KEY (idAviso) REFERENCES avisos(id) ON DELETE CASCADE;

--- no se pone la accion de eliminar con cascade los que referencien  en interesEn por la condicion impuesta en el astah y no se puede poner NO ACTION como accion en oracle











-- AccionesOK
--

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('U001', TO_DATE('2024-10-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
VALUES ('U004', TO_DATE('2024-10-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

INSERT INTO ubicaciones (codigo, latitud, longitud, ciudad, zona, barrio)
VALUES ('UB001', 101.5, 35.2, 'Ciudad1', 'N', 'Barrio1');

insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (24,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

INSERT INTO opcionesCredito (numero, plazo, valorMensual) 
VALUES (24, 12, 500);  
select * from ofertas where numero=24; select * from opcionesCredito where numero = 24;


DELETE FROM ofertas WHERE numero = 24;

select * from ofertas where numero=24; select * from opcionesCredito where numero = 24;

--

insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (24,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into fotografias (nombre, ruta, descripcion)
VALUES ('Foto3', 'ruta de foto5', 'Descripción foto 3');

insert into tienefotografia (numero, nombre) 
VALUES (24, 'Foto3');

select * from ofertas where numero=24; select * from fotografias where nombre = 'Foto3'; select * from tieneFotografia where numero=24;

DELETE FROM OFERTAS WHERE numero=24; DELETE FROM fotografias WHERE nombre = 'Foto3';

select * from ofertas where numero=24; select * from fotografias where nombre = 'Foto3'; select * from tieneFotografia where numero=24;

---

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (24,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U004');

insert into origenFondos (numero, valor, credito, estaAprobado) 
VALUES (24,50000, 'T','T');

DELETE FROM demandas WHERE numero = 24;
select * from origenFondos where numero =24;

--

insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (5,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U004');

INSERT INTO avisos (id, fechaCreacion, mensaje, estado, numero) 
VALUES ('Aviso2',TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'No se pudo procesar la demanda','enviada', 5);

INSERT INTO alertas (idAviso, estadoAlerta, dato, hora) 
VALUES ('Aviso2','basica','<alerta><tipo>error</tipo><mensaje>Se ha producido un error en el sistema.</mensaje><fecha>2024-01-01T14:30:00</fecha><prioridad>alta</prioridad></alerta>',TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'));

DELETE FROM demandas where numero =5;
select * from avisos where numero=5; select * from alertas where idAviso = 'Aviso2';










-- Disparadores



-- Mantener Oferta

CREATE GLOBAL TEMPORARY TABLE tempMaxNumeroOfertas (
    maxNumero NUMBER
) ON COMMIT DELETE ROWS;


CREATE OR REPLACE TRIGGER TR_ofertas_insert
BEFORE INSERT ON ofertas
FOR EACH ROW 
DECLARE cantidad_ofertas NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO cantidad_ofertas
    FROM ofertas;
    
    :NEW.numero := cantidad_ofertas;
    :NEW.fecha := SYSDATE;
    :NEW.estado := 'D'; -- El número, fecha y estado de la oferta es autogenerado
    

END TR_ofertas_insert;
/

CREATE OR REPLACE TRIGGER TR_OFERTAS_INSERT_AFTER
AFTER INSERT ON ofertas
FOR EACH ROW
--DECLARE cantidad NUMBER(9);
BEGIN 
    --SELECT COUNT(*)+1 INTO cantidad
    --FROM opcionescredito;
    INSERT INTO opcionesCredito
    VALUES (:NEW.numero, 12, (1.1*:NEW.costo)/12); --Se asume que todas las viviendas tienen una opción de crédito a 12 meses con cuotas mensuales equivalentes al costo más 10% dividido en 12.
END TR_OFERTAS_INSERT_AFTER;
/

CREATE OR REPLACE TRIGGER TR_ofertas_update
BEFORE UPDATE ON ofertas
FOR EACH ROW 
BEGIN 

    IF ((:NEW.numero != :OLD.numero) OR (:NEW.fecha != :OLD.fecha) OR (:NEW.direccion != :OLD.direccion) OR (:NEW.tipoVivienda != :OLD.tipoVivienda) OR (:NEW.costo != :OLD.costo) OR (:NEW.estado != :OLD.estado) OR (:NEW.idUsuario != :OLD.idUsuario) OR (:NEW.codigoUbicacion != :OLD.codigoUbicacion)) THEN 
    RAISE_APPLICATION_ERROR (-20001, 'No puedes actualizar algo en esta tabla que no sea anexos');
    END IF; -- Solo se pueden modificar los anexos, las fotografías y la opción de crédito
    
END TR_ofertas_update;
/

CREATE OR REPLACE TRIGGER TR_opcionesCredito_update
BEFORE UPDATE ON opcionesCredito
FOR EACH ROW 
DECLARE costoOferta NUMBER(9);
BEGIN 
     
    IF ((:NEW.numero != :OLD.numero)) THEN 
    RAISE_APPLICATION_ERROR (-20004, 'No puedes modificar el numero en esta tabla');
    END IF;  -- Se puede modificar las condiciones
    
    SELECT costo INTO costoOferta
    FROM ofertas
    WHERE numero = :NEW.numero;
    
    IF costoOferta > ((:NEW.plazo)*(:NEW.valorMensual)) THEN
    RAISE_APPLICATION_ERROR (-20005, 'La cuota por el numero de meses es menor al costo de la oferta');
    END IF; -- Se puede modificar las condiciones. Las cuotas por el número de meses debe ser mayor o igual al costo 
    
END TR_opcionesCredito_update;
/

CREATE OR REPLACE TRIGGER store_max_id_ofertas
BEFORE DELETE ON ofertas 
BEGIN

    DELETE FROM tempMaxNumeroOfertas;
    INSERT INTO tempMaxNumeroOfertas(maxNumero)
    SELECT MAX(numero) FROM ofertas;
    
END store_max_id_ofertas;
/

CREATE OR REPLACE TRIGGER TR_ofertas_delete
BEFORE DELETE ON ofertas
FOR EACH ROW 
DECLARE cantidad_ofertas NUMBER(9);
BEGIN 

    SELECT maxNumero INTO cantidad_ofertas
    FROM tempMaxNumeroOfertas;
    
    IF  :OLD.numero != cantidad_ofertas THEN
    RAISE_APPLICATION_ERROR (-20009, 'La fila que intentas eliminar no es la ultima'); -- Una oferta puede ser eliminada siempre y cuando sea la última
    END IF;
    
END TR_ofertas_delete; 
/




--Registrar Demanda

CREATE GLOBAL TEMPORARY TABLE tempMaxNumeroDemandas (
    maxNumero NUMBER
) ON COMMIT DELETE ROWS;

CREATE OR REPLACE TRIGGER TR_demandas_insert
BEFORE INSERT ON demandas
FOR EACH ROW 
DECLARE cantidad_demandas NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO cantidad_demandas
    FROM demandas;
    
    
    :NEW.numero := cantidad_demandas;
    :NEW.fecha := SYSDATE; -- El número y la fecha se generan automáticamente
    
    IF :NEW.tipoVivienda IS NULL THEN
    :NEW.tipoVivienda := 'C'; -- Si no se indica el tipo de vivienda, se asume que es casa.
    END IF;
    
END TR_demandas_insert;
/
CREATE OR REPLACE TRIGGER TR_origenFondos_verificar
AFTER INSERT ON demandas
FOR EACH ROW

BEGIN


    INSERT INTO origenFondos (numero, valor, credito, estaAprobado)
    VALUES (:NEW.numero, :NEW.maxCompra, 'T', NULL);
    
END TR_origenFondos_verificar;
/


CREATE OR REPLACE TRIGGER TR_interesEn_update
BEFORE UPDATE ON interesEn
FOR EACH ROW 
--
DECLARE cantidad_avisos NUMBER(9);
--
BEGIN 
    --
    SELECT COUNT(*)+1 INTO cantidad_avisos
    FROM avisos;
    INSERT INTO avisos (id,fechaCreacion,mensaje, estado, numero)
    VALUES (cantidad_avisos,SYSDATE,'Se ha intentado actualizar  los intereses', 'enviada', :NEW.numero);
    --
    RAISE_APPLICATION_ERROR (-20007, 'No puedes actualizar valores de esta tabla'); -- No puede modificar ubicaciones de interés
    
END TR_interesEn_update;
/

CREATE OR REPLACE TRIGGER TR_interesEn_delete
BEFORE DELETE ON interesEn
FOR EACH ROW
--
DECLARE cantidad_avisos NUMBER(9);
--
BEGIN
    --
    BEGIN
    
    SELECT COUNT(*)+1 INTO cantidad_avisos
    FROM avisos;
    INSERT INTO avisos (id,fechaCreacion,mensaje, estado, numero)
    VALUES (cantidad_avisos,SYSDATE,'Se ha intentado eliminar  los intereses', 'enviada', :OLD.numero);  
    --
    END;


    RAISE_APPLICATION_ERROR (-20008, 'No puedes eliminar valores de esta tabla'); -- No puede eliminar ubicaciones de interés
    
END TR_interesEn_delete;
/

CREATE OR REPLACE TRIGGER store_max_id_demandas
BEFORE DELETE ON demandas 
BEGIN
    DELETE FROM tempMaxNumeroDemandas; -- Asegúrate de limpiar datos previos
    INSERT INTO tempMaxNumeroDemandas(maxNumero)
    SELECT MAX(numero) FROM demandas;
END store_max_id;
/

CREATE OR REPLACE TRIGGER TR_demandas_delete
BEFORE DELETE ON demandas
FOR EACH ROW 
DECLARE cantidad_demandas NUMBER(9);
BEGIN 

    SELECT maxNumero INTO cantidad_demandas
    FROM tempMaxNumeroDemandas ;
    
    IF  :OLD.numero != cantidad_demandas THEN
    RAISE_APPLICATION_ERROR (-20009, 'La fila que intentas eliminar no es la ultima'); -- Únicamente se pueden eliminar, si es la ultima demanda.
    END IF;
    
END TR_demandas_delete;
/
---

--AVISOS PARA DEMANDAS.
CREATE OR REPLACE TRIGGER TR_demandas_insert_avisos
AFTER INSERT ON demandas
FOR EACH ROW 
DECLARE cantidad_avisos NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO cantidad_avisos
    FROM avisos;
    INSERT INTO avisos (id,fechaCreacion,mensaje, estado, numero) 
    values (cantidad_avisos,:NEW.fecha,'Se ha insertado una demanda', 'enviada', :NEW.numero);
    
    
END TR_demandas_insert_avisos;
/


CREATE OR REPLACE TRIGGER TR_demandas_after_insert_avisos
AFTER INSERT ON origenFondos
FOR EACH ROW 
DECLARE cantidad_avisos NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO cantidad_avisos
    FROM avisos;
    
    INSERT INTO avisos (id,fechaCreacion,mensaje, estado, numero) 
    values (cantidad_avisos,SYSDATE,'Se ha insertado un nuevo origen de fondos', 'enviada', :NEW.numero);
    
END TR_demandas_after_insert_avisos;
/

--CREATE OR REPLACE TRIGGER TR_demandas_after_delete_avisos     genera mutacion al borrar una demanda
--AFTER DELETE ON demandas
--FOR EACH ROW 
--DECLARE cantidad_avisos NUMBER(9);
--BEGIN 
    --SELECT COUNT(*)+1 INTO cantidad_avisos
    --FROM avisos;
    
    --INSERT INTO avisos (id,fechaCreacion,mensaje, estado, numero) 
    --values (cantidad_avisos,SYSDATE,'Se ha eliminado una demanda', 'enviada', :OLD.numero);
    
--END TR_demandas_after_insert_avisos;
--/

--Xdatos

TRUNCATE TABLE tieneFotografia;
TRUNCATE TABLE interesEn;
TRUNCATE TABLE origenFondos;
TRUNCATE TABLE alertas;
TRUNCATE TABLE avisos;
TRUNCATE TABLE demandas;
TRUNCATE TABLE empresas;
TRUNCATE TABLE personasNaturales;
TRUNCATE TABLE contactos;
TRUNCATE TABLE fotografias;
TRUNCATE TABLE opcionesCredito;
TRUNCATE TABLE ofertas;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE ubicaciones;

-- Para las pruebas:


insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');

insert into personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('U001', 'Cédula', '12345678', 'Juan Juanoso', 'Colombiano');

insert into empresas (id, nit,razonSocial, representante) 
VALUES ('U001', '123456789', 'Empresa Uno', 'U001');

insert into contactos (id, numeroContacto) 
VALUES ('U001','1040506789');

INSERT INTO usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U004', TO_TIMESTAMP('2023-10-07 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario4@example.com');

INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
VALUES ('U004', 'Cédula', '34567890', 'Lucía Lucioso', 'Colombiana');

INSERT INTO empresas (id, nit, razonSocial, representante) 
VALUES ('U004', '246813579', 'Empresa Cuatro', 'U004');

INSERT INTO contactos (id, numeroContacto) 
VALUES ('U004', '1040506782');
---2 Ubicaciones

select *  from contactos;

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) 
VALUES ('UB001',200, -77, 'Bogotá', 'N', 'Barrio 3');

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) 
VALUES ('UB004',12, 77, 'Cali', 'N', 'Barrio 7');


--------------------------------------------------
--DisparadoresOK


-- oferta
INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Calle 123', 'A', 150000, NULL, 'U001', 'UB001');

INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Avenida 456', 'C', 200000, XMLTYPE('<anexo><nombre>Anexo1</nombre><numero>001</numero><url>http://example.com/anexo1</url></anexo>'), 'U001', 'UB001');

INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Plaza Central', 'B', 250000, XMLTYPE('<anexo><nombre>Anexo2</nombre><numero>002</numero><url>http://example.com/anexo2</url></anexo>'), 'U001', 'UB004');

INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Calle Falsa 123', 'F', 180000, NULL, 'U004', 'UB001');

INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Avenida Siempre Viva', 'A', 300000, XMLTYPE('<anexo><nombre>Anexo3</nombre><numero>003</numero><url>http://example.com/anexo3</url></anexo>'), 'U001', 'UB001');

INSERT INTO ofertas (direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
VALUES ('Calle del Sol', 'C', 220000, NULL, 'U001', 'UB004');

--

INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto1', 'www.ejemplo1.com/imagen1.jpg', 'Descripción de la foto 1');
INSERT INTO fotografias (nombre, ruta, descripcion)
VALUES ('foto2', 'www.ejemplo2.com/imagen2.jpg', 'Descripción de la foto 2');
INSERT INTO tieneFotografia (numero, nombre)
VALUES (1, 'foto1');
INSERT INTO tieneFotografia (numero, nombre)
VALUES (2, 'foto2');

--

--demanda

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario) 
VALUES ('C', 150000, 'U001');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('A', 180000, 'U001');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('C', 220000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('B', 300000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('F', 150000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('A', 275000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('C', 195000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('B', 250000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('F', 220000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES ('A', 185000, 'U004');

INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario)
VALUES (NULL, 210000, 'U004');


select * from origenfondos;

--
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (1, 'UB001', 'A');
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (2, 'UB001', 'M');
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (3, 'UB004', 'B');
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (4, 'UB004', 'A');
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (5, 'UB001', 'M');
INSERT INTO interesEn (numero, codigo, nivel)
VALUES (6, 'UB001', 'B');

select * from interesEn;
---


--Avisos

select * from avisos;
 
--oferta

select* from ofertas;
UPDATE ofertas SET anexos = NULL WHERE numero =2;

DELETE FROM ofertas where numero = 6; 

select* from opcionesCredito;
UPDATE opcionesCredito set plazo = 11 where numero = 1;

select* from fotografias;
INSERT INTO fotografias VALUES ('foto3','www.ejemplo3.com/imagen3.jpg','Muy grande');
INSERT INTO tieneFotografia VALUES (1,'foto3');

select * from opcionesCredito;
DELETE opcionesCredito where numero = 3;


--demanda
select* from origenFondos;
UPDATE origenfondos set estaAprobado = 'T' where numero = 1;

select * from demandas;
DELETE demandas where numero = 11;  



--DisparadoresNoOK

select * from opcionesCredito;
select* from ofertas;

UPDATE opcionesCredito set valorMensual = 200  where numero = 1; -- la cuota es menor al costo
DELETE FROM ofertas where numero = 1; --no es la ultima demanda
  
  
DELETE from interesEn where numero = 1;  --No puedes eliminar valores en esta tabla 
UPDATE interesEn SET nivel = 'M' WHERE numero  = 1;--No puedes actualizar valores de esta tabla

UPDATE ofertas set numero = 3 WHERE numero=1; --No puedes actualizar algo en esta tabla que no sea anexos
UPDATE opcionesCredito set numero = 2; --No puedes modificar el numero en esta tabla
DELETE FROM ofertas where numero = 1; -- No es la ultima demanda


-- Xdisparadores

DROP TRIGGER TR_ofertas_insert;
DROP TRIGGER TR_OFERTAS_INSERT_AFTER;
DROP TRIGGER TR_ofertas_update;
DROP TRIGGER TR_opcionesCredito_update;
DROP TRIGGER store_max_id_ofertas;
DROP TRIGGER TR_ofertas_delete;
DROP TRIGGER TR_demandas_insert;
DROP TRIGGER TR_origenFondos_verificar;
DROP TRIGGER TR_interesEn_update;
DROP TRIGGER TR_interesEn_delete;
DROP TRIGGER store_max_id_demandas;
DROP TRIGGER TR_demandas_delete;
DROP TRIGGER TR_demandas_insert_avisos;
DROP TRIGGER TR_demandas_after_insert_avisos;
--DROP TRIGGER TR_demandas_after_delete_avisos;











-- LAB 05
--1. 
--datos
select * from mbda.data ;
select * from usuarios;
select * from contactos;
select * from personasNaturales;
select* from empresas;


--empresas
select count(*) from mbda.data where razon is not null;


--2.





INSERT INTO (select * from mbda.data) 
VALUES ('daniel@gmail.com', 3211265498, 3133314567, 1000031231, 'Daniel Palacios', NULL);
COMMIT;

select * from mbda.data where nombres like 'Daniel%';

INSERT INTO (select * from mbda.data) 
VALUES ('andres@gmail.com', 3133314567, 3211265498, 1000077731, 'Andres', NULL);
COMMIT;
--3. No podemos ya que no contamos con los permisos
select * from mbda.data where nombres like 'Andres%';

UPDATE (select * from mbda.data)  SET nombres = 'Andres Cardozo' where nombres = 'Andres'; 

DELETE FROM (select * from mbda.data) where nombres = 'Andres'; 


-------------------------------------------------------------------------------

-- 5




DECLARE
    CURSOR cursor_mbdaDATA IS 
        SELECT correo, contacto1, contacto2, numero, nombres, razon
        FROM mbda.data;

    dtb_id VARCHAR(5); 
    vExiste NUMBER;
    vCorreo VARCHAR(100);
    vNumeroContacto1 VARCHAR(100);
    vNumeroContacto2 VARCHAR(100);
    vNumeroDocumento VARCHAR(100);
    vNombre VARCHAR(100);
    vRazon VARCHAR(100);
    vUltimaPN VARCHAR(5);
BEGIN
    OPEN cursor_mbdaDATA;

    LOOP
        -- Obtener la siguiente fila del cursor
        FETCH cursor_mbdaDATA INTO vCorreo, vNumeroContacto1, vNumeroContacto2, vNumeroDocumento, vNombre, vRazon;

        -- Salir del bucle si ya no hay más filas
        EXIT WHEN cursor_mbdaDATA%NOTFOUND;
        LOOP
        -- Generar un ID aleatorio
            dtb_id := 'LT' || DBMS_RANDOM.STRING('U', 3);

        -- Verificar si el ID ya existe
            SELECT COUNT(*) INTO vExiste
            FROM Usuarios
            WHERE id = dtb_id;
            
            EXIT WHEN vExiste = 0;
        END LOOP;
        
        -- Insertar el registro si el ID no existe
        INSERT INTO usuarios (id, fechaRegistro, correoElectronico)
        VALUES (dtb_id, SYSDATE, vCorreo);
        
        -- Insertar el primer contacto dado
        vNumeroContacto1 := REPLACE(vNumeroContacto1, '-', '');
        IF LENGTH(vNumeroContacto1) = 10 THEN
        --vNumeroContacto1 := REGEXP_REPLACE(vNumeroContacto1, '[^0-9]', '');
        INSERT INTO contactos (id, numeroContacto)
        VALUES (dtb_id, vNumeroContacto1);
        END IF;
        
        -- Insertar el segundo conctacto dato si este no aparece como nulo
        vNumeroContacto2 := REPLACE(vNumeroContacto2, '-', '');
        IF vNumeroContacto2 IS NOT NULL AND LENGTH(vNumeroContacto2) = 10 AND vNumeroContacto2 != vNumeroContacto1 THEN
          --vNumeroContacto2 := REGEXP_REPLACE(vNumeroContacto2, '[^0-9]', '');
          INSERT INTO contactos (id, numeroContacto)
          VALUES (dtb_id, vNumeroContacto2);
        END IF;
        
        SELECT COUNT(*) INTO vExiste
            FROM personasNaturales
            WHERE nombres = vNombre and numeroDocumento = vNumeroDocumento ;
        
        -- Insertar al usuario como persona natural si aparece con razon NULL 
        IF vrazon IS NULL AND vNombre IS NOT NULL AND vExiste = 0 THEN
        INSERT INTO personasNaturales (id, tipoDocumento, numeroDocumento, nombres, nacionalidad)
        VALUES (dtb_id, 'CC', vNumeroDocumento, vNombre, 'Colombiana');
            vUltimaPN := dtb_id;
        END IF;
        
        SELECT COUNT(*) INTO vExiste
            FROM empresas
            WHERE nit = vNumeroDocumento||'-1' ;
        
        -- Insertar al usuario como empresa si aparece con razon 
        IF vrazon IS NOT NULL AND vExiste = 0 THEN
        INSERT INTO empresas (id, nit, razonSocial, representante)
        VALUES (dtb_id, vNumeroDocumento||'-1', vRazon, vUltimaPN);
        END IF;
        
    END LOOP;

    CLOSE cursor_mbdaDATA;
END;
/
















--CRUDE

CREATE OR REPLACE PACKAGE PC_OFERTAS
IS 
    PROCEDURE AD_OFERTA( x_direccion IN VARCHAR, x_tipoVivienda IN CHAR, x_costo IN NUMBER, x_anexos IN XMLTYPE, x_idUsuario IN VARCHAR, x_codigoUbicacion IN VARCHAR); 
    PROCEDURE MO_OFERTA(x_numero IN NUMBER, x_anexos IN XMLTYPE);
    PROCEDURE EL_OFERTA(x_numero IN NUMBER);
    
    PROCEDURE AD_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER);
    PROCEDURE MO_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER);
    PROCEDURE EL_FOTOGRAFIA(x_nombre IN VARCHAR);
    
    PROCEDURE MO_OPCIONCREDITO(x_numero IN NUMBER,x_plazo IN INT, x_valorMensual IN NUMBER);
    PROCEDURE EL_OPCIONCREDITO(x_numero IN NUMBER);
    
    FUNCTION CO_OFERTACOSTO RETURN SYS_REFCURSOR;
    FUNCTION CO_OFERTASCANTIDAD RETURN SYS_REFCURSOR;
END;
/

--CRUDI

CREATE OR REPLACE PACKAGE BODY PC_OFERTAS IS
    PROCEDURE AD_OFERTA( x_direccion IN VARCHAR, x_tipoVivienda IN CHAR, x_costo IN NUMBER, x_anexos IN XMLTYPE, x_idUsuario IN VARCHAR, x_codigoUbicacion IN VARCHAR) IS
    BEGIN 
        INSERT INTO OFERTAS ( direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
        VALUES (x_direccion , x_tipoVivienda, x_costo, x_anexos , x_idUsuario, x_codigoUbicacion);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al adicionar oferta' || SQLERRM);
    END AD_OFERTA;
    
    
    
    PROCEDURE MO_OFERTA(x_numero IN NUMBER,x_anexos IN XMLTYPE) IS
    BEGIN
        UPDATE ofertas SET anexos = x_anexos WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar oferta' || SQLERRM);
    
    END MO_OFERTA;
    
    
    
    
    PROCEDURE EL_OFERTA(x_numero IN NUMBER) IS
    BEGIN
        DELETE FROM ofertas WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar oferta' || SQLERRM);
    
    
    END EL_OFERTA;
    
    
    
    PROCEDURE AD_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER) IS
    BEGIN
        INSERT INTO fotografias (nombre, ruta, descripcion) VALUES (x_nombre,x_ruta,x_descripcion);
        INSERT INTO tieneFotografia (numero,nombre) VALUES (x_numero,x_nombre);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20004, 'Error al añadir fotografias' || SQLERRM);
            
    END AD_FOTOGRAFIA;
    
    
    
    PROCEDURE MO_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER) IS
    BEGIN
        UPDATE fotografias set ruta = x_ruta, descripcion = x_descripcion 
        WHERE nombre = x_nombre; --AND X_NUMERO= NUMERO si es por la oferta?? 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20005, 'Error al modificar fotografias' || SQLERRM);
            
    
    END MO_FOTOGRAFIA;
    
    
    
    
    
    
    
    PROCEDURE EL_FOTOGRAFIA(x_nombre IN VARCHAR) IS
    BEGIN
        DELETE FROM fotografias WHERE nombre = x_nombre;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20006, 'Error al eliminar fotografias' || SQLERRM);
                
    
    END EL_FOTOGRAFIA;
    
    
    

    
    
    
    PROCEDURE MO_OPCIONCREDITO(x_numero IN NUMBER,x_plazo IN INT, x_valorMensual IN NUMBER) IS 
    BEGIN
        UPDATE opcionesCredito SET  plazo = x_plazo, valorMensual = x_valorMensual WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20007, 'Error al modificar la opcion de credito' || SQLERRM);
            
    
    
    END MO_OPCIONCREDITO;
    
    
    
    
    
    
    
    
    
    
    PROCEDURE EL_OPCIONCREDITO(x_numero IN NUMBER) IS
    BEGIN 
        DELETE FROM opcionesCredito WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20008, 'Error al eliminar la opcion de credito' || SQLERRM);
    END EL_OPCIONCREDITO;
            
        
    
    
    
    --Consultar las ofertas con un costo menor a 1000000, que tenga una latitud igual a 200 y este en la ciudad de Bogota
    FUNCTION CO_OFERTACOSTO RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT ofertas.numero 
        FROM ofertas JOIN ubicaciones on ubicaciones.codigo = ofertas.codigoUbicacion  
        WHERE ofertas.costo<1000000 AND ubicaciones.latitud = 200 AND ubicaciones.ciudad = 'Bogotá';
        RETURN xResultado;
        
    END CO_OFERTACOSTO;
    
   --Consultar  los usuarios con la mayor cantidad de ofertas disponibles 
    FUNCTION CO_OFERTASCANTIDAD RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT usuarios.id, COUNT(ofertas.numero) AS ofertas_Vendedor
        FROM ofertas JOIN usuarios ON ofertas.IDUsuario = usuarios.id WHERE ofertas.estado = 'D' 
        GROUP BY usuarios.ID 
        ORDER BY ofertas_Vendedor DESC;
        RETURN xResultado;
        
    END CO_OFERTASCANTIDAD;
    
    
    
END PC_OFERTAS;
/


--XCRUD
DROP PACKAGE BODY PC_OFERTAS;

DROP PACKAGE PC_OFERTAS;


--CRUDOOK
insert into usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1@example.com');
insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) 
VALUES ('UB001',12, -77, 'Bogotá', 'N', 'Barrio 3');



BEGIN
    PC_OFERTAS.ad_oferta('Calle 123', 'A', 150000, NULL, 'U001', 'UB001');
    PC_OFERTAS.mo_oferta(1,XMLTYPE('<anexo><nombre>Anexo2</nombre><numero>002</numero><url>http://example.com/anexo2</url></anexo>'));
    --PC_OFERTAS.el_oferta(1);
END;
/

BEGIN
    
    PC_OFERTAS.ad_fotografia('foto1', 'www.ejemplo1.com/imagen1.jpg', 'Descripción de la foto 1',1);
    PC_OFERTAS.mo_fotografia('foto1', 'www.ejem3.com/imagen1.jpg', 'Descripción de la foto 1',1);
    --PC_OFERTAS.el_fotografia('foto1');
END;
/
BEGIN
    
    PC_OFERTAS.mo_opcioncredito(1,13, 13800);
    PC_OFERTAS.el_opcioncredito(1);
    
END;
/


SET SERVEROUTPUT ON;


DECLARE
    v_cursor_costos SYS_REFCURSOR;
    v_numero NUMBER;
    
BEGIN
    v_cursor_costos := PC_OFERTAS.co_ofertacosto(); 

    LOOP
        FETCH v_cursor_costos INTO v_numero;
        EXIT WHEN v_cursor_costos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Oferta: ' || v_numero);
    END LOOP;

    CLOSE v_cursor_costos;
END;
/

DECLARE
    v_cursor_cantidad SYS_REFCURSOR; 
    v_usuario_id VARCHAR2(50);       
    v_ofertas_vendedor NUMBER;       

BEGIN
    v_cursor_cantidad := PC_OFERTAS.CO_OFERTASCANTIDAD;

    LOOP
        FETCH v_cursor_cantidad INTO v_usuario_id, v_ofertas_vendedor;  
        EXIT WHEN v_cursor_cantidad%NOTFOUND;  
        DBMS_OUTPUT.PUT_LINE('Usuario ' || v_usuario_id || ' tiene ' || v_ofertas_vendedor || ' ofertas disponibles.');
    END LOOP;

    CLOSE v_cursor_cantidad;

END;


--CRUDONoOK
--intentar insertar sin todos los datos necesarios
BEGIN
    PC_OFERTAS.ad_oferta('Calle 123', NULL, 'U001', 'UB001');
END;
/

--intentar modificar un dato que no es posible
BEGIN
    
    PC_OFERTAS.ad_oferta('Calle 123', 'A', 150000, NULL, 'U001', 'UB001');
    PC_OFERTAS.mo_oferta('Calle 123', 'A', 150000, NULL, 'U001', 'UB001');
    

END;
/
--no cumplir con las restricciones
BEGIN
    
    PC_OFERTAS.mo_opcioncredito(1,13, 1);    
END;
/
















-- ActoresE
--usuario
CREATE OR REPLACE PACKAGE PA_USUARIOS
IS 
    PROCEDURE AD_USUARIOS(x_id IN VARCHAR, x_fechaRegistro IN TIMESTAMP, x_correoElectronico IN VARCHAR); 
    PROCEDURE MO_USUARIOS(x_id IN VARCHAR, x_correoElectronico IN VARCHAR);
    PROCEDURE EL_USUARIOS(x_id IN VARCHAR);
    
    PROCEDURE AD_OFERTA( x_direccion IN VARCHAR, x_tipoVivienda IN CHAR, x_costo IN NUMBER, x_anexos IN XMLTYPE, x_idUsuario IN VARCHAR, x_codigoUbicacion IN VARCHAR);
    PROCEDURE MO_OFERTA(x_numero IN NUMBER, x_anexos IN XMLTYPE);
    PROCEDURE EL_OFERTA(x_NUMERO IN NUMBER);
    
    PROCEDURE AD_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER);
    PROCEDURE MO_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER);
    PROCEDURE EL_FOTOGRAFIA(x_nombre IN VARCHAR);
    
    PROCEDURE MO_OPCIONCREDITO(x_numero IN NUMBER,x_plazo IN INT, x_valorMensual IN NUMBER);
    PROCEDURE EL_OPCIONCREDITO(x_numero IN NUMBER);
    
    PROCEDURE AD_DEMANDA(x_fecha IN DATE, x_tipoVivienda IN CHAR, x_maxCompra IN NUMBER, x_idUsuario IN VARCHAR);
    PROCEDURE MO_DEMANDA(x_numero IN NUMBER, x_fecha IN DATE, x_tipoVivienda IN CHAR, x_maxCompra IN NUMBER, x_idUsuario IN VARCHAR);

    
    PROCEDURE AD_interesEN(x_numero IN NUMBER, x_codigo IN VARCHAR, x_nivel IN CHAR);
    
    PROCEDURE MO_origenFONDOS(x_numero IN NUMBER, x_estaAprobado IN CHAR);
    
    FUNCTION CO_OFERTACOSTO RETURN SYS_REFCURSOR;
END;
/








--analista

CREATE OR REPLACE PACKAGE PA_ANALISTA
IS 
    PROCEDURE ad_usuarios(x_id IN VARCHAR, x_fechaRegistro IN TIMESTAMP, x_correoElectronico IN VARCHAR); 
    PROCEDURE mo_usuarios(x_id IN VARCHAR, x_correoElectronico IN VARCHAR);
    PROCEDURE el_usuarios(x_id IN VARCHAR);
    
    PROCEDURE ad_ubicaciones(x_codigo IN VARCHAR, x_latitud IN NUMBER,x_longitud IN NUMBER, x_ciudad IN VARCHAR, x_zona IN CHAR, x_barrio IN VARCHAR);
    PROCEDURE mo_ubicaciones(x_codigo IN VARCHAR, x_latitud IN NUMBER,x_longitud IN NUMBER, x_ciudad IN VARCHAR, x_zona IN CHAR, x_barrio IN VARCHAR);    
    PROCEDURE el_ubicaciones(x_codigo IN VARCHAR);
    

    FUNCTION CO_OFERTASCANTIDAD RETURN SYS_REFCURSOR;
END;
/


















-- ActoresI

--usuario

CREATE OR REPLACE PACKAGE BODY PA_USUARIOS IS
    
    PROCEDURE ad_usuarios(x_id IN VARCHAR, x_fechaRegistro IN TIMESTAMP, x_correoElectronico IN VARCHAR) IS 
    BEGIN
        INSERT INTO usuarios (id, fechaRegistro, correoElectronico) VALUES (x_id, x_fechaRegistro, x_correoElectronico);
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20015, 'Error al adicionar usuario' || SQLERRM);

    END ad_usuarios;
     
    
    PROCEDURE mo_usuarios(x_id IN VARCHAR, x_correoElectronico IN VARCHAR) IS
    BEGIN 
        UPDATE usuarios SET  correoElectronico = x_correoElectronico WHERE id = x_id;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20016, 'Error al modificar usuario' || SQLERRM);

    
    END mo_usuarios;
    
    PROCEDURE el_usuarios(x_id IN VARCHAR) IS
    BEGIN 
        DELETE FROM usuarios WHERE id = x_id;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20017, 'Error al eliminar usuario' || SQLERRM);

    
    END el_usuarios;
    
    
 
    
    
    
    PROCEDURE AD_OFERTA( x_direccion IN VARCHAR, x_tipoVivienda IN CHAR, x_costo IN NUMBER, x_anexos IN XMLTYPE, x_idUsuario IN VARCHAR, x_codigoUbicacion IN VARCHAR) IS
    BEGIN 
        INSERT INTO OFERTAS ( direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion)
        VALUES (x_direccion , x_tipoVivienda, x_costo, x_anexos , x_idUsuario, x_codigoUbicacion);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20020, 'Error al adicionar oferta' || SQLERRM);
    END AD_OFERTA;
    

    PROCEDURE MO_OFERTA(x_numero IN NUMBER,x_anexos IN XMLTYPE) IS
    BEGIN
        UPDATE ofertas SET anexos = x_anexos WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20021, 'Error al modificar oferta' || SQLERRM);
    
    END MO_OFERTA;

    
    PROCEDURE EL_OFERTA(x_numero IN NUMBER) IS
    BEGIN
        DELETE FROM ofertas WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20022, 'Error al eliminar oferta' || SQLERRM);
    
    
    END EL_OFERTA;
   
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER) IS
    BEGIN
        INSERT INTO fotografias (nombre, ruta, descripcion) VALUES (x_nombre,x_ruta,x_descripcion);
        INSERT INTO tieneFotografia (numero,nombre) VALUES (x_numero,x_nombre);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20023, 'Error al añadir fotografias' || SQLERRM);
            
    END AD_FOTOGRAFIA;
    
    
    PROCEDURE MO_FOTOGRAFIA(x_nombre IN VARCHAR, x_ruta IN VARCHAR, x_descripcion IN VARCHAR, x_numero IN NUMBER) IS
    BEGIN
        UPDATE fotografias set ruta = x_ruta, descripcion = x_descripcion 
        WHERE nombre = x_nombre; --AND X_NUMERO= NUMERO si es por la oferta?? 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20024, 'Error al modificar fotografias' || SQLERRM);
            
    
    END MO_FOTOGRAFIA;
    
    
    PROCEDURE EL_FOTOGRAFIA(x_nombre IN VARCHAR) IS
    BEGIN
        DELETE FROM fotografias WHERE nombre = x_nombre;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20025, 'Error al eliminar fotografias' || SQLERRM);
                
    
    END EL_FOTOGRAFIA;

----------------------------------------------------------------------------------------------------------------------------
    
    PROCEDURE MO_OPCIONCREDITO(x_numero IN NUMBER,x_plazo IN INT, x_valorMensual IN NUMBER) IS 
    BEGIN
        UPDATE opcionesCredito SET  plazo = x_plazo, valorMensual = x_valorMensual WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20026, 'Error al modificar la opcion de credito' || SQLERRM);
    
    END MO_OPCIONCREDITO;

    
    PROCEDURE EL_OPCIONCREDITO(x_numero IN NUMBER) IS
    BEGIN 
        DELETE FROM opcionesCredito WHERE numero = x_numero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20027, 'Error al eliminar la opcion de credito' || SQLERRM);
    END EL_OPCIONCREDITO;
            
----------------------------------------------------------------------------------------------------------------------------      
      
    --Consultar las ofertas con un costo menor a 1000000, que tenga una latitud igual a 200 y este en la ciudad de Bogota
    FUNCTION CO_OFERTACOSTO RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT ofertas.numero 
        FROM ofertas JOIN ubicaciones on ubicaciones.codigo = ofertas.codigoUbicacion  
        WHERE ofertas.costo<1000000 AND ubicaciones.latitud = 200 AND ubicaciones.ciudad = 'Bogotá';
        RETURN xResultado;
        
    END CO_OFERTACOSTO;
    
    PROCEDURE AD_DEMANDA(x_fecha IN DATE, x_tipoVivienda IN CHAR, x_maxCompra IN NUMBER, x_idUsuario IN VARCHAR) IS
    BEGIN 
        INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario) VALUES (x_fecha, x_tipoVivienda, x_maxCompra, x_idUsuario);
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20028, 'Error al añadir una demanda' || SQLERRM);
    END AD_DEMANDA;
    
    
    PROCEDURE MO_DEMANDA(x_numero IN NUMBER, x_fecha IN DATE, x_tipoVivienda IN CHAR, x_maxCompra IN NUMBER, x_idUsuario IN VARCHAR) IS
    BEGIN 
        UPDATE demandas SET fecha = x_fecha,tipoVivienda=x_tipoVivienda,maxCompra=x_maxCompra,idUsuario=x_idUsuario WHERE numero = x_numero;
            
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20029, 'Error al modificar una demanda' || SQLERRM);
    END MO_DEMANDA;
    
       

    
    PROCEDURE AD_interesEN(x_numero IN NUMBER, x_codigo IN VARCHAR, x_nivel IN CHAR) IS
        BEGIN
            INSERT INTO interesEN (numero, codigo, nivel) VALUES (x_numero, x_codigo, x_nivel);
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20030, 'Error al añadir una ubicacion de interes' || SQLERRM);
    END AD_interesEN;

    
    


    
    PROCEDURE MO_origenFONDOS(x_numero IN NUMBER, x_estaAprobado IN CHAR) IS
    BEGIN 
        UPDATE origenFondos SET estaAprobado = x_estaAprobado WHERE numero = x_numero;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20031, 'Error al modificar el origen de los fondos' || SQLERRM);
    END MO_origenFONDOS;

    
END PA_USUARIOS;
/






--analista

CREATE OR REPLACE PACKAGE BODY PA_ANALISTA IS

    PROCEDURE ad_usuarios(x_id IN VARCHAR, x_fechaRegistro IN TIMESTAMP, x_correoElectronico IN VARCHAR) IS 
    BEGIN
        INSERT INTO usuarios (id, fechaRegistro, correoElectronico) VALUES (x_id, x_fechaRegistro, x_correoElectronico);
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20009, 'Error al adicionar usuario' || SQLERRM);

    END ad_usuarios;
     
    
    PROCEDURE mo_usuarios(x_id IN VARCHAR, x_correoElectronico IN VARCHAR) IS
    BEGIN 
        UPDATE usuarios SET  correoElectronico = x_correoElectronico WHERE id = x_id;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20010, 'Error al modificar usuario' || SQLERRM);

    
    END mo_usuarios;
    
    PROCEDURE el_usuarios(x_id IN VARCHAR) IS
    BEGIN 
        DELETE FROM usuarios WHERE id = x_id;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20011, 'Error al eliminar usuario' || SQLERRM);

    
    END el_usuarios;
    
    
    
    
    PROCEDURE ad_ubicaciones(x_codigo IN VARCHAR, x_latitud IN NUMBER,x_longitud IN NUMBER, x_ciudad IN VARCHAR, x_zona IN CHAR, x_barrio IN VARCHAR) IS
    BEGIN 
        INSERT INTO ubicaciones (codigo, latitud ,longitud , ciudad , zona, barrio) VALUES (x_codigo, x_latitud ,x_longitud , x_ciudad , x_zona, x_barrio );
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'Error al añadir ubicacion' || SQLERRM);

    
    END ad_ubicaciones;
    
    
    PROCEDURE mo_ubicaciones(x_codigo IN VARCHAR, x_latitud IN NUMBER,x_longitud IN NUMBER, x_ciudad IN VARCHAR, x_zona IN CHAR, x_barrio IN VARCHAR) IS  
    BEGIN 
        UPDATE ubicaciones SET latitud = x_latitud, longitud=x_longitud, ciudad=x_ciudad, zona=x_zona, barrio=x_barrio WHERE codigo=x_codigo;
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20013, 'Error al modificar ubicacion' || SQLERRM);

    
    END mo_ubicaciones;
    
    
    PROCEDURE el_ubicaciones(x_codigo IN VARCHAR) IS
    BEGIN 
        DELETE FROM ubicaciones WHERE codigo=x_codigo;
        
        EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20014, 'Error al eliminar ubicacion' || SQLERRM);

    
    END el_ubicaciones;
    


    FUNCTION CO_OFERTASCANTIDAD RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT usuarios.id, COUNT(ofertas.numero) AS ofertas_Vendedor
        FROM ofertas JOIN usuarios ON ofertas.IDUsuario = usuarios.id WHERE ofertas.estado = 'D' 
        GROUP BY usuarios.ID 
        ORDER BY ofertas_Vendedor DESC;
        RETURN xResultado;
        
    END CO_OFERTASCANTIDAD;
    
        
END PA_ANALISTA;
/




--seguridad
-- Seguridad

-- Permisos usuarios

DROP ROLE rol_Usuario;

DROP ROLE rol_Administrador;

CREATE ROLE rol_Usuario;

GRANT EXECUTE ON PA_USUARIOS TO rol_Usuario;

GRANT UPDATE, DELETE, INSERT ON usuarios TO rol_Usuario;

GRANT UPDATE, DELETE, INSERT ON ofertas TO rol_Usuario;

GRANT UPDATE, DELETE, INSERT ON tieneFotografia TO rol_Usuario;

GRANT UPDATE, DELETE ON opcionesCredito TO rol_Usuario;

GRANT INSERT ON demandas TO rol_Usuario;

GRANT UPDATE ON origenFondos TO rol_Usuario;

GRANT SELECT ON OFERTAS TO rol_Usuario;

GRANT SELECT ON OFERTAS TO rol_Usuario;

-- Permisos Administrador

CREATE ROLE rol_Administrador;

GRANT EXECUTE ON PA_ANALISTA TO rol_Administrador;

GRANT ALL ON usuarios TO rol_Administrador;

GRANT UPDATE, DELETE, INSERT ON ubicaciones TO rol_Administrador;

--GRANT rol_usuario TO bd1000100546;

--GRANT rol_Administrador TO bd1000096312;

GRANT ADMINISTRADOR TO  bd1000100546;

--xseguridad
DROP PACKAGE PA_USUARIOS;

DROP PACKAGE PA_ANALISTA;

DROP ROLE rol_Usuario;

DROP ROLE rol_Administrador;


--pruebas
--- Daniela es una trabajadora que recientemente quiere vender su casa y comprar una nueva, se unió a una plataforma en donde puede subir su casa y buscar una nueva 
--- Hoy, Danie.a quiere ingresar su casa al sistema

--1.Para esto , Daniela ingresa sus datos al sistema:

BEGIN
    PA_USUARIOS.AD_USUARIOS('D0001',TO_TIMESTAMP('2024-11-23 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'daniela.trabaja@gmail.com');
END;
/



---2. Ahora se dispone de subir su oferta al sistema (el administrador ya tendra las ubicaciones)

BEGIN
    pa_analista.ad_ubicaciones('UB01', 32 ,-22 , 'Cali' , 'N', 'Barriocali');
    PA_USUARIOS.AD_OFERTA('carrera 7', 'C',200000,NULL,'D0001','UB01');
END;
/


---3.Daniela ahora quiere buscar una  oferta con condiciones especificas con un costo menor a 1000000, con una latitud de 200 AND y en la ciudad de bogotá;


DECLARE
    v_cursor_costos SYS_REFCURSOR;
    v_numero NUMBER;
    
BEGIN
    v_cursor_costos := PA_USUARIOS.co_ofertacosto(); 

    LOOP
        FETCH v_cursor_costos INTO v_numero;
        EXIT WHEN v_cursor_costos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Oferta: ' || v_numero);
    END LOOP;

    CLOSE v_cursor_costos;
END;
/



---3. Luego, Daniela se da cuenta que se le olvido meter anexos a su oferta, asi que lo intenta

BEGIN
    PA_USUARIOS.mo_oferta(1,XMLTYPE('<anexo><nombre>Anexo2</nombre><numero>002</numero><url>http://example.com/anexo2</url></anexo>'));
END;
/



---4. Luego Daniela quiere añadir fotografias a su oferta para hacerla mas atractiva

BEGIN
    PA_USUARIOS.ad_fotografia('Foto sala','ruta1','es una sala amplia','1');
    PA_USUARIOS.ad_fotografia('Foto cocina','ruta2','es una codina bonita y amplia','1');
    PA_USUARIOS.ad_fotografia('Foto dormitorio','rutaperro','es un dormitorio comodo','1');

END;
/

select * from fotografias;

---5. Al ver que se equivoco y subio una foto de su perro la actualiza


BEGIN
    PA_USUARIOS.mo_fotografia('Foto dormitorio','rutareal3','es un dormitorio comodo','1');
END;
/


---6. Ahora, Daniela se da cuenta que no le sirve la opcion de credito que esta por defecto, asi que la cambia


BEGIN
    PA_USUARIOS.mo_opcioncredito(1, 13, 30000);
END;
/


--- 7.Pero Daniela decide mejor que quiere que se comuniquen con ella para hablar de un tema tan importante y mejor la borra:

BEGIN
    PA_USUARIOS.el_opcioncredito(1);
END;
/


--- 8. Por lo que ahora decide añadir una demanda a una propiedad que le gusto:
BEGIN
    PA_USUARIOS.AD_DEMANDA(TO_DATE('2024-11-23 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),'C',20000,'D0001');
END;
/


--- 9. Asi mismo dice que esta interesada en una propiedad


BEGIN
    PA_USUARIOS.AD_interesEn(1,'UB01','A');
END;
/


--- 10. Finalmente se da cuenta que hizo una solicitud a su propia casa y decide modificar el origen de los fondos para que no le afecte e irse a trabajar

BEGIN
    PA_USUARIOS.mo_origenFondos(1,'R');
END;
/









