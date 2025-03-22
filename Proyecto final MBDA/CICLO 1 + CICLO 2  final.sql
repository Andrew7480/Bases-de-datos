--XTablas
DROP TABLE tempCantidadPersonajeBanner; 
DROP TABLE tempCantidadComplementoBanner; 
DROP TABLE creaBanner;
DROP TABLE llegan;
DROP TABLE publicidades;
DROP TABLE distribuye;
DROP TABLE distribuidores;
DROP TABLE artistas;
DROP TABLE generosPreferidos;
DROP TABLE personajesBanners;
DROP TABLE complementosBanners;
DROP TABLE compras;
DROP TABLE tiroEn;
DROP TABLE personajesCuentas;
DROP TABLE complementosCuentas;
DROP TABLE personajes;
DROP TABLE complementos;
DROP TABLE banners;
DROP TABLE cuentas;
DROP TABLE jugadores;
DROP TABLE tiendasIntegradas;
DROP TABLE eventos;
DROP TABLE plataformas;
DROP TABLE juegos;
DROP TABLE desarrolladores;

-- Tablas

CREATE TABLE juegos(
nombreJuego VARCHAR(35) NOT NULL,
genero VARCHAR(11)NOT NULL,
modoJuego VARCHAR(13) NOT NULL,
idDesarrollador VARCHAR(20) NOT NULL
);

CREATE TABLE eventos(
nombreEvento VARCHAR(35) NOT NULL,
fechaInicio DATE NOT NULL,
fechaFin DATE NOT NULL,
nombreJuego VARCHAR (35) NOT NULL
);

CREATE TABLE tiendasIntegradas(
idArticulo VARCHAR (20) NOT NULL,
articulo VARCHAR(20) NOT NULL,
nombreJuego VARCHAR (35) NOT NULL, 
precio NUMBER(10,2)NOT NULL

);

CREATE TABLE cuentas(
idCuenta VARCHAR(20) NOT NULL,
correo VARCHAR(20) NOT NULL,
fechaCreacion DATE NOT NULL,
telefono VARCHAR (20),
fechaConexion DATE NOT NULL,
nombreJuego VARCHAR (35) NOT NULL,
tipoId VARCHAR(20)NOT NULL,
numId VARCHAR(20)NOT NULL
);

CREATE TABLE banners(
idBanner VARCHAR(20) NOT NULL,
nombreBanner VARCHAR(30) NOT NULL,
fechaInicio DATE NOT NULL,
fechaFin DATE,
nombreJuego VARCHAR (20) NOT NULL
);

CREATE TABLE complementos(
nombreComplemento VARCHAR(35) NOT NULL,
tipo VARCHAR(20) NOT NULL
);

CREATE TABLE personajes(   -- genero estatura color vestimenta y personalidad en xmltype
nombrePersonaje VARCHAR(20) NOT NULL,
caracteristicas XMLTYPE NOT NULL, 
rol VARCHAR(7) NOT NULL
);

CREATE TABLE jugadores(
tipoId VARCHAR(20)NOT NULL,
numId VARCHAR(20)NOT NULL,
pais VARCHAR(20) NOT NULL,
fechaNacimiento DATE NOT NULL
);

CREATE TABLE complementosCuentas(
idCuenta VARCHAR(20) NOT NULL,
nombreComplemento VARCHAR(35) NOT NULL
);

CREATE TABLE personajesCuentas(
idCuenta VARCHAR(20) NOT NULL,
nombrePersonaje VARCHAR(20) NOT NULL
);

CREATE TABLE tiroEn(
idCuenta VARCHAR(20) NOT NULL,
idBanner VARCHAR(20) NOT NULL
);

CREATE TABLE compras(
idCompra VARCHAR(20) NOT NULL,
fechaCompra DATE NOT NULL,
metodoPago VARCHAR(20) NOT NULL,
costoCompra NUMBER(10,2)NOT NULL,
correo VARCHAR(20) NOT NULL,
articulo VARCHAR(16)NOT NULL,
idCuenta VARCHAR(20),
nombreJuego VARCHAR(35) NOT NULL,
idArticulo VARCHAR(20)
);

CREATE TABLE complementosBanners(
nombreComplemento VARCHAR(35) NOT NULL,
idBanner VARCHAR(20) NOT NULL
);

CREATE TABLE personajesBanners(
nombrePersonaje VARCHAR(20) NOT NULL,
idBanner VARCHAR(20) NOT NULL
);

CREATE TABLE generosPreferidos(
tipoId VARCHAR(20)NOT NULL,
numId VARCHAR(20)NOT NULL,
genero VARCHAR(11)NOT NULL
);

CREATE TABLE plataformas (
nombreJuego VARCHAR(35) NOT NULL,
plataforma VARCHAR (20) NOT NULL
);

CREATE TABLE desarrolladores(
idDesarrollador VARCHAR(20) NOT NULL,
nombreDesarrollador VARCHAR(50) NOT NULL,
pais VARCHAR(20) NOT NULL
);

CREATE TABLE distribuidores(
idDistribuidor VARCHAR(20) NOT NULL,
nombreDistribuidor VARCHAR(50) NOT NULL,
region VARCHAR(7) NOT NULL
);

CREATE TABLE distribuye(
idDistribuidor VARCHAR(20) NOT NULL,
nombreJuego VARCHAR(50) NOT NULL
);

CREATE TABLE publicidades(
nombrePublicidad VARCHAR(50) NOT NULL,
inversion NUMBER(20,2) NOT NULL,
idBanner VARCHAR(20),
fechaInicio DATE NOT NULL,
fechaFin DATE,
idDistribuidor VARCHAR(20)
);

CREATE TABLE llegan(
tipoId VARCHAR(20)NOT NULL,
numId VARCHAR(20)NOT NULL,
nombrePublicidad VARCHAR(20) NOT NULL
);

CREATE TABLE artistas(
idArtista VARCHAR(20) NOT NULL,
nombreArtista VARCHAR(20) NOT NULL
);

CREATE TABLE creaBanner (
idArtista VARCHAR(20) NOT NULL,
idBanner VARCHAR(20) NOT NULL
);

-- Primarias

ALTER TABLE juegos
ADD CONSTRAINT PK_juegos PRIMARY KEY (nombreJuego);

ALTER TABLE eventos
ADD CONSTRAINT PK_eventos PRIMARY KEY (nombreEvento);

ALTER TABLE tiendasIntegradas
ADD CONSTRAINT PK_tiendasIntegradas PRIMARY KEY (idArticulo);

ALTER TABLE cuentas
ADD CONSTRAINT PK_cuentas PRIMARY KEY (idCuenta);

ALTER TABLE banners
ADD CONSTRAINT PK_banners PRIMARY KEY (idBanner);

ALTER TABLE complementos
ADD CONSTRAINT PK_complementos PRIMARY KEY (nombreComplemento);

ALTER TABLE personajes
ADD CONSTRAINT PK_personajes PRIMARY KEY (nombrePersonaje);

ALTER TABLE jugadores
ADD CONSTRAINT PK_jugadores PRIMARY KEY (tipoId, numId);

ALTER TABLE complementosCuentas
ADD CONSTRAINT PK_complementosCuentas PRIMARY KEY (idCuenta, nombreComplemento);

ALTER TABLE personajesCuentas
ADD CONSTRAINT PK_personajesCuentas PRIMARY KEY (idCuenta, nombrePersonaje);

ALTER TABLE tiroEn
ADD CONSTRAINT PK_tiroEn PRIMARY KEY (idCuenta, idBanner);

ALTER TABLE compras
ADD CONSTRAINT PK_compras PRIMARY KEY (idCompra); 

ALTER TABLE complementosBanners
ADD CONSTRAINT PK_complementosBanners PRIMARY KEY (nombreComplemento, idBanner);

ALTER TABLE personajesBanners
ADD CONSTRAINT PK_personajesBanners PRIMARY KEY (nombrePersonaje, idBanner);

ALTER TABLE generosPreferidos
ADD CONSTRAINT PK_generosPreferidos PRIMARY KEY (tipoId, numId, genero);

ALTER TABLE plataformas
ADD CONSTRAINT PK_plataformas PRIMARY KEY (nombreJuego, plataforma);

ALTER TABLE desarrolladores
ADD CONSTRAINT PK_desarrolladoress PRIMARY KEY (idDesarrollador);

ALTER TABLE distribuidores
ADD CONSTRAINT PK_distribuidores PRIMARY KEY (idDistribuidor);

ALTER TABLE distribuye
ADD CONSTRAINT PK_distribuye PRIMARY KEY (idDistribuidor,nombreJuego);

ALTER TABLE publicidades
ADD CONSTRAINT PK_publicidades PRIMARY KEY (nombrePublicidad);

ALTER TABLE llegan
ADD CONSTRAINT PK_llegan PRIMARY KEY (tipoId, numId, nombrePublicidad);

ALTER TABLE artistas
ADD CONSTRAINT PK_artistas PRIMARY KEY (idArtista);

ALTER TABLE creaBanner
ADD CONSTRAINT PK_creaBanner PRIMARY KEY (idArtista, idBanner);

-- Unicas

ALTER TABLE tiendasIntegradas 
ADD CONSTRAINT UK_tiendasIntegradas UNIQUE (articulo, nombreJuego, precio); -- En tiendasIntegradas no puede haber un articulo en el mismo juego con el mismo precio

ALTER TABLE cuentas
ADD CONSTRAINT UK_cuentas UNIQUE (correo, nombreJuego); -- En las cuentas del mismo juego el correo no se puede repetir.

ALTER TABLE banners
ADD CONSTRAINT UK_banners UNIQUE (nombreBanner,nombreJuego);

ALTER TABLE distribuidores 
ADD CONSTRAINT UK_distribuidores UNIQUE (nombreDistribuidor, region);

ALTER TABLE artistas
ADD CONSTRAINT UK_artistas UNIQUE (nombreArtista);

ALTER TABLE desarrolladores
ADD CONSTRAINT UK_desarrolladores UNIQUE(nombreDesarrollador);
-- Foraneas

ALTER TABLE eventos 
ADD CONSTRAINT FK_eventos_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego);

ALTER TABLE tiendasIntegradas
ADD CONSTRAINT FK_tiendasIntegradas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego);

ALTER TABLE cuentas
ADD CONSTRAINT FK_cuentas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego);

ALTER TABLE cuentas
ADD CONSTRAINT FK_cuentas_jugadores FOREIGN KEY (tipoId, numId) REFERENCES jugadores(tipoId, numId);

ALTER TABLE banners 
ADD CONSTRAINT FK_banners_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego);

ALTER TABLE complementosCuentas
ADD CONSTRAINT FK_complementosCuentas_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta);

ALTER TABLE complementosCuentas
ADD CONSTRAINT FK_complementosCuentas_complementos FOREIGN KEY (nombreComplemento) REFERENCES complementos(nombreComplemento);

ALTER TABLE personajesCuentas
ADD CONSTRAINT FK_personajesCuentas_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta);

ALTER TABLE personajesCuentas
ADD CONSTRAINT FK_personajesCuentas_personajes FOREIGN KEY (nombrePersonaje) REFERENCES personajes(nombrePersonaje);

ALTER TABLE tiroEn 
ADD CONSTRAINT FK_tiroEn_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta);

ALTER TABLE tiroEn
ADD CONSTRAINT FK_tiroEn_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner);

ALTER TABLE compras
ADD CONSTRAINT FK_compras_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta);

ALTER TABLE compras
ADD CONSTRAINT FK_compras_tiendasIntegradas FOREIGN KEY (idArticulo) REFERENCES tiendasIntegradas(idArticulo);

ALTER TABLE complementosBanners 
ADD CONSTRAINT FK_complementosBanners_complementos FOREIGN KEY (nombreComplemento) REFERENCES complementos(nombreComplemento);

ALTER TABLE complementosBanners 
ADD CONSTRAINT FK_complementosBanners_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner);

ALTER TABLE personajesBanners
ADD CONSTRAINT FK_personajesBanners_personajes FOREIGN KEY (nombrePersonaje) REFERENCES personajes(nombrePersonaje);

ALTER TABLE personajesBanners
ADD CONSTRAINT FK_personajesBanners_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner);

ALTER TABLE generosPreferidos
ADD CONSTRAINT FK_generosPreferidos_jugadores FOREIGN KEY (tipoId, numId) REFERENCES jugadores(tipoId, numId);

ALTER TABLE plataformas
ADD CONSTRAINT FK_plataformas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos (nombreJuego);

ALTER TABLE juegos
ADD CONSTRAINT FK_juegos_desarrolladores FOREIGN KEY (idDesarrollador) REFERENCES desarrolladores(idDesarrollador);

ALTER TABLE creaBanner
ADD CONSTRAINT FK_creaBanner_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner);

ALTER TABLE distribuye
ADD CONSTRAINT FK_distribuye_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego);

ALTER TABLE distribuye
ADD CONSTRAINT FK_distribuye_distribuidores FOREIGN KEY (idDistribuidor) REFERENCES distribuidores(idDistribuidor);

ALTER TABLE creaBanner
ADD CONSTRAINT FK_creaBanner_artistas FOREIGN KEY (idArtista) REFERENCES artistas(idArtista);

ALTER TABLE publicidades
ADD CONSTRAINT FK_publicidades_distribuidores FOREIGN KEY (idDistribuidor) REFERENCES distribuidores(idDistribuidor);

ALTER TABLE publicidades
ADD CONSTRAINT FK_publicidades_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner);

ALTER TABLE llegan 
ADD CONSTRAINT FK_llegan_publicidades FOREIGN KEY (nombrePublicidad) REFERENCES publicidades(nombrePublicidad);

ALTER TABLE llegan
ADD CONSTRAINT FK_llegan_jugadores FOREIGN KEY (tipoId, numId) REFERENCES jugadores(tipoId, numId);

-- Atributos

ALTER TABLE plataformas
ADD CONSTRAINT CK_plataformas_plataforma CHECK ((plataforma = 'PC')OR(plataforma = 'Consola')OR(plataforma = 'Mobil'));

ALTER TABLE juegos
ADD CONSTRAINT CK_juegos_genero CHECK ((genero = 'Aventura')OR(genero = 'RPG')OR(genero = 'Accion')OR(genero = 'Deporte')OR(genero = 'Estrategico') OR (genero='Musica'));

ALTER TABLE juegos
ADD CONSTRAINT CK_juegos_modoJuego CHECK ((modoJuego = 'Single player')OR(modoJuego = 'Multiplayer')OR(modoJuego = 'Cooperativo'));

ALTER TABLE tiendasIntegradas
ADD CONSTRAINT CK_tiendasIntegradas_articulo CHECK ((articulo = 'Moneda integrada')OR(articulo = 'Membresia'));

ALTER TABLE compras
ADD CONSTRAINT CK_compras_articulo CHECK ((articulo = 'Moneda integrada')OR(articulo = 'Membresia'));

--ALTER TABLE personajes    --Ya no por archivo XML
--ADD CONSTRAINT CK_personajes_generoPersonaje CHECK ((generoPersonaje = 'Hombre')OR(generoPersonaje = 'Mujer'));

ALTER TABLE personajes
ADD CONSTRAINT CK_personajes_rol CHECK ((rol = 'DPS')OR(rol = 'Soporte')OR(rol = 'Healer'));

ALTER TABLE complementos
ADD CONSTRAINT CK_complementos_tipo CHECK ((tipo = 'Arma')OR(tipo = 'Accesorio')OR(tipo = 'Ropa'));

ALTER TABLE generosPreferidos
ADD CONSTRAINT CK_generosPreferidos_genero CHECK ((genero = 'Aventura')OR(genero = 'RPG')OR(genero = 'Accion')OR(genero = 'Deporte')OR(genero = 'Estrategico'));

ALTER TABLE banners
ADD CONSTRAINT CK_banners_fecha_inicioFin CHECK (fechaInicio < fechaFin); -- La fecha de inicio de un banner tiene que ser menor a la fecha de fin del evento

ALTER TABLE eventos 
ADD CONSTRAINT CK_eventos_fecha_inicioFin CHECK (fechaInicio < fechaFin); -- La fecha de inicio de un evento tiene que ser menor a la fecha de fin del evento

ALTER TABLE tiendasIntegradas
ADD CONSTRAINT CK_tiendasIntegradas_precio CHECK (precio>0);

ALTER TABLE compras
ADD CONSTRAINT CK_compras_costoCompra CHECK (costoCompra>0);

ALTER TABLE distribuidores
ADD CONSTRAINT CK_distribuidores_region CHECK ((region = 'Asia')OR(region = 'Europa')OR(region = 'Africa')OR(region = 'America')OR(region = 'Oceania') OR (region = 'Global'));

ALTER TABLE publicidades 
ADD CONSTRAINT CK_publicidades_fechaInicio_inicioFin CHECK (fechaInicio < fechaFin); 

