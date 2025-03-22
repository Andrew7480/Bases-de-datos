-- PoblarOK

--Jugadores


INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '10001000', 'Colombia', TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '1020', 'Mexico', TO_DATE('2011-05-17', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '20002000', 'Argentina', TO_DATE('1995-11-21', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '30003000', 'Chile', TO_DATE('1990-03-25', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '40004000', 'Peru', TO_DATE('1985-07-30', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '50005000', 'Venezuela', TO_DATE('1992-09-12', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '60006000', 'Ecuador', TO_DATE('2000-01-01', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '70007000', 'Uruguay', TO_DATE('1988-06-15', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '80008000', 'Paraguay', TO_DATE('1993-10-09', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '90009000', 'Bolivia', TO_DATE('1998-04-22', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '10001010', 'Costa Rica', TO_DATE('2005-12-30', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '11001100', 'Honduras', TO_DATE('1991-08-18', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '12001200', 'Nicaragua', TO_DATE('1997-03-04', 'YYYY-MM-DD'));

INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '10001000', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '20002000', 'Deporte');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '20002000', 'Aventura');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '20002000', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '30003000', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '40004000', 'Deporte');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '50005000', 'Aventura');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '60006000', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '70007000', 'Deporte');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '80008000', 'Aventura');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '90009000', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '10001010', 'Deporte');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '11001100', 'Aventura');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '12001200', 'RPG');






--Empresa--

--Desarrolladoras de juegos
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HYV', 'HoYoverse', 'China');
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HS', 'Hotta Studio', 'China');  --tower of fantasy
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HG', 'Kuro Game', 'China');
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('HE', 'Happy Elements', 'China');

INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('SM', 'Studio Montagne', 'China'); --arknights
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('SU', 'Shift Up', 'Corea del Sur');  --Nikke
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('NAT', 'NAT Games', 'Corea del Sur'); --BLue archive
INSERT INTO desarrolladores (idDesarrollador, nombreDesarrollador, pais) VALUES ('NyG', 'Cygames ', 'Japon'); --Princess connect

--Distribuidores de Juegos

INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('HYV', 'HoYoverse', 'Global');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('LI', 'Level Infinite', 'Global');   --tower of fantasy y nikke
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('KG', 'Kuro Game', 'Global');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('HE', 'Happy Elements', 'Asia');  
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('YR', 'Yostar', 'Global');  --arknights y blue archive
INSERT INTO distribuidores (idDistribuidor, nombreDistribuidor, region) VALUES ('CG', 'Cygames ', 'Global');  

--artistas
--tower of fantasy
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('123', 'Wu Wa');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('145', 'Zhang Lei');
    
--Ensemble Stars! Music
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('146', 'Yuko Iwasa');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('147', 'Takashi Okamoto');

--Wuthering Waves  
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('148', 'Zhenxi Zhang');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('149', 'Kazuya Nakai');
--Genshin Impact y Honkai
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('142', 'Zhou Ling');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('179', 'Chen Kun');
--Arknights y Blue Archive
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('125', 'Shunpei Yamaguchi');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('126', 'Akira Yamada');

--Nikke
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('127', 'Eri Saito');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('135', 'Takahiro Koyama');
-- Princess Connect
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('137', 'Hiroshi Sasaki');
    INSERT INTO artistas (idArtista, nombreArtista) VALUES ('131', 'Yuuki Nakashima');


--juegos
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Honkai:Star Rail','RPG', 'Single player','DR_HYV');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Genshin Impact', 'Aventura', 'Multiplayer','DR_HYV');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Arknights', 'Estrategico', 'Single player','DR_SM');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Nikke', 'Accion', 'Single player','DR_SU');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Blue Archive', 'RPG', 'Multiplayer','DR_NAT');
INSERT INTO juegos (nombreJuego, genero, modoJuego, idDesarrollador) VALUES ('Princess Connect', 'RPG', 'Single player','DR_NyG');

--INSERT INTO juegos (nombreJuego, genero, modoJuego) VALUES ('Zenless Zone Zero','Estrategico', 'Single player');
--INSERT INTO juegos (nombreJuego, genero, modoJuego) VALUES ('Tower of Fantasy', 'Aventura', 'Multiplayer');
--INSERT INTO juegos (nombreJuego, genero, modoJuego) VALUES ('Wuthering Waves', 'Aventura', 'Multiplayer');
--INSERT INTO juegos (nombreJuego, genero, modoJuego) VALUES ('Ensemble Stars Music', 'Musica', 'Single player');



--Relaciones Empresas con juegos
-- Distribuye 

INSERT INTO distribuye VALUES ('DB_HYV', 'Honkai:Star Rail');

INSERT INTO distribuye VALUES ('DB_HYV', 'Genshin Impact');

INSERT INTO distribuye VALUES ('DB_YR', 'Arknights');

INSERT INTO distribuye VALUES ('DB_LI', 'Nikke');

INSERT INTO distribuye VALUES ('DB_YR', 'Blue Archive');

INSERT INTO distribuye VALUES ('DB_CG', 'Princess Connect');



