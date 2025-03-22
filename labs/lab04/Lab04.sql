-- XTablas
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
nombres VARCHAR(20) NOT NULL,
nacionalidad  VARCHAR(10)NOT NULL
);

CREATE TABLE empresas(
id VARCHAR(5) NOT NULL,
nit VARCHAR(10)NOT NULL,
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

-- Foraneas

-- Checks

--Tuplasok
---1 Usuarios

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

--TuplasNoOk
INSERT INTO usuarios (id, fechaRegistro, correoElectronico) 
VALUES ('U001', TO_TIMESTAMP('2023-10-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'usuario1example.com'); -- Falta '@' en el correo

INSERT INTO contactos (id, numeroContacto) 
VALUES ('C001', '12345678901'); -- NúmeroContacto demasiado largo

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

-- no se pone la accion de eliminar con cascade los que referencien  en interesEn por la condicion impuesta en el astah y no se puede poner NO ACTION como accion en oracle

--
--

-- AccionesOK
--
insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (4,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

INSERT INTO opcionesCredito (numero, plazo, valorMensual) 
VALUES (4, 12, 500);  
select * from ofertas where numero=4; select * from opcionesCredito where numero = 4;

DELETE FROM ofertas WHERE numero = 4;

select * from ofertas where numero=4; select * from opcionesCredito where numero = 4;
--
insert into ofertas (numero,fecha, direccion, tipoVivienda, costo, anexos, estado, idUsuario, codigoUbicacion) 
VALUES (4,TO_DATE('2024-01-03', 'YYYY-MM-DD'), 'Calle 1 # 1-1', 'C',1000,'<record><nombre>Fernande</nombre><numero>788</numero><url>http://paypal.com/lacus/curabitur/at/ipsum/ac.html?lacus=cursus</url></record>', 'D', 'U001','UB001');

insert into fotografias (nombre, ruta, descripcion)
VALUES ('Foto3', 'ruta de foto5', 'Descripción foto 3');

insert into tienefotografia (numero, nombre) 
VALUES (4, 'Foto3');

select * from ofertas where numero=4; select * from fotografias where nombre = 'Foto3'; select * from tieneFotografia where numero=4;

DELETE FROM OFERTAS WHERE numero=4; DELETE FROM fotografias WHERE nombre = 'Foto3';

select * from ofertas where numero=4; select * from fotografias where nombre = 'Foto3'; select * from tieneFotografia where numero=4;

---
insert into demandas (numero,fecha, tipoVivienda, maxCompra, idUsuario) 
VALUES (4,TO_DATE('2023-04-09', 'YYYY-MM-DD'),'C',10000,'U004');

insert into origenFondos (numero, valor, credito, estaAprobado) 
VALUES (4,50000, 'T','T');

DELETE FROM demandas WHERE numero = 4;
select* from origenFondos where numero =4;

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
DECLARE cantidad NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO cantidad
    FROM opcionescredito;
    INSERT INTO opcionesCredito
    VALUES (cantidad, 12, (1.1*:NEW.costo)/12); --Se asume que todas las viviendas tienen una opción de crédito a 12 meses con cuotas mensuales equivalentes al costo más 10% dividido en 12.
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

CREATE OR REPLACE TRIGGER TR_ofertas_delete
BEFORE DELETE ON interesEn
FOR EACH ROW 
DECLARE cantidad_ofertas NUMBER(9);
BEGIN 

    SELECT COUNT(*) INTO cantidad_ofertas
    FROM ofertas;
    
    IF  :OLD.numero != cantidad_ofertas THEN
    RAISE_APPLICATION_ERROR (-20009, 'La fila que intentas eliminar no es la ultima'); -- Una oferta puede ser eliminada siempre y cuando sea la última
    END IF;
    
END TR_ofertas_delete; 
/

--Registrar Demanda

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
    
END;
/


CREATE OR REPLACE TRIGGER TR_interesEn_update
BEFORE UPDATE ON interesEn
FOR EACH ROW 
BEGIN 

    RAISE_APPLICATION_ERROR (-20007, 'No puedes actualizar valores de esta tabla'); -- No puede modificar ubicaciones de interés
    
END TR_interesEn_update;
/

CREATE OR REPLACE TRIGGER TR_interesEn_delete
BEFORE DELETE ON interesEn
FOR EACH ROW 
BEGIN 

    RAISE_APPLICATION_ERROR (-20008, 'No puedes eliminar valores de esta tabla'); -- No puede eliminar ubicaciones de interés
    
END TR_interesEn_delete;
/

CREATE OR REPLACE TRIGGER TR_demandas_delete
BEFORE DELETE ON interesEn
FOR EACH ROW 
DECLARE cantidad_demandas NUMBER(9);
BEGIN 

    SELECT COUNT(*) INTO cantidad_demandas
    FROM demandas;
    
    IF  :OLD.numero != cantidad_demandas THEN
    RAISE_APPLICATION_ERROR (-20009, 'La fila que intentas eliminar no es la ultima'); -- Únicamente se pueden eliminar, si es la ultima demanda.
    END IF;
    
END TR_demandas_delete;
/
---

---
--DisparadoresOK

-- oferta
INSERT INTO ofertas ( direccion, tipoVivienda, costo, anexos, idUsuario, codigoUbicacion) 
VALUES ( 'Calle 3 # 3-3', 'A', 2000, '<record><nombre>Juan</nombre></record>', 'U001', 'UB001');


--demanda


INSERT INTO demandas (tipoVivienda, maxCompra, idUsuario) 
VALUES ('C', 150000, 'U001');


--DisparadoresNoOK

DELETE from interesEn where numero = 1;  --La fila que intentas eliminar no es la ultima
UPDATE interesEn SET nivel = 'M' WHERE numero  = 1;--No puedes actualizar valores de esta tabla
UPDATE ofertas set numero = 3 WHERE numero=1; --No puedes actualizar algo en esta tabla que no sea anexos
UPDATE opcionesCredito set numero = 2; --No puedes modificar el numero en esta tabla

-- Xdisparadores

DROP TRIGGER TR_ofertas_insert;

DROP TRIGGER TR_ofertas_update;

DROP TRIGGER TR_opcionesCredito_update;

DROP TRIGGER TR_demandas_insert;

DROP TRIGGER TR_origenFondos_update;

DROP TRIGGER TR_interesEn_update;

DROP TRIGGER TR_interesEn_delete;