ALTER TABLE publicidades
ADD CONSTRAINT CK_publicidades_inversion CHECK (inversion>0);

ALTER TABLE Distribuidores
ADD CONSTRAINT CK_Distribuidores_id CHECK (idDistribuidor LIKE 'DB_%');

ALTER TABLE Desarrolladores
ADD CONSTRAINT CK_Desarrolladores_id CHECK (idDesarrollador LIKE 'DR_%');

ALTER TABLE Artistas
ADD CONSTRAINT CK_Artistas_id CHECK (idArtista LIKE 'AT_%');

ALTER TABLE cuentas
ADD CONSTRAINT CK_cuentas_Correo CHECK (correo LIKE '%@%' AND correo LIKE '%.%');


-------------  Acciones------------
------------- jugador

ALTER TABLE generosPreferidos DROP CONSTRAINT FK_generosPreferidos_jugadores;

ALTER TABLE generosPreferidos
ADD CONSTRAINT FK_generosPreferidos_jugadores FOREIGN KEY (tipoId, numId) REFERENCES jugadores(tipoId, numId) ON DELETE CASCADE;

---------------- juego

ALTER TABLE eventos
DROP CONSTRAINT FK_eventos_juegos;

ALTER TABLE plataformas
DROP CONSTRAINT FK_plataformas_juegos;

ALTER TABLE tiendasIntegradas
DROP CONSTRAINT FK_tiendasIntegradas_juegos;

ALTER TABLE banners
DROP CONSTRAINT FK_banners_juegos;

ALTER TABLE complementosBanners 
DROP CONSTRAINT FK_complementosBanners_banners;

ALTER TABLE personajesBanners
DROP CONSTRAINT FK_personajesBanners_banners;

ALTER TABLE eventos 
ADD CONSTRAINT FK_eventos_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego) ON DELETE CASCADE; -- Si  se elimina un juego se eliminan los eventos relacionados al juego

ALTER TABLE plataformas
ADD CONSTRAINT FK_plataformas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos (nombreJuego) ON DELETE CASCADE; -- Si  se elimina un juego se eliminan las plataformas relacionadas al juego

ALTER TABLE banners
ADD CONSTRAINT FK_banners_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos (nombreJuego) ON DELETE CASCADE; -- Si  se elimina un juego se eliminan los banners relacionados al juego

ALTER TABLE tiendasIntegradas
ADD CONSTRAINT FK_tiendasIntegradas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego)ON DELETE CASCADE; -- Si  se elimina un juego se elimina la tienda integrada relacionada al juego

ALTER TABLE complementosBanners 
ADD CONSTRAINT FK_complementosBanners_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner) ON DELETE CASCADE; -- Si se elimina banner se elimina  a donde pertenecían los complementos

ALTER TABLE personajesBanners
ADD CONSTRAINT FK_personajesBanners_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner) ON DELETE CASCADE; -- Si se elimina banner se elimina  donde pertenecían los personajes 

ALTER TABLE cuentas
DROP CONSTRAINT FK_cuentas_juegos;

ALTER TABLE cuentas
ADD CONSTRAINT FK_cuentas_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego) ON DELETE CASCADE; -- Si  se elimina un juego se eliminan las cuentas relacionadas al juego

------------------------ banner
ALTER TABLE tiroEn 
DROP CONSTRAINT FK_tiroEn_cuentas;

ALTER TABLE tiroEn 
DROP CONSTRAINT  FK_tiroEn_banners;

ALTER TABLE complementosCuentas
DROP CONSTRAINT FK_complementosCuentas_cuentas;

ALTER TABLE personajesCuentas
DROP CONSTRAINT FK_personajesCuentas_cuentas;

--ALTER TABLE complementosCuentas
--DROP CONSTRAINT FK_complementosCuentas_complementos; 

--ALTER TABLE personajesCuentas
--DROP CONSTRAINT FK_personajesCuentas_personajes; 

ALTER TABLE complementosCuentas
ADD CONSTRAINT FK_complementosCuentas_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta)ON DELETE CASCADE; -- Si se elimina cuentas se eliminan sus complementos

ALTER TABLE personajesCuentas
ADD CONSTRAINT FK_personajesCuentas_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta)ON DELETE CASCADE; -- Si se elimina cuentas se eliminan sus personajes 

--ALTER TABLE complementosCuentas
--ADD CONSTRAINT FK_complementosCuentas_complementos FOREIGN KEY (nombreComplemento) REFERENCES complementos(nombreComplemento)ON DELETE CASCADE; -- Si se elimina un complemento se elimina el personaje de las cuentas  

--ALTER TABLE personajesCuentas
--ADD CONSTRAINT FK_personajesCuentas_personajes FOREIGN KEY (nombrePersonaje) REFERENCES personajes(nombrePersonaje)ON DELETE CASCADE; -- Si se elimina un personaje se elimina el personaje de las cuentas 

ALTER TABLE tiroEn 
ADD CONSTRAINT FK_tiroEn_cuentas FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta) ON DELETE CASCADE;  -- Si se elimina cuentas se eliminan los banners en donde tiro (Accion mantener banners)

ALTER TABLE tiroEn
ADD CONSTRAINT FK_tiroEn_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner) ON DELETE CASCADE; -- Si se elimina el banner se eliminan los tiroEn relacionados al banner eliminado


------------- Empresa

ALTER TABLE juegos
DROP CONSTRAINT FK_juegos_desarrolladores;

ALTER TABLE creabanner
DROP CONSTRAINT FK_creabanner_banners;

ALTER TABLE distribuye
DROP CONSTRAINT FK_distribuye_juegos;

ALTER TABLE distribuye
DROP CONSTRAINT FK_distribuye_distribuidores;

ALTER TABLE creabanner
DROP CONSTRAINT FK_creabanner_artistas;

ALTER TABLE publicidades
DROP CONSTRAINT FK_publicidades_distribuidores;

ALTER TABLE publicidades
DROP CONSTRAINT FK_publicidades_banners;

--ALTER TABLE llegan 
--DROP CONSTRAINT FK_llegan_publicidades;

--ALTER TABLE llegan
--DROP CONSTRAINT FK_llegan_jugadores;

ALTER TABLE juegos
ADD CONSTRAINT FK_juegos_desarrolladores FOREIGN KEY (idDesarrollador) REFERENCES desarrolladores(idDesarrollador) ON DELETE CASCADE;

ALTER TABLE creaBanner
ADD CONSTRAINT FK_creaBanner_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner) ON DELETE CASCADE;

ALTER TABLE distribuye
ADD CONSTRAINT FK_distribuye_juegos FOREIGN KEY (nombreJuego) REFERENCES juegos(nombreJuego) ON DELETE CASCADE;

ALTER TABLE distribuye
ADD CONSTRAINT FK_distribuye_distribuidores FOREIGN KEY (idDistribuidor) REFERENCES distribuidores(idDistribuidor) ON DELETE CASCADE;

ALTER TABLE creaBanner
ADD CONSTRAINT FK_creaBanner_artistas FOREIGN KEY (idArtista) REFERENCES artistas(idArtista) ON DELETE CASCADE;

ALTER TABLE publicidades
ADD CONSTRAINT FK_publicidades_distribuidores FOREIGN KEY (idDistribuidor) REFERENCES distribuidores(idDistribuidor)  ON DELETE SET NULL; --ON DELETE CASCADE;

ALTER TABLE publicidades
ADD CONSTRAINT FK_publicidades_banners FOREIGN KEY (idBanner) REFERENCES banners(idBanner)  ON DELETE SET NULL; --ON DELETE CASCADE;

--ALTER TABLE llegan 
--ADD CONSTRAINT FK_llegan_publicidades FOREIGN KEY (nombrePublicidad) REFERENCES publicidades(nombrePublicidad) ON DELETE CASCADE;

--ALTER TABLE llegan
--ADD CONSTRAINT FK_llegan_jugadores FOREIGN KEY (tipoId, numId) REFERENCES jugadores(tipoId, numId) ON DELETE CASCADE;



------------triggers------------------------------------------------------

-- mantener banners--------
--Ad:

CREATE OR REPLACE TRIGGER TR_banners_insert
BEFORE INSERT ON banners
FOR EACH ROW
DECLARE cantidadFechaFin NUMBER(1);
BEGIN
    
    
    IF :NEW.fechaFin IS NULL THEN -- Se mira si la fecha fin del banner que se quiere agregar es NULL
        SELECT COUNT(*) INTO cantidadFechaFin
        FROM banners
        WHERE banners.fechaFin IS NULL AND :NEW.nombreJuego = banners.nombrejuego; -- Se cuenta la cantidad de fechas de fin de banners que no tengan fechaFin y deberia siempre dar 1 o 0
        IF cantidadFechaFin > 0 THEN 
        raise_application_error (-20001, 'El juego ya tiene un banner standard'); -- Solo puede haber un banner sin fecha de fin por juego.
        END IF;
    END IF;
    
    IF :NEW.fechaFin <= SYSDATE AND  :NEW.fechaFin IS NOT NULL THEN
        raise_application_error (-20002, 'La fecha de fin del banner es menor a la fecha del sistema'); -- La fecha de fin de un banner tiene que ser mayor a la de inicio. 
    END IF;

    :NEW.fechaInicio := SYSDATE; -- La fecha de inicio del banner es la del sistema 
    :NEW.idBanner := DBMS_RANDOM.STRING('A', 20); -- El id del banner es una cadena generada automaticamente por 20 caracteres alfanumericos las letras pueden ser minusculas o mayusculas 
END TR_banners_insert;
/



CREATE OR REPLACE TRIGGER TR_personajesBanners_insert
BEFORE INSERT ON personajesBanners
FOR EACH ROW
DECLARE cantidadBannerComplemento NUMBER(1); 
cantidadBannerFechaFinNula NUMBER(1);
existenciaNombreJuegoPersonaje NUMBER (10);
nombreJuegoPersonaje VARCHAR (35);
nombreJuegoBanner VARCHAR(35);
BEGIN
    
    SELECT COUNT(*) INTO existenciaNombreJuegoPersonaje
    FROM personajesBanners
    WHERE :NEW.nombrePersonaje = nombrePersonaje; -- Se verifica si el personaje que se esta intentando agregar a un banner ya esta agregado a un banner
    
    IF existenciaNombreJuegoPersonaje > 0 THEN
        
        SELECT nombreJuego INTO nombreJuegoPersonaje
        FROM banners b
        JOIN personajesBanners p ON p.idBanner = b.idBanner 
        WHERE :NEW.nombrePersonaje = nombrePersonaje
        FETCH FIRST 1 ROWS ONLY; -- Se pone el nombre del juego de un banner donde pertenezca el personaje en una variable
        
        SELECT nombreJuego INTO nombreJuegoBanner
        FROM banners b
        WHERE :NEW.idBanner = idBanner; -- Se pone el nombre del juego del banner donde se quiere agregar al personaje en una variable
        
        IF nombreJuegoBanner != nombreJuegoPersonaje THEN
            raise_application_error (-20003,'Un personaje no puede estar en banners de dos juegos diferentes');  -- Los personajes solo pueden pertenecer a banners de un unico juego.
        END IF;
    END IF;
    
    SELECT Count(*)INTO cantidadBannerComplemento
    FROM complementosBanners
    WHERE idBanner = :NEW.idBanner; -- Se mira si el id del banner esta en complementosBanners 
    
    IF cantidadBannerComplemento > 0 THEN
        
        SELECT count(*) INTO cantidadBannerFechaFinNula
        FROM banners
        WHERE banners.fechaFin IS NULL AND :NEW.idBanner = banners.idBanner; -- Se busca si el banner donde se esta intentando insertar el dato es el banner standard si da 1 es el standard y si es 0 no lo es
    IF cantidadBannerFechaFinNula = 0 THEN
        raise_application_error (-20004, 'Estas intentando poner un personaje en un banner de complementos y no es el banner standard'); -- Los banners sin fecha de fin son los unicos que se pueden relacionar con complementos y personajes al mismo tiempo.
    END IF;
    
    END IF;

END TR_personajesBanners_insert;
/


CREATE OR REPLACE TRIGGER TR_complementosBanners_insert
BEFORE INSERT ON complementosBanners
FOR EACH ROW
DECLARE cantidadBannerpersonaje NUMBER(1); 
cantidadBannerFechaFinNula NUMBER(1);
existenciaNombreJuegoComplemento NUMBER (10);
nombreJuegoComplemento VARCHAR (35);
nombreJuegoBanner VARCHAR(35);
BEGIN

    SELECT COUNT(*) INTO existenciaNombreJuegoComplemento
    FROM complementosBanners
    WHERE :NEW.nombreComplemento = nombreComplemento; -- Se verifica si el complemento que se esta intentando agregar a un banner ya esta agregado a un banner
    
    IF existenciaNombreJuegoComplemento > 0 THEN
    
        SELECT nombreJuego INTO nombreJuegoComplemento
        FROM banners b
        JOIN complementosBanners c ON c.idBanner = b.idBanner 
        WHERE :NEW.nombreComplemento = nombreComplemento
        FETCH FIRST 1 ROWS ONLY; -- Se pone el nombre del juego de un banner donde pertenezca el complemento en una variable
        
        SELECT nombreJuego INTO nombreJuegoBanner
        FROM banners b
        WHERE :NEW.idBanner = idBanner; -- Se pone el nombre del juego del banner donde se quiere agregar al complemento en una variable
        
        IF nombreJuegoBanner != nombreJuegoComplemento THEN
            raise_application_error (-20005,'Un complemento no puede esta en banners de dos juegos diferentes');  -- Los complementos solo pueden pertenecer a banners de un unico juego.
        END IF;
    END IF;

    SELECT COUNT(*)INTO cantidadBannerpersonaje
    FROM personajesBanners
    WHERE idBanner = :NEW.idBanner; -- Se mira si el id del banner esta en cantidadBannerpersonajeBanners 
    
    IF cantidadBannerpersonaje > 0 THEN
    
        SELECT COUNT(*) INTO cantidadBannerFechaFinNula
        FROM banners
        WHERE banners.fechaFin IS NULL AND :NEW.idBanner = banners.idBanner; -- Se busca si el banner donde se esta intentando insertar el dato es el banner standard si da 1 es el standard y si es 0 no lo es
        IF cantidadBannerFechaFinNula = 0 THEN
            raise_application_error (-20006, 'Estas intentando poner un complemento en un banner de personajes y no es el banner standard'); -- Los banners sin fecha de fin son los unicos que se pueden relacionar con complementos y personajes al mismo tiempo.
    
        END IF;
    
    END IF;

END TR_complementosBanners_insert;
/

--Mo:

CREATE GLOBAL TEMPORARY TABLE tempCantidadPersonajeBanner( 
    nombrePersonaje VARCHAR(35),
    cantidad NUMBER
) ON COMMIT DELETE ROWS;

CREATE GLOBAL TEMPORARY TABLE tempCantidadComplementoBanner(  
    nombreComplemento VARCHAR(35),
    cantidad NUMBER 
) ON COMMIT DELETE ROWS;

   -- No se puede puede modificar la tabla de banners.
   
CREATE OR REPLACE TRIGGER TR_banners_update
BEFORE UPDATE ON banners
FOR EACH ROW
BEGIN

    raise_application_error (-20007, 'No se puede modificar banners'); 
    
END TR_banners_update;
/   


  -- Solo se puede modificar rol de los personajes

CREATE OR REPLACE TRIGGER TR_personajes_update
BEFORE UPDATE ON personajes
FOR EACH ROW
DECLARE new_caracteristicas CLOB;
old_caracteristicas CLOB;
BEGIN
    SELECT XMLSERIALIZE(CONTENT :NEW.caracteristicas AS CLOB) INTO new_caracteristicas
    FROM dual;

    SELECT XMLSERIALIZE(CONTENT :OLD.caracteristicas AS CLOB) INTO old_caracteristicas
    FROM dual;

    IF :NEW.nombrepersonaje != :OLD.nombrepersonaje OR new_caracteristicas != old_caracteristicas THEN
        raise_application_error(-20008, 'Solo se puede modificar el rol de los personajes');
    END IF;
END TR_personajes_update;
/

 
 
   -- Solo se puede modificar el tipo de complementos.
 
CREATE OR REPLACE TRIGGER TR_complementos_update
BEFORE UPDATE ON complementos
FOR EACH ROW
BEGIN
    IF  :NEW.nombreComplemento != :OLD.nombreComplemento THEN
    raise_application_error (-20009, 'solo se puede modificar el tipo del complemento'); 
    END IF;
END TR_complementos_update;
/

-- No se puede modificar complementosBanners 

CREATE OR REPLACE TRIGGER TR_complementosBanners_update
BEFORE UPDATE ON complementosBanners 
FOR EACH ROW
BEGIN

    raise_application_error (-20010, 'No se puede modificar complementosBanners'); 
    
