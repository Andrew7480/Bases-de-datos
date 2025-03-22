
---------------------------pruebas--------------------------------------


--AccionesOk
----------
--0

DELETE FROM banners WHERE nombreBanner = 'El ultimo rayo de luz';
select * from publicidades where nombrepublicidad ='Banner Promocional 4'; --null

DELETE FROM distribuidores WHERE nombredistribuidor = 'HoYoverse' ;
select * from publicidades where nombrepublicidad ='Banner Promocional 4'; --null
select * from distribuye WHERE idDistribuidor = 'DB_HYV'; --vacio

DELETE FROM artistas WHERE nombreArtista= 'Zhou Ling';
select * from creaBanner where idArtista = 'AT_142'; --vacia 

--3
DELETE FROM tiendasintegradas where  nombreJuego = 'Honkai:Star Rail' AND precio = 50000;
select * from tiendasintegradas where  nombreJuego = 'Honkai:Star Rail' AND precio = 50000 ; --vacio
select * from compras where  nombreJuego = 'Honkai:Star Rail' AND costoCompra = 50000;   --null

--4

select * from cuentas where nombreJuego = 'Honkai:Star Rail' AND correo ='cuenta7@gmail.com';--vacio
select * from compras where correo ='cuenta7@gmail.com' AND  nombreJuego = 'Honkai:Star Rail';--null

select idBanner from tiroEn x join cuentas y on x.idCuenta = y.idCuenta where correo ='cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';--vacia
select nombreComplemento from complementosCuentas x join cuentas y on x.idCuenta = y.idCuenta where correo ='cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail'; --vacia
select nombrepersonaje from personajesCuentas x join cuentas y on x.idCuenta = y.idCuenta where correo ='cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';  --vacia

DELETE FROM CUENTAS where nombreJuego = 'Honkai:Star Rail' AND correo ='cuenta7@gmail.com';



--1
DELETE FROM juegos where nombreJuego = 'Honkai:Star Rail'; 

select * from eventos where nombreJuego = 'Honkai:Star Rail';   --vacia
select * from plataformas where nombreJuego = 'Honkai:Star Rail';   --vacia
select * from banners where nombreJuego = 'Honkai:Star Rail';   --vacia
select * from tiendasIntegradas where nombreJuego = 'Honkai:Star Rail';   --vacia
select * from cuentas where nombreJuego = 'Honkai:Star Rail';   --vacia
--2

select nombrePersonaje from personajesBanners x join banners y on x.idBanner = y.idBanner where nombreJuego= 'Honkai:Star Rail';   --vacia 
select nombreComplemento from complementosBanners x join banners y on x.idBanner = y.idBanner where nombreJuego= 'Honkai:Star Rail';   --vacia









--DisparadoresOK--------- 
TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;   


--Mantener Empresa--

INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HYV', 'HoYoverse', 'China');
INSERT INTO artistas (idArtista, nombreArtista) VALUES ('142', 'Zhou Ling');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Honkai:Star Rail','RPG', 'Single player','DR_HYV');


--Ad:
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('001', 'Empresa1', 'America');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('002', 'Empresa2', 'Asia');  

INSERT INTO distribuye VALUES ('DB_001', 'Honkai:Star Rail') ;
INSERT INTO distribuye VALUES ('DB_002', 'Honkai:Star Rail') ;

-- La fechaInicio y la fechaFin de la publicidad es la misma que la fecha de inicio del banner que se este publicitando.
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Publicidad 1', 10002,vIdBanner, 'DB_001');

END;
/
--select* from publicidades;
--select * from banners;

--Mo:
-- Solo se puede modificar inversion de las publicidades.
UPDATE publicidades set inversion = 20000 where nombrePublicidad = 'Publicidad 1';

--El:

   -- Los artistas y distribuidores  solo se pueden borrar cuando no tienen ninguna relacion con otras tablas.

DELETE FROM artistas WHERE idArtista = 'AT_142';
select* from desarrolladores; --vacio
DELETE FROM distribuidores WHERE nombreDistribuidor = 'HoYoverse';
select* from distribuidores WHERE nombreDistribuidor = 'HoYoverse'; --vacio
select* from publicidades;--nulo

--DELETE FROM desarrolladores where idDesarrollador = 'DR_HYV';  
--select* from artistas;  --vacia


-- Mantener juego-------
--Ad:

-- se añade la plataforma mobil para cada juego

INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Honkai:Star Rail', 'PC');

--select * from plataformas;


-- la fecha de compra debe ser mayor a la fecha de creacion de la cuenta
INSERT INTO tiendasIntegradas ( articulo, nombreJuego, precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',30000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',20000);
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '10001000', 'Colombia', TO_DATE('2000-02-17', 'YYYY-MM-DD'));
INSERT INTO cuentas (idCuenta, correo, fechaCreacion, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ('100032', 'cuenta1@gmail.com', TO_DATE('2020-01-23', 'YYYY-MM-DD'), NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10001000');

--select * from tiendasIntegradas;

--SELECT * FROM compras;

--SELECT * FROM cuentas;


DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 30000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';   
    INSERT INTO compras ( metodoPago,  idCuenta, idArticulo) VALUES (  'Tarjeta de Credito',vIdCuenta  ,vIdArticulo);
    INSERT INTO compras ( metodoPago,  idCuenta, idArticulo) VALUES (  'Tarjeta de Credito',vIdCuenta  ,vIdArticulo2);    
END;
/

--SELECT * FROM compras;

--Mo:
   -- solo se puede modificar el telefono en cuentas
   
DECLARE vIdArticulo VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com'; -- buscar id articulo    
    UPDATE cuentas SET telefono = 1234 WHERE idCuenta  = vIdCuenta;

END;
/


-- de compras solo se puede modificar idCuenta e idArticulo a NULL

DECLARE vIdcompra VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdcompra FROM compras where costoCompra = 30000 AND articulo = 'Moneda integrada';
    UPDATE compras  SET idCuenta = NULL where idCompra = vIdcompra ;  
END;
/
--SELECT * FROM compras;

--

-- solo se puede modificar la fecha de fin de un evento

INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Relojito: Dulces sueños del pasado',TO_DATE('2025-06-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
UPDATE eventos SET fechaFin = TO_DATE('2028-07-20', 'YYYY-MM-DD') WHERE nombreEvento = 'Relojito: Dulces sueños del pasado';

--select * from eventos;

--El:
-- se elimina cuando idCuenta y idArticulo son nulos

DECLARE vIdcompra VARCHAR(20);                                                               
BEGIN
    SELECT idCompra INTO vIdcompra FROM compras where costoCompra = 30000 AND articulo = 'Moneda integrada';
    UPDATE compras  SET idArticulo = NULL where idCompra = vIdcompra ;  
END;
/
SELECT * FROM compras;


------ Registrar jugador-------------

--Ad:
   -- al registrar un jugador automaticamente se genera un genero preferido de accion

INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '123', 'Colombia', TO_DATE('2010-05-17', 'YYYY-MM-DD'));
--select * from generosPreferidos where numId = '123';


--Mo:
-- Se puede modificar pais
   
UPDATE jugadores SET pais = 'España' where numId = '123';

--select * from jugadores where numId = '123';
--select * from generosPreferidos where numId = '123';



---------- mantener banners--------

--Ad:
   -- La fecha de inicio del banner es la del sistema 

INSERT INTO banners (NombreBanner, fechaFin,  nombreJuego) VALUES ('Banner numero 1',TO_DATE('2025-05-29', 'YYYY-MM-DD'),'Honkai:Star Rail');
--select * from banners;

--Mo:
   -- no se puede modificar la fecha de inicio de los banners
-- en  NoOK

INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Una invitación de Colonipenal', 'Arma');

INSERT INTO personajes (nombrePersonaje,caracteristicas, rol) VALUES ('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />')
 ,'Soporte');
 
--select * from complementos;
--select* from personajes;
  --solo se puede modificar el rol de los personajes

UPDATE personajes SET rol = 'DPS' WHERE nombrePersonaje = 'Robin';
--select * from personajes;
 
 
--El:


DECLARE vIdbanner VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    insert into personajesBanners VALUES ('Robin',vIdbanner );
    insert into complementosBanners VALUES('Una invitación de Colonipenal',vIdbanner);
    
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';         
    INSERT INTO tiroEn VALUES (vIdCuenta,vIdBanner);    
END;
/


DECLARE vIdCuenta VARCHAR(20);
BEGIN    
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';    
    INSERT INTO complementosCuentas (idCuenta, nombreComplemento) VALUES (vIdCuenta, 'Una invitación de Colonipenal');    
    INSERT INTO personajesCuentas (idCuenta,nombrePersonaje) VALUES (vIdCuenta,'Robin');   
END;
/

select * from banners;
select * from personajesBanners;
select * from complementosBanners;
select * from tiroEn;
select * from personajesCuentas;
select * from complementosCuentas;
--La cuenta tiro en un banner y tiene un personaje y un complemento

-- Antes de eliminar un banner se elimina tiradas de las cuentas   (se borra tambien las relaciones de los personajes o complementos con el banner que se borro )                         

DELETE FROM banners where nombreBanner = 'standard';  

select * FROM tiroEn;
select * from banners;
select * from complementosBanners ;
select * from personajesBanners ;
select * from personajes;
select * from complementos;



--DisparadoresNoOk
TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;

--Mantener Empresa--

INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HYV', 'HoYoverse', 'China');
INSERT INTO artistas (idArtista, nombreArtista) VALUES ('142', 'Zhou Ling');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Honkai:Star Rail','RPG', 'Single player','DR_HYV');
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '10001000', 'Colombia', TO_DATE('2016-02-17', 'YYYY-MM-DD'));

--Ad:
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('HYV', 'HoYoverse', 'Global');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('LI', 'Level Infinite', 'Asia');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('KG', 'Kuro Game', 'Global');  

 -- No puede haber 2 distribuidores del mismo juego en una misma region.

INSERT INTO distribuye VALUES ('DB_HYV', 'Honkai:Star Rail') ;
INSERT INTO distribuye VALUES ('DB_LI', 'Honkai:Star Rail') ;
INSERT INTO distribuye VALUES ('DB_KG', 'Honkai:Star Rail') ;--No lo deja meter


DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Publicidad 1', 10002,vIdBanner, 'DB_HYV');

END;
/
insert into llegan VALUES('cedula', '10001000','Publicidad 1');

--select* from publicidades;
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO creaBanner (idArtista, idBanner) VALUES ('AT_142',vIdBanner);

END;
/
--Mo:
   --- No se puede modificar la tabla de distribuidores, llegan, artistas, creaBanner, desarrolladores, distribuye.

UPDATE desarrolladores SET nombreDesarrollador = 'Alan' WHERE nombreDesarrollador ='HoYoverse';
UPDATE distribuidores SET nombreDistribuidor = 'Alan' WHERE nombreDistribuidor ='HoYoverse';
UPDATE artistas SET nombreartista = 'Alan' WHERE nombreartista ='Zhou Ling';
UPDATE distribuye SET nombreJuego = 'Juego 2' WHERE nombreJuego ='Honkai:Star Rail';
UPDATE creaBAnner SET idArtista = 'Artista 2' WHERE idArtista ='AT_142';
UPDATE llegan SET nombrePublicidad = 'publi' WHERE tipoId = 'cedula' AND numId= '10001000';

--El: 
-- No se puede borrar las publicidades que le llegan a los jugadores.
DELETE FROM llegan WHERE nombrePublicidad = 'Publicidad 1';

select *from llegan;
--select*from creaBanner;

-- Mantener juego-------

INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Honkai:Star Rail', 'PC');
INSERT INTO tiendasIntegradas ( articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Honkai:Star Rail', 25000);
INSERT INTO tiendasIntegradas ( articulo, nombreJuego, precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',30000);
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '10001000', 'Colombia', TO_DATE('2000-02-17', 'YYYY-MM-DD'));
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta1@gmail.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10001000');

--Mo:
-- de compras solo se puede modificar idCuenta e idArticulo a NULL
select * from cuentas;
select * from compras;

DECLARE vIdArticulo VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';     
    INSERT INTO compras ( metodoPago,  idCuenta, idArticulo) VALUES (  'Tarjeta de Credito',vIdCuenta  ,vIdArticulo);    
END;
/


DECLARE vIdcompra VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdcompra FROM compras; 
    UPDATE compras SET  metodoPago = 'No se puede' where idCompra = vIdcompra  ;
END;
/


   -- solo se puede modificar el telefono en cuentas
select * from cuentas;

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';     
    UPDATE cuentas set nombrejuego = 'no se puede' where idCuenta = vIdCuenta ;    
END;
/



-- Solo se puede modificar el precio del articulo de las tiendas integradas
select * from tiendasIntegradas;

UPDATE tiendasIntegradas SET articulo = 'Ni lo pienses' WHERE articulo  = 'Membresia';



INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Relojito: Dulces sueños del pasado',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
-- solo se puede modificar la fecha de fin de un evento
select * from eventos;

UPDATE eventos SET fechainicio = TO_DATE('2019-07-20', 'YYYY-MM-DD') WHERE nombreEvento = 'Relojito: Dulces sueños del pasado';




------ Registrar jugador------------- 

INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '123', 'Colombia', TO_DATE('2010-05-17', 'YYYY-MM-DD'));