--1. Honkai:Star Rail
--plataformas
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Honkai:Star Rail', 'PC');
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Honkai:Star Rail', 'Consola');
--eventos
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Relojito: Dulces sueños del pasado',TO_DATE('2025-07-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Pergamino ninja de la Cacería' ,TO_DATE('2026-02-13', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Presente del cometa' ,TO_DATE('2025-06-13', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Sombra del Vigilante' ,TO_DATE('2026-08-20', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Gran Torneo de Villarroca' ,TO_DATE('2024-12-30', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Archivo de curiosidades del museo' ,TO_DATE('2026-12-21', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Comando de la Estación Espacial' ,TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Presente del fulgor' ,TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Guerras Etéreas' ,TO_DATE('2025-03-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Plano infinito' ,TO_DATE('2024-12-24', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Fotografías estelares' ,TO_DATE('2027-03-17', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Historias raposianas para no dormir' ,TO_DATE('2025-04-12', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Torneo de Exhibición de Destrezas' ,TO_DATE('2025-06-20', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Búsqueda de mascotas exóticas' ,TO_DATE('2025-04-05', 'YYYY-MM-DD'), 'Honkai:Star Rail');
--tienda integrada
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada', 'Honkai:Star Rail', 25000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',30000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',40000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',60000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',70000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego,precio) VALUES ('Moneda integrada',  'Honkai:Star Rail',80000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Honkai:Star Rail', 75000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Honkai:Star Rail', 65000);

--del standard
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Clara', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.56" color="Rojo" vestimenta="Ropa de combate" personalidad="Inocente, Tímida" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Bronya', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Plata" vestimenta="Armadura Tecnológica" personalidad="Seria, Determinada" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Gepard', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.88" color="Rubio" vestimenta="Armadura de comandante" personalidad="Leal, Protector" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Himeko', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.71" color="Rojo" vestimenta="Ropa de piloto" personalidad="Intelectual, Aventurera" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Welt', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Blanco" vestimenta="Ropa futurista" personalidad="Sabio, Reservado" />'), 'Soporte');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Una invitación de Colonipenal', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada del Sol Oscuro', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza del Crepúsculo', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Cloak of Shadows', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Filo de Eternidad', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Puño de Fuego Eterno', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Cuchillo de la Luna Roja', 'Arma');

--banners solo de personajes
INSERT INTO personajes (nombrePersonaje,caracteristicas, rol) VALUES ('Robin',XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.42" color="Blanco" vestimenta="Elegante" personalidad="Alegre" />'),'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('March 7th', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.64" color="Azul" vestimenta="Uniforme Escolar" personalidad="Amistosa, Optimista" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Dan Heng', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.78" color="Negro" vestimenta="Traje de viaje" personalidad="Serio, Reservado" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Sampo', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.73" color="Blanco" vestimenta="Ropa Casuales" personalidad="Travieso, Carismático" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Kafka', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.68" color="Blanco" vestimenta="Traje elegante" personalidad="Fría, Calculadora" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Seele', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.55" color="Púrpura" vestimenta="Ropa de batalla" personalidad="Melancólica, Decidida" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Jing Yuan', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.85" color="Blanco" vestimenta="Traje de comandante" personalidad="Sabio, Tranquilo" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Asta', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.69" color="Castaño" vestimenta="Ropa de investigación" personalidad="Curiosa, Intelectual" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Pela', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Blanco" vestimenta="Uniforme de combate" personalidad="Audaz, Valiente" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Herta', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Blanco" vestimenta="Laboratorio" personalidad="Excéntrica, Genial" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Sushang', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.55" color="Blanco" vestimenta="Ropa de combate" personalidad="Energética, Amigable" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Natasha', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Rosa" vestimenta="Ropa de curación" personalidad="Compasiva, Tranquila" />'), 'Healer');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Luocha', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.82" color="Plata" vestimenta="Traje elegante" personalidad="Sutil, Misterioso" />'), 'Healer');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Luka', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.82" color="Verde" vestimenta="Ropa de combate" personalidad="Valiente, Impulsivo" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Serval', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.74" color="Blanco" vestimenta="Ropa elegante" personalidad="Tímida, Inteligente" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Tingyun', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.58" color="Amarillo" vestimenta="Ropa tradicional" personalidad="Sensible, Optimista" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Silverwolf', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Plata" vestimenta="Ropa oscura" personalidad="Calculadora, Solitaria" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Blade', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.83" color="Rojo" vestimenta="Traje de combate" personalidad="Vengativo, Imparable" />'), 'DPS');
/*
<!ELEMENT caracteristicas EMPTY>
<!ATTLIST caracteristicas 
    genero CDATA #REQUIRED
    estatura CDATA #REQUIRED
    color CDATA #REQUIRED
    vestimenta CDATA #REQUIRED
    personalidad CDATA #REQUIRE

*/


--banners solo de complementos

INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arco del Viento Mortal', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Baculo del Conocimiento Arcaico', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada del Caido', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Martillo de Destruccion Cosmica', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Daga del Viento Celestial', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Hacha del Imperio Perdido', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Sable de la Fuerza Elemental', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Baculo de la Aurora', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Flecha de la Tempestad Eterna', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Guantelete de la Tormenta', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de la Eternidad Desatada', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Garra de la Bestia Mistica', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Latigo de la Ira Divina', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de los Espiritus Errantes', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Escudo de la Luna Negra', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza de las Furias Eternas', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Baculo del Alma Perdida', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Daga del Cazador Oscuro', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Sable de la Tempestad', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Hacha del Ruido Abismal', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Latigo del Viento Furioso', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de la Inmortalidad', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Guantelete del Titan Antiguo', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Martillo de la Guerra Estelar', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Baculo del Ultimo Dios', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Flecha de la Desolacion', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada del Reino Perdido', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arco del Guerrero Fantasma', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Daga de la Serpiente Mistica', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Hacha de la Fuerza Caotica', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza del Dragon Ascendente', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Cuchillo de la Sombra Inmortal', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Guante de la Mente Celestial', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de los Cuatro Vientos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Latigo de la Ira del Fenix', 'Arma');

--Estan en banner standard

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    PC_banner.AD_personajesBanners(vIdbanner, 'Clara');
    PC_banner.AD_personajesBanners(vIdbanner, 'Bronya');
    PC_banner.AD_personajesBanners(vIdbanner, 'Gepard');
    PC_banner.AD_personajesBanners(vIdbanner, 'Himeko');
    PC_banner.AD_personajesBanners(vIdbanner, 'Welt');
    
    PC_banner.AD_complementosBanners(vIdbanner, 'Una invitación de Colonipenal');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada del Sol Oscuro');
    PC_banner.AD_complementosBanners(vIdbanner, 'Lanza del Crepúsculo');
    PC_banner.AD_complementosBanners(vIdbanner, 'Cloak of Shadows');
    PC_banner.AD_complementosBanners(vIdbanner, 'Filo de Eternidad');
    PC_banner.AD_complementosBanners(vIdbanner, 'Puño de Fuego Eterno');
    PC_banner.AD_complementosBanners(vIdbanner, 'Cuchillo de la Luna Roja');    
END;
/


--Banners personajes