END TR_complementosBanners_update;
/   

-- No se puede modificar personajesBanners 

CREATE OR REPLACE TRIGGER TR_personajesBanners_update
BEFORE UPDATE ON personajesBanners
FOR EACH ROW
BEGIN

    raise_application_error (-20011, 'No se puede modificar personajesBanners'); 
    
END TR_personajesBanners_update;
/   
 
--El:
  -- Los personajes solo se pueden borrar cuando no estan relacionados a ningun banner

CREATE OR REPLACE TRIGGER TR_guardar_tempCantidadPersonajeBanner_personajesBanners_personajes 
BEFORE DELETE ON personajes  
DECLARE existenciaTabla NUMBER;
BEGIN
    
    SELECT COUNT(*) INTO existenciaTabla
    FROM tempCantidadPersonajeBanner;
    
    IF existenciaTabla = 0 THEN
        DELETE FROM tempCantidadPersonajeBanner;

        INSERT INTO tempCantidadPersonajeBanner (nombrePersonaje, cantidad)
        SELECT nombrePersonaje, COUNT(*) -- -1
        FROM personajesBanners
        GROUP BY nombrePersonaje;
        
    END IF;
    
END TR_guardar_tempCantidadPersonajeBanner;
/

CREATE OR REPLACE TRIGGER TR_personajes_delete 
AFTER DELETE ON personajes
FOR EACH ROW
DECLARE verificadorExistencia NUMBER(3);
BEGIN
    SELECT cantidad INTO verificadorExistencia
    FROM tempCantidadPersonajeBanner
    WHERE :OLD.nombrePersonaje = nombrePersonaje;
    IF verificadorExistencia > 0 THEN
        raise_application_error (-20012, 'El personaje que intentas eliminar aun tiene banners a los que pertenece'); 
    END IF;
END TR_personajes_delete;
/

  -- Los complementos solo se pueden borrar cuando no estan relacionados a ningun banner

CREATE OR REPLACE TRIGGER TR_guardar_tempCantidadComplementoBanner_complementos 
BEFORE DELETE ON complementos
DECLARE existenciaTabla NUMBER;
BEGIN
    
    SELECT COUNT(*) INTO existenciaTabla
    FROM tempCantidadComplementoBanner;
    
    IF existenciaTabla = 0 THEN
        DELETE FROM tempCantidadComplementoBanner;

        INSERT INTO tempCantidadComplementoBanner (nombreComplemento, cantidad)
        SELECT nombreComplemento, COUNT(*)-- -1
        FROM complementosBanners
        GROUP BY nombreComplemento;
    END IF;
    
END TR_guardar_tempCantidadComplementoBanner;
/

CREATE OR REPLACE TRIGGER TR_complementos_delete 
AFTER DELETE ON complementos
FOR EACH ROW
DECLARE verificadorExistencia NUMBER(5);
BEGIN
    SELECT cantidad INTO verificadorExistencia
    FROM tempCantidadComplementoBanner
    WHERE :OLD.nombreComplemento = nombreComplemento;
    IF verificadorExistencia > 0 THEN
        raise_application_error (-20013, 'El complemento que intentas eliminar aun tiene banners a los que pertenece'); 
    END IF;
END TR_complementos_delete;
/

---  Los personajes y complementos se borran cuando se borran todas sus relaciones con todos los banners. 


CREATE OR REPLACE TRIGGER TR_guardar_tempCantidadPersonajeBanner_personajesBanners 
BEFORE DELETE ON personajesBanners
BEGIN
    DELETE FROM tempCantidadPersonajeBanner;

    INSERT INTO tempCantidadPersonajeBanner (nombrePersonaje, cantidad)
    SELECT nombrePersonaje, COUNT(*)-1
    FROM personajesBanners
    GROUP BY nombrePersonaje;
    
END TR_guardar_tempCantidadPersonajeBanner_personajesBanners;
/

CREATE OR REPLACE TRIGGER TR_guardar_tempCantidadComplementoBanner_complementosBanners 
BEFORE DELETE ON complementosBanners
BEGIN
    DELETE FROM tempCantidadComplementoBanner;

    INSERT INTO tempCantidadComplementoBanner (nombreComplemento, cantidad)
    SELECT nombreComplemento, COUNT(*)-1
    FROM complementosBanners
    GROUP BY nombreComplemento;
    
END TR_guardar_tempCantidadComplementoBanner_complementosBanners;
/

CREATE OR REPLACE TRIGGER TR_personajesBanners_delete_A 
AFTER DELETE ON personajesBanners
FOR EACH ROW
DECLARE verificadorExistencia NUMBER(5);
BEGIN
    SELECT cantidad INTO verificadorExistencia
    FROM tempCantidadPersonajeBanner
    WHERE :OLD.nombrePersonaje = nombrePersonaje; -- Se verifica que despues de eliminar un personaje de un banner el personaje aun tenga banners relacionados
    
    IF verificadorExistencia = 0 THEN
    DELETE FROM personajes WHERE nombrePersonaje = :OLD.nombrePersonaje; --Si el personaje no tiene mas banners relacionados, el personaje se borra
    END IF;
    
END TR_personajesBanners_delete_A;
/

CREATE OR REPLACE TRIGGER TR_complementosBanners_delete_A 
AFTER DELETE ON complementosBanners
FOR EACH ROW
DECLARE verificadorExistencia NUMBER(5);
BEGIN
    SELECT cantidad INTO verificadorExistencia
    FROM tempCantidadComplementoBanner
    WHERE :OLD.nombreComplemento = nombreComplemento; -- Se verifica que despues de eliminar un complemento de un banner el complemento aun tenga banners relacionados
    IF verificadorExistencia = 0 THEN
        DELETE FROM complementos WHERE nombreComplemento = :OLD.nombreComplemento; -- Si el complemento no tiene mas banners relacionados, el complemento se borra
    END IF;
END TR_complementosBanners_delete_A;
/


-- Registrar jugador-------------

--Ad:

CREATE OR REPLACE TRIGGER TR_jugadores_insert_A
AFTER INSERT ON jugadores
FOR EACH ROW
BEGIN

    INSERT INTO generosPreferidos VALUES (:NEW.tipoId, :NEW.numId, 'Accion'); -- Al registrar un jugador automaticamente se genera un genero preferido de accion

END TR_jugadores_insert_A;
/

CREATE OR REPLACE TRIGGER TR_jugadores_insert_B
BEFORE INSERT ON jugadores
FOR EACH ROW
BEGIN

    IF :NEW.fechaNacimiento >= SYSDATE THEN
        raise_application_error (-20014,'La fecha de nacimiento no puede ser mayor o igual a la fecha del sistema'); -- La fecha de nacimiento del jugador tiene que ser menor a la del sistema
    END IF;
  

END TR_jugadores_insert_B;
/

--Mo:

-- Solo se puede modificar pais de la tabla jugadores.
   
CREATE OR REPLACE TRIGGER TR_jugadores_update
BEFORE UPDATE ON jugadores
FOR EACH ROW
BEGIN

    IF :NEW.fechaNacimiento != :OLD.fechaNacimiento OR :NEW.tipoId != :OLD.tipoId OR :NEW.numId != :OLD.numId THEN 
        raise_application_error (-20015,'Solo se puede modificar el pais del jugador');
    END IF;

END TR_jugadores_update;
/

-- Mantener juego-------

--Ad:

-- Las cuentas solo pueden tirar en banners del mismo juego de la cuenta donde se esta tirando.
-- Los jugadores solo pueden tirar en los banner del juego donde pertenece su cuenta. 

CREATE OR REPLACE TRIGGER TR_tiroEn_insert  --:mejor Triiger
BEFORE INSERT ON tiroEn
FOR EACH ROW
DECLARE nombreJuegoCuenta VARCHAR (35);
nombreJuegoBanner VARCHAR (35);
BEGIN

    SELECT nombreJuego INTO nombreJuegoCuenta
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta ; -- Se pone el nombre del juego de la cuenta que quiere hacer una tirada en una variable
    
    SELECT nombreJuego INTO nombreJuegoBanner
    FROM banners
    WHERE :NEW.idBanner = idBanner ; -- Se pone el nombre del juego del banner donde se esta tirando en una variable

    IF nombreJuegoCuenta != nombreJuegoBanner THEN 
        raise_application_error (-20016,'No puedes tirar en un banner que no pertenece al juego de la cuenta'); 
    END IF;

END TR_tiroEn_insert;
/

---

CREATE OR REPLACE TRIGGER TR_personajesCuentas_insert
BEFORE INSERT ON personajesCuentas
FOR EACH ROW
DECLARE nombreJuegoCuenta VARCHAR (35);
nombreJuegoBanner VARCHAR (35);
existenciaTirada NUMBER (10);
BEGIN

    -- Las cuentas solo pueden tener personajes que sean del mismo juego de la cuenta.
    
    SELECT nombreJuego INTO nombreJuegoCuenta
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta ; -- Se pone el nombre del juego de la cuenta en una variable
    
    SELECT nombreJuego INTO nombreJuegoBanner
    FROM banners b
    JOIN personajesBanners p ON p.idBanner = b.idBanner 
    WHERE :NEW.nombrePersonaje = nombrePersonaje
    FETCH FIRST 1 ROWS ONLY;         -- Se pone el nombre del juego de un banner donde pertenezca el personaje en una variable

    IF nombreJuegoCuenta != nombreJuegoBanner THEN 
        raise_application_error (-20017,'No puedes tener un personaje que no pertenece al juego de la cuenta');  
    END IF;
    
    -- Una cuenta no puede tener personajes de banners donde no tiro en.

   SELECT COUNT(*) INTO existenciaTirada
   FROM tiroEn t
   JOIN personajesBanners p ON p.idBanner = t.idBanner 
   WHERE :NEW.nombrePersonaje = nombrePersonaje AND :NEW.idCuenta = idCuenta; -- Se verifica que el personaje que se esta intentando agregar este en un banner que la cuenta en la que se esta intentando agregar haya tirado por
   
   IF existenciaTirada = 0 THEN -- Si no se a tirado nunca en un banner con el personaje sale error
    raise_application_error (-20018,'No puedes tener un personaje que no este en un banner en el que no hayas tirado'); 
   END IF;

END TR_personajesCuentas_insert;
/

CREATE OR REPLACE TRIGGER TR_complementosCuentas_insert
BEFORE INSERT ON complementosCuentas
FOR EACH ROW
DECLARE nombreJuegoCuenta VARCHAR (35);
nombreJuegoBanner VARCHAR (35);
existenciaTirada NUMBER (10);
BEGIN

    -- Las cuentas solo pueden tener complementos que sean del mismo juego de la cuenta.

    SELECT nombreJuego INTO nombreJuegoCuenta
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta ; -- Se pone el nombre del juego de la cuenta en una variable
    
    SELECT nombreJuego INTO nombreJuegoBanner
    FROM banners b
    JOIN complementosBanners c ON c.idBanner = b.idBanner 
    WHERE :NEW.nombreComplemento = nombreComplemento 
    FETCH FIRST 1 ROWS ONLY;                       -- Se pone el nombre del juego de un banner donde pertenezca el complemento en una variable

    IF nombreJuegoCuenta != nombreJuegoBanner THEN 
        raise_application_error (-20019,'No puedes tener un personaje que no pertenece al juego de la cuenta'); 
    END IF;
    
    -- Una cuenta no puede tener complementos de banners donde no tiro en.
    
   SELECT COUNT(*) INTO existenciaTirada
   FROM tiroEn t
   JOIN complementosBanners c ON c.idBanner = t.idBanner 
   WHERE :NEW.nombreComplemento = nombreComplemento AND :NEW.idCuenta = idCuenta; -- Se verifica que el complemento que se esta intentando agregar este en un banner que la cuenta en la que se esta intentando agregar haya tirado por
   
   IF existenciaTirada = 0 THEN -- Si no se a tirado nunca en un banner con el complemento sale error
    raise_application_error (-20020,'No puedes tener un personaje que no este en un banner en el que no hayas tirado');  
   END IF;

END TR_complementosCuentas_insert;
/


-- la fecha de compra debe ser mayor a la fecha de creacion de la cuenta

CREATE OR REPLACE TRIGGER TR_compras_insert
BEFORE INSERT ON compras
FOR EACH ROW
DECLARE vFechaCreacion DATE;
nombreJuegoCuenta VARCHAR (35);
nombreJuegoArticulo VARCHAR (35);
vCorreo VARCHAR (20);
vArticulo VARCHAR (20);
vNombreJuego VARCHAR (35);
vCostoCompra NUMBER(10,2);

BEGIN


    SELECT fechaCreacion INTO vFechaCreacion 
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta ; -- Se pone la fecha de creacion de la cuenta en una variable
    
    :NEW.fechaCompra := SYSDATE; -- La fecha de compra es la fecha del sistema al momento de hacer la compra.
    
    IF :NEW.fechaCompra < vFechaCreacion THEN 
        raise_application_error (-20021,'La fecha de compra de la cuenta debe ser mayor a la fecha de creacion de la cuenta'); --- la fecha de compra debe ser mayor a la fecha de creacion de la cuenta
    END IF;
    
    IF :NEW.idArticulo IS NULL OR :NEW.idCuenta IS NULL THEN 
        RAISE_APPLICATION_ERROR(-20022, 'No se puede agregar una compra con idCuenta o idArticulo nulos'); -- Una compra no se puede agregar con idCuenta o idArticulo NULL
    END IF;
    
    ---
    
    SELECT nombreJuego INTO nombreJuegoCuenta
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta ; -- Se pone el nombre del juego de la cuenta donde se quiere hacer la compra en una variable
    
    SELECT nombreJuego INTO nombreJuegoArticulo
    FROM tiendasIntegradas 
    WHERE :NEW.idArticulo = idArticulo ; -- Se pone el nombre del juego del articulo que se quiere comprar en una variable
    
    IF nombreJuegoArticulo != nombreJuegoCuenta THEN
        RAISE_APPLICATION_ERROR(-20023, 'No puedes hacer una compra de un articulo que no pertenece al juego de la cuenta'); -- Las compras solo se pueden hacer con una cuenta que pertenezca al mismo juego del articulo que se vaya a hacer la compra. 
    END IF;
    
    -- El costoCompra,correo, articulo y nombre del juego de la compra se ponen automaticamente  --------------------------------------------------yo creo q costo tmb es automatic
    
    SELECT correo,NombreJuego  INTO vCorreo, vNombreJuego
    FROM cuentas 
    WHERE :NEW.idCuenta = idCuenta;
    
    SELECT articulo, precio INTO vArticulo, vCostoCompra
    FROM tiendasIntegradas
    WHERE :NEW.idArticulo = idArticulo;
    
    :NEW.nombreJuego := vNombreJuego;
    :NEW.correo := vCorreo;
    :NEW.articulo := vArticulo;
    :NEW.costoCompra := vCostoCompra;
    
     -- El id de la compra se crea automaticamente de manera aleatoria con caracteres alfa numericos y las letras pueden ser mayusculas o minusculas si es una compra de una moneda integrada comienza con MI si es una membresia empieza por ME y en ambos casos termina por CO 
     
    IF :NEW.articulo = 'Membresia' THEN
    :NEW.idCompra := 'ME'|| DBMS_RANDOM.STRING('A', 16)||'CO';
    END IF;
    
    IF :NEW.articulo = 'Moneda integrada' THEN
    :NEW.idCompra := 'MI'|| DBMS_RANDOM.STRING('A', 16)||'CO';
    END IF;

END TR_compras_insert;
/
   
CREATE OR REPLACE TRIGGER TR_cuentas_insert
BEFORE INSERT ON cuentas
FOR EACH ROW
BEGIN
    
    :NEW.idCuenta := DBMS_RANDOM.STRING('A', 20); --- El id de la cuenta se crea aleatoriamente con caracteres alfanumericos y las letras pueden ser mayusculas o minusculas. 
    :NEW.fechaCreacion := SYSDATE; --La fecha de creacion de la cuenta es la fecha del sistema. 
    
END TR_cuentas_insert;
/
   
-- 

CREATE OR REPLACE TRIGGER TR_eventos_insert
BEFORE INSERT ON eventos
FOR EACH ROW
BEGIN

    :NEW.fechaInicio := SYSDATE; -- La fecha de inicio de un evento es la fecha del sistema. 
    
END TR_eventos_insert;
/

-- 
  
