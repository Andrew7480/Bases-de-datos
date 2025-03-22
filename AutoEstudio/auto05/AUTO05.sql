
-- XTablas
DROP TABLE PLAYS_IN;
DROP TABLE BAND;
DROP TABLE PLACE;
DROP TABLE PERFORMER;
DROP TABLE MUSICIAN;

-- XSecuencias

DROP SEQUENCE SQ_band_no;
DROP SEQUENCE SQ_m_no;
DROP SEQUENCE SQ_place_no;

-- Tablas

CREATE TABLE BAND(
band_no NUMBER(9)NOT NULL,
band_name VARCHAR(20) NOT NULL,
band_type VARCHAR(10) NOT NULL,
b_date DATE,
band_home NUMBER(9) NOT NULL,
band_contact NUMBER(9) NOT NULL
);

CREATE TABLE PLAYS_IN(
player NUMBER(9) NOT NULL,
band_id NUMBER(9) NOT NULL
);

CREATE TABLE PLACE(
place_no NUMBER(9) NOT NULL
);

CREATE TABLE MUSICIAN(
m_no NUMBER(9) NOT NULL,
m_name VARCHAR(20) NOT NULL
);

CREATE TABLE performer(
perf_no VARCHAR(20) , 
perf_is NUMBER(9), 
instrument VARCHAR(20)
);

CREATE SEQUENCE SQ_band_no START WITH 1 INCREMENT BY 1 MAXVALUE 999999999 CYCLE;
CREATE SEQUENCE SQ_place_no START WITH 1 INCREMENT BY 1 MAXVALUE 999999999 CYCLE;
CREATE SEQUENCE SQ_m_no START WITH 1 INCREMENT BY 1 MAXVALUE 999999999 CYCLE;

-- Atributos

-- Primarias

ALTER TABLE BAND
ADD CONSTRAINT PK_BAND PRIMARY KEY (band_no);

ALTER TABLE PLACE
ADD CONSTRAINT PK_PLACE PRIMARY KEY (place_no);

ALTER TABLE MUSICIAN
ADD CONSTRAINT PK_MUSICIAN PRIMARY KEY (m_no);

ALTER TABLE performer
ADD PRIMARY KEY (perf_no);
-- Unicas

ALTER TABLE BAND 
ADD CONSTRAINT UK_BAND_band_name UNIQUE (band_name);

-- Foraneas

ALTER TABLE PLAYS_IN
ADD CONSTRAINT FK_PLAYS_IN_BAND FOREIGN KEY (band_id) REFERENCES BAND(band_no); 

ALTER TABLE PLAYS_IN
ADD CONSTRAINT FK_PLAYS_IN_MUSICIAN FOREIGN KEY (player) REFERENCES MUSICIAN(m_no); 

ALTER TABLE BAND
ADD CONSTRAINT FK_BAND_PLACE FOREIGN KEY (band_home) REFERENCES PLACE(place_no); 

ALTER TABLE BAND
ADD CONSTRAINT FK_BAND_MUSICIAN FOREIGN KEY (band_contact) REFERENCES MUSICIAN(m_no); 

ALTER TABLE performer
ADD CONSTRAINT FK_PERFORMER_MUSICIAN FOREIGN KEY (perf_is) REFERENCES musician(m_no);
-- Tuplas

ALTER TABLE BAND 
ADD CONSTRAINT CK_BAND_band_type CHECK (band_type = 'rock' OR band_type = 'classical' OR band_type = 'jazz' OR band_type = 'blues' OR band_type = 'pop' OR band_type = 'soul');

-- Primarias

ALTER TABLE PLAYS_IN
ADD CONSTRAINT PK_PLAYS_IN PRIMARY KEY (player, band_id);

-- Poblar

