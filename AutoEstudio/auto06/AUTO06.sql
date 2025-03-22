
--Usaremos un formato XML  para representar los siguientes aspectos:
--los atributos de premios, sitio web, caracteristicas fisicas, instrumentos que toca y una descripcion del musico. 

--ejemplo:
/*<?xml version="1.0"?>

<informacion>

    <premios>
        <premio>
            <nombre>Grammy</nombre>
            <categoria>Mejor Álbum</categoria>
            <año>2020</año>
        </premio>
        <premio>
            <nombre>MTV Music Award</nombre>
            <categoria>Mejor Video Musical</categoria>
            <año>2021</año>
        </premio>
    </premios>


    <sitio_web>https://www.juanperez.com</sitio_web>

    <caracteristicas_fisicas>
        <caracteristica atributo="altura">1.80</caracteristica>
        <caracteristica atributo="ojos">Azules</caracteristica>
        <caracteristica atributo="cabello">Negro</caracteristica>
    </caracteristicas_fisicas>

    <instrumentos>
        <instrumento>Guitarra</instrumento>
        <instrumento>Piano</instrumento>
    </instrumentos>

    <descripcion> Es un musico reconocido por todo el pais que ha hecho grandes composiciones 
    </descripcion>
</informacion>
*/

TRUNCATE TABLE musician;

CREATE TABLE musician(
    m_no NUMBER(11) NOT NULL,
    m_name VARCHAR(20) NOT NULL,
    born DATE NOT NULL,
    died DATE,
    born_in NUMBER(11) NOT NULL,
    living_in NUMBER(11) NOT NULL,
    Informacion XMLTYPE NOT NULL
);
ALTER TABLE musician ADD CONSTRAINT PK_musician PRIMARY KEY(m_no);