CREATE OR REPLACE TRIGGER TR_tiendasIntegradas_insert
BEFORE INSERT ON tiendasIntegradas
FOR EACH ROW
DECLARE existenciaMembresia NUMBER(1);
BEGIN

    IF :NEW.articulo = 'Membresia' THEN
        
        SELECT COUNT(*) INTO existenciaMembresia
        FROM tiendasIntegradas
        WHERE nombreJuego = :NEW.nombreJuego AND :NEW.articulo = articulo; -- se mira si el juego al que esta intentando tiene ya una membresia creada y si es asi saca un error
        
        IF existenciaMembresia = 1 THEN    
            RAISE_APPLICATION_ERROR(-20024, 'el juego al que estas intentando ya tiene un articulo de membresia.'); -- No se puede agregar mas de 1 articulo de membresia en la tienda integrada de cada juego 
        END IF;
        
        -- Cuando se agrega un articulo su id se genera de manera aleatoria si es una moneda integrada el id empieza con MI y si es una membresia empieza por ME.
        
        :NEW.idArticulo := 'ME'|| DBMS_RANDOM.STRING('A', 18);
    END IF;
        
    IF :NEW.articulo = 'Moneda integrada' THEN
        :NEW.idArticulo := 'MI'|| DBMS_RANDOM.STRING('A', 18);
    END IF;
    
END TR_tiendasIntegradas_insert;
/

--

CREATE OR REPLACE TRIGGER TR_juegos_insert
AFTER INSERT ON juegos
FOR EACH ROW
BEGIN

    INSERT INTO plataformas VALUES (:NEW.nombreJuego, 'Mobil'); -- se añade el juego automaticamente a la plataforma de mobil.

    INSERT INTO banners (nombreBanner,fechaFin, nombreJuego)VALUES('standard',NULL,:NEW.nombreJuego); -- Al momento de agregar un juego se crea automaticamente el banner sin fecha de fin. (standard)

    INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio )VALUES('Membresia',:NEW.nombreJuego, 30000); -- Al momento de agregar un juego se crea tienda integrada relacionada al juego con una membresia de valor 30000. 

    INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio )VALUES('Moneda integrada',:NEW.nombreJuego, 50000); -- Al momento de agregar un juego se crea tienda integrada relacionada al juego con una moneda integrada con valor de 50000. 

END TR_juegos_insert;
/

--Mo: 
   -- Solo se puede modificar el telefono y la fecha de conexion en cuentas.

CREATE OR REPLACE TRIGGER TR_cuentas_update
BEFORE UPDATE ON cuentas
FOR EACH ROW
BEGIN

    IF :NEW.idCuenta != :OLD.idCuenta OR :NEW.correo != :OLD.correo OR :NEW.fechaCreacion != :OLD.fechaCreacion OR :NEW.nombreJuego != :OLD.nombreJuego OR :NEW.tipoId != :OLD.tipoId OR :NEW.numId != :OLD.numId THEN -- Solo se puede modificar el telefono y la fecha de conexion en cuentas.
        RAISE_APPLICATION_ERROR(-20025, 'Solo se puede modificar el teléfono y la fecha de conexion en cuentas.');
    END IF;
    
    IF :NEW.fechaConexion != :OLD.fechaConexion THEN
        :NEW.fechaConexion := SYSDATE;      -- La fecha de conexion es la fecha del sistema al momento de conexion.
    END IF;
    
END TR_cuentas_update;
/

-- De compras solo se puede modificar idCuenta e idArticulo a NULL

CREATE OR REPLACE TRIGGER TR_compras_update_B
BEFORE UPDATE ON compras
FOR EACH ROW
BEGIN
    
    -- De compras solo se puede modificar idCuenta e idArticulo a NULL

    IF :NEW.idCuenta IS NOT NULL AND :NEW.idCuenta != :OLD.idCuenta  THEN  -- verifica que si esta cambiando el valor del id de la cuenta sea null si es el caso contrario sale un error
        RAISE_APPLICATION_ERROR(-20026, 'los valores que quieres actualizar de idCuenta o idArticulo no son nulos');
    END IF;
    
    IF :NEW.idArticulo IS NOT NULL AND :NEW.idArticulo != :OLD.idArticulo THEN 
        RAISE_APPLICATION_ERROR(-20027, 'los valores que quieres actualizar de idCuenta o idArticulo no son nulos'); -- verifica que si se esta cambiando el valor del id del articulo de la compra sea null si no es el caso contrario sale un error
    END IF;
    
    IF :NEW.correo != :OLD.correo OR :NEW.articulo != :OLD.articulo OR :NEW.fechaCompra != :OLD.fechaCompra OR :NEW.metodopago != :OLD.metodopago OR :NEW.costoCompra != :OLD.costoCompra OR :NEW.nombreJuego != :OLD.nombreJuego OR :NEW.idCompra != :OLD.idCompra THEN -- verifica que no intente cambiar un valor de la compra que no sea el id de la cuenta o el id del articulo de la compra
        RAISE_APPLICATION_ERROR(-20028, 'No se puede modificar datos que no sean idCuentao idArticulo');
    END IF;
    
END TR_compras_update_B;
/


-- no se puede modificar juegos,plataformas, tiroEn, complementosCuentas y tampoco personajesCuentas

CREATE OR REPLACE TRIGGER TR_juegos_update
BEFORE UPDATE ON juegos
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-200029, 'No se puede modificar los juegos'); -- no permite modificar juegos
END TR_juegos_update;
/ 

CREATE OR REPLACE TRIGGER TR_plataformas_update
BEFORE UPDATE ON plataformas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20030, 'No se puede modificar las plataformas'); -- no permite modificar plataformas
END TR_plataformas_update;
/ 

CREATE OR REPLACE TRIGGER TR_tiroEn_update
BEFORE UPDATE ON tiroEn
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20031, 'No se puede modificar las tiendas integradas'); -- no permite modificar tiroEn
END TR_tiroEn_update;
/    

CREATE OR REPLACE TRIGGER TR_complementosCuentas_update
BEFORE UPDATE ON complementosCuentas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20032, 'No se puede modificar las tiendas integradas'); -- no permite modificar complementosCuentas
END TR_complementosCuentas_update;
/ 

CREATE OR REPLACE TRIGGER TR_personajesCuentas_update
BEFORE UPDATE ON personajesCuentas
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20033, 'No se puede modificar las tiendas integradas'); -- no permite modificar personajesCuentas
END TR_personajesCuentas_update;
/ 

--

-- solo se puede modificar la fecha de fin de un evento
  
CREATE OR REPLACE TRIGGER TR_eventos_update
BEFORE UPDATE ON eventos
FOR EACH ROW
BEGIN
    IF :NEW.nombreEvento != :OLD.nombreEvento OR :NEW.fechaInicio != :OLD.fechaInicio OR :NEW.nombreJuego != :OLD.nombreJuego THEN  -- se verifica que el nombre del evento, la fecha de inicio del evento o el nombre del juego no se modifiquen poero si es el caso sale un error
    RAISE_APPLICATION_ERROR(-20034, 'Solo se puede modificar la fecha de fin de un evento');
    END IF;
END TR_eventos_update;
/ 

-- Solo se puede modificar el precio de los articulos en la tienda integrada

CREATE OR REPLACE TRIGGER TR_tiendasIntegradas_update
BEFORE UPDATE ON tiendasIntegradas
FOR EACH ROW
BEGIN
    IF :NEW.idArticulo  != :OLD.idArticulo  OR :NEW.articulo  != :OLD.articulo  OR :NEW.nombreJuego != :OLD.nombreJuego  THEN  -- se verifica que el nombre del juego , el id del articulo o el articulo no se esten intentando modificar pero si es el caso sale un error
    RAISE_APPLICATION_ERROR(-20035, 'Solo se puede modificar el precio del articulo');
    END IF;
END TR_tiendasIntegradas_update;
/ 

-- DE

-- Solo se puede eliminar una compra cuando el id del articulo y el id de la cuenta de las compras es nulo

CREATE OR REPLACE TRIGGER TR_compras_delete
BEFORE DELETE ON compras
FOR EACH ROW
BEGIN
    IF :NEW.idCuenta IS NOT NULL  AND :NEW.idArticulo IS NOT NULL THEN  -- Se verifica que el id de la cuenta el correo y el id del articulo de una compra sean nulos pero si no lo son sale un error
        RAISE_APPLICATION_ERROR(-20036, 'Solo se puede eliminar una compra cuando el articulo, el id de la cuenta y el correo de la compra es nulo');
    END IF;
END TR_compras_delete;
/ 



-- Si se elimina cuentas se pone como NULL el id de la cuenta de las  compras que realizo 

CREATE OR REPLACE TRIGGER TR_cuentas_eliminar_compras
BEFORE DELETE ON cuentas
FOR EACH ROW
BEGIN

    UPDATE compras
    SET idCuenta = NULL
    WHERE  idCuenta = :OLD.idCuenta;
    
END TR_cuentas_eliminar_compras;
/

-- Si se elimina  un articulo de la tienda se pone como null el id del articulo de las compras relacionadas con el articulo

CREATE OR REPLACE TRIGGER TR_articulos_eliminar_compras
BEFORE DELETE ON tiendasIntegradas
FOR EACH ROW
BEGIN

    UPDATE compras
    SET idArticulo = NULL
    WHERE  idArticulo = :OLD.idArticulo;
    
END TR_articulos_eliminar_compras;
/

-- Se elimina la compra cuando el id de la cuenta y el id del articulo es nulo
 
CREATE OR REPLACE TRIGGER TR_compras_update_A
AFTER UPDATE ON compras
BEGIN
    DELETE FROM compras
    WHERE idCuenta IS NULL AND idArticulo IS NULL;
END TR_compras_update_A;
/ 




--Mantener empresa--------

--Ad:
CREATE OR REPLACE TRIGGER TR_idDesarrollador_insert
BEFORE INSERT ON Desarrolladores
FOR EACH ROW
BEGIN
    :NEW.idDesarrollador := 'DR_' || :NEW.idDesarrollador;
END TR_idDesarrollador_insert;
/
CREATE OR REPLACE TRIGGER TR_idDistribuidor_insert
BEFORE INSERT ON Distribuidores
FOR EACH ROW
BEGIN
    :NEW.idDistribuidor := 'DB_' || :NEW.idDistribuidor;
END TR_idDistribuidor_insert;
/
CREATE OR REPLACE TRIGGER TR_idArtista_insert
BEFORE INSERT ON Artistas
FOR EACH ROW
BEGIN
    :NEW.idArtista := 'AT_' || :NEW.idArtista;
END TR_idArtista_insert;
/

CREATE OR REPLACE TRIGGER TR_distribuye_insert -- :mejor trigger
BEFORE INSERT ON distribuye
FOR EACH ROW
DECLARE existencia NUMBER(1);
regionDistribuidor VARCHAR(50);
BEGIN

    SELECT region INTO regionDistribuidor -- Se busca la region del distribuidor que se va a agregar
    FROM distribuidores 
    WHERE :NEW.idDistribuidor = idDistribuidor;
    
    SELECT count(*) INTO existencia -- Se busca si ya existe algun distribuidor en la misma region del distribuidor que se esta intentando agregar que ya este distribuyendo el juego en esa  region
    FROM distribuye d
    JOIN distribuidores di ON d.idDistribuidor = di.idDistribuidor 
    WHERE regionDistribuidor = region  AND :NEW.nombreJuego = nombreJuego;
    
    
    IF existencia > 0 THEN -- Si ya existe un distribuidor para el juego en la region del distribuidor que se esta intentando agregar sale un error
        
        raise_application_error (-20037, 'No puede haber 2 o mas distribuidores del mismo juego en una misma region'); -- No puede haber 2 distribuidores del mismo juego en una misma region.
    
    END IF;
    
END TR_distribuye_insert;
/

CREATE OR REPLACE TRIGGER TR_publicidades_insert
BEFORE INSERT ON publicidades
FOR EACH ROW
DECLARE fechaInicioBanner DATE;
fechaFinBanner DATE;
BEGIN

    SELECT fechaInicio, fechaFin INTO fechaInicioBanner, fechaFinBanner -- Se busca las fechas del Banner
    FROM banners 
    WHERE :NEW.idBanner = idBanner;
    
    -- La fechaInicio y la fechaFin de la publicidad es la misma que la fecha de inicio del banner que se este publicitando.
    :NEW.fechaInicio := fechaInicioBanner; 
    :NEW.fechaFin := fechaFinBanner;
    
    
END TR_publicidades_insert;
/

--Mo:

-- No se puede modificar la tabla de distribuidores, llegan, artistas, creaBanner, desarrolladores, distribuye.

CREATE OR REPLACE TRIGGER TR_distribuidores_update
BEFORE UPDATE ON distribuidores
FOR EACH ROW
BEGIN

    raise_application_error (-20038, 'No puedes modificar esta tabla');
    
END TR_distribuidores_update;
/

CREATE OR REPLACE TRIGGER TR_llegan_update
BEFORE UPDATE ON llegan
FOR EACH ROW
BEGIN

    raise_application_error (-20039, 'No puedes modificar esta tabla');
    
END TR_llegan_update;
/

CREATE OR REPLACE TRIGGER TR_artistas_update
BEFORE UPDATE ON artistas
FOR EACH ROW
BEGIN

    raise_application_error (-20040, 'No puedes modificar esta tabla');
    
END TR_artistas_update;
/

CREATE OR REPLACE TRIGGER TR_creaBanner_update
BEFORE UPDATE ON creaBanner
FOR EACH ROW
BEGIN

    raise_application_error (-20041, 'No puedes modificar esta tabla');
    
END TR_creaBanner_update;
/

CREATE OR REPLACE TRIGGER TR_desarrolladores_update
BEFORE UPDATE ON desarrolladores
FOR EACH ROW
BEGIN

    raise_application_error (-20042, 'No puedes modificar esta tabla');
    
END TR_desarrolladores_update;
/

CREATE OR REPLACE TRIGGER TR_distribuye_update
BEFORE UPDATE ON distribuye
FOR EACH ROW
BEGIN

    raise_application_error (-20043, 'No puedes modificar esta tabla');
    
END TR_distribuye_update;
/
 
-- Solo se puede modificar inversion de las publicidades. 
 
CREATE OR REPLACE TRIGGER TR_publicidades_update
BEFORE UPDATE ON publicidades
FOR EACH ROW
BEGIN

    IF :NEW.nombrePublicidad != :OLD.nombrePublicidad OR :NEW.idBanner != :OLD.idBanner OR :NEW.fechaInicio != :OLD.fechaInicio OR :NEW.fechaFin != :OLD.fechaFin OR :NEW.idDistribuidor != :OLD.idDistribuidor THEN
        raise_application_error (-20044, 'No puedes modificar algo de esta tabla que no sea la inversion de la publicidad');
    END IF;
    
END TR_publicidades_update;
/

--El: 
-- No se puede borrar las publicidades que le llegan a los jugadores.

CREATE OR REPLACE TRIGGER TR_llegan_delete
BEFORE DELETE ON llegan
FOR EACH ROW
BEGIN
    raise_application_error (-20300, 'No puedes eliminar esta tabla.');    
END TR_llegan_delete;
/

--------------------------------consultas---------------------------------------

-- Consultar la informacion de los jugadores que han comprado en la tienda integrada de forma recurrente

WITH jugadorTotalCompras AS (
    SELECT j.tipoId, j.numId, SUM(comp.costoCompra) AS totalCompras
    FROM jugadores j
    JOIN cuentas c ON j.tipoId = c.tipoId AND j.numId = c.numId
    JOIN compras comp ON c.idCuenta = comp.idCuenta
    GROUP BY j.tipoId, j.numId
),
promedioCompras AS (
    SELECT AVG(totalCompras) AS promedioCompras
    FROM jugadorTotalCompras
)
SELECT c.idCuenta, c.correo, comp.idCompra, comp.fechaCompra, comp.metodoPago, comp.costoCompra
FROM jugadorTotalCompras jtc
JOIN promedioCompras pc ON 1=1
JOIN jugadores j ON jtc.tipoId = j.tipoId AND jtc.numId = j.numId
JOIN cuentas c ON j.tipoId = c.tipoId AND j.numId = c.numId
JOIN compras comp ON c.idCuenta = comp.idCuenta
WHERE jtc.totalCompras > pc.promedioCompras;

-- Consultar ganancias aproximadas de todos los banners

SELECT b.idBanner, b.nombreJuego, SUM(comp.costoCompra) AS totalGanancias
FROM banners b
JOIN tiroEn t ON b.idBanner = t.idBanner
JOIN cuentas c ON t.idCuenta = c.idCuenta
JOIN compras comp ON c.idCuenta = comp.idCuenta AND comp.nombreJuego = b.nombreJuego
WHERE comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
GROUP BY b.idBanner, b.nombreJuego
ORDER BY nombreJuego, totalGanancias DESC;

--Consultar ganancias de las membresias y las monedas integradas de un juego en especifico (HONKAI)
SELECT articulo, SUM(costoCompra) AS "Ventas netas"
        FROM compras 
        WHERE nombreJuego LIKE 'Honkai%'
        GROUP BY articulo
        ORDER BY "Ventas netas" DESC;