BEGIN 
    FOR i IN 1..22 LOOP 
        INSERT INTO MUSICIAN VALUES (SQ_m_no.nextval,'james');
    END LOOP;
    
    FOR i IN 1..9 LOOP 
        INSERT INTO PLACE VALUES (SQ_place_no.nextval);
    END LOOP;
end;
/

INSERT INTO place VALUES(1);
INSERT INTO place VALUES(2);
INSERT INTO place VALUES(3);
INSERT INTO place VALUES(4);
INSERT INTO place VALUES(5);
INSERT INTO place VALUES(6);
INSERT INTO place VALUES(7);
INSERT INTO place VALUES(8);
INSERT INTO place VALUES(9);

INSERT INTO musician VALUES(1,'Fred Bloggs'); 
INSERT INTO musician VALUES(2,'John Smith'); 
INSERT INTO musician VALUES(3,'Helen Smyth'); 
INSERT INTO musician VALUES(4,'Harriet Smithson');
INSERT INTO musician VALUES(5,'James First'); 
INSERT INTO musician VALUES(6,'Theo Mengel'); 
INSERT INTO musician VALUES(7,'Sue Little'); 
INSERT INTO musician VALUES(8,'Harry Forte'); 
INSERT INTO musician VALUES(9,'Phil Hot'); 
INSERT INTO musician VALUES(10,'Jeff Dawn'); 
INSERT INTO musician VALUES(11,'Rose Spring'); 
INSERT INTO musician VALUES(12,'Davis Heavan'); 
INSERT INTO musician VALUES(13,'Lovely Time'); 
INSERT INTO musician VALUES(14,'Alan Fluff'); 
INSERT INTO musician VALUES(15,'Tony Smythe'); 
INSERT INTO musician VALUES(16,'James Quick'); 
INSERT INTO musician VALUES(17,'Freda Miles'); 
INSERT INTO musician VALUES(18,'Elsie James'); 
INSERT INTO musician VALUES(19,'Andy Jones'); 
INSERT INTO musician VALUES(20,'Louise Simpson'); 
INSERT INTO musician VALUES(21,'James Steeple'); 
INSERT INTO musician VALUES(22,'Steven Chaytors'); 

INSERT INTO band VALUES(1,'ROP','classical',NULL,1,11);
INSERT INTO band VALUES(2,'AASO','classical',NULL,2,10);
INSERT INTO band VALUES(3,'The J Bs','jazz',NULL,3,12);
INSERT INTO band VALUES(4,'BBSO','classical',NULL,4,21);
INSERT INTO band VALUES(5,'The left Overs','jazz',NULL,5,8);
INSERT INTO band VALUES(6,'Somebody Loves this','jazz',NULL,6,6);
INSERT INTO band VALUES(7,'Oh well','classical',NULL,7,3);
INSERT INTO band VALUES(8,'Swinging strings','classical',NULL,8,7);
INSERT INTO band VALUES(9,'The Rest','jazz',NULL,9,16);

INSERT INTO performer VALUES(1,2,'violin');
INSERT INTO performer VALUES(2,4,'viola');
INSERT INTO performer VALUES(3,6,'banjo');
INSERT INTO performer VALUES(4,8,'violin');
INSERT INTO performer VALUES(5,12,'guitar');
INSERT INTO performer VALUES(6,14,'violin');
INSERT INTO performer VALUES(7,16,'trumpet');
INSERT INTO performer VALUES(8,18,'viola');
INSERT INTO performer VALUES(9,20,'bass');
INSERT INTO performer VALUES(10,2,'flute');
INSERT INTO performer VALUES(11,20,'cornet');
INSERT INTO performer VALUES(12,6,'violin');
INSERT INTO performer VALUES(13,8,'drums');
INSERT INTO performer VALUES(14,10,'violin');
INSERT INTO performer VALUES(15,12,'cello');
INSERT INTO performer VALUES(16,14,'viola');
INSERT INTO performer VALUES(17,16,'flute');
INSERT INTO performer VALUES(18,18,'guitar');
INSERT INTO performer VALUES(19,20,'trombone');
INSERT INTO performer VALUES(20,3,'horn');
INSERT INTO performer VALUES(21,5,'violin');
INSERT INTO performer VALUES(22,7,'cello');
INSERT INTO performer VALUES(23,2,'bass');
INSERT INTO performer VALUES(24,4,'violin');
INSERT INTO performer VALUES(25,6,'drums');
INSERT INTO performer VALUES(26,8,'clarinet');
INSERT INTO performer VALUES(27,10,'bass');
INSERT INTO performer VALUES(28,12,'viola');
INSERT INTO performer VALUES(29,18,'cello');