--Mo:
   -- Solo se puede modificar el pais del jugador

UPDATE jugadores SET fechaNacimiento = TO_DATE('2011-12-17', 'YYYY-MM-DD') WHERE numId = '123';
    




---------- mantener banners--------
select * from banners;


INSERT INTO banners (NombreBanner, fechaFin,  nombreJuego) VALUES ('Banner numero 1',TO_DATE('2025-05-29', 'YYYY-MM-DD'),'Honkai:Star Rail');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Una invitación de Colonipenal', 'Arma');
INSERT INTO personajes (nombrePersonaje,caracteristicas, rol) VALUES ('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />')
 ,'Soporte');
 
--no puedes meter un complemento en un banner de personajes

DECLARE vIdbanner VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'Banner numero 1';
    insert into personajesBanners VALUES ('Robin',vIdbanner );
    insert into complementosBanners VALUES('Una invitación de Colonipenal',vIdbanner);
    
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';         
    INSERT INTO tiroEn VALUES (vIdCuenta,vIdBanner);    
END;
/

--Mo:
   -- no se puede modificar la tabla de banners
   
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdbanner FROM banners WHERE nombreBanner = 'standard'; 
    UPDATE banners set fechaFin = TO_DATE('2010-05-17', 'YYYY-MM-DD');    
END;
/
  
------------

  --solo se puede modificar  rol de los personajes

UPDATE personajes SET caracteristicas = XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />') WHERE nombrePersonaje = 'Robin';
select * from personajes;
 
 
--El:

   --  Los personajes y complementos se borran cuando se borran todas sus relaciones con todos los banners.
   
DECLARE vIdbanner VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    insert into personajesBanners VALUES ('Robin',vIdbanner );
    
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail.com';         
    INSERT INTO tiroEn VALUES (vIdCuenta,vIdBanner);    
END;
/

Delete from personajes where nombrePersonaje = 'Luocha';  
select * from publicidades;


--IndicesVistasOK  
SELECT * FROM VW_JugadoresComprasRecurrentes;
SELECT * FROM VW_BannersGananciasAproximadas;
--ganancias tiendas integradas --funcion
SELECT * FROM VW_cantidad_jugador_eventos;
SELECT * FROM VW_PersonajesCaracteristicasVentasMayoresPromedio;
SELECT * FROM VW_personajes_mas_tiradas;
SELECT * FROM VW_juegos_con_mas_tiradas;
SELECT * FROM VW_cantidad_jugadores_juegos;
SELECT * FROM VW_JuegosMasDeDiezMillonesJugadores; 
SELECT * FROM VW_PublicidadesJugadoresMayorPromedio;
SELECT * FROM VW_InformeVentasBanner; 
SELECT * FROM VW_BannersInversionMayor100Millones;




SELECT * FROM cuentas where correo = 'cuenta1@gmail.com';
SELECT * FROM compras where correo = 'cuenta1@gmail.com';
SELECT * FROM BANNERS WHERE nombreBanner='standard';
SELECT * FROM distribuidores WHERE nombreDistribuidor = 'HYV';




    
--CRUDOK --
TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;




--0. Empresa
     --AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR); 
BEGIN
    PC_empresa.AD_desarrolladores('HYV', 'HoYoverse', 'China');
    PC_empresa.AD_desarrolladores('SM', 'Studio Montagne', 'China');
    PC_empresa.AD_desarrolladores('SU', 'Shift Up', 'Corea del Sur');
    PC_empresa.AD_desarrolladores('NyG', 'Cygames ', 'Japon');
END;
/

     --EL_desarrolladores(x_idDesarrollador IN VARCHAR);   
BEGIN
    PC_empresa.EL_desarrolladores('DR_NyG');
END;
/    
    
--select* from desarrolladores;

     --AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR); 
     
BEGIN
    PC_empresa.AD_distribuidores('HYV', 'HoYoverse', 'Global');
    PC_empresa.AD_distribuidores('LI', 'Level Infinite', 'Global');
    PC_empresa.AD_distribuidores('KG', 'Kuro Game', 'Global');
END;
/       
     
     
     --EL_distribuidores(x_idDistribuidor IN VARCHAR);
BEGIN
    PC_empresa.EL_distribuidores('DB_KG');
END;
/       
--select * from distribuidores;    
    
     --AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR); 
     
BEGIN
    PC_empresa.AD_artistas('142', 'Zhou Ling');
    PC_empresa.AD_artistas('179', 'Chen Kun');
    PC_empresa.AD_artistas('148', 'Zhenxi Zhang');
    PC_empresa.AD_artistas('149', 'Kazuya Nakai');
END;
/    
     --EL_artistas(x_idArtista IN VARCHAR);
    
BEGIN
    PC_empresa.EL_artistas('AT_142');
END;
/     
    
--select*from artistas;
    



--1.PC_jugador 

-- AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE); 

BEGIN
    PC_jugador.AD_jugadores('cedula', '10001000', 'Colombia', TO_DATE('2019-02-17', 'YYYY-MM-DD'));
    PC_jugador.AD_jugadores('cedula', '1020', 'Brazil', TO_DATE('2018-12-17', 'YYYY-MM-DD'));
    PC_jugador.AD_jugadores('cedula', '10204040', 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/

-- MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR);

BEGIN
    PC_jugador.MO_jugadores('cedula', '10001000', 'Alemania');
END;
/ 
--select*from jugadores;

-- AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR);
BEGIN
    PC_jugador.AD_generosPreferidos('cedula', '10001000', 'Aventura');
END;
/ 

-- MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR);

BEGIN
    PC_jugador.MO_generosPreferidos('cedula', '10001000', 'Aventura','Deporte');
END;
/ 
--select * from generosPreferidos;


--2.  PC_juego 
--select * from banners;
-- AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR);
BEGIN
    PC_juego.AD_juegos('Honkai:Star Rail','RPG', 'Single player','DR_HYV');
    PC_juego.AD_juegos('Genshin','Aventura', 'Multiplayer','DR_HYV');    
END;
/

-- EL_juegos(x_nombreJuego IN VARCHAR);
BEGIN
    PC_juego.EL_juegos('Genshin');
END;
/
--select*from juegos;


-- AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR);
BEGIN
    PC_juego.AD_eventos('Relojito: Dulces sueños del pasado',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_juego.AD_eventos('Pergamino ninja de la Cacería' ,TO_DATE('2026-02-13', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_juego.AD_eventos('Presente del cometa' ,TO_DATE('2025-06-13', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/
-- MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR);
BEGIN
    PC_juego.MO_eventos_fechaFin('Relojito: Dulces sueños del pasado',TO_DATE('2026-06-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/

-- EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR);
BEGIN
    PC_juego.EL_eventos('Relojito: Dulces sueños del pasado', 'Honkai:Star Rail');
END;
/
--select * from eventos;


-- AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
BEGIN
    PC_juego.AD_plataformas( 'Honkai:Star Rail','Consola');
END;
/
-- EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
BEGIN
    PC_juego.EL_plataformas( 'Honkai:Star Rail','Mobil');
END;
/
--select*from plataformas;


-- AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER);

BEGIN
    PC_juego.AD_tiendasIntegradas( 'Moneda integrada','Honkai:Star Rail',40000); 
END;
/
-- MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER);
DECLARE vIdArticulo VARCHAR (20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas where precio = 30000 AND nombreJuego= 'Honkai:Star Rail';
    PC_juego.MO_tiendasIntegradas( vIdArticulo,40000);
END;
/
-- EL_tiendasIntegradas(x_idArticulo IN VARCHAR);

DECLARE vIdArticulo VARCHAR (20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas where precio = 40000 AND nombreJuego= 'Honkai:Star Rail' AND articulo ='Moneda integrada' ;
    PC_juego.EL_tiendasIntegradas( vIdArticulo);
END;
/
--select*from tiendasintegradas;


-- AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR);
--select* from jugadores;
--select*from cuentas;
BEGIN
    PC_juego.AD_cuentas('cuenta1@gmail1.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10001000');
    PC_juego.AD_cuentas('cuenta1@gmail2.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '1020');
    PC_juego.AD_cuentas('cuenta1@gmail3.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10204040');
END;
/

-- MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_juego.MO_cuentas_fechaConexion(vIdCuenta);

END;
/


-- MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR);  

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_juego.MO_cuentas_telefono(vIdCuenta,'12849');

END;
/

-- EL_cuentas(x_idCuenta IN VARCHAR);
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_juego.EL_cuentas(vIdCuenta);

END;
/


-- AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR);

DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';   
    PC_juego.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_juego.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/

-- MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR);

DECLARE vIdCompra VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';   
    PC_juego.MO_compras_idCuenta( vIdCompra,NULL);
END;
/
--select * from compras ;
--select * from tiendasintegradas;
-- MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR);

DECLARE vIdCompra VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND costoCompra = 50000; 
    PC_juego.MO_compras_idArticulo( vIdCompra,NULL);
END;
/

-- EL_compras(x_idCompra IN VARCHAR);


DECLARE vIdCompra VARCHAR(20);                                                    
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND costoCompra = 50000; 
    PC_juego.EL_compras( vIdCompra);
END;
/
--select * from compras;


-- CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR;
SET SERVEROUTPUT ON;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(40);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_juego.CO_cantidad_jugadores_juegos(); 
    DBMS_OUTPUT.PUT_LINE('--- Jugadores Totales por Juego ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Juego: ' || v_nombre || ' - Jugadores Totales: ' || v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

-- CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR; 

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_juego.CO_cantidad_jugador_eventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre ||' | ' ||'  Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/



-- CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR) RETURN SYS_REFCURSOR;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_articulo VARCHAR(50);
    v_ventas NUMBER;
BEGIN
    v_cursor := PC_juego.CO_ganancias_tiendaIntegrada('Honkai:Star Rail'); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias por Artículo (Honkai:Star Rail) ---');
    
    LOOP
        FETCH v_cursor INTO v_articulo, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_articulo || ' - Ventas Netas: ' || v_ventas);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/
select* from compras where nombreJuego = 'Honkai:Star Rail';
select* from tiendasIntegradas;










--3.PC_banner

--AD_banners(x_nombreBanner,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 

BEGIN
    PC_banner.AD_banners('La flamiente llama',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_banner.AD_banners('La odisea milagrosa',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_banner.AD_banners('La odisea del caos',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/
    
--EL_banners(x_nombreBanner IN VARCHAR);
BEGIN
    PC_banner.EL_banners('La flamiente llama');
END;
/
--select * from banners;       
 
--AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
BEGIN
    PC_banner.AD_complementos('Una invitación de Colonipenal', 'Arma');
    PC_banner.AD_complementos('Un deseo que arde', 'Arma');
    PC_banner.AD_complementos('La batalla final', 'Arma');
    
END;
/

-- MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
BEGIN
    PC_banner.MO_complementos('Una invitación de Colonipenal', 'Ropa');
END;
/

-- AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas IN XMLTYPE, x_rol IN VARCHAR);

BEGIN
    PC_banner.AD_personajes('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />'),'Soporte');
    PC_banner.AD_personajes('Ruan Mei',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Negro" vestimenta="Elegante" personalidad="Estudiosa" />'),'Soporte');
    PC_banner.AD_personajes('Sampo Koski',XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Azul" vestimenta="Divertida" personalidad="Alegre" />'),'Soporte');
END;
/

-- MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR);

BEGIN
    PC_banner.MO_personajes_rol('Robin','DPS');
END;
/
  
    
-- AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);


DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa';
    PC_banner.AD_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    PC_banner.AD_complementosBanners(vIdbanner,'Un deseo que arde');
    PC_banner.AD_complementosBanners(vIdbanner,'La batalla final');
    
END;
/

--select * from complementos;

-- EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);   

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa';
    PC_banner.EL_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    
END;
/

    
-- AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);

select* from personajesBanners;
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos';
    PC_banner.AD_personajesBanners(vIdbanner,'Robin');
    PC_banner.AD_personajesBanners(vIdbanner,'Ruan Mei');
    PC_banner.AD_personajesBanners(vIdbanner,'Sampo Koski');
    
END;
/
-- EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);          
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos';
    PC_banner.EL_personajesBanners(vIdbanner,'Robin');
    
END;
/

-- paquete de juego
----------------------------------------------------------------------------------------------------------------------------------------
-- AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR);   
--select* from tiroEn;

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos' AND nombreJuego = 'Honkai:Star Rail';
    PC_juego.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa' AND nombreJuego = 'Honkai:Star Rail';
    PC_juego.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard' AND nombreJuego = 'Honkai:Star Rail';
    PC_juego.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/

-- EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard' AND nombreJuego = 'Honkai:Star Rail';
    PC_juego.EL_tiroEn(vIdCuenta, vIdbanner);
END;
/


-- AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR);
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_juego.AD_complementosCuentas(vIdCuenta, 'Un deseo que arde');
    PC_juego.AD_complementosCuentas(vIdCuenta, 'La batalla final');
END;
/



-- EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_juego.EL_complementosCuentas(vIdCuenta, 'Un deseo que arde');
END;
/
--select*from complementoscuentas;

-- AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_juego.AD_personajesCuentas(vIdCuenta, 'Ruan Mei');
    PC_juego.AD_personajesCuentas(vIdCuenta, 'Sampo Koski');
END;
/

-- EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_juego.EL_personajesCuentas(vIdCuenta, 'Ruan Mei');
END;
/




----------------------------------------------------------------------------------------------------------------------------------------    
SET SERVEROUTPUT ON;
    

-- CO_personajes_mas_tiradas RETURN SYS_REFCURSOR; 
--select * from personajes;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_xml XMLTYPE;
    v_tipo VARCHAR(30);
    
BEGIN
    v_cursor := PC_banner.CO_personajes_mas_tiradas(); 
    DBMS_OUTPUT.PUT_LINE('--- Personajes que por mas tiran ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_xml,v_tipo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('personaje: ' || v_nombre ||' | ' ||v_tipo);
        DBMS_OUTPUT.PUT_LINE(COALESCE(v_xml.getStringVal(), 'Sin XML'));
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/


-- CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR;
    
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_banner.CO_juegos_con_mas_tiradas(); 
    DBMS_OUTPUT.PUT_LINE('--- Juegos con mas tiradas ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Juego:  ' || v_nombre || ' - Numero:  ' ||v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

--CO_PersonajesCaracteristicasVentasMayoresPromedio  
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_genero VARCHAR(30);
    v_personalidad VARCHAR(30);
    v_estatura VARCHAR(30);
    v_color VARCHAR(30);
    v_rol VARCHAR(30);
    v_ganancias NUMBER;
    
BEGIN
    v_cursor := PC_banner.CO_PersonajesCaracteristicasVentasMayoresPromedio(); 
    DBMS_OUTPUT.PUT_LINE('--- Juegos con mas tiradas ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_genero,v_personalidad,v_estatura,v_color ,v_rol, v_ganancias;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Personaje:  ' || v_nombre || ' | '|| v_genero ||' | '||v_personalidad ||' | '||v_estatura||' | '||v_color||' | '||v_rol || ' | ' || v_ganancias);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/


--PC_empresa

INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Genshin Impact', 'Aventura', 'Multiplayer','DR_HYV');

--PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
BEGIN
    PC_empresa.AD_distribuye('DB_HYV', 'Honkai:Star Rail');
    PC_empresa.AD_distribuye('DB_HYV', 'Genshin Impact');
END;
/


--PROCEDURE EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
BEGIN 
    PC_empresa.EL_distribuye('DB_HYV', 'Genshin Impact');
END;
/
    
--select *from distribuye;
    
--PROCEDURE AD_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
--select *from creabanner;
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner FROM banners WHERE nombreBanner='standard' AND nombreJuego='Honkai:Star Rail';
    PC_empresa.AD_creaBanner('AT_149', vIdBanner);
    PC_empresa.AD_creaBanner('AT_179', vIdBanner);

END;
/


DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner FROM banners WHERE nombreBanner='La odisea milagrosa' AND nombreJuego='Honkai:Star Rail';
    PC_empresa.AD_creaBanner('AT_149', vIdBanner);
    PC_empresa.AD_creaBanner('AT_179', vIdBanner);
END;
/

--PROCEDURE EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner FROM banners WHERE nombreBanner='La odisea milagrosa' AND nombreJuego='Honkai:Star Rail';
    PC_empresa.EL_creaBanner('AT_149', vIdBanner);
END;
/  


--PROCEDURE AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR);
--select * from publicidades;

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    PC_empresa.AD_publicidades('Publicidad 1', 10334002,vIdBanner, 'DB_HYV');
    PC_empresa.AD_publicidades('Publicidad 2', 34590283,vIdBanner, 'DB_HYV');
    PC_empresa.AD_publicidades('Publicidad 3', 237328834,vIdBanner, 'DB_HYV');

END;
/

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa'  AND nombreJuego = 'Honkai:Star Rail';
    PC_empresa.AD_publicidades('Banner Promocional 3', 103002,vIdBanner, 'DB_HYV');
END;
/

--PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER);

BEGIN
    PC_empresa.MO_publicidades_inversion('Publicidad 1', 500000000001);

END;
/    
    
--PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR);    
BEGIN
    PC_empresa.EL_publicidades('Publicidad 1');

END;
/    
      
    
    
--PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
select * from llegan; 

BEGIN 
    PC_empresa.AD_llegan('cedula', '10001000','Publicidad 2');
    PC_empresa.AD_llegan('cedula', '10001000','Publicidad 3');
    PC_empresa.AD_llegan('cedula', '10001000','Banner Promocional 3');
    PC_empresa.AD_llegan('cedula', '1020','Publicidad 2');
    PC_empresa.AD_llegan('cedula', '1020','Publicidad 3');
    PC_empresa.AD_llegan('cedula', '10204040','Publicidad 2');
    PC_empresa.AD_llegan('cedula', '10204040','Banner Promocional 3');
END;
/ 

  
  
       




     --CO_InformeVentasBanner RETURN SYS_REFCURSOR;  
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idBanner VARCHAR(30);
    v_nombre VARCHAR(30);
    v_inversion NUMBER;
    v_ventas NUMBER;
    v_ganancias NUMBER;    