--Consultar la cantidad de jugadores que se hayan conectado durante el periodo de tiempo de todos los eventos
SELECT e.nombreEvento, COUNT(e.nombreEvento) as "jugadores activos"
FROM cuentas c
JOIN juegos j ON (j.nombreJuego = c.nombreJuego)
JOIN eventos e ON (j.nombreJuego = e.nombreJuego)
WHERE c.fechaConexion BETWEEN e.fechaInicio AND e.fechaFin
GROUP BY e.nombreEvento; 



-- Consultar las caracteristicas de los personajes dependinedo de las ventas en los banners en donde las ventas Integradas hayan sido mayor al promedio
WITH bannerGanancias AS (
    SELECT b.idBanner, SUM(comp.costoCompra) AS totalGananciasNetas
    FROM banners b
    JOIN tiroEn t ON b.idBanner = t.idBanner
    JOIN cuentas c ON t.idCuenta = c.idCuenta
    JOIN compras comp ON c.idCuenta = comp.idCuenta AND comp.nombreJuego = b.nombreJuego
    WHERE b.fechaFin IS NOT NULL AND comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
    GROUP BY b.idBanner
),
promedioVentas AS (
    SELECT AVG(totalGananciasNetas) AS promedioGanancias
    FROM bannerGanancias
)
SELECT p.nombrePersonaje AS nombre,EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@genero') AS genero, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@personalidad') AS personalidad, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@estatura') AS estatura, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@color') AS colorPelo, p.rol, bg.totalGananciasNetas
FROM bannerGanancias bg
JOIN promedioVentas a ON 1=1
JOIN personajesBanners pb ON pb.idBanner = bg.idBanner
JOIN personajes p ON p.nombrePersonaje = pb.nombrePersonaje
WHERE bg.totalGananciasNetas > a.promedioGanancias
ORDER BY bg.totalGananciasNetas DESC;



-- nombre de los personajes que estan en el banner donde mas se tiro   --cambiar
SELECT p.nombrePersonaje as "Nombre personaje"
FROM personajesBanners pe 
JOIN personajes p ON p.nombrePersonaje = pe.nombrePersonaje
WHERE pe.idBanner IN (SELECT t.idBanner
                      FROM tiroEn t
                      GROUP BY t.idBanner
                      ORDER BY COUNT(t.idBanner) DESC
                      FETCH FIRST 3 ROWS ONLY
                      ); 



--Consultar los 5 juegos donde mas gente haya tirado en banners  
SELECT nombreJuego AS "Nombre del juego", COUNT(nombreJuego) as "totalTiradas"
FROM tiroEn t 
JOIN banners b ON t.idBanner = b.idBanner 
GROUP BY nombreJuego
ORDER BY COUNT(nombreJuego) DESC
FETCH FIRST 5 ROWS ONLY;

--Consultar la cantidad de jugadores totales de cada juego
SELECT j.nombreJuego, COUNT(j.nombreJuego) as "jugadores totales"
FROM cuentas c
JOIN juegos j ON (j.nombreJuego = c.nombreJuego) 
GROUP BY j.nombreJuego
ORDER BY COUNT(j.nombreJuego) DESC;

-- Consultar los juegos con un  numero de  jugadores mayor a un monto especifico. (jugadores=10)  

WITH juegoJugadores AS (
    SELECT nombreJuego, COUNT(nombreJuego) AS jugadoresTotales
    FROM cuentas c
    GROUP BY  nombreJuego
),
ventasJuego AS (
    SELECT j.nombreJuego, SUM(comp.costoCompra) AS totalVentas
    FROM compras comp
    JOIN juegos j ON j.nombreJuego = comp.nombreJuego
    GROUP BY j.nombreJuego
)
SELECT j.nombreJuego, j.modoJuego, j.genero, d.nombreDesarrollador, vj.totalVentas, jj.jugadoresTotales
FROM juegos j
JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
JOIN juegoJugadores jj ON j.nombreJuego = jj.nombreJuego
JOIN ventasJuego vj ON j.nombreJuego = vj.nombreJuego
WHERE jj.jugadoresTotales > 10
ORDER BY jj.jugadoresTotales DESC;



-- Consultar las publicidades que hayan atraido a mas jugadores que el promedio

WITH publicidadJugadores AS (
    SELECT l.nombrePublicidad, COUNT(l.nombrePublicidad) AS totalJugadores
    FROM publicidades p
    JOIN llegan l ON p.nombrePublicidad = l.nombrePublicidad
    GROUP BY l.nombrePublicidad
),
promedioJugadoresPub AS (
    SELECT AVG(totalJugadores) AS promedioJugadores
    FROM publicidadJugadores
)
SELECT p.nombrePublicidad, p.inversion, b.nombreBanner, p.fechaInicio, p.fechaFin, dist.nombreDistribuidor, b.nombreJuego, pj.totalJugadores
FROM publicidades p
JOIN publicidadJugadores pj ON p.nombrePublicidad = pj.nombrePublicidad
JOIN promedioJugadoresPub pr ON 1=1
JOIN banners b ON p.idBanner = b.idBanner
JOIN distribuidores dist ON p.idDistribuidor = dist.idDistribuidor
WHERE pj.totalJugadores > pr.promedioJugadores
ORDER BY pj.totalJugadores DESC;

-- Consultar informe de ventas de cada banner junto a su ganancia o perdida de la inversion en publicidad.

SELECT 
    b.idBanner,
    SUM(pub.inversion) AS totalInversion,
    SUM(comp.costoCompra) AS totalVentas,
    (SUM(comp.costoCompra) - SUM(pub.inversion)) AS ganancia
FROM banners b
JOIN publicidades pub ON b.idBanner = pub.idBanner
JOIN tiroEn t ON b.idBanner = t.idBanner
JOIN cuentas c ON t.idCuenta = c.idCuenta
JOIN compras comp ON c.idCuenta = comp.idCuenta
                 AND comp.nombreJuego = b.nombreJuego
                 AND comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
GROUP BY b.idBanner;


-- Consultar cuales son los banners  con una inversion mayor a un monto en publicidad.  (monto = 1000000)  
WITH bannerInversion AS (
    SELECT idBanner, SUM(inversion) AS totalInversion
    FROM publicidades
    GROUP BY idBanner)
    
SELECT b.nombreBanner, j.modoJuego, j.genero, d.nombreDesarrollador, a.nombreArtista, bi.totalInversion
FROM bannerInversion bi
JOIN banners b ON bi.idBanner = b.idBanner
JOIN juegos j ON b.nombreJuego = j.nombreJuego
JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
JOIN creaBanner cb ON b.idBanner = cb.idBanner
JOIN artistas a ON cb.idArtista = a.idArtista
WHERE bi.totalInversion > 1000000;




----------------------------------------- Vistas ------------------------------------------------------------------------

-- Consultar la informacion de los jugadores que han comprado en la tienda integrada de forma recurrente

CREATE OR REPLACE VIEW VW_JugadoresComprasRecurrentes AS
WITH jugadorTotalCompras AS (
    SELECT j.tipoId, j.numId, SUM(comp.costoCompra) AS totalCompras
    FROM jugadores j
    JOIN cuentas c ON j.tipoId = c.tipoId AND j.numId = c.numId
    JOIN compras comp ON c.idCuenta = comp.idCuenta
    GROUP BY j.tipoId, j.numId
),
promedioCompras AS (
    SELECT AVG(totalCompras) AS promedioCompras
    FROM jugadorTotalCompras
)
SELECT c.idCuenta, c.correo, comp.idCompra, comp.fechaCompra, comp.metodoPago, comp.costoCompra
FROM jugadorTotalCompras jtc
JOIN promedioCompras pc ON 1=1
JOIN jugadores j ON jtc.tipoId = j.tipoId AND jtc.numId = j.numId
JOIN cuentas c ON j.tipoId = c.tipoId AND j.numId = c.numId
JOIN compras comp ON c.idCuenta = comp.idCuenta
WHERE jtc.totalCompras > pc.promedioCompras;


-- Consultar ganancias aproximadas de todos los banners

CREATE OR REPLACE VIEW VW_BannersGananciasAproximadas AS
SELECT b.idBanner, b.nombreJuego, SUM(comp.costoCompra) AS totalGanancias
FROM banners b
JOIN tiroEn t ON b.idBanner = t.idBanner
JOIN cuentas c ON t.idCuenta = c.idCuenta
JOIN compras comp ON c.idCuenta = comp.idCuenta
                 AND comp.nombreJuego = b.nombreJuego
WHERE comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
GROUP BY b.idBanner, b.nombreJuego
ORDER BY nombreJuego, totalGanancias DESC;

--Consultar ganancias de las membresias y las monedas integradas de un juego en especifico  FUNCTION paquetes

--cantidad jugadores que se hayan conectado durante el periodo de tiempo de algun evento     
CREATE OR REPLACE VIEW VW_cantidad_jugador_eventos AS
SELECT e.nombreEvento,e.fechaInicio,e.fechaFin ,COUNT(e.nombreEvento) as "jugadores activos"
FROM cuentas c
JOIN juegos j ON (j.nombreJuego = c.nombreJuego)
JOIN eventos e ON (j.nombreJuego = e.nombreJuego)
WHERE (c.fechaConexion >= e.fechaInicio)
GROUP BY e.nombreEvento,e.fechaInicio, e.fechaFin
ORDER BY COUNT(e.nombreEvento) DESC; 



-- Consultar las caracteristicas de los personajes dependinedo de las ventas en los banners en donde las ventas Integradas hayan sido mayor al promedio

CREATE OR REPLACE VIEW VW_PersonajesCaracteristicasVentasMayoresPromedio AS
WITH bannerGanancias AS (
    SELECT b.idBanner, SUM(comp.costoCompra) AS totalGananciasNetas
    FROM banners b
    JOIN tiroEn t ON b.idBanner = t.idBanner
    JOIN cuentas c ON t.idCuenta = c.idCuenta
    JOIN compras comp ON c.idCuenta = comp.idCuenta AND comp.nombreJuego = b.nombreJuego
    WHERE b.fechaFin IS NOT NULL AND comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
    GROUP BY b.idBanner
),
promedioVentas AS (
    SELECT AVG(totalGananciasNetas) AS promedioGanancias
    FROM bannerGanancias
)
SELECT p.nombrePersonaje AS nombre,EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@genero') AS genero, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@personalidad') AS personalidad, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@estatura') AS estatura, EXTRACTVALUE(p.caracteristicas, '/caracteristicas/@color') AS color, p.rol, bg.totalGananciasNetas
FROM bannerGanancias bg
JOIN promedioVentas a ON 1=1
JOIN personajesBanners pb ON pb.idBanner = bg.idBanner
JOIN personajes p ON p.nombrePersonaje = pb.nombrePersonaje
WHERE bg.totalGananciasNetas > a.promedioGanancias
ORDER BY bg.totalGananciasNetas DESC;



-- el nombre, las caracteristicas y el rol de los personajes que estan en el banner donde mas se tiro
CREATE OR REPLACE VIEW VW_personajes_mas_tiradas AS
SELECT p.nombrePersonaje,p.caracteristicas, p.rol
FROM personajesBanners pe 
JOIN personajes p ON p.nombrePersonaje = pe.nombrePersonaje
WHERE pe.idBanner IN (SELECT t.idBanner
                      FROM tiroEn t
                      GROUP BY t.idBanner
                      ORDER BY COUNT(t.idBanner) DESC
                      FETCH FIRST 3 ROWS ONLY
                      ); 
                      
--  los 5 juegos donde mas gente haya tirado en banners                      
CREATE OR REPLACE VIEW VW_juegos_con_mas_tiradas AS
SELECT nombreJuego AS "Nombre del juego", COUNT(nombreJuego) as "totalTiradas"
FROM tiroEn t 
JOIN banners b ON t.idBanner = b.idBanner 
GROUP BY nombreJuego
ORDER BY COUNT(nombreJuego) DESC
FETCH FIRST 5 ROWS ONLY;     

-- cantidad de jugadores(cuentas) totales de cada juego
CREATE OR REPLACE VIEW VW_cantidad_jugadores_juegos AS
SELECT j.nombreJuego, COUNT(j.nombreJuego) as "jugadores totales"
FROM cuentas c
JOIN juegos j ON (j.nombreJuego = c.nombreJuego) 
GROUP BY j.nombreJuego
ORDER BY COUNT(j.nombreJuego) DESC; 

-- Consultar  los juegos con un  numero de  jugadores mayor a un monto especifico.

CREATE OR REPLACE VIEW VW_JuegosMasDeDiezMillonesJugadores AS
WITH juegoJugadores AS (
    SELECT nombreJuego, COUNT(nombreJuego) AS jugadoresTotales
    FROM cuentas c
    GROUP BY  nombreJuego
),
ventasJuego AS (
    SELECT j.nombreJuego, SUM(comp.costoCompra) AS totalVentas
    FROM compras comp
    JOIN juegos j ON j.nombreJuego = comp.nombreJuego
    GROUP BY j.nombreJuego
)
SELECT j.nombreJuego, j.modoJuego, j.genero, d.nombreDesarrollador, vj.totalVentas, jj.jugadoresTotales
FROM juegos j
JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
JOIN juegoJugadores jj ON j.nombreJuego = jj.nombreJuego
JOIN ventasJuego vj ON j.nombreJuego = vj.nombreJuego
WHERE jj.jugadoresTotales > 10
ORDER BY jj.jugadoresTotales DESC;



-- Consultar las publicidades que hayan atraido a mas jugadores que el promedio

CREATE OR REPLACE VIEW VW_PublicidadesJugadoresMayorPromedio AS
WITH publicidadJugadores AS (
    SELECT l.nombrePublicidad, COUNT(l.nombrePublicidad) AS totalJugadores
    FROM publicidades p
    JOIN llegan l ON p.nombrePublicidad = l.nombrePublicidad
    GROUP BY l.nombrePublicidad
),
promedioJugadoresPub AS (
    SELECT AVG(totalJugadores) AS promedioJugadores
    FROM publicidadJugadores
)
SELECT p.nombrePublicidad, p.inversion, b.nombreBanner, p.fechaInicio, p.fechaFin, dist.nombreDistribuidor, b.nombreJuego, pj.totalJugadores
FROM publicidades p
JOIN publicidadJugadores pj ON p.nombrePublicidad = pj.nombrePublicidad
JOIN promedioJugadoresPub pr ON 1=1
JOIN banners b ON p.idBanner = b.idBanner
JOIN distribuidores dist ON p.idDistribuidor = dist.idDistribuidor
WHERE pj.totalJugadores > pr.promedioJugadores
ORDER BY pj.totalJugadores DESC;


-- Consultar informe de ventas de cada banner junto a su ganancia o perdida de la inversion en publicidad.

CREATE OR REPLACE VIEW VW_InformeVentasBanner AS
SELECT 
    b.idBanner, b.nombreBanner,
    SUM(pub.inversion) AS totalInversion,
    SUM(comp.costoCompra) AS totalVentas,
    (SUM(comp.costoCompra) - SUM(pub.inversion)) AS ganancia
FROM banners b
JOIN publicidades pub ON b.idBanner = pub.idBanner
JOIN tiroEn t ON b.idBanner = t.idBanner
JOIN cuentas c ON t.idCuenta = c.idCuenta
JOIN compras comp ON c.idCuenta = comp.idCuenta
                 AND comp.nombreJuego = b.nombreJuego
                 AND comp.fechaCompra BETWEEN b.fechaInicio AND b.fechaFin
GROUP BY b.idBanner, b.nombreBanner;


    
-- Consultar cuales son los banners  con una inversion mayor a un monto especifico en publicidad.
CREATE OR REPLACE VIEW VW_BannersInversionMayor100Millones AS
WITH bannerInversion AS (
    SELECT idBanner, SUM(inversion) AS totalInversion
    FROM publicidades
    GROUP BY idBanner)
    
SELECT b.nombreBanner, j.modoJuego, j.genero, d.nombreDesarrollador, a.nombreArtista, bi.totalInversion
FROM bannerInversion bi
JOIN banners b ON bi.idBanner = b.idBanner
JOIN juegos j ON b.nombreJuego = j.nombreJuego
JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
JOIN creaBanner cb ON b.idBanner = cb.idBanner
JOIN artistas a ON cb.idArtista = a.idArtista
WHERE bi.totalInversion > 10000
GROUP BY b.nombreBanner, j.modoJuego, j.genero, d.nombreDesarrollador, a.nombreArtista, bi.totalInversion;



--Indices

CREATE INDEX IDXnombreBanner ON banners (nombreBanner);  

CREATE INDEX IDXcorreo_cuentas ON cuentas (correo);

CREATE INDEX IDXcorreo_compras ON compras (correo);