INSERT INTO plays_in VALUES(1,1);
INSERT INTO plays_in VALUES(1,7);
INSERT INTO plays_in VALUES(3,1);
INSERT INTO plays_in VALUES(4,1);
INSERT INTO plays_in VALUES(4,7);
INSERT INTO plays_in VALUES(5,1);
INSERT INTO plays_in VALUES(6,1);
INSERT INTO plays_in VALUES(6,7);
INSERT INTO plays_in VALUES(7,1);
INSERT INTO plays_in VALUES(8,1);
INSERT INTO plays_in VALUES(8,7);
INSERT INTO plays_in VALUES(10,2);
INSERT INTO plays_in VALUES(12,2);
INSERT INTO plays_in VALUES(13,2);
INSERT INTO plays_in VALUES(14,2);
INSERT INTO plays_in VALUES(14,8);
INSERT INTO plays_in VALUES(15,2);
INSERT INTO plays_in VALUES(15,8);
INSERT INTO plays_in VALUES(17,2);
INSERT INTO plays_in VALUES(18,2);
INSERT INTO plays_in VALUES(19,3);
INSERT INTO plays_in VALUES(20,3);
INSERT INTO plays_in VALUES(21,4);
INSERT INTO plays_in VALUES(22,4);


-- AtributosOK 

INSERT INTO BAND
VALUES (1,'band1','classical',NULL,1,3); -- FK_BAND_PLACE, FK_BAND_MUSICIAN 

INSERT INTO BAND
VALUES (2,'band2','jazz',NULL,2,8); -- FK_BAND_PLACE, FK_BAND_MUSICIAN 

-- AtributosNoOK 

INSERT INTO BAND
VALUES (1,NULL,'classical',NULL,1,3); -- NOT NULL

INSERT INTO BAND
VALUES (1,'band1','classical',NULL,1,3); -- PK_BAND 

INSERT INTO BAND
VALUES (2,'band2','jazz',NULL,10,8); -- FK_BAND_PLACE

-- TuplasOK

INSERT INTO BAND
VALUES (3,'band3','jazz',NULL,5,10); --CK_BAND_band_type

INSERT INTO PLAYS_IN
VALUES (3,3); -- PK_PLAYS_IN

INSERT INTO PLAYS_IN
VALUES (7,1); -- PK_PLAYS_IN

-- TuplasNoOK

INSERT INTO PLAYS_IN
VALUES (7,1); -- PK_PLAYS_IN

INSERT INTO BAND
VALUES (4,'band4','j-pop',NULL,5,10); --CK_BAND_band_type

-- Acciones

ALTER TABLE PLAYS_IN
DROP CONSTRAINT FK_PLAYS_IN_BAND;

ALTER TABLE PLAYS_IN
DROP CONSTRAINT FK_PLAYS_IN_MUSICIAN;

ALTER TABLE PLAYS_IN
ADD CONSTRAINT FK_PLAYS_IN_BAND FOREIGN KEY (band_id) REFERENCES BAND(band_no) ON DELETE CASCADE; --esto se hace para que si una banda es borrada todas las referencias dentro de la tabla PLAYS_IN se borran