INSERT INTO musician (m_no, m_name, born, died, born_in, living_in, Informacion)
VALUES (1, 'Carlos', TO_DATE('1985-06-15', 'YYYY-MM-DD'),NULL, 1,2,
XMLType(
'<?xml version="1.0"?>

<informacion>

    <premios>
        <premio>
            <nombre>Grammy</nombre>
            <categoria>Mejor Álbum</categoria>
            <año>2020</año>
        </premio>
        <premio>
            <nombre>MTV Music Award</nombre>
            <categoria>Mejor Video Musical</categoria>
            <año>2021</año>
        </premio>
    </premios>


    <sitio_web>https://www.Carlosperez.com</sitio_web>

    <caracteristicas_fisicas>
        <caracteristica atributo="altura">1.80</caracteristica>
        <caracteristica atributo="ojos">Azules</caracteristica>
        <caracteristica atributo="cabello">Negro</caracteristica>
    </caracteristicas_fisicas>

    <instrumentos>
        <instrumento>Guitarra</instrumento>
        <instrumento>Piano</instrumento>
    </instrumentos>

    <descripcion> Es un musico reconocido por todo el pais que ha hecho grandes composiciones 
    </descripcion>
</informacion>'));
INSERT INTO musician (m_no, m_name, born, died, born_in, living_in, Informacion)
VALUES (2, 'Camilo', TO_DATE('1970-11-20', 'YYYY-MM-DD'),NULL, 1,5,
XMLType(
'<?xml version="1.0"?>

<informacion>

    <premios>
        <premio>
            <nombre>Grammy</nombre>
            <categoria>Mejor Cancion</categoria>
            <año>2010</año>
        </premio>
        <premio>
            <nombre>MTV Music Award</nombre>
            <categoria>Mejor Video Artistico</categoria>
            <año>2020</año>
        </premio>
    </premios>


    <sitio_web>https://www.juanCamilo.com</sitio_web>

    <caracteristicas_fisicas>
        <caracteristica atributo="altura">1.70</caracteristica>
        <caracteristica atributo="ojos">Negros</caracteristica>
        <caracteristica atributo="cabello">Negro</caracteristica>
    </caracteristicas_fisicas>

    <instrumentos>
        <instrumento>Guitarra</instrumento>
        <instrumento>Trompeta</instrumento>
    </instrumentos>

    <descripcion> Es un musico reconocido por todo el pais 
    </descripcion>
</informacion>'));

--select * from musician;


-- Consultando

--1.
SELECT EXTRACT(Informacion, '/informacion/caracteristicas_fisicas/*') FROM musician WHERE m_name = 'Camilo';

SELECT EXTRACTVALUE (Informacion, '/informacion/sitio_web') FROM musician WHERE EXTRACTVALUE(Informacion, '/informacion/sitio_web') IS NOT NULL;

SELECT m_name FROM musician WHERE EXTRACTVALUE(informacion, '/informacion/premios/premio[nombre="Grammy"]/nombre') = 'Grammy';

--que instrumentos toca un artista en concreto
SELECT EXTRACT(Informacion, '/informacion/instrumentos/*') FROM musician WHERE m_name = 'Camilo';
--Mostrar todos los premios, categorías y años ganados por un musico específico
SELECT m.m_name, x.nombre_premio, x.categoria, x.año FROM musician m,
XMLTABLE('/informacion/premios/premio' 
PASSING m.Informacion
COLUMNS nombre_premio VARCHAR2(50) PATH 'nombre',
        categoria VARCHAR2(50) PATH 'categoria',
        año NUMBER PATH 'año'
     ) x
WHERE m.m_name = 'Camilo';


--Usamos DBMS_XMLGEN.GETXMLTYPE para generar un XML completo de un músicoen especifico

SELECT DBMS_XMLGEN.GETXMLTYPE(
           
           'SELECT m_name, born, died, born_in,
                   EXTRACTVALUE(Informacion, ''/informacion/sitio_web'') AS sitio_web,
                   EXTRACT(Informacion, ''/informacion/premios'') AS premios,
                   EXTRACT(Informacion, ''/informacion/caracteristicas_fisicas'') AS caracteristicas_fisicas,
                   EXTRACT(Informacion, ''/informacion/instrumentos'') AS instrumentos,
                   EXTRACT(Informacion,''/informacion/descripcion'') AS descripcion
            FROM musician
            WHERE m_name = ''Camilo''') AS musician_xml
FROM dual;



--3.

--Debe existir una descripcion y almenos un instrumento
/*
<?xml version="1.0"?>

<!DOCTYPE informacion [
    <!ELEMENT informacion (premios, sitio_web?, caracteristicas_fisicas, instrumentos, descripcion)>
    
    <!-- Características físicas deben tener los tres atributos ) -->
    <!ELEMENT caracteristicas_fisicas (altura, ojos, cabello)>
    <!ELEMENT altura (#PCDATA)>
    <!ELEMENT ojos (#PCDATA)>
    <!ELEMENT cabello (#PCDATA)>
    
    <!ELEMENT sitio_web (#PCDATA)>
    
    <!-- Premios con el nombre de premio, categoría y año -->
    <!ELEMENT premios (premio+)>
    <!ELEMENT premio (nombre, categoria, año)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT categoria (#PCDATA)>
    <!ELEMENT año (#PCDATA)>
    
    <!-- Instrumentos, al menos uno -->
    <!ELEMENT instrumentos (instrumento+)>
    <!ELEMENT instrumento (#PCDATA)>
    
    <!-- Descripción del artista -->
    <!ELEMENT descripcion (#PCDATA)>
]>


<informacion>

    <premios>
        <premio>
            <nombre>Grammy</nombre>
            <categoria>Mejor Álbum</categoria>
            <año>2020</año>
        </premio>
        <premio>
            <nombre>MTV Music Award</nombre>
            <categoria>Mejor Video Musical</categoria>
            <año>2021</año>
        </premio>
    </premios>


    <sitio_web>https://www.camiloperez.com</sitio_web>

    <caracteristicas_fisicas>
        <altura>1.80</altura>
        <ojos>Azules</ojos>
        <cabello>Negro</cabello>
    </caracteristicas_fisicas>

    <instrumentos>
        <instrumento>Guitarra</instrumento>
        <instrumento>Piano</instrumento>
    </instrumentos>

    <descripcion> Es un musico reconocido por todo el pais que ha hecho grandes composiciones 
    </descripcion>
</informacion>

*/