CREATE INDEX IDXnombreDistribuidor ON distribuidores(nombreDistribuidor);





    
-- CRUDE


CREATE OR REPLACE PACKAGE PC_banner IS 
    PROCEDURE AD_banners(x_nombreBanner IN VARCHAR,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_banners(x_nombreBanner IN VARCHAR);
    
    PROCEDURE AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
    PROCEDURE MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
    
    PROCEDURE AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas IN XMLTYPE, x_rol IN VARCHAR);
    PROCEDURE MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR);
    
    PROCEDURE AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);
    PROCEDURE EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);
    
    PROCEDURE AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);
    PROCEDURE EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);
    
    FUNCTION CO_personajes_mas_tiradas RETURN SYS_REFCURSOR;
    FUNCTION CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR;
    FUNCTION CO_PersonajesCaracteristicasVentasMayoresPromedio RETURN SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE PC_jugador IS 
    PROCEDURE AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE); 
    PROCEDURE MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR);
    
    PROCEDURE AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR);
    PROCEDURE MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR);
END;
/

CREATE OR REPLACE PACKAGE PC_juego IS --:mejor paquete

    PROCEDURE AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR, x_idDesarrollador IN VARCHAR);
    PROCEDURE EL_juegos(x_nombreJuego IN VARCHAR);
    
    PROCEDURE AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR); 
    
    PROCEDURE AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
    PROCEDURE EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
    
    PROCEDURE AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER);
    PROCEDURE MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER);
    PROCEDURE EL_tiendasIntegradas(x_idArticulo IN VARCHAR);
    
    PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR); 
    PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR); 
    PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR); 
    PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR);
    
    PROCEDURE AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ); 
    PROCEDURE EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ); 
    
    PROCEDURE AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR); 
    PROCEDURE EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR ); 
    
    PROCEDURE AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR );
    PROCEDURE EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR );
    
    PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR); 
    PROCEDURE MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR);
    PROCEDURE MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR);
    PROCEDURE EL_compras(x_idCompra IN VARCHAR);
    
    FUNCTION CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR;
    FUNCTION CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR;
    FUNCTION CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR) RETURN SYS_REFCURSOR;
END;
/




CREATE OR REPLACE PACKAGE PC_empresa IS 

    PROCEDURE AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR); 
    PROCEDURE EL_desarrolladores(x_idDesarrollador IN VARCHAR);
    
    PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR); 
    PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR);
    
    PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    
    PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
    --PROCEDURE EL_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
    
    PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR); 
    PROCEDURE EL_artistas(x_idArtista IN VARCHAR);
    
    PROCEDURE AD_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
    PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
    
    PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR);
    PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER);
    PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR);
    
    FUNCTION CO_InformeVentasBanner RETURN SYS_REFCURSOR;
    FUNCTION CO_JuegosMasDexJugadores (x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_BannersInversionMayorx (x_inversion IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION CO_JugadoresComprasRecurrentes RETURN SYS_REFCURSOR;
    FUNCTION CO_BannersGananciasAproximadas RETURN SYS_REFCURSOR;
    FUNCTION CO_JugadoresConectadosEventos RETURN SYS_REFCURSOR;
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;
    
END;
/





-- CRUDI 
                      

CREATE OR REPLACE PACKAGE BODY PC_banner IS
    PROCEDURE AD_banners(x_nombreBanner IN VARCHAR,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN 
        INSERT INTO banners (nombreBanner,fechaFin, nombreJuego)
        VALUES (x_nombreBanner,x_fechaFin, x_nombreJuego);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20048, 'Error al adicionar banner' || SQLERRM);
    END AD_banners;
    

    PROCEDURE EL_banners(x_nombreBanner IN VARCHAR) IS
    BEGIN
        DELETE banners WHERE nombreBanner = x_nombreBanner;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20049, 'Error al eliminar banner' || SQLERRM);
   END EL_banners;
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR) IS
    BEGIN
        INSERT INTO complementos (nombreComplemento,tipo) VALUES (x_nombreComplemento,x_tipo);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20050, 'Error al añadir complementos' || SQLERRM);
            
    END AD_complementos;
    
    PROCEDURE MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR) IS
    BEGIN
        UPDATE complementos SET tipo = x_tipo
        WHERE nombreComplemento = x_nombreComplemento; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20051, 'Error al modificar el complemento' || SQLERRM);
            
    
    END MO_complementos;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas  IN XMLTYPE, x_rol IN VARCHAR) IS 
    BEGIN
        INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) 
        VALUES (x_nombrePersonaje, x_caracteristicas, x_rol);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20052, 'Error al agregar un personaje' || SQLERRM);
    
    END AD_personajes;
    
        PROCEDURE MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR) IS
    BEGIN 
        UPDATE personajes SET rol = x_rol WHERE nombrePersonaje = x_nombrePersonaje;
        COMMIT;
        EXCEPTION                   
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20053, 'Error al modificar el rol del personaje' || SQLERRM);
    END MO_personajes_rol;
   
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR) IS    
    BEGIN
        INSERT INTO complementosBanners (idBanner, nombreComplemento) VALUES (x_idBanner, x_nombreComplemento);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20054, 'Error al agregar un complemento a un banner' || SQLERRM);
    
    END AD_complementosBanners;   
    
        PROCEDURE EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR) IS    
    BEGIN
        DELETE complementosBanners WHERE idBanner = x_idBanner AND nombreComplemento = x_nombreComplemento;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20055, 'Error al eliminar un complemento de un banner' || SQLERRM);
    
    END EL_complementosBanners;  
    
    ----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS    
    BEGIN
        INSERT INTO personajesBanners (idBanner, nombrePersonaje) VALUES (x_idBanner, x_nombrePersonaje);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20056, 'Error al agregar un personaje a un banner' || SQLERRM);
    
    END AD_personajesBanners;   
    
        PROCEDURE EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS    
    BEGIN
        DELETE personajesBanners WHERE idBanner = x_idBanner AND nombrePersonaje = x_nombrePersonaje;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20057, 'Error al eliminar un personaje de un banner' || SQLERRM);
    
    END EL_personajesBanners;  
            
----------------------------------------------------------------------------------------------------------------------------      
      
    -- el nombre, las caracteristicas y el rol de los personajes que estan en el banner donde mas se tiro
    FUNCTION CO_personajes_mas_tiradas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_personajes_mas_tiradas;
        RETURN xResultado;
        
    END CO_personajes_mas_tiradas;
    
   --  los 10 juegos donde mas gente haya tirado en banners
    FUNCTION CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT * 
        FROM VW_juegos_con_mas_tiradas;
        RETURN xResultado;
        
    END CO_juegos_con_mas_tiradas;
    
    -- Consultar las caracteristicas de los personajes dependinedo de las ventas en los banners en donde las ventas Integradas hayan sido mayor al promedio
    
    FUNCTION CO_PersonajesCaracteristicasVentasMayoresPromedio RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT * 
        FROM VW_PersonajesCaracteristicasVentasMayoresPromedio;
        RETURN xResultado;
        
    END CO_PersonajesCaracteristicasVentasMayoresPromedio;
        
END PC_banner;
/


CREATE OR REPLACE PACKAGE BODY PC_jugador IS
    PROCEDURE AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE) IS
    BEGIN 
        INSERT INTO jugadores ( tipoId, numId, pais, fechaNacimiento)
        VALUES (x_tipoId , x_numId, x_pais, x_fechaNacimiento);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20058, 'Error al adicionar el jugador' || SQLERRM);
    END AD_jugadores;
    

    PROCEDURE MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR) IS
    BEGIN
        UPDATE jugadores SET pais = x_pais WHERE numId = x_numId AND tipoId= x_tipoId;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20059, 'Error al modificar jugadores' || SQLERRM);
    
    END MO_jugadores;
   
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR) IS
    BEGIN 
        INSERT INTO generosPreferidos ( tipoId, numId, genero)
        VALUES (x_tipoId , x_numId, x_genero);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20060, 'Error al adicionar genero preferido' || SQLERRM);
    END AD_generosPreferidos;
    

    PROCEDURE MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR) IS
    BEGIN
        UPDATE generosPreferidos SET genero = x_genero_cambio WHERE numId = x_numId AND tipoId= x_tipoId AND genero = x_genero;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20061, 'Error al modificar genero preferido' || SQLERRM);
    
    END MO_generosPreferidos;
    
END PC_jugador;
/








CREATE OR REPLACE PACKAGE BODY PC_juego IS
        PROCEDURE AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR, x_idDesarrollador IN VARCHAR) IS
    BEGIN 
        INSERT INTO juegos ( nombreJuego, genero, modoJuego, idDesarrollador)
        VALUES (x_nombreJuego , x_genero, x_modoJuego, x_idDesarrollador);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20062, 'Error al adicionar juego' || SQLERRM);
    END AD_juegos;
    

        PROCEDURE EL_juegos(x_nombreJuego IN VARCHAR) IS
    BEGIN
        DELETE juegos WHERE nombreJuego = x_nombreJuego;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20063, 'Error al eliminar juego' || SQLERRM);
        END EL_juegos;
   
----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN
        INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) 
        VALUES (x_nombreEvento, x_fechaFin, x_nombreJuego);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20064, 'Error al añadir evento' || SQLERRM);
            
    END AD_eventos;
    
    
        PROCEDURE MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN
        UPDATE eventos set fechaFin = x_fechaFin 
        WHERE nombreEvento = x_nombreEvento AND  nombreJuego = x_nombreJuego; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20065, 'Error al modificar fecha final del evento' || SQLERRM);
            
    END MO_eventos_fechaFin;
    
    
        PROCEDURE EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        DELETE FROM eventos WHERE nombreEvento = x_nombreEvento AND nombreJuego = x_nombreJuego;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20066, 'Error al eliminar evento' || SQLERRM);
    
    END EL_eventos;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR) IS
    BEGIN
        INSERT INTO plataformas (nombreJuego, plataforma) 
        VALUES (x_nombreJuego, x_plataforma);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20067, 'Error al añadir la plataforma del juego' || SQLERRM);
            
    END AD_plataformas;
    
        PROCEDURE EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR) IS 
    BEGIN
        DELETE plataformas WHERE nombreJuego = x_nombreJuego AND plataforma = x_plataforma;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20068, 'Error al eliminar la plataforma del juego' || SQLERRM);
    
    END EL_plataformas;

----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER) IS
    BEGIN
        INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) 
        VALUES (x_articulo, x_nombreJuego, x_precio);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20069, 'Error al añadir tiendasIntegradas' || SQLERRM);
            
    END AD_tiendasIntegradas;
    
    
        PROCEDURE MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER) IS
    BEGIN
        UPDATE tiendasIntegradas SET precio = x_precio 
        WHERE idArticulo = x_idArticulo; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20070, 'Error al modificar el precio del articulo' || SQLERRM);
            
    END MO_tiendasIntegradas;
    
    
        PROCEDURE EL_tiendasIntegradas(x_idArticulo IN VARCHAR) IS
    BEGIN
        DELETE FROM tiendasIntegradas WHERE idArticulo = x_idArticulo;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20071, 'Error al eliminar evento' || SQLERRM);
    
    END EL_tiendasIntegradas;

----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR) IS
    BEGIN
        INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
        VALUES (x_correo, x_telefono, x_fechaConexion, x_nombreJuego, x_tipoId, x_numId);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20072, 'Error al añadir tiendasIntegradas' || SQLERRM);
            
    END AD_cuentas;
    
    
        PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR) IS
    BEGIN
        UPDATE cuentas SET fechaConexion = SYSDATE
        WHERE x_idCuenta = idCuenta; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20073, 'Error al modificar la fecha de conexion' || SQLERRM);
            
    END MO_cuentas_fechaConexion;
    
    
        PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR) IS
    BEGIN
        UPDATE cuentas SET telefono = x_telefono
        WHERE x_idCuenta = idCuenta; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20074, 'Error al modificar el telefono de la cuenta' || SQLERRM);
            
    END MO_cuentas_telefono;
    
    
        PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR) IS
    BEGIN
        DELETE FROM cuentas WHERE idCuenta = x_idCuenta;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20075, 'Error al eliminar evento' || SQLERRM);
    
    END EL_cuentas;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ) IS
    BEGIN
        INSERT INTO complementosCuentas (idCuenta, nombreComplemento) 
        VALUES (x_idCuenta, x_nombreComplemento);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20076, 'Error al añadir un complemento a la cuenta' || SQLERRM);
            
    END AD_complementosCuentas;
    
        PROCEDURE EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ) IS 
    BEGIN
        DELETE complementosCuentas WHERE idCuenta = x_idCuenta AND nombreComplemento = x_nombreComplemento;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20077, 'Error al eliminar el complemento de la cuenta' || SQLERRM);
    
    END EL_complementosCuentas;
    
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS
    BEGIN
        INSERT INTO personajesCuentas (idCuenta, nombrePersonaje) 
        VALUES (x_idCuenta, x_nombrePersonaje);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20078, 'Error al añadir un personaje a la cuenta' || SQLERRM);
            
    END AD_personajesCuentas;
    
        PROCEDURE EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR ) IS 
    BEGIN
        DELETE personajesCuentas WHERE idCuenta = x_idCuenta AND nombrePersonaje = x_nombrePersonaje;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20079, 'Error al eliminar el personaje de la cuenta' || SQLERRM);
    
    END EL_personajesCuentas;
    
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR) IS
    BEGIN
        INSERT INTO tiroEn (idCuenta, idBanner) 
        VALUES (x_idCuenta, x_idBanner);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20080, 'Error al añadir las tiradas de la cuenta en el banner' || SQLERRM);
            
    END AD_tiroEn;
    
        PROCEDURE EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR) IS 
    BEGIN
        DELETE tiroEn WHERE idCuenta = x_idCuenta AND idBanner = x_idBanner;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20081, 'Error al eliminar las tiradas de la cuenta en el banner' || SQLERRM);
    
    END EL_tiroEn;    

----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR) IS
    BEGIN
        INSERT INTO compras (metodoPago, idArticulo, idCuenta) 
        VALUES (x_metodoPago, x_idArticulo, x_idCuenta);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20082, 'Error al añadir la compra' || SQLERRM);
            
    END AD_compras;
    
    
        PROCEDURE MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR) IS
    BEGIN
        UPDATE compras SET idCuenta = x_idCuenta
        WHERE idCompra = x_idCompra; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20083, 'Error al modificar el id de la cuenta en la compra' || SQLERRM);
            
    END MO_compras_idCuenta;
    
    
        PROCEDURE MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR) IS
    BEGIN
        UPDATE compras SET idArticulo = x_idArticulo
        WHERE idCompra = x_idCompra; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20084, 'Error al modificar el id del articulo en la compra' || SQLERRM);
            
    END MO_compras_idArticulo;
    
    
        PROCEDURE EL_compras(x_idCompra IN VARCHAR) IS
    BEGIN
        UPDATE compras SET idArticulo = NULL, idCuenta = NULL
        WHERE idCompra = x_idCompra; 
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20085, 'Error al eliminar la compra' || SQLERRM);
    
    END EL_compras;

----------------------------------------------------------------------------------------------------------------------------      
    
    -- Cantidad de jugadores(cuentas) totales de cada juego
    
    FUNCTION CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado FOR 
        SELECT *
        FROM VW_cantidad_jugadores_juegos;
        RETURN xResultado;
        
    END CO_cantidad_jugadores_juegos;
    
    -- Cantidad jugadores que se hayan conectado durante el periodo de tiempo de algun evento
    FUNCTION CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_cantidad_jugador_eventos;
        RETURN xResultado;
        
    END CO_cantidad_jugador_eventos;
    
   -- Ganancias de las membresias y las monedas integradas de un juego en especifico 
    
    FUNCTION CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        SELECT articulo, SUM(costoCompra) AS "Ventas netas"
        FROM compras 
        WHERE nombreJuego = x_nombreJuego
        GROUP BY articulo
        ORDER BY "Ventas netas" DESC;
        RETURN xResultado;
        
    END CO_ganancias_tiendaIntegrada;
    
END PC_juego;
/





CREATE OR REPLACE PACKAGE BODY PC_empresa IS
    PROCEDURE AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR) IS
    BEGIN 
        INSERT INTO desarrolladores (idDesarrollador,nombreDesarrollador, pais)
        VALUES (x_idDesarrollador,x_nombreDesarrollador, x_pais);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20086, 'Error al adicionar un desarrollador' || SQLERRM);
    END AD_desarrolladores;
    

    PROCEDURE EL_desarrolladores(x_idDesarrollador IN VARCHAR) IS
    BEGIN
        DELETE desarrolladores WHERE idDesarrollador = x_idDesarrollador;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20087, 'Error al eliminar un desarrollador' || SQLERRM);
   END EL_desarrolladores;
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR) IS
    BEGIN 
        INSERT INTO distribuidores (idDistribuidor,nombreDistribuidor, region)
        VALUES (x_idDistribuidor,x_nombreDistribuidor, x_region);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20088, 'Error al adicionar un distribuidor' || SQLERRM);
    END AD_distribuidores;
    

    PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR) IS
    BEGIN
        DELETE distribuidores WHERE idDistribuidor = x_idDistribuidor;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20089, 'Error al eliminar un distribuidor' || SQLERRM);
   END EL_distribuidores;