ALTER TABLE PLAYS_IN
ADD CONSTRAINT FK_PLAYS_IN_MUSICIAN FOREIGN KEY (player) REFERENCES MUSICIAN(m_no) ON DELETE CASCADE; --esto se hace para que si un musico es borrado dentro de MUSICIAN todas las referencias dentro de la tabla PLAYS_IN se borran

-- AccionesOK

SELECT * FROM PLAYS_IN;

SELECT * FROM MUSICIAN;

DELETE FROM MUSICIAN WHERE m_no = 7;

SELECT * FROM PLAYS_IN;

SELECT * FROM BAND;

DELETE FROM BAND WHERE band_no = 3;

SELECT * FROM PLAYS_IN;

INSERT INTO MUSICIAN VALUES (7);

--XPoblar

TRUNCATE TABLE PLAYS_IN;
TRUNCATE TABLE BAND;
TRUNCATE TABLE PERFORMER;
TRUNCATE TABLE PLACE;
TRUNCATE TABLE MUSICIAN;

-- XDisparadores

DROP TRIGGER tr_INSERT_BAND;
DROP TRIGGER tr_UPDATE_BAND;
DROP TRIGGER tr_UPDATE_PLAYS_IN;
DROP TRIGGER tr_INSERT_PLAYS_IN;

-- Disparadores

CREATE OR REPLACE TRIGGER tr_INSERT_BAND
BEFORE INSERT ON BAND
FOR EACH ROW 
DECLARE CANTIDAD_BANDAS NUMBER(9);
BEGIN 
    SELECT COUNT(*)+1 INTO CANTIDAD_BANDAS FROM BAND;
    
    IF (:NEW.b_date > SYSDATE) THEN 
    RAISE_APPLICATION_ERROR (-20005, 'La fecha de b_date no puede ser mayor a la del sistema');
    END IF;
    
    
    :NEW.band_no := CANTIDAD_BANDAS;
    
    IF :NEW.band_type != 'rock' OR :NEW.band_type != 'classical' OR :NEW.band_type != 'jazz' OR :NEW.band_type != 'blues' OR :NEW.band_type != 'pop' OR :NEW.band_type != 'soul' THEN
    :NEW.band_type := 'rock';
    END IF;
    END tr_INSERT_BAND;
 
/
    
CREATE OR REPLACE TRIGGER tr_UPDATE_BAND
BEFORE UPDATE ON BAND
FOR EACH ROW 
BEGIN 
    IF ((:NEW.band_name != :OLD.band_name) OR (:NEW.band_type != :OLD.band_type) OR (:NEW.band_home != :OLD.band_home) OR (:NEW.band_contact != :OLD.band_contact)) THEN 
    RAISE_APPLICATION_ERROR (-20001, 'no puedes actualizar algo en esta tabla que no sea b_date');
    END IF;
    
    IF ((:OLD.b_date IS NOT NULL)) THEN 
    RAISE_APPLICATION_ERROR (-20002, 'b_date ya tiene una fecha');
    END IF;
    END tr_UPDATE_BAND; 
    
/     

CREATE OR REPLACE TRIGGER tr_UPDATE_PLAYS_IN
BEFORE UPDATE ON PLAYS_IN
FOR EACH ROW 
BEGIN 
    RAISE_APPLICATION_ERROR (-20003, 'No puedes modificar musicos en la tabla plays_in');
    END tr_UPDATE_PLAYS_IN;

/ 

CREATE OR REPLACE TRIGGER tr_INSERT_PLAYS_IN
BEFORE INSERT ON PLAYS_IN
FOR EACH ROW 
DECLARE CANTIDAD_MUSICOS NUMBER(2);
BEGIN 
    SELECT COUNT(*) INTO CANTIDAD_MUSICOS 
    FROM PLAYS_IN 
    WHERE band_id = :NEW.band_id ;
    
    IF (CANTIDAD_MUSICOS >= 10) THEN 
    RAISE_APPLICATION_ERROR (-20004, 'La banda no puede tener mas de 10 musicos en ella');
    END IF;
    END tr_INSERT_PLAYS_IN;
