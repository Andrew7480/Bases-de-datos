-- XTablas
DROP TABLE tieneFotografia;
DROP TABLE interesEn;
DROP TABLE origenFondos;
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
tipoDocumento VARCHAR(20),
numeroDocumento VARCHAR(20),
nombres VARCHAR(20) NOT NULL,
nacionalidad  VARCHAR(10)NOT NULL
);

CREATE TABLE empresas(
id VARCHAR(5) NOT NULL,
nit VARCHAR(10),
razonSocial VARCHAR(100) NOT NULL,
representante VARCHAR(5)NOT NULL
);

CREATE TABLE ofertas(
numero NUMBER(9) GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
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
numero NUMBER(9) GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
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

insert into ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into opcionesCredito (numero, plazo, valorMensual) 
VALUES (1, 12, 500);

insert into fotografias (nombre, ruta, descripcion)
VALUES ('Foto1', 'ruta de foto1', 'Descripción foto 1');

insert into tienefotografia (numero, nombre) 
VALUES (1, 'Foto1');

---3

insert into ubicaciones (codigo, latitud,longitud, ciudad, zona, barrio) VALUES ('UB001',12, -77, 'Bogotá', 'N', 'Barrio 3');

---4

insert into demandas (fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U001');

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

insert into demandas (fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',-10000,'U001');

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

TRUNCATE TABLE demandas;
ALTER TABLE demandas  MODIFY(numero GENERATED AS IDENTITY (START WITH 1));

TRUNCATE TABLE empresas;

TRUNCATE TABLE personasNaturales;

TRUNCATE TABLE contactos;

TRUNCATE TABLE fotografias;

TRUNCATE TABLE opcionesCredito;

TRUNCATE TABLE ofertas;
ALTER TABLE ofertas  MODIFY(numero GENERATED AS IDENTITY (START WITH 1));

TRUNCATE TABLE usuarios;

TRUNCATE TABLE ubicaciones;

--Atributos

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

ALTER TABLE demandas
ADD CONSTRAINT ck_demandas_tipoVivienda CHECK (tipoVivienda = 'C' OR tipoVivienda = 'A' OR tipoVivienda = 'B' OR tipoVivienda = 'F');

ALTER TABLE demandas
ADD CONSTRAINT ck_demandas_maxCompra CHECK (maxCompra > 0);

ALTER TABLE origenFondos
ADD CONSTRAINT ck_origenFondos_credito CHECK (credito = 'T' OR credito = 'F');

ALTER TABLE origenFondos
ADD CONSTRAINT ck_origenFondos_estaAprobado CHECK (estaAprobado = 'T' OR estaAprobado = 'F' OR estaAprobado = NULL);

ALTER TABLE interesEn
ADD CONSTRAINT ck_interesEn_nivel CHECK (nivel = 'A' OR nivel = 'M' OR nivel = 'B');

ALTER TABLE ubicaciones
ADD CONSTRAINT ck_ubicaciones_zona CHECK (zona = 'N' OR zona = 'S' OR zona = 'O' OR zona = 'E');

ALTER TABLE ubicaciones
ADD CONSTRAINT ck_ubicaciones_latitud CHECK (latitud > 100);

ALTER TABLE fotografias
ADD CONSTRAINT ck_fotografias_ruta CHECK (ruta LIKE 'www.%');

--Primarias

ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);

ALTER TABLE contactos
ADD CONSTRAINT pk_contactos PRIMARY KEY (id,numeroContacto);

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

ALTER TABLE tieneFotografia
ADD CONSTRAINT pk_tieneFotografia PRIMARY KEY (numero,nombre);

ALTER TABLE demandas
ADD CONSTRAINT pk_demandas PRIMARY KEY (numero);

ALTER TABLE origenFondos
ADD CONSTRAINT pk_origenFondos PRIMARY KEY (numero);

ALTER TABLE interesEn
ADD CONSTRAINT pk_interesEn PRIMARY KEY (numero,codigo);

ALTER TABLE ubicaciones
ADD CONSTRAINT pk_ubicaciones PRIMARY KEY (codigo);

--Unicas 

ALTER TABLE empresas
ADD CONSTRAINT uk_empresas_nit UNIQUE (nit);

ALTER TABLE personasNaturales
ADD CONSTRAINT uk_personasNaturales UNIQUE (tipoDocumento, numeroDocumento);

--Foraneas

ALTER TABLE contactos
ADD CONSTRAINT fk_contactos_id FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE personasNaturales
ADD CONSTRAINT fk_personasNaturales_id FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE empresas
ADD CONSTRAINT fk_empresas_id FOREIGN KEY (id) REFERENCES usuarios(id);

ALTER TABLE empresas
ADD CONSTRAINT fk_empresas_representante FOREIGN KEY (representante) REFERENCES personasNaturales(id);

ALTER TABLE ofertas
ADD CONSTRAINT fk_ofertas_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuarios(id);

ALTER TABLE ofertas
ADD CONSTRAINT fk_ofertas_codigoUbicacion FOREIGN KEY (codigoUbicacion) REFERENCES ubicaciones(codigo);

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_numero FOREIGN KEY (numero) REFERENCES ofertas(numero);

ALTER TABLE tieneFotografia
ADD CONSTRAINT fk_tieneFotografia_nombre FOREIGN KEY (nombre) REFERENCES fotografias(nombre);

ALTER TABLE opcionesCredito
ADD CONSTRAINT fk_opcionesCredito_numero FOREIGN KEY (numero) REFERENCES ofertas(numero);

ALTER TABLE demandas
ADD CONSTRAINT fk_demandas_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuarios(id);

ALTER TABLE origenFondos
ADD CONSTRAINT fk_origenFondos_numero FOREIGN KEY (numero) REFERENCES demandas(numero);

ALTER TABLE interesEn
ADD CONSTRAINT fk_interesEn_numero FOREIGN KEY (numero) REFERENCES demandas(numero);

ALTER TABLE interesEn
ADD CONSTRAINT fk_interesEn_codigo FOREIGN KEY (codigo) REFERENCES ubicaciones(codigo);

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
VALUES ('1', 100, 200, 'Bogota', 'Z', 'Suba'); -- ck_ubicaciones_zona

INSERT INTO usuarios
VALUES ('1', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Daniel@gmailcom'); -- ck_usuarios_correoelectronico

ALTER TABLE ofertas  MODIFY(numero GENERATED AS IDENTITY (START WITH 1));

ALTER TABLE demandas  MODIFY(numero GENERATED AS IDENTITY (START WITH 1));

-- Consultas

-- <Consultar  los usuarios con la mayor cantidad de ofertas disponibles>

SELECT id, COUNT(*) AS ofertas_Vendedor
FROM usuarios us
JOIN ofertas ofr ON ofr.idUsuario = us.id
GROUP BY us.id
ORDER BY ofertas_Vendedor DESC ;

-- <Consultar las ofertas con un costo menor a 1000000, que tenga una latitud igual a 200 y este en la ciudad de Bógota>

SELECT *
FROM ofertas ofr
JOIN ubicaciones ub ON ub.codigo = ofr.codigoUbicacion
WHERE (costo < 1000000) and (latitud = 200) AND (ciudad = 'Bógota');

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

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'A', 180000, 'USR01');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'C', 220000, 'USR02');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'B', 300000, 'USR03');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'F', 150000, 'USR04');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'A', 275000, 'USR05');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'C', 195000, 'USR06');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'B', 250000, 'USR07');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'F', 220000, 'USR08');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'A', 185000, 'USR09');