INSERT INTO banners (nombreBanner, fechaFin,  nombreJuego) VALUES ('La flamiente llama',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO banners (nombreBanner, fechaFin,  nombreJuego)VALUES ('La odisea milagrosa',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO banners (nombreBanner, fechaFin,  nombreJuego)VALUES('La calma despues dela tormenta',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');


-- Asignación de personajes para Banner 'La flamiente llama'
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'La flamiente llama';
    PC_banner.AD_personajesBanners(vIdbanner, 'Clara');
    PC_banner.AD_personajesBanners(vIdbanner, 'Dan Heng');
    PC_banner.AD_personajesBanners(vIdbanner, 'Seele');
    PC_banner.AD_personajesBanners(vIdbanner, 'Sushang');
    PC_banner.AD_personajesBanners(vIdbanner, 'Herta');
    PC_banner.AD_personajesBanners(vIdbanner, 'Sampo');
END;
/

-- Asignación de personajes para Banner 'La odisea milagrosa'
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'La odisea milagrosa';
    PC_banner.AD_personajesBanners(vIdbanner, 'March 7th');
    PC_banner.AD_personajesBanners(vIdbanner, 'Kafka');
    PC_banner.AD_personajesBanners(vIdbanner, 'Luocha');
    PC_banner.AD_personajesBanners(vIdbanner, 'Jing Yuan');
    PC_banner.AD_personajesBanners(vIdbanner, 'Pela');
    PC_banner.AD_personajesBanners(vIdbanner, 'Tingyun');
END;
/

-- Asignación de personajes para Banner 'La calma despues de la tormenta'
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'La calma despues dela tormenta';
    PC_banner.AD_personajesBanners(vIdbanner, 'Blade');
    PC_banner.AD_personajesBanners(vIdbanner, 'Luka');
    PC_banner.AD_personajesBanners(vIdbanner, 'Serval');
    PC_banner.AD_personajesBanners(vIdbanner, 'Silverwolf');
    PC_banner.AD_personajesBanners(vIdbanner, 'Asta');
    PC_banner.AD_personajesBanners(vIdbanner, 'Natasha');
END;
/

--Banners complementos
INSERT INTO banners (nombreBanner, fechaFin,  nombreJuego)VALUES('El ultimo rayo de luz',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');
INSERT INTO banners (nombreBanner, fechaFin,  nombreJuego)VALUES('La caida de un eon',TO_DATE('2025-09-27', 'YYYY-MM-DD'), 'Honkai:Star Rail');

-- Asignación de los complementos al banner 'El ultimo rayo de luz'
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'El ultimo rayo de luz';
    PC_banner.AD_complementosBanners(vIdbanner, 'Arco del Viento Mortal');
    PC_banner.AD_complementosBanners(vIdbanner, 'Baculo del Conocimiento Arcaico');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada del Caido');
    PC_banner.AD_complementosBanners(vIdbanner, 'Martillo de Destruccion Cosmica');
    PC_banner.AD_complementosBanners(vIdbanner, 'Daga del Viento Celestial');
    PC_banner.AD_complementosBanners(vIdbanner, 'Hacha del Imperio Perdido');
    PC_banner.AD_complementosBanners(vIdbanner, 'Sable de la Fuerza Elemental');
    PC_banner.AD_complementosBanners(vIdbanner, 'Baculo de la Aurora');
    PC_banner.AD_complementosBanners(vIdbanner, 'Flecha de la Tempestad Eterna');
    PC_banner.AD_complementosBanners(vIdbanner, 'Guantelete de la Tormenta');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada de la Eternidad Desatada');
    PC_banner.AD_complementosBanners(vIdbanner, 'Garra de la Bestia Mistica');
    PC_banner.AD_complementosBanners(vIdbanner, 'Latigo de la Ira Divina');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada de los Espiritus Errantes');
    PC_banner.AD_complementosBanners(vIdbanner, 'Escudo de la Luna Negra');
    PC_banner.AD_complementosBanners(vIdbanner, 'Lanza de las Furias Eternas');
    PC_banner.AD_complementosBanners(vIdbanner, 'Baculo del Alma Perdida');
END;
/

-- Asignación de los complementos al banner 'La caida de un eon'
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'La caida de un eon';
    PC_banner.AD_complementosBanners(vIdbanner, 'Daga del Cazador Oscuro');
    PC_banner.AD_complementosBanners(vIdbanner, 'Sable de la Tempestad');
    PC_banner.AD_complementosBanners(vIdbanner, 'Hacha del Ruido Abismal');
    PC_banner.AD_complementosBanners(vIdbanner, 'Latigo del Viento Furioso');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada de la Inmortalidad');
    PC_banner.AD_complementosBanners(vIdbanner, 'Guantelete del Titan Antiguo');
    PC_banner.AD_complementosBanners(vIdbanner, 'Martillo de la Guerra Estelar');
    PC_banner.AD_complementosBanners(vIdbanner, 'Baculo del Ultimo Dios');
    PC_banner.AD_complementosBanners(vIdbanner, 'Flecha de la Desolacion');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada del Reino Perdido');
    PC_banner.AD_complementosBanners(vIdbanner, 'Arco del Guerrero Fantasma');
    PC_banner.AD_complementosBanners(vIdbanner, 'Daga de la Serpiente Mistica');
    PC_banner.AD_complementosBanners(vIdbanner, 'Hacha de la Fuerza Caotica');
    PC_banner.AD_complementosBanners(vIdbanner, 'Lanza del Dragon Ascendente');
    PC_banner.AD_complementosBanners(vIdbanner, 'Cuchillo de la Sombra Inmortal');
    PC_banner.AD_complementosBanners(vIdbanner, 'Guante de la Mente Celestial');
    PC_banner.AD_complementosBanners(vIdbanner, 'Espada de los Cuatro Vientos');
    PC_banner.AD_complementosBanners(vIdbanner, 'Latigo de la Ira del Fenix');
END;
/



--Cuentas
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta1@gmail.com', NULL, TO_DATE('2025-07-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '10001000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta7@gmail.com', 1234, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '1020');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta2@gmail.com',3247, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '20002000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta3@gmail.com',95873 , TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '30003000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta4@gmail.com', 64172, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '40004000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta5@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '50005000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta6@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '60006000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta8@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '70007000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta9@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '80008000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta10@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'cedula', '90009000');
INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) VALUES ( 'cuenta11@gmail.com', 09248, TO_DATE('2024-08-11', 'YYYY-MM-DD'), 'Honkai:Star Rail', 'tarjeta de identidad', '10001010');




--select * from tiroen;

--Tiro EN

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Honkai:Star Rail' AND nombreBanner = 'La caida de un eon';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Honkai:Star Rail' AND nombreBanner = 'El ultimo rayo de luz';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/
DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Honkai:Star Rail' AND nombreBanner = 'La odisea milagrosa';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/

--PersonajesCuentas ComplementosCuentas

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo =  'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO personajesCuentas (idCuenta, nombrePersonaje) 
    VALUES (vIdCuenta, 'Pela');
END;
/

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo =  'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO personajesCuentas (idCuenta, nombrePersonaje) 
    VALUES (vIdCuenta, 'Kafka');
END;
/

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';
    
    INSERT INTO complementosCuentas (idCuenta, nombreComplemento) 
    VALUES (vIdCuenta, 'Daga del Cazador Oscuro');
END;
/

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';
    
    INSERT INTO complementosCuentas (idCuenta, nombreComplemento) 
    VALUES (vIdCuenta, 'Espada de la Inmortalidad');
END;
/



--compras 
--select* from tiendasintegradas where nombreJuego = 'Honkai:Star Rail';
--select* from compras where nombreJuego = 'Honkai:Star Rail';
DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Membresia' AND nombreJuego = 'Honkai:Star Rail' AND precio = 30000;


    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Transferencia');
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Honkai:Star Rail' AND precio = 50000;


    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Transferencia');
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Honkai:Star Rail' AND precio = 60000;


    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Transferencia');
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'cuenta7@gmail.com' AND nombreJuego = 'Honkai:Star Rail';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Honkai:Star Rail' AND precio = 70000;


    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Transferencia');
END;
/

--Publicidad Honkai
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Publicidad 1', 103002,vIdBanner, 'DB_HYV');

END;
/

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Publicidad 2', 345983,vIdBanner, 'DB_HYV');

END;
/
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'standard'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Publicidad 3', 23834,vIdBanner, 'DB_HYV');

END;
/

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La calma despues dela tormenta'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Banner Promocional', 12002,vIdBanner, 'DB_HYV');