/

-- DisparadoresOK

INSERT INTO BAND
VALUES (1,'band1','classical',NULL,1,3);

UPDATE BAND 
SET b_date = TO_DATE('2024-01-03', 'YYYY-MM-DD')
WHERE band_no = 1;

INSERT INTO PLAYS_IN VALUES (1,1);

-- DisparadoresNoOK
    
UPDATE BAND 
SET band_name = 'nuevo_band_name' --solo se puede modificar la fecha si no la tiene aun
WHERE band_no = 1;

UPDATE BAND 
SET b_date = TO_DATE('2024-03-04', 'YYYY-MM-DD')  --no se pede modificar nada que no sea una fecha nula
WHERE band_no = 1;

INSERT INTO PLAYS_IN VALUES (2,1);
INSERT INTO PLAYS_IN VALUES (3,1);
INSERT INTO PLAYS_IN VALUES (4,1);
INSERT INTO PLAYS_IN VALUES (5,1);
INSERT INTO PLAYS_IN VALUES (6,1);
INSERT INTO PLAYS_IN VALUES (7,1);
INSERT INTO PLAYS_IN VALUES (8,1);
INSERT INTO PLAYS_IN VALUES (9,1);
INSERT INTO PLAYS_IN VALUES (10,1);
INSERT INTO PLAYS_IN VALUES (11,1);   -- ya tiene 10 musicos
    
--CRUDE

CREATE OR REPLACE PACKAGE PC_BANDS IS
    PROCEDURE AD(x_band_no OUT NUMBER, x_band_name IN VARCHAR, x_band_type IN VARCHAR, x_b_date IN DATE, x_band_home IN NUMBER,band_contact IN NUMBER);
    PROCEDURE MO(x_band_no IN NUMBER, x_b_date IN DATE);
    PROCEDURE AD_MUSICIAN(x_band_no IN NUMBER, x_musician_no IN NUMBER);
    PROCEDURE DEL_MUSICIAN(x_band_no IN NUMBER, x_musician_no IN NUMBER);
    PROCEDURE DEL(x_band_no IN NUMBER);
    FUNCTION CO RETURN SYS_REFCURSOR;
    FUNCTION CO_MUSICIANS RETURN SYS_REFCURSOR;
    FUNCTION CO_BANDS RETURN SYS_REFCURSOR;
END PC_BANDS;
/
--CRUDI