INSERT INTO demandas (fecha, tipoVivienda, maxCompra, idUsuario)
VALUES (TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'C', 210000, 'USR10');

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

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Calle 123', 'A', 150000, NULL, 'D', 'USR01', 'COD001');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-02-10', 'YYYY-MM-DD'), 'Avenida 456', 'C', 200000, XMLTYPE('<anexo><nombre>Anexo1</nombre><numero>001</numero><url>http://example.com/anexo1</url></anexo>'), 'N', 'USR02', 'COD002');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'Plaza Central', 'B', 250000, XMLTYPE('<anexo><nombre>Anexo2</nombre><numero>002</numero><url>http://example.com/anexo2</url></anexo>'), 'V', 'USR03', 'COD003');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'Calle Falsa 123', 'F', 180000, NULL, 'D', 'USR04', 'COD004');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'Avenida Siempre Viva', 'A', 300000, XMLTYPE('<anexo><nombre>Anexo3</nombre><numero>003</numero><url>http://example.com/anexo3</url></anexo>'), 'N', 'USR05', 'COD005');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Calle del Sol', 'C', 220000, NULL, 'V', 'USR06', 'COD006');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'Calle Luna', 'B', 190000, XMLTYPE('<anexo><nombre>Anexo4</nombre><numero>004</numero><url>http://example.com/anexo4</url></anexo>'), 'D', 'USR03', 'COD007');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'Calle de la Paz', 'F', 210000, NULL, 'N', 'USR08', 'COD008');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Avenida Libertad', 'A', 175000, XMLTYPE('<anexo><nombre>Anexo5</nombre><numero>005</numero><url>http://example.com/anexo5</url></anexo>'), 'V', 'USR05', 'COD009');

INSERT INTO ofertas (fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion)
VALUES (TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Calle Victoria', 'C', 230000, XMLTYPE('<anexo><nombre>Anexo6</nombre><numero>006</numero><url>http://example.com/anexo6</url></anexo>'), 'D', 'USR10', 'COD010');

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