END;
/
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La flamiente llama'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Banner Promocional 2', 10002,vIdBanner, 'DB_HYV');

END;
/
DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La odisea milagrosa'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Banner Promocional 3', 10302,vIdBanner, 'DB_HYV');

END;
/


DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'El ultimo rayo de luz'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Banner Promocional 4', 30002,vIdBanner, 'DB_HYV');

END;
/

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners where nombreBanner = 'La caida de un eon'  AND nombreJuego = 'Honkai:Star Rail';
    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, idDistribuidor) VALUES ('Banner Promocional 5', 100002,vIdBanner, 'DB_HYV');

END;
/

--creaBanner
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='standard'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='standard'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_179', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La calma despues dela tormenta'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La odisea milagrosa'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La odisea milagrosa'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_179', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='El ultimo rayo de luz'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_179', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='El ultimo rayo de luz'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La flamiente llama'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_179', vIdBanner);
END;
/
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La flamiente llama'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La caida de un eon'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_179', vIdBanner);
END;
/
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La caida de un eon'
      AND nombreJuego='Honkai:Star Rail';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_142', vIdBanner);
END;
/

--Publicidades que le llegan a los jugadores


INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '1020', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '20002000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30003000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '40004000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '50005000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '60006000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '70007000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '80008000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '90009000', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '10001010', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'Publicidad 1');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '12001200', 'Publicidad 1');

INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '1020', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '20002000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30003000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '40004000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '50005000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '60006000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '70007000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '80008000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '90009000', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '10001010', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'Publicidad 2');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '12001200', 'Publicidad 2');

INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '1020', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '20002000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30003000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '40004000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '50005000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '60006000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '70007000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '80008000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '90009000', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '10001010', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'Publicidad 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '12001200', 'Publicidad 3');

INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '1020', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '20002000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30003000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '40004000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '50005000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '60006000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '70007000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '80008000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '90009000', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '10001010', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'Banner Promocional');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '12001200', 'Banner Promocional');

INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '1020', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '20002000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30003000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '40004000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '50005000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '60006000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '70007000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '80008000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '90009000', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '10001010', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'Banner Promocional 3');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '12001200', 'Banner Promocional 3');


--2.  Genshin
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Genshin Impact', 'PC');
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Genshin Impact', 'Consola');


INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Festival del Viento', TO_DATE('2025-03-21', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Luz de la Lluvia de Estrellas', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Ritual de la Linterna', TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Cuentos de Teyvat', TO_DATE('2025-09-30', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('La Llama Eterna', TO_DATE('2026-01-20', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Invocación del Archipiélago', TO_DATE('2025-07-05', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Leyendas de los Vientos Susurrantes', TO_DATE('2025-11-10', 'YYYY-MM-DD'), 'Genshin Impact');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Camino de las Estrellas Errantes', TO_DATE('2025-12-25', 'YYYY-MM-DD'), 'Genshin Impact');


INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 25000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 30000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 40000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 60000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 70000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Genshin Impact', 80000);


--standar
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Amber', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Castaño" vestimenta="Exploradora" personalidad="Enérgica, Amigable" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Diluc', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.85" color="Rojo" vestimenta="Armadura ligera" personalidad="Serio, Protector" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Jean', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Rubio" vestimenta="Armadura de caballero" personalidad="Justa, Responsable" />'), 'Healer');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Fischl', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.59" color="Rubio" vestimenta="Estilo gótico" personalidad="Excéntrica, Observadora" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Kaeya', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.82" color="Azul" vestimenta="Elegante" personalidad="Carismático, Misterioso" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Barbara', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.58" color="Rubio" vestimenta="Vestido de idol" personalidad="Optimista, Dulce" />'), 'Healer');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Mona', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.63" color="Marrón" vestimenta="Traje astrológico" personalidad="Astuta, Intelectual" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Razor', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.72" color="Gris" vestimenta="Ropa salvaje" personalidad="Leal, Feroz" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Lisa', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.66" color="Castaño" vestimenta="Traje de bruja" personalidad="Relajada, Coqueta" />'), 'Soporte');

INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada del Alba', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arco del Cuervo', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza del Guerrero', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Prototipo Arcaico', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Catalizador del Ocaso', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Mandoble de Favonius', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada Larga del Amanecer', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Códice de los Cielos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arco Elegía del Fin', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza Perforadora', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Mandoble de la Luna Fría', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada Negra', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Cántico de los Vientos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza de Espinas de Dragón', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada Real', 'Arma');



--banner personajes
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Venti', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.65" color="Azul" vestimenta="Bardo" personalidad="Alegre, Caprichoso" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Hu Tao', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Negro" vestimenta="Directora funeraria" personalidad="Divertida, Excéntrica" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Xiao', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.62" color="Verde" vestimenta="Guerrero Yaksha" personalidad="Reservado, Protector" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Raiden Shogun', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.67" color="Púrpura" vestimenta="Samurái elegante" personalidad="Determinada, Serena" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Klee', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.35" color="Rubio" vestimenta="Exploradora infantil" personalidad="Traviesa, Alegre" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Tartaglia', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Naranja" vestimenta="Traje militar" personalidad="Leal, Complejo" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Zhongli', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.85" color="Castaño oscuro" vestimenta="Formal y elegante" personalidad="Sabio, Tranquilo" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Eula', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.72" color="Azul" vestimenta="Guerrera noble" personalidad="Firme, Justiciera" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Yoimiya', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Rubio" vestimenta="Artesana pirotécnica" personalidad="Optimista, Creativa" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Nahida', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.40" color="Blanco" vestimenta="Traje espiritual" personalidad="Curiosa, Empática" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Albedo', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.73" color="Rubio" vestimenta="Investigador alquímico" personalidad="Sereno, Intelectual" />'), 'Soporte');

--banner complementos
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Báculo de Homa', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Alas Celestiales', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Púa Celestial', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Memorias de Sacrificio', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Mandoble del Lobo', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Orgullo Celestial', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Corte de la Desidia', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Harpista Celestial', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espina Dragónica', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Luz del Segador', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('El Susurro de los Vientos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Cetro de la Luz Lunar', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arma de los Dioses Gemelos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Perdición del Dragón', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Luz del Incienso', 'Arma');

--Estan en el Standard

-- Están en banner permanente

DECLARE vIdbanner VARCHAR(20);
BEGIN
    SELECT Idbanner INTO vIdbanner FROM banners WHERE nombreBanner = 'standard' AND nombreJuego = 'Genshin Impact';
    
    PC_banner.AD_personajesBanners(vIdbanner, 'Jean');
    PC_banner.AD_personajesBanners(vIdbanner, 'Diluc');
    PC_banner.AD_personajesBanners(vIdbanner, 'Mona');
    PC_banner.AD_personajesBanners(vIdbanner, 'Razor');
    PC_banner.AD_personajesBanners(vIdbanner, 'Lisa');
    PC_banner.AD_personajesBanners(vIdbanner, 'Kaeya');
    PC_banner.AD_personajesBanners(vIdbanner, 'Barbara');

    PC_banner.AD_complementosBanners(vIdbanner, 'Espada del Alba');
    PC_banner.AD_complementosBanners(vIdbanner, 'Arco del Cuervo');
    PC_banner.AD_complementosBanners(vIdbanner, 'Lanza del Guerrero');
    PC_banner.AD_complementosBanners(vIdbanner, 'Prototipo Arcaico');
    PC_banner.AD_complementosBanners(vIdbanner, 'Catalizador del Ocaso');
    PC_banner.AD_complementosBanners(vIdbanner, 'Luz del Segador');
    PC_banner.AD_complementosBanners(vIdbanner, 'Mandoble de Favonius');
END;
/










------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Jugadores

INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '10101010', 'Colombia', TO_DATE('1998-01-15', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '20202020', 'Mexico', TO_DATE('2000-06-10', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '30303030', 'Argentina', TO_DATE('1995-09-22', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '40404040', 'Chile', TO_DATE('1989-12-25', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '88889999', 'Argentina', TO_DATE('1997-05-14', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('cedula', '44445555', 'Mexico', TO_DATE('1990-09-21', 'YYYY-MM-DD'));
INSERT INTO jugadores (tipoId, numId, pais, fechaNacimiento) VALUES ('tarjeta de identidad', '99990000', 'Chile', TO_DATE('2003-11-22', 'YYYY-MM-DD'));

-- generosPreferidos

INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '10101010', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('tarjeta de identidad', '20202020', 'Estrategico');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '30303030', 'Aventura');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '40404040', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '88889999', 'RPG');
INSERT INTO generosPreferidos (tipoId, numId, genero) VALUES ('cedula', '44445555', 'Estrategico');

-- plataformas

INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Arknights', 'PC');
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Nikke', 'PC');
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Blue Archive', 'PC');
INSERT INTO plataformas (nombreJuego, plataforma) VALUES ('Princess Connect', 'PC');

--Banners

INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('La Orden del Guardian', TO_DATE('2024-12-31', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Tormenta de Acero', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Guerreras de la Oscuridad', TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Furia de Acero', TO_DATE('2025-02-20', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Academia de las Sombras', TO_DATE('2025-11-10', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Heroes del Futuro', TO_DATE('2025-05-25', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('El Reino de la Luz', TO_DATE('2025-06-30', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Cruzados Eternos', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('AK Elite Units', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Nikke Vanguard', TO_DATE('2025-10-15', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Ecos del Ocaso', TO_DATE('2025-06-30', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Guardianes de la Aurora', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Sombras del Vacío', TO_DATE('2025-08-20', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Caballeros de la Luna', TO_DATE('2025-09-05', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Tierra de Sueños', TO_DATE('2025-10-10', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Héroes de la Luz', TO_DATE('2025-11-15', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Reinos Celestiales', TO_DATE('2025-12-25', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Guardianes Epicos', TO_DATE('2025-08-15', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Vanguardia Nikke', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Aventuras Eternas', TO_DATE('2025-02-20', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Legado de la Reina', TO_DATE('2025-03-10', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Gremio de Héroes', TO_DATE('2025-04-15', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Almas Guerreras', TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO banners (nombreBanner, fechaFin, nombreJuego) VALUES ('Élite Inmortal', TO_DATE('2025-06-25', 'YYYY-MM-DD'), 'Arknights');


-- Personajes

INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('SilverAsh', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.85" color="Blanco" vestimenta="Armadura táctica" personalidad="Frío, Calculador" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Exusiai', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Rojo" vestimenta="Uniforme de asalto" personalidad="Alegre, Energética" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Rapi', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Negro" vestimenta="Armadura táctica" personalidad="Fuerte, Resiliente" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Snow White', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Blanco" vestimenta="Vestido ceremonial" personalidad="Calmada, Noble" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Hoshino', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.55" color="Castaño" vestimenta="Uniforme escolar" personalidad="Curiosa, Aventurera" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Iori', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.58" color="Negro" vestimenta="Traje táctico" personalidad="Determinada, Firme" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Pecorine', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Rubio" vestimenta="Armadura de princesa" personalidad="Alegre, Enérgica" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Karyl', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Negro" vestimenta="Traje ceremonial" personalidad="Tsundere, Leal" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Yostar', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.80" color="Gris" vestimenta="Uniforme Militar" personalidad="Estratégico, Meticuloso" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Ch’en', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.75" color="Negro" vestimenta="Policía de Élite" personalidad="Seria, Decidida" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Blue Poison', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Azul" vestimenta="Médico de Campo" personalidad="Calma, Precisa" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Fiammetta', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Rojo" vestimenta="Tirador Letal" personalidad="Impulsiva, Apasionada" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Skadi', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Azul" vestimenta="Cazadora" personalidad="Misteriosa, Fuerte" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Eunectes', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.80" color="Verde" vestimenta="Piloto de Mecha" personalidad="Tímida, Ingeniosa" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Asuna', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.68" color="Rosa" vestimenta="Escolar" personalidad="Extrovertida, Energética" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Mikako', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.63" color="Morado" vestimenta="Uniforme Deportivo" personalidad="Competitiva, Apasionada" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Kokkoro', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.50" color="Verde" vestimenta="Maga Elfica" personalidad="Tranquila, Sabia" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Eriko', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.68" color="Rojo" vestimenta="Caballera" personalidad="Ferviente, Decidida" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Shiroko', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.67" color="Azul" vestimenta="Táctica Militar" personalidad="Reservada, Directa" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Yuki', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.78" color="Gris" vestimenta="Soldado" personalidad="Calmado, Protector" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Tsubaki', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Azul" vestimenta="Uniforme táctico" personalidad="Calmada, Protectora" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Aris', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Negro" vestimenta="Armadura escolar" personalidad="Decidida, Estratégica" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Mutsuki', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Rojo" vestimenta="Uniforme de exploradora" personalidad="Entusiasta, Juguetona" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Shining', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.75" color="Blanco" vestimenta="Vestido ceremonial" personalidad="Compasiva, Noble" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Texas', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Gris" vestimenta="Uniforme de operador" personalidad="Sarcástica, Protectora" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Amiya', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.60" color="Castaño" vestimenta="Uniforme táctico" personalidad="Líder, Empática" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Scarlet', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.72" color="Rojo" vestimenta="Armadura ligera" personalidad="Audaz, Independiente" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Ludmilla', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.68" color="Plata" vestimenta="Uniforme de combate" personalidad="Estratégica, Protectora" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Anis', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.65" color="Azul" vestimenta="Traje casual táctico" personalidad="Optimista, Divertida" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Hibiki', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.58" color="Castaño" vestimenta="Uniforme escolar" personalidad="Alegre, Inteligente" />'), 'Soporte');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Izumi', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.62" color="Negro" vestimenta="Uniforme escolar" personalidad="Glotona, Entusiasta" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Vanguard', XMLType('<?xml version="1.0"?><caracteristicas genero="Hombre" estatura="1.85" color="Negro" vestimenta="Uniforme militar" personalidad="Decidido, Estratega" />'), 'DPS');
INSERT INTO personajes (nombrePersonaje, caracteristicas, rol) VALUES ('Sniper', XMLType('<?xml version="1.0"?><caracteristicas genero="Mujer" estatura="1.70" color="Rubio" vestimenta="Traje de combate" personalidad="Precisa, Cautelosa" />'), 'Soporte');

-- Complementos

INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada del Guardián de Rhodes', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Casco de Defensa Avanzada', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Capa del Operador Sombrío', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Arco de las Sombras Letales', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Medalla del Valor Élite', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de Acero Brillante', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Escudo del Amanecer', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Libro de Hechizos Arcanos', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Collar de las Sombras Ocultas', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Abrigo de la Academia Mística', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de la Luz Pura', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Broche de la Sabiduría', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Rifle de Asalto del Amanecer', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Visor de Francotirador Ártico', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Chaqueta de Combate Avanzada', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Escopeta del Fénix de Fuego', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Guantes de la Resistencia Eterna', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Varita de Cristal Mágico', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Tiaras de la Reina Mística', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Vestido de la Princesa Radiante', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza de las Hadas', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Pendientes de la Eternidad', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Vanguard Shield', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Rapid Strike Module', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Espada de la Luz', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Escudo de la Eternidad', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Capa del Dragón', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Báculo del Mago', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Anillo de la Sabiduría', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Armadura Real', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Hacha de los Titanes', 'Arma');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Collar del Fénix', 'Accesorio');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Traje de la Orden', 'Ropa');
INSERT INTO complementos (nombreComplemento, tipo) VALUES ('Lanza de las Estrellas', 'Arma');


-- ComplementosBanners

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'La Orden del Guardian' AND nombreJuego = 'Arknights';

    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Espada de Acero Brillante', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Escudo del Amanecer', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Casco de Defensa Avanzada', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Collar del Fénix', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Lanza de las Estrellas', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Tormenta de Acero' AND nombreJuego = 'Arknights';

    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Capa del Dragón', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Báculo del Mago', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Anillo de la Sabiduría', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Armadura Real', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Espada de la Luz', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Guerreras de la Oscuridad' AND nombreJuego = 'Nikke';

    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Rapid Strike Module', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Escopeta del Fénix de Fuego', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Guantes de la Resistencia Eterna', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Medalla del Valor Élite', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Capa del Operador Sombrío', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Academia de las Sombras' AND nombreJuego = 'Blue Archive';

    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Abrigo de la Academia Mística', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Varita de Cristal Mágico', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Tiaras de la Reina Mística', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Vestido de la Princesa Radiante', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Pendientes de la Eternidad', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Cruzados Eternos' AND nombreJuego = 'Princess Connect';

    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Espada del Guardián de Rhodes', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Escudo de la Eternidad', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Hacha de los Titanes', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Traje de la Orden', vIdBanner);
    INSERT INTO complementosBanners (nombreComplemento, idBanner)
    VALUES ('Broche de la Sabiduría', vIdBanner);
END;
/

-- PersonajesBanners

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Heroes del Futuro' AND nombreJuego = 'Blue Archive';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Hoshino', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Iori', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Tsubaki', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Aris', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Mutsuki', vIdBanner);
END;
/ 

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'El Reino de la Luz' AND nombreJuego = 'Princess Connect';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Kokkoro', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Eriko', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Asuna', vIdBanner);
END;
/ 

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Guardianes Epicos' AND nombreJuego = 'Arknights';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('SilverAsh', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Shining', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Texas', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Amiya', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Ch’en', vIdBanner);
END;
/ 

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Nikke Vanguard' AND nombreJuego = 'Nikke';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Rapi', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Snow White', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Scarlet', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Ludmilla', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Anis', vIdBanner);
END;
/ 

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Aventuras Eternas' AND nombreJuego = 'Blue Archive';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Hoshino', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Iori', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Shiroko', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Hibiki', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Izumi', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'AK Elite Units' AND nombreJuego = 'Arknights';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('SilverAsh', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Exusiai', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Vanguard', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Sniper', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Pecorine', vIdBanner);
END;
/

DECLARE vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Almas Guerreras' AND nombreJuego = 'Nikke';

    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Rapi', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Snow White', vIdBanner);
    INSERT INTO personajesBanners (nombrePersonaje, idBanner)
    VALUES ('Karyl', vIdBanner);
END;
/

-- TiendasIntegradas

INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Arknights', 75000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Nikke', 40000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Nikke', 65000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Blue Archive', 30000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Blue Archive', 55000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Princess Connect', 35000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Princess Connect', 60000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Arknights', 45000);
INSERT INTO tiendasIntegradas (articulo, nombreJuego, precio) VALUES ('Moneda integrada', 'Nikke', 55000);


-- Cuentas 

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('arknights1@gmail.com', NULL, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 'Arknights', 'cedula', '10101010');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('arknights2@gmail.com', 123456789, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 'Arknights', 'tarjeta de identidad', '20202020');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('nikke1@gmail.com', NULL, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Nikke', 'cedula', '30303030');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('nikke2@gmail.com', 987654321, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'Nikke', 'cedula', '40404040');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('blue1@gmail.com', NULL, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Blue Archive', 'cedula', '10101010');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('blue@gmail.com', 123456789, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 'Blue Archive', 'tarjeta de identidad', '20202020');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('princess1@gmail.com', NULL, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Princess Connect', 'cedula', '30303030');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('princess2@gmail.com', 987654321, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Princess Connect', 'cedula', '40404040');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('arknights5@gmail.com', 1234567890, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'Arknights', 'cedula', '88889999');

INSERT INTO cuentas (correo, telefono, fechaConexion, nombreJuego, tipoId, numId) 
VALUES ('nikke5@gmail.com', 9876543210, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Nikke', 'cedula', '44445555');

-- Eventos

INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Rescate en la Base', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Operación del Guardián', TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Furia Desatada', TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Sombras del Futuro', TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Misterios de la Academia', TO_DATE('2025-11-15', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Héroes de la Luz', TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('El Reino Perdido', TO_DATE('2025-07-30', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Batalla de los Eternos', TO_DATE('2025-08-20', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Operation Scavenger', TO_DATE('2025-01-06', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Mission Alpha', TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Crystal Harvest', TO_DATE('2025-03-07', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Starfall Festival', TO_DATE('2025-04-06', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Phantom Rebellion', TO_DATE('2025-05-06', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Golden Parade', TO_DATE('2025-06-05', 'YYYY-MM-DD'), 'Arknights');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Frozen Horizon', TO_DATE('2025-07-05', 'YYYY-MM-DD'), 'Blue Archive');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Phoenix Ascent', TO_DATE('2025-08-04', 'YYYY-MM-DD'), 'Princess Connect');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Twilight Expedition', TO_DATE('2025-09-03', 'YYYY-MM-DD'), 'Nikke');
INSERT INTO eventos (nombreEvento, fechaFin, nombreJuego) VALUES ('Shadowfall Chronicles', TO_DATE('2025-10-03', 'YYYY-MM-DD'), 'Arknights');

-- Compras

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'blue1@gmail.com' AND nombreJuego = 'Blue Archive';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Blue Archive' AND precio = 30000;


    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Transferencia');
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN

    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'princess2@gmail.com' AND nombreJuego = 'Princess Connect';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Princess Connect' AND precio = 35000;

    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Efectivo');
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'arknights5@gmail.com' AND nombreJuego = 'Arknights';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Arknights' AND precio = 75000;

    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'Tarjeta de Credito');
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
vIdArticulo VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'nikke5@gmail.com' AND nombreJuego = 'Nikke';

    SELECT idArticulo INTO vIdArticulo
    FROM tiendasIntegradas
    WHERE articulo = 'Moneda integrada' AND nombreJuego = 'Nikke' AND precio = 55000;

    INSERT INTO compras (idCuenta, idArticulo, metodoPago)
    VALUES (vIdCuenta, vIdArticulo, 'PayPal');
END;
/ 

-- tiroEn

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'nikke2@gmail.com' AND nombreJuego = 'Nikke';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Nikke' AND nombreBanner = 'Guerreras de la Oscuridad';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'arknights5@gmail.com' AND nombreJuego = 'Arknights';

    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'AK Elite Units' AND nombreJuego = 'Arknights';

    INSERT INTO tiroEn (idCuenta, idBanner)
    VALUES (vIdCuenta, vIdBanner);
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'princess1@gmail.com' AND nombreJuego = 'Princess Connect';

    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'El Reino de la Luz' AND nombreJuego = 'Princess Connect';

    INSERT INTO tiroEn (idCuenta, idBanner)
    VALUES (vIdCuenta, vIdBanner);
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'nikke5@gmail.com' AND nombreJuego = 'Nikke';

    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner = 'Nikke Vanguard' AND nombreJuego = 'Nikke';

    INSERT INTO tiroEn (idCuenta, idBanner)
    VALUES (vIdCuenta, vIdBanner);
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'blue1@gmail.com' AND nombreJuego = 'Blue Archive';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Blue Archive' AND nombreBanner = 'Academia de las Sombras';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/

DECLARE vIdCuenta VARCHAR(20);
vIdBanner VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'arknights5@gmail.com' AND nombreJuego = 'Arknights';

    SELECT idBanner INTO vIdBanner 
    FROM banners 
    WHERE nombreJuego = 'Arknights' AND nombreBanner = 'La Orden del Guardian';

    INSERT INTO tiroEn (idCuenta, idBanner) 
    VALUES (vIdCuenta, vIdBanner);
END;
/

-- complementosCuentas

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'blue1@gmail.com' AND nombreJuego = 'Blue Archive';
    
    INSERT INTO complementosCuentas (idCuenta, nombreComplemento) 
    VALUES (vIdCuenta, 'Varita de Cristal Mágico');
END;
/

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'arknights5@gmail.com' AND nombreJuego = 'Arknights';

    INSERT INTO complementosCuentas (idCuenta, nombreComplemento)
    VALUES (vIdCuenta, 'Casco de Defensa Avanzada');
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'nikke2@gmail.com' AND nombreJuego = 'Nikke';

    INSERT INTO complementosCuentas (idCuenta, nombreComplemento)
    VALUES (vIdCuenta, 'Rapid Strike Module');
END;
/

-- personajesCuentas

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta 
    FROM cuentas 
    WHERE correo = 'princess1@gmail.com' AND nombreJuego = 'Princess Connect';

    INSERT INTO personajesCuentas (idCuenta, nombrePersonaje) 
    VALUES (vIdCuenta, 'Kokkoro');
END;
/

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'arknights5@gmail.com' AND nombreJuego = 'Arknights';

    INSERT INTO personajesCuentas (idCuenta, nombrePersonaje)
    VALUES (vIdCuenta, 'Pecorine');
END;
/ 

DECLARE vIdCuenta VARCHAR(20);
BEGIN
    SELECT idCuenta INTO vIdCuenta
    FROM cuentas
    WHERE correo = 'nikke5@gmail.com' AND nombreJuego = 'Nikke';

    INSERT INTO personajesCuentas (idCuenta, nombrePersonaje)
    VALUES (vIdCuenta, 'Snow White');
END;
/ 

----------------------------

--creaBanner
DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Aventuras Eternas'
      AND nombreJuego='Blue Archive';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_126', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Aventuras Eternas'
      AND nombreJuego='Blue Archive';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_125', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Cruzados Eternos'
      AND nombreJuego='Princess Connect';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_137', vIdBanner);
END;
/


DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='AK Elite Units'
      AND nombreJuego='Arknights';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_126', vIdBanner);
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Nikke Vanguard'
      AND nombreJuego='Nikke';

    INSERT INTO creaBanner (idArtista, idBanner)
    VALUES ('AT_126', vIdBanner);
END;
/

-- Publicidades

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='La Orden del Guardian' 
      AND nombreJuego='Arknights';

    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, fechaInicio, fechaFin, idDistribuidor)
    VALUES ('PromoArknights', 200000000, vIdBanner, TO_DATE('2024-07-01','YYYY-MM-DD'), TO_DATE('2025-07-01','YYYY-MM-DD'), 'DB_YR');
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='AK Elite Units'
      AND nombreJuego='Arknights';

    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, fechaInicio, fechaFin, idDistribuidor)
    VALUES ('PromoArknightsElite', 150000000, vIdBanner, TO_DATE('2024-08-01','YYYY-MM-DD'), TO_DATE('2025-08-01','YYYY-MM-DD'), 'DB_YR');
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Academia de las Sombras'
      AND nombreJuego='Blue Archive';

    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, fechaInicio, fechaFin, idDistribuidor)
    VALUES ('PromoBlueAcademia', 100000000, vIdBanner, TO_DATE('2024-09-01','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'), 'DB_YR');
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='Nikke Vanguard'
      AND nombreJuego='Nikke';

    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, fechaInicio, fechaFin, idDistribuidor)
    VALUES ('NikkeHeroicCampaign', 250000000, vIdBanner, TO_DATE('2024-10-01','YYYY-MM-DD'), TO_DATE('2025-10-01','YYYY-MM-DD'), 'DB_LI');
END;
/

DECLARE
    vIdBanner VARCHAR(20);
BEGIN
    SELECT idBanner INTO vIdBanner
    FROM banners
    WHERE nombreBanner='El Reino de la Luz'
      AND nombreJuego='Princess Connect';

    INSERT INTO publicidades (nombrePublicidad, inversion, idBanner, fechaInicio, fechaFin, idDistribuidor)
    VALUES ('PrinConEternalLight', 180000000, vIdBanner, TO_DATE('2024-11-01','YYYY-MM-DD'), TO_DATE('2025-11-01','YYYY-MM-DD'), 'DB_CG');
END;
/

-- Llegan

INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10101010', 'PromoArknightsElite');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '20202020', 'NikkeHeroicCampaign');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '88889999', 'PrinConEternalLight');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '11001100', 'PromoBlueAcademia');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '10001000', 'PromoBlueAcademia');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '44445555', 'PromoBlueAcademia');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('cedula', '30303030', 'PromoBlueAcademia');
INSERT INTO llegan (tipoId, numId, nombrePublicidad) VALUES ('tarjeta de identidad', '99990000', 'PromoBlueAcademia');


---------------------------