CREATE OR REPLACE PACKAGE BODY PC_BANDS AS 
    PROCEDURE AD(x_band_no OUT NUMBER, x_band_name IN VARCHAR, x_band_type IN VARCHAR, x_b_date IN DATE, x_band_home IN NUMBER,band_contact IN NUMBER) IS
    BEGIN
        INSERT INTO band(band_no, band_name, band_type, b_date,band_home,band_contact) VALUES (x_band_no, x_band_name, x_band_type , x_b_date, x_band_home,band_contact); 

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20101, 'Error al insertar en BANDS');
    END;

    PROCEDURE MO(x_band_no IN NUMBER, x_b_date IN DATE) IS
    BEGIN 
        UPDATE band SET b_date = x_b_date WHERE band_no = x_band_no;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN 
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20103, 'Error al modificar en BANDS');
    END;

    PROCEDURE AD_MUSICIAN(x_band_no IN NUMBER, x_musician_no IN NUMBER) IS
    BEGIN 
        --INSERT INTO band(band_no, band_contact) VALUES (x_band_no, x_musician_no);
        INSERT INTO plays_in( player,band_id) VALUES ( x_musician_no,x_band_no);

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20101, 'Error al insertar en BANDS');
    END;

    PROCEDURE DEL_MUSICIAN(x_band_no IN NUMBER, x_musician_no IN NUMBER) IS
    BEGIN 
        DELETE FROM plays_in WHERE band_id = x_band_no and player = x_musician_no;
        --DELETE FROM band WHERE band_no = x_band_no AND band_contact = x_musician_no;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20102, 'Error al eliminar en BANDAS');
    END;

    PROCEDURE DEL(x_band_no IN NUMBER) IS
    BEGIN 
        DELETE FROM band WHERE band_no = x_band_no;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20102, 'Error al eliminar en BANDAS');
    END;

    FUNCTION CO RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR 
        SELECT band_no, band_name, band_type, b_date,band_home, m.m_name as composer,M.m_name as musician
        FROM BAND b
        JOIN PLAYS_IN p ON p.band_id = b.band_no
        JOIN MUSICIAN M ON M.m_no = p.player
        JOIN MUSICIAN m ON b.band_contact = m.m_no;
        RETURN v_cursor;
    END;

    FUNCTION CO_MUSICIANS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR 
        SELECT m.m_name, COUNT(DISTINCT(p.instrument)) AS num_instruments
        FROM MUSICIAN m JOIN PERFORMER p ON m.m_no=p.perf_is 
        GROUP BY m.m_name;
        
        RETURN v_cursor;
    END;

    FUNCTION CO_BANDS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR 
        WITH temp1 AS (
        SELECT band_name, COUNT(*) cnt
        FROM band b JOIN plays_in pn ON b.band_no = pn.band_id
        GROUP BY band_name)
        SELECT band_name, cnt
        FROM temp1
        WHERE cnt > (SELECT AVG(cnt) FROM temp1);
        RETURN v_cursor;
    END;
END PC_BANDS;
/
--CRUDOK
SET SERVEROUTPUT ON;

--Para probar:
INSERT INTO MUSICIAN (m_no, m_name) VALUES (1, 'John Doe');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (2, 'Jane Smith');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (3, 'Alice Cooper');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (4, 'Bob Marley');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (5, 'David Bowie');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (6, 'Freddie Mercury');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (7, 'Elvis Presley');
INSERT INTO MUSICIAN (m_no, m_name) VALUES (8, 'Jimi Hendrix');
INSERT INTO PLACE (place_no) VALUES (1);
INSERT INTO PLACE (place_no) VALUES (2);
INSERT INTO PLACE (place_no) VALUES (3);
INSERT INTO BAND VALUES (1,'band1','classical',NULL,1,3); 
INSERT INTO BAND VALUES (2,'band2','jazz',NULL,2,2); 
INSERT INTO PLAYS_IN VALUES (1,1);
INSERT INTO PLAYS_IN VALUES (2,1);
INSERT INTO PLAYS_IN VALUES (3,1);
INSERT INTO PLAYS_IN VALUES (4,2);
INSERT INTO PLAYS_IN VALUES (5,1);
INSERT INTO PLAYS_IN VALUES (6,2);
INSERT INTO PLAYS_IN VALUES (7,2);

INSERT INTO performer VALUES(1,1,'violin');
INSERT INTO performer VALUES(2,2,'viola');
INSERT INTO performer VALUES(3,1,'banjo');
INSERT INTO performer VALUES(4,3,'violin');
INSERT INTO performer VALUES(5,3,'guitar');
INSERT INTO performer VALUES(6,4,'violin');
INSERT INTO performer VALUES(7,5,'trumpet');
INSERT INTO performer VALUES(8,5,'viola');

SELECT * FROM PLAYS_IN;
SELECT * FROM MUSICIAN;
SELECT * FROM BAND;

--AD
DECLARE v_band_no NUMBER;
BEGIN
    PC_BANDS.AD(v_band_no,'band3', 'rock', NULL,1,1); 
    DBMS_OUTPUT.PUT_LINE('banda insertado exitosamente' || v_band_no);
    COMMIT;
END;
/