BEGIN
    v_cursor := PC_empresa.CO_InformeVentasBanner(); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de Banners ---');

    LOOP
        FETCH v_cursor INTO v_idBanner, v_nombre,v_inversion, v_ventas, v_ganancias;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banner:  ' || v_nombre|| ' |  '  || v_inversion|| ' |  ' ||v_ventas|| '  | ' || v_ganancias);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/
     
    -- CO_JuegosMasDexJugadores (x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR;
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_modalidad VARCHAR(30);
    v_genero VARCHAR(30);
    v_desarrollador VARCHAR(30);
    v_inversion NUMBER;
    v_Jugadores NUMBER;    
BEGIN
    v_cursor := PC_empresa.CO_JuegosMasDexJugadores(10); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de juegos con mas de x jugadores ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_modalidad,v_genero,v_desarrollador,v_inversion, v_Jugadores;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Juegos:  ' || v_nombre|| ' |  '  || v_modalidad|| ' |  ' ||v_genero|| ' |  ' || v_desarrollador|| ' |  ' || v_inversion|| '  | ' || v_Jugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/     
     -- CO_BannersInversionMayorx (x_inversion IN NUMBER) RETURN SYS_REFCURSOR;
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_modalidad VARCHAR(30);
    v_genero VARCHAR(30);
    v_desarrollador VARCHAR(30);
    v_inversion NUMBER;
    v_Artista VARCHAR(30);    
BEGIN
    v_cursor := PC_empresa.CO_BannersInversionMayorx(100000); 
    DBMS_OUTPUT.PUT_LINE('--- Juegos con mas de x en inversion  ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_modalidad,v_genero,v_desarrollador,v_Artista,v_inversion;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Juegos:  ' || v_nombre|| ' |  '  || v_modalidad|| '  | ' ||v_genero|| '  | ' || v_desarrollador|| ' |  ' || v_Artista|| '  | ' || v_inversion);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/          
     
     --CO_JugadoresComprasRecurrentes RETURN SYS_REFCURSOR;
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idCuenta VARCHAR(30);
    v_correo VARCHAR(30);
    v_idCompra VARCHAR(30);
    v_fechacompra DATE;
    v_metodo VARCHAR(30); 
    v_costo NUMBER;
BEGIN
    v_cursor := PC_empresa.CO_JugadoresComprasRecurrentes(); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de Jugadores recurrentes ---');

    LOOP
        FETCH v_cursor INTO v_idCuenta,v_correo,v_idCompra,v_fechacompra,v_metodo,v_costo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Cuenta:  ' || v_idCuenta|| ' |  '  || v_correo|| '  | ' ||v_idCompra|| '  | ' || v_fechacompra|| ' |  ' || v_metodo|| ' |  ' || v_costo);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/           
     --CO_BannersGananciasAproximadas RETURN SYS_REFCURSOR; 
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idBanner VARCHAR(40);
    v_nombre VARCHAR(30);
    v_costo NUMBER;
BEGIN
    v_cursor := PC_empresa.CO_BannersGananciasAproximadas(); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias Banners ---');

    LOOP
        FETCH v_cursor INTO v_idBanner,v_nombre,v_costo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banner:  ' || v_idBanner|| ' |  '  || v_nombre|| '  | ' ||v_costo);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/        
     
     --CO_JugadoresConectadosEventos RETURN SYS_REFCURSOR;
 DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_empresa.CO_JugadoresConectadosEventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre || ' - Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/    
     
     --CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombrePublicidad VARCHAR(100);
    v_inversion NUMBER;
    v_nombreBanner VARCHAR(100);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_nombreDistribuidor VARCHAR(100);
    v_nombreJuego VARCHAR(100);
    v_totalJugadores NUMBER;
BEGIN
    v_cursor := PC_empresa.CO_PublicidadesJugadoresMayorPromedio();

    DBMS_OUTPUT.PUT_LINE('--- Informe de Publicidades con Jugadores Superiores al Promedio ---');
    
    LOOP
        FETCH v_cursor INTO v_nombrePublicidad, v_inversion, v_nombreBanner, v_fechaInicio, v_fechaFin, v_nombreDistribuidor, v_nombreJuego, v_totalJugadores;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombrePublicidad || ' | ' || v_inversion || ' | ' || v_nombreBanner || ' | ' || TO_CHAR(v_fechaInicio, 'DD-MM-YYYY') || ' | ' || TO_CHAR(v_fechaFin, 'DD-MM-YYYY') || ' | ' || v_nombreDistribuidor || ' | ' || v_nombreJuego || ' | ' || v_totalJugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/







 -------------CRUDNoOK --------------------

TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;

--insertar un NULL donde no debe   
select * from jugadores;
BEGIN
    PC_jugador.AD_jugadores('cedula', '10204040', 'Colombia', TO_DATE('2019-02-17', 'YYYY-MM-DD'));
    PC_jugador.AD_jugadores('cedula', '1020', 'Brazil', TO_DATE('2018-12-17', 'YYYY-MM-DD'));
    PC_jugador.AD_jugadores('cedula', NULL, 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/


-- actualizar valores a NULL
BEGIN
    PC_jugador.AD_jugadores('cedula', '10204040', 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/

BEGIN
    PC_jugador.MO_jugadores('cedula', '10204040', NULL);
END;
/ 

-- Intentar meter un valor que no es aceptado
BEGIN
    PC_jugador.AD_generosPreferidos('cedula', '10001000', 'No se puede');
END;
/ 
 
-- Intentar meter un valor que no es aceptado


BEGIN
    PC_jugador.MO_generosPreferidos('cedula', '10204040', 'Accion','No posible');
END;
/ 
--select * from generosPreferidos;




--intentar meter un valor null
BEGIN
    PC_empresa.AD_desarrolladores('HYV', 'HoYoverse', 'China');
    PC_empresa.AD_desarrolladores('SM', 'Studio Montagne', 'China');
    PC_empresa.AD_desarrolladores('SU', 'Shift Up', 'Corea del Sur');
    PC_empresa.AD_desarrolladores('NyG', 'Cygames ', NULL);
END;
/
--select* from desarrolladores;

-- ingresar un juego con modalidad no aceptada
BEGIN
    PC_juego.AD_juegos('Honkai:Star Rail','RPG', 'Multiplayer','DR_HYV');
    PC_juego.AD_juegos('Genshin','Aventura', 'BATALLA','DR_HYV');    
END;
/
--select * from juegos;

-- añadir una plataforma no permitida
BEGIN
    PC_juego.AD_plataformas( 'Honkai:Star Rail','Celuco');
END;
/

-- Ingresar un valor negativo

BEGIN
    PC_juego.AD_tiendasIntegradas( 'Moneda integrada','Honkai:Star Rail',-40000); 
END;
/

--añadir una cuenta con un correo muy largo
--select* from cuentas;
--select * from jugadores;
insert into jugadores VALUES ('cedula','123','Mexico',TO_DATE('2020-02-10', 'YYYY-MM-DD')) ;
insert into jugadores VALUES ('cedula','456','Mexico',TO_DATE('2020-02-10', 'YYYY-MM-DD')) ;
BEGIN
    PC_juego.AD_cuentas('cuenta12@gmail1.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '456');
    PC_juego.AD_cuentas('cuenta1cuenta2cuenta3cuenta4cuenta5cuenta6cuenta7cuenta8cuenta9@gmail3.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '123');
END;
/













--SeguridadOK

TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;

--PC_Jugador_Actor     

-- AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE); 

BEGIN
    PC_Jugador_Actor.AD_jugadores('cedula', '10001000', 'Colombia', TO_DATE('2019-02-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('cedula', '1020', 'Brazil', TO_DATE('2018-12-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('cedula', '10204040', 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/

-- MO_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_pais IN VARCHAR);

BEGIN
    PC_Jugador_Actor.MO_jugadores('cedula', '10001000', 'Alemania');
END;
/ 

-- AD_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR);
BEGIN
    PC_Jugador_Actor.AD_generosPreferidos('cedula', '10001000', 'Aventura');
END;
/ 

-- MO_generosPreferidos(x_tipoId IN VARCHAR, x_numId IN VARCHAR, x_genero IN VARCHAR , x_genero_cambio IN VARCHAR);

BEGIN
    PC_Jugador_Actor.MO_generosPreferidos('cedula', '10001000', 'Aventura','Deporte');
END;
/ 


    
--PC_Desarrollador  
     --AD_desarrolladores(x_idDesarrollador IN VARCHAR,x_nombreDesarrollador IN VARCHAR, x_pais IN VARCHAR); 
BEGIN
    PC_Desarrollador.AD_desarrolladores('HYV', 'HoYoverse', 'China');
    PC_Desarrollador.AD_desarrolladores('SM', 'Studio Montagne', 'China');
    PC_Desarrollador.AD_desarrolladores('SU', 'Shift Up', 'Corea del Sur');
    PC_Desarrollador.AD_desarrolladores('NyG', 'Cygames ', 'Japon');
END;
/

     --EL_desarrolladores(x_idDesarrollador IN VARCHAR);   
BEGIN
    PC_Desarrollador.EL_desarrolladores('DR_NyG');
END;
/    
    

--AD_juegos(x_nombreJuego IN VARCHAR, x_genero IN VARCHAR, x_modoJuego IN VARCHAR);

BEGIN
    PC_Desarrollador.AD_juegos('Honkai:Star Rail','RPG', 'Single player','DR_HYV');
    PC_Desarrollador.AD_juegos('Genshin','Aventura', 'Multiplayer','DR_HYV');    
END;
/

--EL_juegos(x_nombreJuego IN VARCHAR);
BEGIN
    PC_Desarrollador.EL_juegos('Genshin');    
END;
/

-- AD_eventos(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 

BEGIN
    PC_Desarrollador.AD_eventos('Relojito: Dulces sueños del pasado',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/

-- MO_eventos_fechaFin(x_nombreEvento IN VARCHAR, x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 

BEGIN
    PC_Desarrollador.MO_eventos_fechaFin('Relojito: Dulces sueños del pasado',TO_DATE('2028-09-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/

-- EL_eventos(x_nombreEvento IN VARCHAR, x_nombreJuego IN VARCHAR); 
BEGIN
    PC_Desarrollador.EL_eventos('Relojito: Dulces sueños del pasado', 'Honkai:Star Rail');
END;
/

    
-- AD_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
BEGIN
    PC_Desarrollador.AD_plataformas( 'Honkai:Star Rail','Consola');
END;
/
-- EL_plataformas(x_nombreJuego IN VARCHAR, x_plataforma IN VARCHAR);
BEGIN
    PC_Desarrollador.EL_plataformas( 'Honkai:Star Rail','Mobil');
END;
/
    
-- AD_tiendasIntegradas(x_articulo IN VARCHAR, x_nombreJuego IN VARCHAR, x_precio IN NUMBER);
BEGIN
    PC_Desarrollador.AD_tiendasIntegradas( 'Moneda integrada','Honkai:Star Rail',40000);
END;
/
-- MO_tiendasIntegradas(x_idArticulo IN VARCHAR, x_precio IN NUMBER);
DECLARE vIdArticulo VARCHAR (20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas where precio = 30000 AND nombreJuego= 'Honkai:Star Rail';
    PC_Desarrollador.MO_tiendasIntegradas( vIdArticulo,40000);
END;
/

-- EL_tiendasIntegradas(x_idArticulo IN VARCHAR);
DECLARE vIdArticulo VARCHAR (20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas where precio = 40000 AND nombreJuego= 'Honkai:Star Rail' AND articulo ='Moneda integrada' ;
    PC_Desarrollador.EL_tiendasIntegradas( vIdArticulo);
END;
/

 

-- AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR);

BEGIN
    PC_Desarrollador.AD_cuentas('cuenta1@gmail1.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10001000');
    PC_Desarrollador.AD_cuentas('cuenta1@gmail2.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '1020');
    PC_Desarrollador.AD_cuentas('cuenta1@gmail3.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10204040');
END;
/

-- MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE tipoid = 'cedula' and numId ='10001000';
    PC_Desarrollador.MO_cuentas_fechaConexion(vIdCuenta);

END;
/


-- MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR);  

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE tipoid = 'cedula' and numId ='10001000';
    PC_Desarrollador.MO_cuentas_telefono(vIdCuenta,'12849');

END;
/

-- EL_cuentas(x_idCuenta IN VARCHAR);
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_Desarrollador.EL_cuentas(vIdCuenta);

END;
/ 

-- AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR);

DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';   
    PC_Desarrollador.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_Desarrollador.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/

-- MO_compras_idCuenta(x_idCompra IN VARCHAR, x_idCuenta IN VARCHAR);

DECLARE vIdCompra VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';   
    PC_Desarrollador.MO_compras_idCuenta( vIdCompra,NULL);
END;
/
-- MO_compras_idArticulo(x_idCompra IN VARCHAR, x_idArticulo IN VARCHAR);

DECLARE vIdCompra VARCHAR(20);
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND costoCompra = 50000; 
    PC_Desarrollador.MO_compras_idArticulo( vIdCompra,NULL);
END;
/

-- EL_compras(x_idCompra IN VARCHAR);


DECLARE vIdCompra VARCHAR(20);                                                     
BEGIN
    SELECT idCompra INTO vIdCompra FROM compras WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND costoCompra = 50000; 
    PC_Desarrollador.EL_compras( vIdCompra);
END;
/

     --CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombrePublicidad VARCHAR(100);
    v_inversion NUMBER;
    v_nombreBanner VARCHAR(100);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_nombreDistribuidor VARCHAR(100);
    v_nombreJuego VARCHAR(100);
    v_totalJugadores NUMBER;
BEGIN
    v_cursor := PC_desarrollador.CO_PublicidadesJugadoresMayorPromedio();

    DBMS_OUTPUT.PUT_LINE('--- Informe de Publicidades con Jugadores Superiores al Promedio ---');
    
    LOOP
        FETCH v_cursor INTO v_nombrePublicidad, v_inversion, v_nombreBanner, v_fechaInicio, v_fechaFin, v_nombreDistribuidor, v_nombreJuego, v_totalJugadores;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombrePublicidad || ' | ' || v_inversion || ' | ' || v_nombreBanner || ' | ' || TO_CHAR(v_fechaInicio, 'DD-MM-YYYY') || ' | ' || TO_CHAR(v_fechaFin, 'DD-MM-YYYY') || ' | ' || v_nombreDistribuidor || ' | ' || v_nombreJuego || ' | ' || v_totalJugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/



-- CO_cantidad_jugadores_juegos RETURN SYS_REFCURSOR;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugadores_juegos(); 
    DBMS_OUTPUT.PUT_LINE('--- Jugadores Totales por Juego ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Juego: ' || v_nombre || ' - Jugadores Totales: ' || v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

-- CO_cantidad_jugador_eventos RETURN SYS_REFCURSOR;  
 DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugador_eventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre || ' - Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/ 

-- CO_ganancias_tiendaIntegrada(x_nombreJuego IN VARCHAR) RETURN SYS_REFCURSOR;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_articulo VARCHAR(50);
    v_ventas NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_ganancias_tiendaIntegrada('Honkai:Star Rail'); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias por Artículo (Honkai:Star Rail) ---');
    
    LOOP
        FETCH v_cursor INTO v_articulo, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_articulo || ' - Ventas Netas: ' || v_ventas);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/    
  


-- PC_Artista  
select* from banners;
-- AD_banners(x_nombreBanner IN VARCHAR,x_fechaFin IN DATE, x_nombreJuego IN VARCHAR); 
BEGIN
    PC_Artista.AD_banners('La flamiente llama',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_Artista.AD_banners('La odisea milagrosa',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
    PC_Artista.AD_banners('La odisea del caos',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
END;
/
-- EL_banners(x_nombreBanner IN VARCHAR);
BEGIN
    PC_Artista.EL_banners('La flamiente llama');
END;
/    
--AD_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
BEGIN
    PC_Artista.AD_complementos('Una invitación de Colonipenal', 'Arma');
    PC_Artista.AD_complementos('Un deseo que arde', 'Arma');
    PC_Artista.AD_complementos('La batalla final', 'Arma');
    
END;
/

-- MO_complementos(x_nombreComplemento IN VARCHAR, x_tipo IN VARCHAR);
BEGIN
    PC_Artista.MO_complementos('Una invitación de Colonipenal', 'Ropa');
END;
/    
    
-- AD_personajes(x_nombrePersonaje IN VARCHAR, x_caracteristicas IN XMLTYPE, x_rol IN VARCHAR); 

BEGIN
    PC_Artista.AD_personajes('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />'),'Soporte');
    PC_Artista.AD_personajes('Ruan Mei',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Negro" vestimenta="Elegante" personalidad="Estudiosa" />'),'Soporte');
    PC_Artista.AD_personajes('Sampo Koski',XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Azul" vestimenta="Divertida" personalidad="Alegre" />'),'Soporte');
END;
/

-- MO_personajes_rol(x_nombrePersonaje IN VARCHAR, x_rol IN VARCHAR);

BEGIN
    PC_Artista.MO_personajes_rol('Robin','DPS');
END;
/
      
-- AD_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);
DECLARE vIdbanner VARCHAR(20); 
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa';
    PC_Artista.AD_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    PC_Artista.AD_complementosBanners(vIdbanner,'Un deseo que arde');
    PC_Artista.AD_complementosBanners(vIdbanner,'La batalla final');
    
END;
/

-- EL_complementosBanners(x_idBanner IN VARCHAR, x_nombreComplemento IN VARCHAR);      

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa';
    PC_Artista.EL_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    
END;
/    

-- AD_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);
select* from personajesBanners;
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos';
    PC_Artista.AD_personajesBanners(vIdbanner,'Robin');
    PC_Artista.AD_personajesBanners(vIdbanner,'Ruan Mei');
    PC_Artista.AD_personajesBanners(vIdbanner,'Sampo Koski');
    
END;
/
-- EL_personajesBanners(x_idBanner IN VARCHAR, x_nombrePersonaje IN VARCHAR);          
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos';
    PC_Artista.EL_personajesBanners(vIdbanner,'Robin');
    
END;
/

--AD_artistas(x_idArtista IN VARCHAR, x_nombreArtista IN VARCHAR);  
BEGIN
    PC_Artista.AD_artistas('146', 'Yuko Iwasa');
    PC_Artista.AD_artistas('147', 'Takashi Okamoto');
    PC_Artista.AD_artistas('148', 'Zhenxi Zhang');
    PC_Artista.AD_artistas('149', 'Kazuya Nakai');
    PC_Artista.AD_artistas('142', 'Zhou Ling');
    PC_Artista.AD_artistas('179', 'Chen Kun');
END;
/

--select* from artistas;


select*from banners;
--AD_creaBanner(x_idArtista  IN VARCHAR, x_idBanner IN VARCHAR); 

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner FROM banners WHERE nombreBanner='standard' AND nombreJuego='Honkai:Star Rail';
    PC_Artista.AD_creaBanner('AT_142', vIdBanner);
    PC_Artista.AD_creaBanner('AT_146', vIdBanner);
    PC_Artista.AD_creaBanner('AT_147', vIdBanner);

END;
/


--EL_creaBanner(x_idArtista IN VARCHAR, x_idBanner IN VARCHAR); 
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner FROM banners WHERE nombreBanner='standard' AND nombreJuego='Honkai:Star Rail';
    PC_Artista.EL_creaBanner('AT_147', vIdBanner);

END;
/




-- CO_personajes_mas_tiradas RETURN SYS_REFCURSOR; 
select * from personajes;

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_xml XMLTYPE;
    v_tipo VARCHAR(30);
    
BEGIN
    v_cursor := PC_Artista.CO_personajes_mas_tiradas(); 
    DBMS_OUTPUT.PUT_LINE('--- Personajes que por mas tiran ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_xml,v_tipo;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('personaje: ' || v_nombre ||v_tipo);
        DBMS_OUTPUT.PUT_LINE(COALESCE(v_xml.getStringVal(), 'Sin XML'));
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/


-- CO_PersonajesCaracteristicasVentasMayoresPromedio RETURN SYS_REFCURSOR;
    
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_genero VARCHAR(30);
    v_personalidad VARCHAR(30);
    v_estatura VARCHAR(30);
    v_color VARCHAR(30);
    v_rol VARCHAR(30);
    v_ganancias NUMBER;
    
BEGIN
    v_cursor := PC_Artista.CO_PersonajesCaracteristicasVentasMayoresPromedio();   
    DBMS_OUTPUT.PUT_LINE('--- Juegos con mas tiradas ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_genero,v_personalidad,v_estatura,v_color ,v_rol, v_ganancias;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Personaje:  ' || v_nombre || ' '|| v_genero ||' '||v_personalidad ||' '||v_estatura||' '||v_color||' '||v_rol || ' ' || v_ganancias);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

--CO_bannerCree(x_nombreArtista IN VARCHAR) RETURN SYS_REFCURSOR

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_nombrejuego VARCHAR(30);
  
BEGIN
    v_cursor := PC_Artista.CO_bannerCree('Zhou Ling');   
    DBMS_OUTPUT.PUT_LINE('--- Banner que creo un artista en concreto ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_nombrejuego;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banner:  ' || v_nombre || ' | '|| v_nombrejuego );
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/
    
--PC_desarrollador
-- AD_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR);   

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea del caos';
    PC_Desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa';
    PC_Desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    PC_Desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/

-- EL_tiroEn(x_idCuenta IN VARCHAR, x_idBanner IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    PC_Desarrollador.EL_tiroEn(vIdCuenta, vIdbanner);
END;
/


-- AD_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR);
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_Desarrollador.AD_complementosCuentas(vIdCuenta, 'Un deseo que arde');
    PC_Desarrollador.AD_complementosCuentas(vIdCuenta, 'La batalla final');
END;
/



-- EL_complementosCuentas(x_idCuenta IN VARCHAR, x_nombreComplemento IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_Desarrollador.EL_complementosCuentas(vIdCuenta, 'Un deseo que arde');
END;
/

-- AD_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_Desarrollador.AD_personajesCuentas(vIdCuenta, 'Ruan Mei');
    PC_Desarrollador.AD_personajesCuentas(vIdCuenta, 'Sampo Koski');
END;
/

-- EL_personajesCuentas(x_idCuenta IN VARCHAR, x_nombrePersonaje IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta1@gmail2.com';     
    PC_Desarrollador.EL_personajesCuentas(vIdCuenta, 'Ruan Mei');
END;
/




--PC_Distribuidor

     --AD_distribuidores(x_idDistribuidor IN VARCHAR,x_nombreDistribuidor IN VARCHAR, x_region IN VARCHAR); 
     
BEGIN
    PC_Distribuidor.AD_distribuidores('HYV', 'HoYoverse', 'Global');
    PC_Distribuidor.AD_distribuidores('LI', 'Level Infinite', 'Global');
    PC_Distribuidor.AD_distribuidores('KG', 'Kuro Game', 'Global');
END;
/       
     
     
     --EL_distribuidores(x_idDistribuidor IN VARCHAR);
BEGIN
    PC_Distribuidor.EL_distribuidores('DB_KG');
END;
/       


INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Genshin Impact', 'Aventura', 'Multiplayer','DR_HYV');
--PROCEDURE AD_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
BEGIN
    PC_Distribuidor.AD_distribuye('DB_HYV', 'Honkai:Star Rail');
    PC_Distribuidor.AD_distribuye('DB_HYV', 'Genshin Impact');
END;
/


-- EL_distribuye(x_idDistribuidor IN VARCHAR, x_nombreJuego IN VARCHAR); 
BEGIN 
    PC_Distribuidor.EL_distribuye('DB_HYV', 'Genshin Impact');
END;
/



-- AD_publicidades(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER, x_idBanner IN VARCHAR, x_idDistribuidor IN VARCHAR);

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    PC_Distribuidor.AD_publicidades('Publicidad 1', 10334002,vIdBanner, 'DB_HYV');
    PC_Distribuidor.AD_publicidades('Publicidad 2', 34590283,vIdBanner, 'DB_HYV');
    PC_Distribuidor.AD_publicidades('Publicidad 3', 237328834,vIdBanner, 'DB_HYV');
END;
/

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa'  AND nombreJuego = 'Honkai:Star Rail';
    PC_Distribuidor.AD_publicidades('Banner Promocional 3', 103002,vIdBanner, 'DB_HYV');
END;
/

--PROCEDURE MO_publicidades_inversion(x_nombrePublicidad IN VARCHAR, x_inversion IN NUMBER);

BEGIN
    PC_Distribuidor.MO_publicidades_inversion('Publicidad 1', 500000000001);

END;
/    
    
--PROCEDURE EL_publicidades(x_nombrePublicidad IN VARCHAR);    
BEGIN
    PC_Distribuidor.EL_publicidades('Publicidad 1');

END;
/    
      
    
    
--PROCEDURE AD_llegan(x_tipoId IN VARCHAR,x_numId IN VARCHAR, x_nombrePublicidad IN VARCHAR); 
select * from llegan; 

BEGIN 
    PC_Distribuidor.AD_llegan('cedula', '10001000','Publicidad 2');
    PC_Distribuidor.AD_llegan('cedula', '10001000','Publicidad 3');
    PC_Distribuidor.AD_llegan('cedula', '10001000','Banner Promocional 3');
    PC_Distribuidor.AD_llegan('cedula', '1020','Publicidad 2');
    PC_Distribuidor.AD_llegan('cedula', '1020','Publicidad 3');
    PC_Distribuidor.AD_llegan('cedula', '10204040','Publicidad 2');
    PC_Distribuidor.AD_llegan('cedula', '10204040','Banner Promocional 3');
END;
/ 
    -- CO_JuegosMasDexJugadores (x_cantidadJugadores IN NUMBER) RETURN SYS_REFCURSOR;
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_modalidad VARCHAR(30);
    v_genero VARCHAR(30);
    v_desarrollador VARCHAR(30);
    v_inversion NUMBER;
    v_Jugadores NUMBER;    
BEGIN
    v_cursor := PC_Distribuidor.CO_JuegosMasDexJugadores(10); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de juegos con mas de x jugadores ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_modalidad,v_genero,v_desarrollador,v_inversion, v_Jugadores;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Juegos:  ' || v_nombre|| ' |  '  || v_modalidad|| ' |  ' ||v_genero|| ' |  ' || v_desarrollador|| ' |  ' || v_inversion|| '  | ' || v_Jugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/     
     --CO_PublicidadesJugadoresMayorPromedio RETURN SYS_REFCURSOR;
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombrePublicidad VARCHAR(100);
    v_inversion NUMBER;
    v_nombreBanner VARCHAR(100);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_nombreDistribuidor VARCHAR(100);
    v_nombreJuego VARCHAR(100);
    v_totalJugadores NUMBER;
BEGIN
    v_cursor := PC_Distribuidor.CO_PublicidadesJugadoresMayorPromedio();

    DBMS_OUTPUT.PUT_LINE('--- Informe de Publicidades con Jugadores Superiores al Promedio ---');
    
    LOOP
        FETCH v_cursor INTO v_nombrePublicidad, v_inversion, v_nombreBanner, v_fechaInicio, v_fechaFin, v_nombreDistribuidor, v_nombreJuego, v_totalJugadores;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombrePublicidad || ' | ' || v_inversion || ' | ' || v_nombreBanner || ' | ' || TO_CHAR(v_fechaInicio, 'DD-MM-YYYY') || ' | ' || TO_CHAR(v_fechaFin, 'DD-MM-YYYY') || ' | ' || v_nombreDistribuidor || ' | ' || v_nombreJuego || ' | ' || v_totalJugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/
  
--CO_MejoresJuegos(x_idDistribuidor IN VARCHAR)

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_genero VARCHAR(30);
    v_ventas NUMBER;

BEGIN
    v_cursor := PC_Distribuidor.CO_MejoresJuegos('DB_HYV');

    DBMS_OUTPUT.PUT_LINE('--- Informe de los tres mejores juegos de un distribuidor en concreto ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre, v_genero, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombre || ' | ' || v_genero || ' | ' || v_ventas );
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/

--PC_Jugador_actor
-- AD_jugadores(x_tipoId IN VARCHAR, x_numId IN VARCHAR,  x_pais IN VARCHAR, x_fechaNacimiento IN DATE); 

BEGIN
    PC_Jugador_Actor.AD_jugadores('tarjeta de identidad', '10001000', 'Colombia', TO_DATE('2019-02-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('tarjeta de identidad', '1020', 'Brazil', TO_DATE('2018-12-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('tarjeta de identidad', '10204040', 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/

-- AD_cuentas(x_correo IN VARCHAR, x_telefono IN VARCHAR, x_fechaConexion IN DATE, x_nombreJuego IN VARCHAR, x_tipoId IN VARCHAR, x_numId IN VARCHAR);
--select* from jugadores;
--select*from cuentas;
BEGIN
    PC_Jugador_actor.AD_cuentas('cuenta14@gmail.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '10001000');
    PC_Jugador_actor.AD_cuentas('cuenta15@gmail.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '1020');
    PC_Jugador_actor.AD_cuentas('cuenta16@gmail.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '10204040');
END;
/

-- MO_cuentas_fechaConexion(x_idCuenta IN VARCHAR);

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE tipoID = 'tarjeta de identidad' AND numId ='10001000';
    PC_Jugador_actor.MO_cuentas_fechaConexion(vIdCuenta);

END;
/


-- MO_cuentas_telefono(x_idCuenta IN VARCHAR, x_telefono IN VARCHAR);  

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE tipoID = 'tarjeta de identidad' AND numId ='10001000';
    PC_Jugador_actor.MO_cuentas_telefono(vIdCuenta,'12849');

END;
/

-- EL_cuentas(x_idCuenta IN VARCHAR);
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE tipoID = 'tarjeta de identidad' AND numId ='10001000';
    PC_Jugador_actor.EL_cuentas(vIdCuenta);

END;
/
    

    --PROCEDURE AD_compras(x_metodoPago IN VARCHAR, x_idArticulo IN VARCHAR, x_idCuenta IN VARCHAR); 
DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'cuenta16@gmail.com';   
    PC_Jugador_actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_Jugador_actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/

    --FUNCTION CO_juegos_con_mas_tiradas RETURN SYS_REFCURSOR;
    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_Jugador_actor.CO_juegos_con_mas_tiradas(); 
    DBMS_OUTPUT.PUT_LINE('--- Juegos con mas tiradas ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Juego:  ' || v_nombre || ' - Numero:  ' ||v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/    
    
    
    
    --FUNCTION CO_BannersInversionMayor100Millones RETURN SYS_REFCURSOR;
    
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_modalidad VARCHAR(30);
    v_genero VARCHAR(30);
    v_desarrollador VARCHAR(30);
    v_inversion NUMBER;
    v_Artista VARCHAR(30);    
BEGIN
    v_cursor := PC_Jugador_actor.CO_BannersInversionMayor100Millones(); 
    DBMS_OUTPUT.PUT_LINE('--- Banners con mas de 1000000 en inversion  ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_modalidad,v_genero,v_desarrollador,v_Artista,v_inversion;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banners:  ' || v_nombre|| ' |  '  || v_modalidad|| '  | ' ||v_genero|| '  | ' || v_desarrollador|| ' |  ' || v_Artista|| '  | ' || v_inversion);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/          
    
    --FUNCTION CO_Publicidades_Jugadores(x_tipoId IN VARCHAR,x_numid IN VARCHAR) RETURN SYS_REFCURSOR;
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_nombreJuego VARCHAR(30);

BEGIN
    v_cursor := PC_Jugador_actor.CO_Publicidades_Jugadores('cedula','10001000'); 
    DBMS_OUTPUT.PUT_LINE('--- Cuales publicidades le han llegado a cierto jugador  ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_nombreJuego;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banners:  ' || v_nombre|| ' |  '  || v_nombreJuego);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/ 
-----------------------------------------------------------------------------------------------------------------------------------------------------------

 
 
-----------------------------------------Historias------------------------------------------------------------


--Generica

--Diego es un desarrollador que esta empenzando en la industria de videojuegos y quiere probar como es en el ambito de juegos gacha, por ello hoy el va a crear un juego con ayuda de su amigo daniel que es artista

--primero Diego va a crear el juego que con tanta ilusion quiere que se conozca en el mundo, por ello va a crear la informacion de su empresa con el rol de desarrollador

BEGIN
    PC_Desarrollador.AD_desarrolladores('HYV', 'HoYoverse', 'Colombia');
    PC_Desarrollador.AD_desarrolladores('SM', 'Studio Montagne', 'España');
    PC_Desarrollador.AD_desarrolladores('SU', 'Shift Up', 'Corea del Sur');
    PC_Desarrollador.AD_desarrolladores('NG', 'Cy ', 'chile');
END;
/
--Luego quiere borrar un desarrollador porque metio muchos desarrolladores
BEGIN
    PC_Desarrollador.EL_desarrolladores('DR_NG');
END;
/    
    


--Ahora si puede crear su juego!
BEGIN
    PC_Desarrollador.AD_juegos('Los inolvidables','Aventura', 'Single player','DR_HYV');
END;
/
 
--Su amigo daniel le dice que por ahora solo usen el banner standard, asi que se dispone a meter personajes y complementos que ha creado con tanto esfuerzo

BEGIN
    PC_Artista.AD_complementos('Una invitación de Colonipenal', 'Arma');
    PC_Artista.AD_complementos('Un deseo que arde', 'Arma');
    PC_Artista.AD_complementos('La batalla final', 'Arma');    
END;
/


BEGIN
    PC_Artista.AD_personajes('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />'),'Soporte');
    PC_Artista.AD_personajes('Ruan Mei',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Negro" vestimenta="Elegante" personalidad="Estudiosa" />'),'Soporte');
    PC_Artista.AD_personajes('Sampo Koski',XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Azul" vestimenta="Divertida" personalidad="Alegre" />'),'Soporte');
END;
/
 
-- ahora daniel quiere que esten en el banner standard



DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    PC_Artista.AD_personajesBanners(vIdbanner,'Robin');
    PC_Artista.AD_personajesBanners(vIdbanner,'Ruan Mei');
    PC_Artista.AD_personajesBanners(vIdbanner,'Sampo Koski');
    
END;
/
 
DECLARE vIdbanner VARCHAR(20); 
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard';
    PC_Artista.AD_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    PC_Artista.AD_complementosBanners(vIdbanner,'Un deseo que arde');
    PC_Artista.AD_complementosBanners(vIdbanner,'La batalla final'); 
END;
/ 
 
--Ahora que ya existe un banner, Diego quiere practicar como funciona la tienda integrada, asi que decide ingresar bastantes articulos
select* from tiendasintegradas;
BEGIN
    PC_Desarrollador.AD_tiendasIntegradas( 'Moneda integrada','Los inolvidables',40000);
    PC_Desarrollador.AD_tiendasIntegradas( 'Moneda integrada','Los inolvidables',80000);
    PC_Desarrollador.AD_tiendasIntegradas( 'Moneda integrada','Los inolvidables',90000);
    PC_Desarrollador.AD_tiendasIntegradas( 'Moneda integrada','Los inolvidables',10000);
END;
/
 
--Ahora que Diego esta super enganchado en este tema, quiere añadir varios eventos a su juego

BEGIN
    PC_Desarrollador.AD_eventos('Evento1',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.AD_eventos('Evento2',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.AD_eventos('Evento3',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.AD_eventos('Evento4',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.AD_eventos('Evento5',TO_DATE('2028-06-17', 'YYYY-MM-DD'), 'Los inolvidables');
END;
/

--y asi mismo quiere editar las fechas porque ha puesto todas iguales!

 
BEGIN
    PC_Desarrollador.MO_eventos_fechaFin('Evento2',TO_DATE('2028-12-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.MO_eventos_fechaFin('Evento3',TO_DATE('2026-05-02', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.MO_eventos_fechaFin('Evento4',TO_DATE('2028-09-17', 'YYYY-MM-DD'), 'Los inolvidables');
    PC_Desarrollador.MO_eventos_fechaFin('Evento5',TO_DATE('2027-05-23', 'YYYY-MM-DD'), 'Los inolvidables');
END;
/

--El quiere mondificar de nuevo los eventos pero FALLA! no puedes Diego! la fecha debe ser mayor a la fecha de inicio del banner
 BEGIN
    PC_Desarrollador.MO_eventos_fechaFin('Evento2',TO_DATE('2010-12-17', 'YYYY-MM-DD'), 'Los inolvidables');

END;
/

 
 
--mientras tanto daniel quiere meter otro banner para poder tener mas ingresos
BEGIN
    PC_Artista.AD_banners('Primer banner personajes',TO_DATE('2025-12-17', 'YYYY-MM-DD'),'Los inolvidables');
    PC_Artista.AD_banners('Primer banner complementos',TO_DATE('2025-12-17', 'YYYY-MM-DD'),'Los inolvidables');
    
END;
/
 
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'Primer banner personajes';
    PC_Artista.AD_personajesBanners(vIdbanner,'Robin');
    PC_Artista.AD_personajesBanners(vIdbanner,'Ruan Mei');
    PC_Artista.AD_personajesBanners(vIdbanner,'Sampo Koski');
    
END;
/
 
DECLARE vIdbanner VARCHAR(20); 
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'Primer banner complementos';
    PC_Artista.AD_complementosBanners(vIdbanner,'Una invitación de Colonipenal');
    PC_Artista.AD_complementosBanners(vIdbanner,'Un deseo que arde');
    PC_Artista.AD_complementosBanners(vIdbanner,'La batalla final'); 
END;
/  
 
 --Asi hasta que se dan cuenta que llevan toda la tarde explorando pero no tienen ninguna cuenta ni persona en su juego, por lo que otro dia van a invitar a otro amigo a unirse

--Otro dia, con ayuda de su amigo daniel que es artista Y ahora con Camila que es una analista interesada en la base de datos quieren mostrarle su proyecto

--primero Diego se le olvida que ayer creo su juego, asi que FALLA!
BEGIN
    PC_Desarrollador.AD_juegos('Los inolvidables','Aventura', 'Single player','DR_SU');
END;
/
 
--Para ello ahora quiere darle el rol de distribuidora a Camila, por lo que ella crea muchas distribuidoras 
     
BEGIN
    PC_Distribuidor.AD_distribuidores('HYV', 'HoYoverse', 'Global');
    PC_Distribuidor.AD_distribuidores('LP', 'Level Top', 'Global');
    PC_Distribuidor.AD_distribuidores('KG', 'Kuro Game', 'Global');
END;
/       
--  Luego crea la relacion para que distribuyan el juego de sus amigos, pero ups ha metido mal los datos y FALLA. No tuvo encuenta la nomenclatura de los distribuidores

BEGIN
    PC_Distribuidor.AD_distribuye('KG', 'Los inolvidables');
    PC_Distribuidor.AD_distribuye('HYV', 'Los inolvidables');
    PC_Distribuidor.AD_distribuye('LP', 'Los inolvidables');
END;
/
---Ahora lo hace vuelve a intentar, pero FALLA.  No puede haber 2 o mas distribuidores del mismo juego en una misma region
BEGIN
    PC_Distribuidor.AD_distribuye('DB_KG', 'Los inolvidables');
    PC_Distribuidor.AD_distribuye('DB_HYV', 'Los inolvidables');
    PC_Distribuidor.AD_distribuye('DB_LP', 'Los inolvidables');
END;
/ 
--Asi que lo intenta de nuevo cambiando los valores

BEGIN
    PC_Distribuidor.EL_distribuye('DB_KG', 'Los inolvidables');
END;
/  
BEGIN
    PC_Distribuidor.EL_distribuidores('DB_LP');
    PC_Distribuidor.EL_distribuidores('DB_KG');
END;
/   
--ahora los vuelve a meter para hacerlo bien esta vez

BEGIN
    PC_Distribuidor.AD_distribuidores('LP', 'Level Top', 'Asia');
    PC_Distribuidor.AD_distribuidores('KG', 'Kuro Game', 'America');
END;
/     
BEGIN
    PC_Distribuidor.AD_distribuye('DB_HYV', 'Los inolvidables');
    PC_Distribuidor.AD_distribuye('DB_LP', 'Los inolvidables');
END;
/ 

-- Ahora, camila quiere consultar la ganancias pero antes debe crear unos jugadores y unas cuentas con el rol de PC_Jugador_Actor :


BEGIN
    PC_Jugador_Actor.AD_jugadores('cedula', '10001000', 'Colombia', TO_DATE('2019-02-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('cedula', '1020', 'Brazil', TO_DATE('2018-12-17', 'YYYY-MM-DD'));
    PC_Jugador_Actor.AD_jugadores('cedula', '10204040', 'Colombia', TO_DATE('2010-02-17', 'YYYY-MM-DD'));
END;
/

BEGIN
    PC_Jugador_Actor.AD_cuentas('cuenta1@gmail1.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Los inolvidables', 'cedula', '10001000');
    PC_Jugador_Actor.AD_cuentas('cuenta1@gmail2.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Los inolvidables', 'cedula', '1020');
    PC_Jugador_Actor.AD_cuentas('cuenta1@gmail3.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Los inolvidables', 'cedula', '10204040');
END;
/

--Cuando ella ingreso una cuenta, queria actualizar la fecha de conexion 
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_Jugador_Actor.MO_cuentas_fechaConexion(vIdCuenta);

END;
/

--Ahora quiere intentar poner un numero de contacto
DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_Jugador_Actor.MO_cuentas_telefono(vIdCuenta,'12849');

END;
/
--Pero vio que una cuenta no le servia de nada, y la decidio eliminar

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='10001000';
    PC_Jugador_Actor.EL_cuentas(vIdCuenta);

END;
/

--Ahora quiere realizar unas compras  pero FALLA. no puede no especificar el metodo de pago de una compra

DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Los inolvidables' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Los inolvidables' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Los inolvidables' AND correo = 'cuenta1@gmail2.com';   
    PC_Jugador_Actor.AD_compras(  NULL  ,vIdArticulo,vIdCuenta);
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/
--lo vuelve a intentar 
DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Los inolvidables' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Los inolvidables' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Los inolvidables' AND correo = 'cuenta1@gmail2.com';   
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/ 
--y para hacer sus analisis quiere consultar ciertas cosas con sus roles
--primero  consulta las ganancias de los articulos
DECLARE
    v_cursor SYS_REFCURSOR;
    v_articulo VARCHAR2(50);
    v_ventas NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_ganancias_tiendaIntegrada('Los inolvidables'); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias por Artículo (Los inolvidables) ---');
    
    LOOP
        FETCH v_cursor INTO v_articulo, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_articulo || ' - Ventas Netas: ' || v_ventas);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/    
 



--Luego quiere consultar la cantidad de jugadores del juego y se da cuenta que tiene muy pocos!!

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(40);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugadores_juegos(); 
    DBMS_OUTPUT.PUT_LINE('--- Jugadores Totales por Juego ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Juego: ' || v_nombre || ' - Jugadores Totales: ' || v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

--Por lo que quiere consultar la cantidad de jugadores por eventos, pero como no tiene tantas cuentas no le sale nada!

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugador_eventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre ||' | ' ||'  Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/

 --Ahora quiere probar lo de comprar recurrentes, pero lo mismo, no tiene tantos jugadores     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idCuenta VARCHAR(30);
    v_correo VARCHAR(30);
    v_idCompra VARCHAR(30);
    v_fechacompra DATE;
    v_metodo VARCHAR(30); 
    v_costo NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_JugadoresComprasRecurrentes(); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de Jugadores recurrentes ---');

    LOOP
        FETCH v_cursor INTO v_idCuenta,v_correo,v_idCompra,v_fechacompra,v_metodo,v_costo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Cuenta:  ' || v_idCuenta|| ' |  '  || v_correo|| '  | ' ||v_idCompra|| '  | ' || v_fechacompra|| ' |  ' || v_metodo|| ' |  ' || v_costo);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/  

--entonces mira sobre las gannacias de los banners
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idBanner VARCHAR(40);
    v_nombre VARCHAR(30);
    v_costo NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_BannersGananciasAproximadas(); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias Banners ---');

    LOOP
        FETCH v_cursor INTO v_idBanner,v_nombre,v_costo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banner:  ' || v_idBanner|| ' |  '  || v_nombre|| '  | ' ||v_costo);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/        
--y los jugadores en los eventos     
 DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_JugadoresConectadosEventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre || ' - Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/    
     
 --Al final ella se queda muy triste porque no puede hacer bien su trabajo con las consultas, pero se emociona porque le gusta mucho el proyecto y decide unirse definitivamente!
 
 
 
 
 
 
 
 
 ------------------------------POR ACTORES--------------------------------------
 
 
---------------------------------- --Jugador (incersiones incluidas)
 
 --Somos una persona nueva en el mundo de los videojuegos, y nos han dicho que el primer paso es declararse como jugador, para ello:
 
BEGIN
    PC_Jugador_Actor.AD_jugadores('cedula', '123456789', 'Colmbia', TO_DATE('2019-02-20', 'YYYY-MM-DD'));
END;
/

--Pero aun no sabemos que significa este nuevo mundo, asi que metemos nuestros gustos
BEGIN
    PC_Jugador_Actor.AD_generosPreferidos('cedula', '123456789', 'RPG');
    PC_Jugador_Actor.AD_generosPreferidos('cedula', '123456789', 'Deporte');
    PC_Jugador_Actor.AD_generosPreferidos('cedula', '123456789', 'Aventura');
    
END;
/ 
--Mientras tanto el distribuidor se da cuenta del nuevo jugador y le manda publicidad en montones:


BEGIN
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Publicidad 1');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Publicidad 2');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Publicidad 3');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Banner Promocional');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Banner Promocional 2');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Banner Promocional 3');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Banner Promocional 4');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'Banner Promocional 5');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'PromoArknights');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'PromoArknightsElite');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'PromoBlueAcademia');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'NikkeHeroicCampaign');
    PC_distribuidor.AD_llegan('cedula', '123456789', 'PrinConEternalLight');
END;
/


--Nosotros entonces queremos ver las posibilidades de los juegos, asi que vamos a hacer una consulta
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_nombreJuego VARCHAR(30);

BEGIN
    v_cursor := PC_Jugador_actor.CO_Publicidades_Jugadores('cedula','123456789'); 
    DBMS_OUTPUT.PUT_LINE('--- Cuales publicidades le han llegado a cierto jugador  ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_nombreJuego;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banners:  ' || v_nombre|| ' |  '  || v_nombreJuego);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/ 

--Al ver esta informacion nos interezamos por dos juegos: Honkai y Nikke, por lo que ahora queremos crear unas cuentas en estos juegos!

--Pero antes, queremos cambiar nuestro Pais porque lo teniamos mal 

BEGIN
    PC_Jugador_Actor.MO_jugadores('cedula', '123456789', 'Colombia');
END;
/ 

--Ahora si, Creemos las cuentas!
--Empecemos por la de Honkai:

BEGIN
    PC_Jugador_Actor.AD_cuentas('micuenta@gmail.com', NULL, TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '123456789');
END;
/
--Nos damos cuenta que olvidamos poner nuestro telefono, asi que lo intentamos ingresar

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE numId ='123456789';
    PC_juego.MO_cuentas_telefono(vIdCuenta,'313111189');

END;
/
--Ahora intentamos crear la cuenta en Nikke

BEGIN
    PC_Jugador_Actor.AD_cuentas('micuenta', '313111189', TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Nikke', 'cedula', '123456789');
END;
/

--Pero FALLA porque olvidamos poner la direccion del correo, asi que lo intentamos de nuevo

BEGIN
    PC_Jugador_Actor.AD_cuentas('micuenta@gmail.com', '313111189', TO_DATE('2021-07-11', 'YYYY-MM-DD'), 'Nikke', 'cedula', '123456789');
END;
/

--Por lo que ahora con nuestras cuentas podemos explorar aun mas este mundo de juegos!

--ahora queremos consultar los banner con mas inversion en publicidad para conocer el mejor banner y tener suerte al momento de tirar en el!

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_modalidad VARCHAR(30);
    v_genero VARCHAR(30);
    v_desarrollador VARCHAR(30);
    v_inversion NUMBER;
    v_Artista VARCHAR(30);    
BEGIN
    v_cursor := PC_Jugador_actor.CO_BannersInversionMayor100Millones(); 
    DBMS_OUTPUT.PUT_LINE('--- Banners con mas de 10000 en inversion  ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_modalidad,v_genero,v_desarrollador,v_Artista,v_inversion;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banners:  ' || v_nombre|| ' |  ' || v_inversion);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/ 

--Asi nos interesa dos banners, para honkai el standard y para nikke el Nikke Vanguard

--Por lo que primero intentamos tirar en el standard y luego a Nikke Vanguard, asi el desarrollador guarda la informacion

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard' AND nombreJuego = 'Honkai:Star Rail';
    PC_desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/

--Pero el desarrollador se equivoca y FALLA, ya que intento agregar la relacion de tiroEn para otra cuenta que no es del juego del banner
DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'Nikke Vanguard' AND nombreJuego = 'Nikke';
    PC_desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/
--Entonces lo vuelve a intentar

DECLARE vIdCuenta VARCHAR(20);
vIdbanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Nikke' AND correo = 'micuenta@gmail.com'; 
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'Nikke Vanguard' AND nombreJuego = 'Nikke';
    PC_desarrollador.AD_tiroEn(vIdCuenta, vIdbanner);
END;
/

--Asi por suerte gana personajes y complementos para su cuenta de honkai, pero no para la de nikke

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com';     
    PC_Desarrollador.AD_complementosCuentas(vIdCuenta, 'Una invitación de Colonipenal');
    PC_Desarrollador.AD_complementosCuentas(vIdCuenta, 'Puño de Fuego Eterno');
END;
/


DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com';     
    PC_Desarrollador.AD_personajesCuentas(vIdCuenta, 'Clara');
    PC_Desarrollador.AD_personajesCuentas(vIdCuenta, 'Bronya');
END;
/

--Entonces decidimos hacer una compra del juego para poder conseguir mas personajes, Pero FALLA ya que intentamos comprarlo desde su cuenta de nikke,  No puedes hacer una compra de un articulo que no pertenece al juego de la cuenta


DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Nikke' AND correo = 'micuenta@gmail.com';  
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/ 

--Entonces lo volvemos a intentar

DECLARE vIdArticulo VARCHAR(20);
vIdArticulo2 VARCHAR(20);
vIdCuenta VARCHAR(20);
BEGIN
    SELECT idArticulo INTO vIdArticulo FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Membresia'; 
    SELECT idArticulo INTO vIdArticulo2 FROM tiendasIntegradas WHERE nombreJuego = 'Honkai:Star Rail' AND articulo = 'Moneda integrada' AND precio = 50000; 
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com';  
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo,vIdCuenta);
    PC_Jugador_Actor.AD_compras(  'Tarjeta de Credito'  ,vIdArticulo2,vIdCuenta);    
END;
/ 

--Ya que gastamos gastamos dinero, vemos que nuestra suerte no mejoro y no ganamos nada mas, pero nos gusto el juego de honkai
--asi que solo vamos a borrar nuestra cuenta de nikke

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta FROM cuentas WHERE nombreJuego = 'Honkai:Star Rail' AND correo = 'micuenta@gmail.com';
    PC_Jugador_Actor.EL_cuentas(vIdCuenta);

END;
/



---------------------------------------------Desarrollador y Distribuidor (inserciones listas)


--somos un desarrollador y al mismo tiempo un distribuidor acargo de un juegos super famosos y tenemos un largo dia de trabajo
--Primero necesitamos hace run informe de nuestro juego, asi que vamos a consultar
--Empezamos por consultar nuestro juego 
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_genero VARCHAR(30);
    v_ventas NUMBER;

BEGIN
    v_cursor := PC_Distribuidor.CO_MejoresJuegos('DB_HYV');

    DBMS_OUTPUT.PUT_LINE('--- Informe de nuestros juegos  ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre, v_genero, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombre || ' | ' || v_genero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/

--Ahora, vamos a consultar todas las publicidades con jugadores superiores al promedio, y podemos ver que nuestro juego esta en el podio!

    
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombrePublicidad VARCHAR(100);
    v_inversion NUMBER;
    v_nombreBanner VARCHAR(100);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_nombreDistribuidor VARCHAR(100);
    v_nombreJuego VARCHAR(100);
    v_totalJugadores NUMBER;
BEGIN
    v_cursor := PC_Distribuidor.CO_PublicidadesJugadoresMayorPromedio();

    DBMS_OUTPUT.PUT_LINE('--- Informe de Publicidades con Jugadores Superiores al Promedio ---');
    
    LOOP
        FETCH v_cursor INTO v_nombrePublicidad, v_inversion, v_nombreBanner, v_fechaInicio, v_fechaFin, v_nombreDistribuidor, v_nombreJuego, v_totalJugadores;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_nombrePublicidad || ' | ' || v_inversion || ' | ' || v_nombreBanner || ' | ' || TO_CHAR(v_fechaInicio, 'DD-MM-YYYY') || ' | ' || TO_CHAR(v_fechaFin, 'DD-MM-YYYY') || ' | ' || v_nombreDistribuidor || ' | ' || v_nombreJuego || ' | ' || v_totalJugadores);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/


--Ahora consultamos cuantos jugadores tienen los juegos para compararlo con el nuestro

DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(30);
    v_numero NUMBER;
    
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugadores_juegos(); 
    DBMS_OUTPUT.PUT_LINE('--- Jugadores Totales por Juego ---');

    LOOP
        FETCH v_cursor INTO v_nombre,v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Juego: ' || v_nombre || ' - Jugadores Totales: ' || v_numero);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/

-- Luego, vamos a consultar cuantos jugadores participan en los eventos, para ver si el juego sigue siendo activo 
 DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR(80);
    v_fechaInicio DATE;
    v_fechaFin DATE;
    v_numero NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_cantidad_jugador_eventos(); 

    DBMS_OUTPUT.PUT_LINE('--- Jugadores Activos por Evento ---');
    
    LOOP
        FETCH v_cursor INTO v_nombre,v_fechaInicio,v_fechaFin, v_numero;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nombre || ' - Jugadores Activos: ' || v_numero|| ' Duracion:  ' || v_fechaInicio || ' - ' ||v_fechaFin);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/ 

-- asi, pasamos a las ganancias del juego

DECLARE
    v_cursor SYS_REFCURSOR;
    v_articulo VARCHAR(50);
    v_ventas NUMBER;
BEGIN
    v_cursor := PC_Desarrollador.CO_ganancias_tiendaIntegrada('Honkai:Star Rail'); 
    DBMS_OUTPUT.PUT_LINE('--- Ganancias por Artículo (Honkai:Star Rail) ---');
    
    LOOP
        FETCH v_cursor INTO v_articulo, v_ventas;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_articulo || ' - Ventas Netas: ' || v_ventas);
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');
END;
/    


--ahora queremos mas especifico cuando vendio cada banner

DECLARE
    v_cursor SYS_REFCURSOR;
    v_idBanner VARCHAR(30);
    v_nombre VARCHAR(30);
    v_inversion NUMBER;
    v_ventas NUMBER;
    v_ganancias NUMBER;    
BEGIN
    v_cursor := PC_Desarrollador.CO_InformeVentasBanner(); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de Banners ---');

    LOOP
        FETCH v_cursor INTO v_idBanner, v_nombre,v_inversion, v_ventas, v_ganancias;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Banner:  ' || v_nombre|| ' |  '  || v_inversion|| ' |  ' ||v_ventas|| '  | ' || v_ganancias);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/
     

--Pasamos para mirar la informacion de las cuentas que son mas activas en la tienda integrada     
     
DECLARE
    v_cursor SYS_REFCURSOR;
    v_idCuenta VARCHAR(30);
    v_correo VARCHAR(30);
    v_idCompra VARCHAR(30);
    v_fechacompra DATE;
    v_metodo VARCHAR(30); 
    v_costo NUMBER;
BEGIN
    v_cursor := PC_empresa.CO_JugadoresComprasRecurrentes(); 
    DBMS_OUTPUT.PUT_LINE('--- Informe de Jugadores recurrentes ---');

    LOOP
        FETCH v_cursor INTO v_idCuenta,v_correo,v_idCompra,v_fechacompra,v_metodo,v_costo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Cuenta:  ' || v_idCuenta|| ' |  '  || v_correo|| '  | ' ||v_idCompra|| '  | ' || v_fechacompra|| ' |  ' || v_metodo|| ' |  ' || v_costo);
    END LOOP;

    CLOSE v_cursor;
    DBMS_OUTPUT.PUT_LINE('--- Fin de la Consulta ---');

END;
/          


--Asi terminamos nuestro informe y llegamos a la conclusion de que deberiamos expandir nuestro juego porque es bastante beneficioso 










-----------------------------------------------------------------------------------------------------------------------------------------------------------   
--XCRUD  
DROP PACKAGE PC_banner;
DROP PACKAGE PC_jugador;
DROP PACKAGE PC_juego;
DROP PACKAGE PC_empresa;


--XIndicesVistas

DROP VIEW VW_JugadoresComprasRecurrentes;

DROP VIEW VW_BannersGananciasAproximadas;

DROP VIEW VW_cantidad_jugador_eventos;

DROP VIEW VW_PersonajesCaracteristicasVentasMayoresPromedio;

DROP VIEW VW_personajes_mas_tiradas;

DROP VIEW VW_juegos_con_mas_tiradas;

DROP VIEW VW_cantidad_jugadores_juegos;

DROP VIEW VW_JuegosMasDeDiezMillonesJugadores;

DROP VIEW VW_PublicidadesJugadoresMayorPromedio;

DROP VIEW VW_InformeVentasBanner;

DROP VIEW VW_BannersInversionMayor100Millones;

DROP INDEX IDXnombreBanner;

DROP INDEX IDXcorreo_cuentas;

DROP INDEX IDXcorreo_compras;

DROP INDEX IDXnombreDistribuidor;



 
--XSeguridad

REVOKE EXECUTE ON PC_Artista FROM rol_Artista;
REVOKE DELETE, INSERT, SELECT ON banners FROM rol_Artista;
REVOKE UPDATE, INSERT, SELECT ON complementos FROM rol_Artista;
REVOKE UPDATE, INSERT, SELECT ON personajes FROM rol_Artista;
REVOKE DELETE, INSERT, SELECT ON complementosBanners FROM rol_Artista;
REVOKE DELETE, INSERT, SELECT ON personajesBanners FROM rol_Artista;

DROP ROLE rol_Artista;

REVOKE EXECUTE ON PC_Jugador FROM rol_Jugador;
REVOKE UPDATE, INSERT, SELECT ON jugadores FROM rol_Jugador;
REVOKE UPDATE, INSERT, SELECT ON generosPreferidos FROM rol_Jugador;

DROP ROLE rol_Jugador;

REVOKE EXECUTE ON PC_Desarrollador FROM rol_Desarrollador;
REVOKE DELETE, INSERT, SELECT ON juegos FROM rol_Desarrollador;
REVOKE UPDATE, DELETE, INSERT, SELECT ON eventos FROM rol_Desarrollador;
REVOKE DELETE, INSERT, SELECT ON plataformas FROM rol_Desarrollador;
REVOKE UPDATE, DELETE, INSERT, SELECT ON tiendasIntegradas FROM rol_Desarrollador;
REVOKE UPDATE, DELETE, INSERT, SELECT ON cuentas FROM rol_Desarrollador;
REVOKE DELETE, INSERT, SELECT ON complementosCuentas FROM rol_Desarrollador;
REVOKE DELETE, INSERT, SELECT ON personajesCuentas FROM rol_Desarrollador;
REVOKE DELETE, INSERT, SELECT ON tiroEn FROM rol_Desarrollador;
REVOKE UPDATE, INSERT, SELECT ON compras FROM rol_Desarrollador;

DROP ROLE rol_Desarrollador;

DROP PACKAGE PC_Artista;
DROP PACKAGE PC_Jugador_Actor;
DROP PACKAGE PC_Desarrollador;
DROP PACKAGE PC_distribuidor;
 
                     
-- Xdisparadores 

DROP TRIGGER TR_banners_insert;

DROP TRIGGER TR_personajesBanners_insert;
DROP TRIGGER TR_complementosBanners_insert;

DROP TRIGGER TR_banners_update;

DROP TRIGGER TR_personajes_update;
DROP TRIGGER TR_complementos_update;

DROP TRIGGER TR_complementosBanners_update;
DROP TRIGGER TR_personajesBanners_update;

DROP TRIGGER TR_guardar_tempCantidadPersonajeBanner_personajesBanners_personajes;

DROP TRIGGER TR_personajes_delete;

DROP TRIGGER TR_guardar_tempCantidadComplementoBanner_complementos;

DROP TRIGGER TR_complementos_delete;

DROP TRIGGER TR_guardar_tempCantidadPersonajeBanner_personajesBanners;
DROP TRIGGER TR_guardar_tempCantidadComplementoBanner_complementosBanners;

DROP TRIGGER TR_personajesBanners_delete_A;
DROP TRIGGER TR_complementosBanners_delete_A;

DROP TRIGGER TR_jugadores_insert_A;
DROP TRIGGER TR_jugadores_insert_B;
DROP TRIGGER TR_jugadores_update;

DROP TRIGGER TR_tiroEn_insert;

DROP TRIGGER TR_personajesCuentas_insert;
DROP TRIGGER TR_complementosCuentas_insert;

DROP TRIGGER TR_compras_insert;

DROP TRIGGER TR_cuentas_insert;

DROP TRIGGER TR_eventos_insert;

DROP TRIGGER TR_tiendasIntegradas_insert;

DROP TRIGGER TR_juegos_insert;

DROP TRIGGER TR_cuentas_update;

DROP TRIGGER TR_compras_update_B;

DROP TRIGGER TR_juegos_update;

DROP TRIGGER TR_plataformas_update;

DROP TRIGGER TR_tiroEn_update;

DROP TRIGGER TR_complementosCuentas_update;

DROP TRIGGER TR_personajesCuentas_update;

DROP TRIGGER TR_eventos_update;

DROP TRIGGER TR_tiendasIntegradas_update;

DROP TRIGGER TR_compras_delete;

DROP TRIGGER TR_cuentas_eliminar_compras;

DROP TRIGGER TR_articulos_eliminar_compras;

DROP TRIGGER TR_compras_update_A;

DROP TRIGGER TR_idDesarrollador_insert;

DROP TRIGGER TR_idDistribuidor_insert;

DROP TRIGGER TR_idArtista_insert;

DROP TRIGGER TR_distribuye_insert;

DROP TRIGGER TR_publicidades_insert;

DROP TRIGGER TR_distribuidores_update;

DROP TRIGGER TR_llegan_update;

DROP TRIGGER TR_artistas_update;

DROP TRIGGER TR_creaBanner_update;

DROP TRIGGER TR_desarrolladores_update;

DROP TRIGGER TR_distribuye_update;

DROP TRIGGER TR_publicidades_update;

DROP TRIGGER TR_llegan_delete;

-- XPoblar

TRUNCATE TABLE creaBanner;
TRUNCATE TABLE llegan;
TRUNCATE TABLE publicidades;
TRUNCATE TABLE distribuye;
TRUNCATE TABLE distribuidores;
TRUNCATE TABLE artistas;
TRUNCATE TABLE generosPreferidos;
TRUNCATE TABLE personajesBanners;
TRUNCATE TABLE complementosBanners;
TRUNCATE TABLE compras;
TRUNCATE TABLE tiroEn;
TRUNCATE TABLE personajesCuentas;
TRUNCATE TABLE complementosCuentas;
TRUNCATE TABLE personajes;
TRUNCATE TABLE complementos;
TRUNCATE TABLE banners;
TRUNCATE TABLE cuentas;
TRUNCATE TABLE jugadores;
TRUNCATE TABLE tiendasIntegradas;
TRUNCATE TABLE eventos;
TRUNCATE TABLE plataformas;
TRUNCATE TABLE juegos;  
TRUNCATE TABLE desarrolladores;

--Xconstraints

-- Unicas
ALTER TABLE tiendasIntegradas 
DROP CONSTRAINT UK_tiendasIntegradas;

ALTER TABLE cuentas
DROP CONSTRAINT UK_cuentas;

ALTER TABLE banners
DROP CONSTRAINT UK_banners;

ALTER TABLE distribuidores
DROP CONSTRAINT UK_distribuidores;

ALTER TABLE artistas
DROP CONSTRAINT UK_artistas;

ALTER TABLE desarrolladores
DROP CONSTRAINT UK_desarrolladores;

-- Foraneas

ALTER TABLE eventos 
DROP CONSTRAINT FK_eventos_juegos;

ALTER TABLE tiendasIntegradas
DROP CONSTRAINT FK_tiendasIntegradas_juegos;

ALTER TABLE cuentas
DROP CONSTRAINT FK_cuentas_juegos;

ALTER TABLE cuentas
DROP CONSTRAINT FK_cuentas_jugadores;

ALTER TABLE banners 
DROP CONSTRAINT FK_banners_juegos;

ALTER TABLE complementosCuentas
DROP CONSTRAINT FK_complementosCuentas_cuentas;

ALTER TABLE complementosCuentas
DROP CONSTRAINT FK_complementosCuentas_complementos;

ALTER TABLE personajesCuentas
DROP CONSTRAINT FK_personajesCuentas_cuentas;

ALTER TABLE personajesCuentas
DROP CONSTRAINT FK_personajesCuentas_personajes;

ALTER TABLE tiroEn 
DROP CONSTRAINT FK_tiroEn_cuentas;

ALTER TABLE tiroEn
DROP CONSTRAINT FK_tiroEn_banners;

ALTER TABLE compras
DROP CONSTRAINT FK_compras_cuentas;

ALTER TABLE compras
DROP CONSTRAINT FK_compras_tiendasIntegradas;

ALTER TABLE complementosBanners 
DROP CONSTRAINT FK_complementosBanners_complementos;

ALTER TABLE complementosBanners 
DROP CONSTRAINT FK_complementosBanners_banners;

ALTER TABLE personajesBanners
DROP CONSTRAINT FK_personajesBanners_personajes;

ALTER TABLE personajesBanners
DROP CONSTRAINT FK_personajesBanners_banners;

ALTER TABLE generosPreferidos
DROP CONSTRAINT FK_generosPreferidos_jugadores;

ALTER TABLE plataformas
DROP CONSTRAINT FK_plataformas_juegos;

ALTER TABLE juegos
DROP CONSTRAINT FK_juegos_desarrolladores;

ALTER TABLE creaBanner
DROP CONSTRAINT FK_creaBanner_banners;

ALTER TABLE distribuye
DROP CONSTRAINT FK_distribuye_juegos;

ALTER TABLE distribuye
DROP CONSTRAINT FK_distribuye_distribuidores;

ALTER TABLE creaBanner
DROP CONSTRAINT FK_creaBanner_artistas;

ALTER TABLE publicidades
DROP CONSTRAINT FK_publicidades_distribuidores;

ALTER TABLE publicidades
DROP CONSTRAINT FK_publicidades_banners;

ALTER TABLE llegan
DROP CONSTRAINT FK_llegan_publicidades;

ALTER TABLE llegan
DROP CONSTRAINT FK_llegan_jugadores;


-- Atributos

ALTER TABLE plataformas
DROP CONSTRAINT CK_plataformas_plataforma;

ALTER TABLE juegos
DROP CONSTRAINT CK_juegos_genero;

ALTER TABLE juegos
DROP CONSTRAINT CK_juegos_modoJuego;

ALTER TABLE tiendasIntegradas
DROP CONSTRAINT CK_tiendasIntegradas_articulo;

ALTER TABLE compras 
DROP CONSTRAINT CK_personajes_generoPersonaje;

ALTER TABLE personajes
DROP CONSTRAINT CK_personajes_generoPersonaje;

ALTER TABLE personajes
DROP CONSTRAINT CK_personajes_rol;

ALTER TABLE generosPreferidos
DROP CONSTRAINT CK_generosPreferidos_genero;

ALTER TABLE banners
DROP CONSTRAINT CK_banners_fecha_inicioFin;

ALTER TABLE distribuidores
DROP CONSTRAINT CK_distribuidores_region;

ALTER TABLE publicidades
DROP CONSTRAINT CK_publicidades_fechaInicio_inicioFin;

ALTER TABLE publicidades
DROP CONSTRAINT CK_publicidades_inversion;

ALTER TABLE Distribuidores
DROP CONSTRAINT CK_Distribuidores_id;

ALTER TABLE Desarrolladores
DROP CONSTRAINT CK_Desarrolladores_id;

ALTER TABLE Artistas
DROP CONSTRAINT CK_Artistas_id;


-- Primarias

ALTER TABLE juegos
DROP CONSTRAINT PK_juegos;

ALTER TABLE eventos
DROP CONSTRAINT PK_eventos;

ALTER TABLE tiendasIntegradas
DROP CONSTRAINT PK_tiendasIntegradas;

ALTER TABLE cuentas
DROP CONSTRAINT PK_cuentas;

ALTER TABLE banners
DROP CONSTRAINT PK_banners;

ALTER TABLE complementos
DROP CONSTRAINT PK_complementos;

ALTER TABLE personajes
DROP CONSTRAINT PK_personajes;

ALTER TABLE jugadores
DROP CONSTRAINT PK_jugadores;

ALTER TABLE complementosCuentas
DROP CONSTRAINT PK_complementosCuentas;

ALTER TABLE personajesCuentas
DROP CONSTRAINT PK_personajesCuentas;

ALTER TABLE tiroEn
DROP CONSTRAINT PK_tiroEn;

ALTER TABLE compras
DROP CONSTRAINT PK_compras;

ALTER TABLE complementosBanners
DROP CONSTRAINT PK_complementosBanners;

ALTER TABLE personajesBanners
DROP CONSTRAINT PK_personajesBanners;

ALTER TABLE generosPreferidos
DROP CONSTRAINT PK_generosPreferidos;

ALTER TABLE plataformas
DROP CONSTRAINT PK_plataformas;

ALTER TABLE desarrolladores
DROP CONSTRAINT PK_desarrolladoress;

ALTER TABLE distribuidores
DROP CONSTRAINT PK_distribuidores;

ALTER TABLE distribuye
DROP CONSTRAINT PK_distribuye;

ALTER TABLE publicidades
DROP CONSTRAINT PK_publicidades;

ALTER TABLE llegan
DROP CONSTRAINT PK_llegan;

ALTER TABLE artistas
DROP CONSTRAINT PK_artistas;

ALTER TABLE creaBanner
DROP CONSTRAINT PK_creaBanner;