----------------------------------------------------------------------------------------------------------------------------
    
    PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN 
        INSERT INTO distribuye (idDistribuidor, nombreJuego)
        VALUES (x_idDistribuidor, x_nombreJuego);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20090, 'Error al adicionar distribuye' || SQLERRM);
    END AD_distribuye;
    

    PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        DELETE distribuye WHERE idDistribuidor = x_idDistribuidor AND nombreJuego = x_nombreJuego;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20091, 'Error al eliminar distribuye' || SQLERRM);
   END EL_distribuye;
   
----------------------------------------------------------------------------------------------------------------------------
    
    PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR) IS
    BEGIN 
        INSERT INTO llegan (tipoId,numId, nombrePublicidad)
        VALUES (x_tipoId,x_numId, x_nombrePublicidad);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20092, 'Error al adicionar llegan' || SQLERRM);
    END AD_llegan;
    

    /*PROCEDURE EL_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR) IS
    BEGIN
        DELETE llegan WHERE tipoId = x_tipoId AND numId = x_numId AND nombrePublicidad = x_nombrePublicidad;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20093, 'Error al eliminar llegan' || SQLERRM);
   END EL_llegan;*/
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR) IS
    BEGIN 
        INSERT INTO artistas (idArtista, nombreArtista)
        VALUES (x_idArtista, x_nombreArtista);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20094, 'Error al adicionar un artista' || SQLERRM);
    END AD_artistas;
    

    PROCEDURE EL_artistas(x_idArtista IN VARCHAR) IS
    BEGIN
        DELETE artistas WHERE idArtista = x_idArtista;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20095, 'Error al eliminar un artista' || SQLERRM);
   END EL_artistas;
            
----------------------------------------------------------------------------------------------------------------------------
            
    PROCEDURE AD_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR) IS
    BEGIN 
        INSERT INTO creaBanner (idArtista, idBanner)
        VALUES (x_idArtista, x_idBanner);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20096, 'Error al adicionar creaBanner' || SQLERRM);
    END AD_creaBanner;
    

    PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR) IS
    BEGIN
        DELETE creaBanner WHERE idArtista = x_idArtista AND idBanner = x_idBanner;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20097, 'Error al eliminar creaBanner' || SQLERRM);
   END EL_creaBanner;            

----------------------------------------------------------------------------------------------------------------------------

    PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR) IS 
    BEGIN
        INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) 
        VALUES (x_nombrePublicidad, x_inversion, x_idBanner, x_idDistribuidor);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20098, 'Error al agregar una publicidad' || SQLERRM);
    
    END AD_publicidades;
    
    PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER) IS
    BEGIN 
        UPDATE publicidades SET inversion = x_inversion WHERE nombrePublicidad = x_nombrePublicidad;
        COMMIT;
        EXCEPTION                   
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20099, 'Error al modificar la inversion de la publicidad' || SQLERRM);
    END MO_publicidades_inversion;
            
    PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR) IS
    BEGIN
        DELETE publicidades WHERE nombrePublicidad = x_nombrePublicidad;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20100, 'Error al eliminar una publicidad' || SQLERRM);
   END EL_publicidades;   
            
----------------------------------------------------------------------------------------------------------------------------      
      
   -- Consultar informe de ventas de cada banner junto a su ganancia o perdida de la inversion en publicidad.
    FUNCTION CO_InformeVentasBanner RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_InformeVentasBanner;
        RETURN xResultado;
        
    END CO_InformeVentasBanner;
    
------------------------------------------------------------------------------------
   -- Consultar los juegos con un  numero de  jugadores mayor a un monto de jugadores.
    FUNCTION CO_JuegosMasDexJugadores(x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        WITH juegoJugadores AS (
        SELECT nombreJuego, COUNT(nombreJuego) AS jugadoresTotales
        FROM cuentas c
        GROUP BY  nombreJuego
        ),
        ventasJuego AS (
        SELECT j.nombreJuego, SUM(comp.costoCompra) AS totalVentas
        FROM compras comp
        JOIN juegos j ON j.nombreJuego = comp.nombreJuego
        GROUP BY j.nombreJuego
        )
        SELECT j.nombreJuego, j.modoJuego, j.genero, d.nombreDesarrollador, vj.totalVentas, jj.jugadoresTotales
        FROM juegos j
        JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
        JOIN juegoJugadores jj ON j.nombreJuego = jj.nombreJuego
        JOIN ventasJuego vj ON j.nombreJuego = vj.nombreJuego
        WHERE jj.jugadoresTotales > x_cantidadJugadores
        ORDER BY jj.jugadoresTotales DESC;
        RETURN xResultado;
        
    END CO_JuegosMasDexJugadores;
    
    -- Consultar cuales son los banners  con una inversion mayor a un monto en publicidad.
    
    FUNCTION CO_BannersInversionMayorx(x_inversion IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        WITH bannerInversion AS (
        SELECT idBanner, SUM(inversion) AS totalInversion
        FROM publicidades
        GROUP BY idBanner)
        SELECT b.nombreBanner, j.modoJuego, j.genero, d.nombreDesarrollador, a.nombreArtista, bi.totalInversion
        FROM bannerInversion bi
        JOIN banners b ON bi.idBanner = b.idBanner
        JOIN juegos j ON b.nombreJuego = j.nombreJuego
        JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
        JOIN creaBanner cb ON b.idBanner = cb.idBanner
        JOIN artistas a ON cb.idArtista = a.idArtista
        WHERE bi.totalInversion > x_inversion;
        RETURN xResultado;
        
    END CO_BannersInversionMayorx;
------------------------------------------------------------------------------------
    
    -- Consultar la informacion de los jugadores que han comprado en la tienda integrada de forma recurrente
    
    FUNCTION CO_JugadoresComprasRecurrentes RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_JugadoresComprasRecurrentes;
        RETURN xResultado;
        
    END CO_JugadoresComprasRecurrentes;
    
    -- Consultar ganancias aproximadas de todos los banners
    
    FUNCTION CO_BannersGananciasAproximadas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_BannersGananciasAproximadas;
        RETURN xResultado;
        
    END CO_BannersGananciasAproximadas;
    
    -- Consultar la cantidad jugadores que se hayan conectado durante el periodo de tiempo de todos los eventos
    
    FUNCTION CO_JugadoresConectadosEventos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_cantidad_jugador_eventos;
        RETURN xResultado;
        
    END CO_JugadoresConectadosEventos;
    
    -- Consultar las publicidades que hayan atraido a mas jugadores que el promedio
    
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_PublicidadesJugadoresMayorPromedio;
        RETURN xResultado;
        
    END CO_PublicidadesJugadoresMayorPromedio;
 
    
END PC_empresa;
/






-- ActoresE 
CREATE OR REPLACE PACKAGE PC_Distribuidor IS
    
    PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR); 
    PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR);
    
    PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    
    
    PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR);
    PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER);
    PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR);
    
    PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
  
    FUNCTION CO_JuegosMasDexJugadores (x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR; 
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;
    FUNCTION CO_MejoresJuegos(x_idDistribuidor IN VARCHAR) RETURN SYS_REFCURSOR;
END;
/


CREATE OR REPLACE PACKAGE PC_Artista IS 
    PROCEDURE AD_banners(x_nombreBanner IN VARCHAR,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_banners(x_nombreBanner IN VARCHAR);
    
    PROCEDURE AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
    PROCEDURE MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
    
    PROCEDURE AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas IN XMLTYPE, x_rol IN VARCHAR);
    PROCEDURE MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR);
    
    PROCEDURE AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);
    PROCEDURE EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);
    
    PROCEDURE AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);
    PROCEDURE EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);
    
    PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR);
    PROCEDURE AD_creaBanner(x_idArtista  IN VARCHAR, x_idBanner IN VARCHAR); 
    PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
    
    FUNCTION CO_personajes_mas_tiradas RETURN SYS_REFCURSOR;
    FUNCTION CO_PersonajesCaracteristicasVentasMayoresPromedio RETURN SYS_REFCURSOR;
    FUNCTION CO_bannerCree(x_nombreArtista IN VARCHAR) RETURN SYS_REFCURSOR;
END;
/
 
CREATE OR REPLACE PACKAGE PC_Jugador_Actor IS 
    PROCEDURE AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE); 
    PROCEDURE MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR);
    
    PROCEDURE AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR);
    PROCEDURE MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR);
    
    PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR); 
    PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR); 
    PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR); 
    PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR);
    
    PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR); 
    
    FUNCTION CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR;
    FUNCTION CO_BannersInversionMayor100Millones RETURN SYS_REFCURSOR;
    FUNCTION CO_Publicidades_Jugadores(x_tipoId IN VARCHAR,x_numid IN VARCHAR) RETURN SYS_REFCURSOR;
   
END;
/
 
CREATE OR REPLACE PACKAGE PC_Desarrollador IS  --:mejor paquete

    PROCEDURE AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR, x_idDesarrollador IN VARCHAR);
    PROCEDURE EL_juegos(x_nombreJuego IN VARCHAR);
    
    PROCEDURE AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR); 
    
    PROCEDURE AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
    PROCEDURE EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
    
    PROCEDURE AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER);
    PROCEDURE MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER);
    PROCEDURE EL_tiendasIntegradas(x_idArticulo IN VARCHAR);
    
    PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR); 
    PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR); 
    PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR); 
    PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR);
    
    PROCEDURE AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ); 
    PROCEDURE EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ); 
    
    PROCEDURE AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR); 
    PROCEDURE EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR ); 
    
    PROCEDURE AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR );
    PROCEDURE EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR );
    
    PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR); 
    PROCEDURE MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR);
    PROCEDURE MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR);
    PROCEDURE EL_compras(x_idCompra IN VARCHAR);
    
    PROCEDURE AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR); 
    PROCEDURE EL_desarrolladores(x_idDesarrollador IN VARCHAR);
    
    PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR); 
    PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR);
    
    PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
    
    PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
    
    PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR); 
    PROCEDURE EL_artistas(x_idArtista IN VARCHAR);
    
    PROCEDURE AD_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
    PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
    
    PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR);
    PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER);
    PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR);    
    
    FUNCTION CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR;
    FUNCTION CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR;
    FUNCTION CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR)RETURN SYS_REFCURSOR;
    FUNCTION CO_InformeVentasBanner RETURN SYS_REFCURSOR;
    FUNCTION CO_JugadoresComprasRecurrentes RETURN SYS_REFCURSOR;
    FUNCTION CO_BannersGananciasAproximadas RETURN SYS_REFCURSOR;
    FUNCTION CO_JugadoresConectadosEventos RETURN SYS_REFCURSOR;
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;

END;
/   


 
           
-- ActoresI
          
CREATE OR REPLACE PACKAGE BODY PC_Artista IS

    PROCEDURE AD_banners(x_nombreBanner IN VARCHAR,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN 
        PC_banner.AD_banners(x_nombreBanner,x_fechaFin, x_nombreJuego);
        COMMIT;
    END AD_banners;
    

    PROCEDURE EL_banners(x_nombreBanner IN VARCHAR) IS
    BEGIN
        PC_banner.EL_banners(x_nombreBanner);
        COMMIT;
   END EL_banners;
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR) IS
    BEGIN
        PC_banner.AD_complementos(x_nombreComplemento, x_tipo);
        COMMIT;
    END AD_complementos;
    
    PROCEDURE MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR) IS
    BEGIN
        PC_banner.MO_complementos(x_nombreComplemento, x_tipo); 
        COMMIT;
    END MO_complementos;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas  IN XMLTYPE, x_rol IN VARCHAR) IS 
    BEGIN
        PC_banner.AD_personajes(x_nombrePersonaje, x_caracteristicas, x_rol);
        COMMIT;
    END AD_personajes;
    
        PROCEDURE MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR) IS
    BEGIN 
        PC_banner.MO_personajes_rol(x_nombrePersonaje, x_rol);
        COMMIT;
    END MO_personajes_rol;
   
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR) IS    
    BEGIN
        PC_banner.AD_complementosBanners(x_idBanner, x_nombreComplemento);
        COMMIT;
    END AD_complementosBanners;   
    
        PROCEDURE EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR) IS    
    BEGIN
        PC_banner.EL_complementosBanners(x_idBanner, x_nombreComplemento);
        COMMIT;
    END EL_complementosBanners;  
    
    ----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS    
    BEGIN
        PC_banner.AD_personajesBanners(x_idBanner, x_nombrePersonaje);
        COMMIT;
    END AD_personajesBanners;   
    
        PROCEDURE EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS    
    BEGIN
        PC_banner.EL_personajesBanners(x_idBanner, x_nombrePersonaje);
        COMMIT;
    END EL_personajesBanners;  
            
----------------------------------------------------------------------------------------------------------------------------      
        PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR) IS
    BEGIN 
        PC_empresa.AD_artistas(x_idArtista,x_nombreArtista);
        COMMIT;
    END AD_artistas;
    
        PROCEDURE AD_creaBanner(x_idArtista  IN VARCHAR, x_idBanner IN VARCHAR) IS 
    BEGIN 
        PC_empresa.AD_creaBanner(x_idArtista,x_idBanner);
        COMMIT;
    END AD_creaBanner;
        PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR) IS 
    BEGIN 
        PC_empresa.EL_creaBanner(x_idArtista,x_idBanner);
        COMMIT;
    END EL_creaBanner;
----------------------------------------------------------------------------------------------------------------------------      

    -- el nombre, las caracteristicas y el rol de los personajes que estan en el banner donde mas se tiro
    FUNCTION CO_personajes_mas_tiradas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_personajes_mas_tiradas;
        RETURN xResultado;
        
    END CO_personajes_mas_tiradas;
    
    -- Consultar las caracteristicas de los personajes dependinedo de las ventas en los banners en donde las ventas Integradas hayan sido mayor al promedio
    
    FUNCTION CO_PersonajesCaracteristicasVentasMayoresPromedio RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT * 
        FROM VW_PersonajesCaracteristicasVentasMayoresPromedio;
        RETURN xResultado;
        
    END CO_PersonajesCaracteristicasVentasMayoresPromedio;
    
    --Consultar que banners creo un artista en concreto
    FUNCTION CO_bannerCree(x_nombreArtista IN VARCHAR) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        SELECT nombreBanner, nombreJuego 
        FROM artistas a 
        JOIN creaBanner cb on a.idArtista=cb.idArtista
        JOIN banners b on b.idBanner=cb.idBanner
        WHERE a.nombreartista = x_nombreArtista;        
        RETURN xResultado;
        
    END CO_bannerCree;    
    
END PC_Artista;
/          
          





CREATE OR REPLACE PACKAGE BODY PC_Jugador_Actor IS
    PROCEDURE AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE) IS
    BEGIN 
        PC_jugador.AD_jugadores(x_tipoId, x_numId, x_pais, x_fechaNacimiento);
        COMMIT;
    END AD_jugadores;
    

    PROCEDURE MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR) IS
    BEGIN
        PC_jugador.MO_jugadores(x_tipoId, x_numId, x_pais);
        COMMIT;
    END MO_jugadores;
   
----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR) IS
    BEGIN 
        PC_jugador.AD_generosPreferidos(x_tipoId, x_numId, x_genero);
        COMMIT;
    END AD_generosPreferidos;
    

    PROCEDURE MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR) IS
    BEGIN
        PC_jugador.MO_generosPreferidos(x_tipoId, x_numId, x_genero, x_genero_cambio);
        COMMIT;
    END MO_generosPreferidos;
    
----------------------------------------------------------------------------------------------------------------------------                        
            
    PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR) IS
    BEGIN
        PC_juego.AD_cuentas(x_correo, x_telefono, x_fechaConexion, x_nombreJuego, x_tipoId, x_numId);
        COMMIT;
    END AD_cuentas;
    
    
    PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.MO_cuentas_fechaConexion(x_idCuenta);
        COMMIT;
    END MO_cuentas_fechaConexion;
    
    PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR) IS
    BEGIN
        PC_juego.MO_cuentas_telefono(x_idCuenta, x_telefono);
        COMMIT;
    END MO_cuentas_telefono;
    
    
    PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.EL_cuentas(x_idCuenta);
        COMMIT;
    END EL_cuentas;
    
            
    PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.AD_compras(x_metodoPago, x_idArticulo, x_idCuenta);
        COMMIT;
    END AD_compras;