--MO
BEGIN
    PC_BANDS.MO(2, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Fecha de banda modificada exitosamente');
END;
/

--AD MUSICIAN
BEGIN
    PC_BANDS.AD_MUSICIAN(2,8);
    DBMS_OUTPUT.PUT_LINE('Musico añadido de la banda exitosamente');
    
END;
/
--DEL MUSICIAN
BEGIN
    PC_BANDS.DEL_MUSICIAN(2, 8);
    DBMS_OUTPUT.PUT_LINE('Musico eliminado de la banda exitosamente');
END;
/

--DEL
BEGIN
    PC_BANDS.DEL(1);
    DBMS_OUTPUT.PUT_LINE('Banda eliminada exitosamente');
END;
/

--CO
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PC_BANDS.CO;
    IF v_cursor  % ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Bandas con el nombre de sus musicos y contactos:');
    END IF;
END;
/

DECLARE
    v_cursor SYS_REFCURSOR;
    v_band_no NUMBER;
    v_band_name VARCHAR2(100);
    v_band_type VARCHAR2(100);
    v_b_date DATE;
    v_band_home NUMBER;
    v_composer_name VARCHAR2(100);  
    v_musician_name VARCHAR2(100);  
BEGIN
    v_cursor := PC_BANDS.CO;

    IF v_cursor%ISOPEN THEN
        LOOP
            FETCH v_cursor INTO v_band_no, v_band_name, v_band_type, v_b_date, v_band_home, v_composer_name, v_musician_name;
            EXIT WHEN v_cursor%NOTFOUND; 
            DBMS_OUTPUT.PUT_LINE('Band No: ' || v_band_no || ', Name: ' || v_band_name || 
                                 ', Type: ' || v_band_type || ', Date: ' || TO_CHAR(v_b_date, 'YYYY-MM-DD') ||
                                 ', Home: ' || v_band_home || ', Composer: ' || v_composer_name ||
                                 ', Musician: ' || v_musician_name);
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontraron bandas.');
    END IF;
END;
/


--CO_MUSICIANS para simplificar no metimos composiciones, pero la idea es la misma

DECLARE
    v_cursor SYS_REFCURSOR;
    v_musician_name VARCHAR2(20);
    v_num_instruments VARCHAR(20);
BEGIN
    v_cursor := PC_BANDS.CO_MUSICIANS;

    LOOP
        FETCH v_cursor INTO v_musician_name, v_num_instruments;
        
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Musico: ' || v_musician_name || ' | Instrumentos: ' || v_num_instruments);
    END LOOP;

    CLOSE v_cursor;
END;
/



--CO_BANDS
DECLARE
    v_cursor SYS_REFCURSOR;
    v_band_name VARCHAR2(100);
    v_cnt NUMBER;
BEGIN
    v_cursor := PC_BANDS.CO_BANDS;
    IF v_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Bandas con más músicos que el promedio:');
        LOOP
            FETCH v_cursor INTO v_band_name, v_cnt;
            EXIT WHEN v_cursor%NOTFOUND;  
            DBMS_OUTPUT.PUT_LINE('Banda: ' || v_band_name || ', Number of Members: ' || v_cnt);
        END LOOP;
        CLOSE v_cursor;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontraron bandas.');
    END IF;
END;
/


--CRUDNoOK-

-- 1)
BEGIN
    -- Intento de insertar una banda con un numero fuera del rango permitido
    PC_BANDS.AD(15, 'Rock Band', 'rock', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 10, 1);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
-- 2)
BEGIN
    -- Intento de insertar una banda con un tipo no permitido
    PC_BANDS.AD(2, 'Reggae Band', 'reggae', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 5, 1);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

-- 3)
BEGIN
    -- Intento de insertar una banda con un contacto de musico inexistente
    PC_BANDS.AD(3, 'Jazz Band', 'jazz', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 5, 999);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--XCRUD

DROP PACKAGE BODY PC_BANDS; 
DROP PACKAGE PC_BANDS; 