-------------------------------------------------------------------------------------------------------------------------------

   --  los 10 juegos donde mas gente haya tirado en banners
    FUNCTION CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT * 
        FROM VW_juegos_con_mas_tiradas;
        RETURN xResultado;
        
    END CO_juegos_con_mas_tiradas;
    
    -- Consultar cuales son los banners  con una inversion mayor a 100000000 en publicidad.
    
    FUNCTION CO_BannersInversionMayor100Millones RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_BannersInversionMayor100Millones;
        RETURN xResultado;
        
    END CO_BannersInversionMayor100Millones;
    
    --
    FUNCTION CO_Publicidades_Jugadores(x_tipoId IN VARCHAR,x_numid IN VARCHAR) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        select ll.nombrePublicidad,b.nombreJuego  from jugadores j JOIN llegan ll on j.tipoId=ll.tipoid and j.numid=ll.numid 
        JOIN publicidades pub on pub.nombrePublicidad=ll.nombrePublicidad
        JOIN banners b on b.idBanner=pub.idBanner
        WHERE j.tipoid =x_tipoId AND j.numid =x_numid;
        RETURN xResultado;
        
    END CO_Publicidades_Jugadores;
    

    
END PC_Jugador_Actor;
/          
 




          

CREATE OR REPLACE PACKAGE BODY PC_Desarrollador IS
        PROCEDURE AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR, x_idDesarrollador IN VARCHAR) IS
    BEGIN 
        PC_juego.AD_juegos(x_nombreJuego, x_genero, x_modoJuego,x_idDesarrollador);
        COMMIT;
    END AD_juegos;
    

        PROCEDURE EL_juegos(x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_juego.EL_juegos(x_nombreJuego);
        COMMIT;
        END EL_juegos;
   
----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_juego.AD_eventos(x_nombreEvento, x_fechaFin, x_nombreJuego);
        COMMIT;
    END AD_eventos;
    
    
        PROCEDURE MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_juego.MO_eventos_fechaFin(x_nombreEvento, x_fechaFin, x_nombreJuego);
        COMMIT;
    END MO_eventos_fechaFin;
    
    
        PROCEDURE EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_juego.EL_eventos(x_nombreEvento, x_nombreJuego);
        COMMIT;
    END EL_eventos;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR) IS
    BEGIN
        PC_juego.AD_plataformas(x_nombreJuego, x_plataforma);
        COMMIT;
    END AD_plataformas;
    
        PROCEDURE EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR) IS 
    BEGIN
        PC_juego.EL_plataformas(x_nombreJuego, x_plataforma);
        COMMIT;
    END EL_plataformas;

----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER) IS
    BEGIN
        PC_juego.AD_tiendasIntegradas(x_articulo, x_nombreJuego, x_precio);
        COMMIT;
    END AD_tiendasIntegradas;
    
    
        PROCEDURE MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER) IS
    BEGIN
        PC_juego.MO_tiendasIntegradas(x_idArticulo, x_precio);
        COMMIT;
    END MO_tiendasIntegradas;
    
    
        PROCEDURE EL_tiendasIntegradas(x_idArticulo IN VARCHAR) IS
    BEGIN
        PC_juego.EL_tiendasIntegradas(x_idArticulo);
        COMMIT;
    END EL_tiendasIntegradas;

----------------------------------------------------------------------------------------------------------------------------    
        
    PROCEDURE AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR) IS
    BEGIN
        PC_juego.AD_cuentas(x_correo, x_telefono, x_fechaConexion, x_nombreJuego, x_tipoId, x_numId);
        COMMIT;
    END AD_cuentas;
    
    
    PROCEDURE MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.MO_cuentas_fechaConexion(x_idCuenta);
        COMMIT;
    END MO_cuentas_fechaConexion;
    
    PROCEDURE MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR) IS
    BEGIN
        PC_juego.MO_cuentas_telefono(x_idCuenta, x_telefono);
        COMMIT;
    END MO_cuentas_telefono;
    
    
    PROCEDURE EL_cuentas(x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.EL_cuentas(x_idCuenta);
        COMMIT;
    END EL_cuentas;

----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ) IS
    BEGIN
        PC_juego.AD_complementosCuentas(x_idCuenta, x_nombreComplemento);
        COMMIT;
    END AD_complementosCuentas;
    
        PROCEDURE EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR ) IS 
    BEGIN
        PC_juego.EL_complementosCuentas(x_idCuenta, x_nombreComplemento);
        COMMIT;
    END EL_complementosCuentas;
    
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR) IS
    BEGIN
        PC_juego.AD_personajesCuentas(x_idCuenta, x_nombrePersonaje);
        COMMIT;
    END AD_personajesCuentas;
    
    
        PROCEDURE EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR ) IS 
    BEGIN
        PC_juego.EL_personajesCuentas(x_idCuenta, x_nombrePersonaje);
        COMMIT;
    END EL_personajesCuentas;
    
----------------------------------------------------------------------------------------------------------------------------
    
        PROCEDURE AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR) IS
    BEGIN
        PC_juego.AD_tiroEn(x_idCuenta, x_idBanner);
        COMMIT;
    END AD_tiroEn;
    
    
        PROCEDURE EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR) IS 
    BEGIN
        PC_juego.EL_tiroEn(x_idCuenta, x_idBanner);
        COMMIT;
    END EL_tiroEn;    

----------------------------------------------------------------------------------------------------------------------------    
        
        PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.AD_compras(x_metodoPago, x_idArticulo, x_idCuenta);
        COMMIT;
    END AD_compras;
    
    
        PROCEDURE MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR) IS
    BEGIN
        PC_juego.MO_compras_idCuenta(x_idCompra, x_idCuenta);
        COMMIT;
    END MO_compras_idCuenta;
    
    
        PROCEDURE MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR) IS
    BEGIN
        PC_juego.MO_compras_idArticulo(x_idCompra, x_idArticulo);
        COMMIT;
    END MO_compras_idArticulo;
    
    
        PROCEDURE EL_compras(x_idCompra IN VARCHAR) IS
    BEGIN
        PC_juego.EL_compras(x_idCompra);
        COMMIT;
    END EL_compras;

----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_desarrolladores(x_idDesarrollador, x_nombreDesarrollador, x_pais);
        COMMIT;
    END AD_desarrolladores;
    
    
        PROCEDURE EL_desarrolladores(x_idDesarrollador IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_desarrolladores(x_idDesarrollador);
        COMMIT;
    END EL_desarrolladores;  
    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_distribuidores(x_idDistribuidor, x_nombreDistribuidor, x_region);
        COMMIT;
    END AD_distribuidores;
    
    
        PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_distribuidores(x_idDistribuidor);
        COMMIT;
    END EL_distribuidores;      
    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_distribuye(x_idDistribuidor, x_nombreJuego);
        COMMIT;
    END AD_distribuye;
    
    
        PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_distribuye(x_idDistribuidor, x_nombreJuego);
        COMMIT;
    END EL_distribuye;    
    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_llegan(x_tipoId, x_numId, x_nombrePublicidad);
        COMMIT;
    END AD_llegan;
    
    

    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_artistas(x_idArtista, x_nombreArtista);
        COMMIT;
    END AD_artistas;
    
    
        PROCEDURE EL_artistas(x_idArtista IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_artistas(x_idArtista);
        COMMIT;
    END EL_artistas; 
    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_creaBanner(x_idArtista, x_idBanner);
        COMMIT;
    END AD_creaBanner;
    
    
        PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_creaBanner(x_idArtista, x_idBanner);
        COMMIT;
    END EL_creaBanner; 
    
----------------------------------------------------------------------------------------------------------------------------      

        PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_publicidades(x_nombrePublicidad, x_inversion, x_idBanner, x_idDistribuidor);
        COMMIT;
    END AD_publicidades;
    
        PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER) IS
    BEGIN
        PC_empresa.MO_publicidades_inversion(x_nombrePublicidad, x_inversion);
        COMMIT;
    END MO_publicidades_inversion;
    
    
        PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR) IS 
    BEGIN
        PC_empresa.EL_publicidades(x_nombrePublicidad);
        COMMIT;
    END EL_publicidades; 


----------------------------------------------------------------------------------------------------------------------------          
    -- Cantidad de jugadores(cuentas) totales de cada juego
    FUNCTION CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado FOR 
        SELECT *
        FROM VW_cantidad_jugadores_juegos;
        RETURN xResultado;
        
    END CO_cantidad_jugadores_juegos;
    
    -- Cantidad jugadores que se hayan conectado durante el periodo de tiempo de algun evento
    FUNCTION CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_cantidad_jugador_eventos;
        RETURN xResultado;
        
    END CO_cantidad_jugador_eventos;
    
   -- Ganancias de las membresias y las monedas integradas de un juego en especifico 
    
    FUNCTION CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        SELECT articulo, SUM(costoCompra) AS "Ventas netas"
        FROM compras 
        WHERE nombreJuego = x_nombreJuego
        GROUP BY articulo
        ORDER BY "Ventas netas" DESC;
        RETURN xResultado;
        
    END CO_ganancias_tiendaIntegrada;  
    
   -- Consultar informe de ventas de cada banner junto a su ganancia o perdida de la inversion en publicidad.
    FUNCTION CO_InformeVentasBanner RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_InformeVentasBanner;
        RETURN xResultado;
        
    END CO_InformeVentasBanner;
    
    -- Consultar la informacion de los jugadores que han comprado en la tienda integrada de forma recurrente
    
    FUNCTION CO_JugadoresComprasRecurrentes RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_JugadoresComprasRecurrentes;
        RETURN xResultado;
        
    END CO_JugadoresComprasRecurrentes;
    
    -- Consultar ganancias aproximadas de todos los banners
    
    FUNCTION CO_BannersGananciasAproximadas RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_BannersGananciasAproximadas;
        RETURN xResultado;
        
    END CO_BannersGananciasAproximadas;
    
    -- Consultar la cantidad jugadores que se hayan conectado durante el periodo de tiempo de todos los eventos
    
    FUNCTION CO_JugadoresConectadosEventos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_cantidad_jugador_eventos;
        RETURN xResultado;
        
    END CO_JugadoresConectadosEventos;
    --Consultar las publicidades que hayan atraido a mas jugadores que el promedio
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_PublicidadesJugadoresMayorPromedio;
        RETURN xResultado; 
    
    END CO_PublicidadesJugadoresMayorPromedio;
    
END PC_Desarrollador;
/  




CREATE OR REPLACE PACKAGE BODY PC_Distribuidor IS
    PROCEDURE AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR) IS
    BEGIN 
        PC_empresa.AD_distribuidores(x_idDistribuidor,x_nombreDistribuidor, x_region );
        COMMIT;
    END AD_distribuidores;
        
    PROCEDURE EL_distribuidores(x_idDistribuidor IN VARCHAR) IS
    BEGIN
        PC_empresa.EL_distribuidores(x_idDistribuidor);
        COMMIT;
    END EL_distribuidores;
    
    PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_distribuye(x_idDistribuidor,x_nombreJuego);
        COMMIT;
    END AD_distribuye;
    
    PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR) IS
    BEGIN
        PC_empresa.EL_distribuye(x_idDistribuidor,x_nombreJuego);
        COMMIT;
    END EL_distribuye;
    
    
    PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR)IS
    BEGIN
        PC_empresa.AD_publicidades(x_nombrePublicidad,x_inversion,x_idBanner, x_idDistribuidor);
        COMMIT;
    END AD_publicidades;
    
    PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER) IS
    BEGIN
        PC_empresa.MO_publicidades_inversion(x_nombrePublicidad,x_inversion);    
        COMMIT;
    END MO_publicidades_inversion;

    PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR) IS
    BEGIN
        PC_empresa.EL_publicidades(x_nombrePublicidad);        
        COMMIT;
    END EL_publicidades;
    
    PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR) IS
    BEGIN
        PC_empresa.AD_llegan(x_tipoId,x_numId, x_nombrePublicidad);        
        COMMIT;
    END AD_llegan;
  
   -- Consultar los juegos con un  numero de  jugadores mayor a un monto de jugadores.
    FUNCTION CO_JuegosMasDexJugadores(x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        WITH juegoJugadores AS (
        SELECT nombreJuego, COUNT(nombreJuego) AS jugadoresTotales
        FROM cuentas c
        GROUP BY  nombreJuego
        ),
        ventasJuego AS (
        SELECT j.nombreJuego, SUM(comp.costoCompra) AS totalVentas
        FROM compras comp
        JOIN juegos j ON j.nombreJuego = comp.nombreJuego
        GROUP BY j.nombreJuego
        )
        SELECT j.nombreJuego, j.modoJuego, j.genero, d.nombreDesarrollador, vj.totalVentas, jj.jugadoresTotales
        FROM juegos j
        JOIN desarrolladores d ON j.idDesarrollador = d.idDesarrollador
        JOIN juegoJugadores jj ON j.nombreJuego = jj.nombreJuego
        JOIN ventasJuego vj ON j.nombreJuego = vj.nombreJuego
        WHERE jj.jugadoresTotales > x_cantidadJugadores
        ORDER BY jj.jugadoresTotales DESC;
        RETURN xResultado;
        
    END CO_JuegosMasDexJugadores; 
    
    -- Consultar las publicidades que hayan atraido a mas jugadores que el promedio
    
    FUNCTION CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
        OPEN xResultado  FOR 
        SELECT *
        FROM VW_PublicidadesJugadoresMayorPromedio;
        RETURN xResultado;
        
    END CO_PublicidadesJugadoresMayorPromedio;

    --Consultar los tres mejores juegos que distribuye un distribuidor en concreto
    FUNCTION CO_MejoresJuegos(x_idDistribuidor IN VARCHAR) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
        SELECT j.nombreJuego, j.genero,SUM(costoCompra) AS "Ventas netas"
        FROM compras c JOIN juegos j on c.nombreJuego = j.nombreJuego
        JOIN distribuye d on j.nombreJuego = d.nombreJuego
        WHERE d.idDistribuidor = x_idDistribuidor
        GROUP BY j.nombreJuego, j.genero
        ORDER BY "Ventas netas" DESC FETCH FIRST 3 ROWS ONLY;
        RETURN xResultado;
        
    END CO_MejoresJuegos;
END PC_Distribuidor;
/






-- Seguridad

-- Rol Artista

--CREATE ROLE rol_Artista;

GRANT EXECUTE ON PC_Artista TO rol_Artista;

GRANT DELETE, INSERT, SELECT ON banners TO rol_Artista;

GRANT UPDATE, INSERT, SELECT ON complementos TO rol_Artista;

GRANT UPDATE, INSERT, SELECT ON personajes TO rol_Artista;

GRANT DELETE, INSERT, SELECT ON complementosBanners TO rol_Artista;

GRANT DELETE, INSERT, SELECT ON personajesBanners TO rol_Artista;
       
-- Rol Jugador

--CREATE ROLE rol_Jugador;

GRANT EXECUTE ON PC_Jugador TO rol_Jugador;

GRANT UPDATE, INSERT, SELECT ON jugadores TO rol_Jugador;

GRANT UPDATE, INSERT, SELECT ON generosPreferidos TO rol_Jugador;

-- Rol Desarrollador

--CREATE ROLE rol_Desarrollador;

GRANT EXECUTE ON PC_Desarrollador TO rol_Desarrollador;

GRANT DELETE, INSERT, SELECT ON juegos TO rol_Desarrollador;

GRANT UPDATE, DELETE, INSERT, SELECT ON eventos TO rol_Desarrollador;

GRANT DELETE, INSERT, SELECT ON plataformas TO rol_Desarrollador;

GRANT UPDATE, DELETE, INSERT, SELECT ON tiendasIntegradas TO rol_Desarrollador;

GRANT UPDATE, DELETE, INSERT, SELECT ON cuentas TO rol_Desarrollador;

GRANT DELETE, INSERT, SELECT ON complementosCuentas TO rol_Desarrollador;

GRANT DELETE, INSERT, SELECT ON personajesCuentas TO rol_Desarrollador;

GRANT DELETE, INSERT, SELECT ON tiroEn TO rol_Desarrollador;

GRANT UPDATE, INSERT, SELECT ON compras TO rol_Desarrollador;

-- Rol Gerente Desarrollador

--CREATE ROLE rol_Gerente_Desarrollador;

GRANT EXECUTE ON PC_Desarrollador TO rol_Gerente_Desarrollador;

GRANT SELECT ON VW_JugadoresComprasRecurrentes TO rol_Gerente_Desarrollador;

GRANT SELECT ON VW_BannersGananciasAproximadas TO rol_Gerente_Desarrollador;

GRANT SELECT ON VW_cantidad_jugador_eventos TO rol_Gerente_Desarrollador;

-- Rol Gerente Distribuidora

--CREATE ROLE rol_Gerente_Distribuidora;

GRANT SELECT ON VW_PublicidadesJugadoresMayorPromedio TO rol_Gerente_Distribuidora;


















