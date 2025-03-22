-- Tablas

CREATE TABLE musician(
m_no VARCHAR(20), 
m_name VARCHAR(20), 
born DATE, 
died DATE DEFAULT NULL, 
born_in VARCHAR(20), 
living_in VARCHAR(20)
);

CREATE TABLE band(
band_no VARCHAR(20), 
band_name VARCHAR(20),
band_home VARCHAR(20),
band_type VARCHAR(20), 
b_date DATE, 
band_contact VARCHAR(20)
);

CREATE TABLE performer(
perf_no VARCHAR(20) , 
perf_is VARCHAR(20), 
instrument VARCHAR(20), 
perf_type VARCHAR(20)
);

CREATE TABLE plays_in(
player VARCHAR(20), 
band_id VARCHAR(20)
);

CREATE TABLE place(
place_no VARCHAR(20),
place_town VARCHAR(20),
place_country VARCHAR(20)
);

-- Atributos, Primarias, Únicas, Foraneas

ALTER TABLE musician
MODIFY m_no NOT NULL;

ALTER TABLE musician
MODIFY m_name NOT NULL;

ALTER TABLE musician
MODIFY born NOT NULL;

ALTER TABLE musician
MODIFY born_in NOT NULL;

ALTER TABLE musician
MODIFY living_in NOT NULL;

ALTER TABLE band
MODIFY band_no NOT NULL;

ALTER TABLE band
MODIFY band_name NOT NULL;

ALTER TABLE band
MODIFY band_home NOT NULL;

ALTER TABLE band
MODIFY band_type NOT NULL;

ALTER TABLE band
MODIFY band_contact NOT NULL;

ALTER TABLE performer
MODIFY perf_no NOT NULL;

ALTER TABLE performer
MODIFY perf_is NOT NULL;

ALTER TABLE performer
MODIFY instrument NOT NULL;

ALTER TABLE performer
MODIFY perf_type NOT NULL;

ALTER TABLE plays_in
MODIFY player NOT NULL;

ALTER TABLE plays_in
MODIFY band_id NOT NULL;

ALTER TABLE place
MODIFY place_no NOT NULL;

ALTER TABLE place
MODIFY place_town NOT NULL;

ALTER TABLE place
MODIFY place_country NOT NULL;

ALTER TABLE musician
ADD PRIMARY KEY (m_no);

ALTER TABLE band
ADD PRIMARY KEY (band_no);

ALTER TABLE performer
ADD PRIMARY KEY (perf_no);

ALTER TABLE plays_in
ADD CONSTRAINT PK_plays_in PRIMARY KEY (player, band_id);

ALTER TABLE place
ADD PRIMARY KEY (place_no);

ALTER TABLE band
ADD UNIQUE (band_name);

ALTER TABLE musician 
ADD FOREIGN KEY (born_in) REFERENCES place(place_no);

ALTER TABLE musician 
ADD FOREIGN KEY (living_in) REFERENCES place(place_no);

ALTER TABLE band
ADD FOREIGN KEY (band_home) REFERENCES place(place_no);

ALTER TABLE band
ADD FOREIGN KEY (band_contact) REFERENCES musician(m_no);

ALTER TABLE performer
ADD FOREIGN KEY (perf_is) REFERENCES musician(m_no);

ALTER TABLE plays_in
ADD FOREIGN KEY (player) REFERENCES performer(perf_no);

ALTER TABLE plays_in
ADD FOREIGN KEY (band_id) REFERENCES band(band_no);

-- PoblarOK

INSERT INTO place VALUES(1,'Manchester','England');
INSERT INTO place VALUES(2,'Edinburgh','Scotland');
INSERT INTO place VALUES(3,'Salzburg','Austria');
INSERT INTO place VALUES(4,'New York','USA');
INSERT INTO place VALUES(5,'Birmingham','England');
INSERT INTO place VALUES(6,'Glasgow','Scotland');
INSERT INTO place VALUES(7,'London','England');
INSERT INTO place VALUES(8,'Chicago','USA');
INSERT INTO place VALUES(9,'Amsterdam','Netherlands');

INSERT INTO musician VALUES(1,'Fred Bloggs','02/01/1948',NULL,1,2); 
INSERT INTO musician VALUES(2,'John Smith','03/03/1950',NULL,3,4); 
INSERT INTO musician VALUES(3,'Helen Smyth','08/08/1948',NULL,4,5); 
INSERT INTO musician VALUES(4,'Harriet Smithson','09/05/1909','20/09/1980',5,6);
INSERT INTO musician VALUES(5,'James First','10/06/1965',NULL,7,7); 
INSERT INTO musician VALUES(6,'Theo Mengel','12/08/1948',NULL,7,1); 
INSERT INTO musician VALUES(7,'Sue Little','21/02/1945',NULL,8,9); 
INSERT INTO musician VALUES(8,'Harry Forte','28/02/1951',NULL,1,8); 
INSERT INTO musician VALUES(9,'Phil Hot','30/06/1942',NULL,2,7); 
INSERT INTO musician VALUES(10,'Jeff Dawn','12/12/1945',NULL,3,6); 
INSERT INTO musician VALUES(11,'Rose Spring','25/05/1948',NULL,4,5); 
INSERT INTO musician VALUES(12,'Davis Heavan','03/10/1975',NULL,5,4); 
INSERT INTO musician VALUES(13,'Lovely Time','28/12/1948',NULL,6,3); 
INSERT INTO musician VALUES(14,'Alan Fluff','15/01/1935','15/05/1997',7,2); 
INSERT INTO musician VALUES(15,'Tony Smythe','02/04/1932',NULL,8,1); 
INSERT INTO musician VALUES(16,'James Quick','08/08/1924',NULL,9,2); 
INSERT INTO musician VALUES(17,'Freda Miles','04/07/1920',NULL,9,3); 
INSERT INTO musician VALUES(18,'Elsie James','06/05/1947',NULL,8,5); 
INSERT INTO musician VALUES(19,'Andy Jones','08/10/1958',NULL,7,6); 
INSERT INTO musician VALUES(20,'Louise Simpson','10/01/1948','11/02/1998',6,6); 
INSERT INTO musician VALUES(21,'James Steeple','10/01/1947',NULL,5,6); 
INSERT INTO musician VALUES(22,'Steven Chaytors','11/03/1956',NULL,6,7); 

INSERT INTO band VALUES(1,'ROP',5,'classical','30/01/2001',11);
INSERT INTO band VALUES(2,'AASO',6,'classical',NULL,10);
INSERT INTO band VALUES(3,'The J Bs',8,'jazz',NULL,12);
INSERT INTO band VALUES(4,'BBSO',9,'classical',NULL,21);
INSERT INTO band VALUES(5,'The left Overs',2,'jazz',NULL,8);
INSERT INTO band VALUES(6,'Somebody Loves this',1,'jazz',NULL,6);
INSERT INTO band VALUES(7,'Oh well',4,'classical',NULL,3);
INSERT INTO band VALUES(8,'Swinging strings',4,'classical',NULL,7);
INSERT INTO band VALUES(9,'The Rest',9,'jazz',NULL,16);

INSERT INTO performer VALUES(1,2,'violin','classical');
INSERT INTO performer VALUES(2,4,'viola','classical');
INSERT INTO performer VALUES(3,6,'banjo','jazz');
INSERT INTO performer VALUES(4,8,'violin','classical');
INSERT INTO performer VALUES(5,12,'guitar','jazz');
INSERT INTO performer VALUES(6,14,'violin','classical');
INSERT INTO performer VALUES(7,16,'trumpet','jazz');
INSERT INTO performer VALUES(8,18,'viola','classical');
INSERT INTO performer VALUES(9,20,'bass','jazz');
INSERT INTO performer VALUES(10,2,'flute','jazz');
INSERT INTO performer VALUES(11,20,'cornet','jazz');
INSERT INTO performer VALUES(12,6,'violin','jazz');
INSERT INTO performer VALUES(13,8,'drums','jazz');
INSERT INTO performer VALUES(14,10,'violin','classical');
INSERT INTO performer VALUES(15,12,'cello','classical');
INSERT INTO performer VALUES(16,14,'viola','classical');
INSERT INTO performer VALUES(17,16,'flute','jazz');
INSERT INTO performer VALUES(18,18,'guitar','not known');
INSERT INTO performer VALUES(19,20,'trombone','jazz');
INSERT INTO performer VALUES(20,3,'horn','jazz');
INSERT INTO performer VALUES(21,5,'violin','jazz');
INSERT INTO performer VALUES(22,7,'cello','classical');
INSERT INTO performer VALUES(23,2,'bass','jazz');
INSERT INTO performer VALUES(24,4,'violin','jazz');
INSERT INTO performer VALUES(25,6,'drums','classical');
INSERT INTO performer VALUES(26,8,'clarinet','jazz');
INSERT INTO performer VALUES(27,10,'bass','jazz');
INSERT INTO performer VALUES(28,12,'viola','classical');
INSERT INTO performer VALUES(29,18,'cello','classical');

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
INSERT INTO plays_in VALUES(23,4);
INSERT INTO plays_in VALUES(25,5);
INSERT INTO plays_in VALUES(26,6);
INSERT INTO plays_in VALUES(27,6);
INSERT INTO plays_in VALUES(28,7);
INSERT INTO plays_in VALUES(28,8);
INSERT INTO plays_in VALUES(29,7);
     
-- PoblarNoOK      

INSERT INTO place VALUES(10,NULL,'England');
INSERT INTO musician VALUES(23,NULL,'01/1948',NULL,1,2); 
INSERT INTO band VALUES(1,NULL,5,'classical','30/01',11);
INSERT INTO performer VALUES(28,12,NULL,'classical');
INSERT INTO plays_in VALUES(29,7);

-- Consultas
select musician.m_name, band_name 
from musician  
join performer  on performer.perf_is = musician.m_no 
join plays_in  on plays_in.player = performer.perf_no 
join band  on band.band_no = plays_in.band_id 
order by musician.m_name 
;

--
SELECT m_name, instrument, COUNT(m_name) OVER (PARTITION BY instrument) as "instrument_players"
FROM musician JOIN performer ON perf_is = m_no 
ORDER BY m_name ;
--
WITH sub_table AS (SELECT instrument, COUNT(instrument) as total_players 
FROM performer 
GROUP BY instrument 
ORDER BY total_players) 

SELECT instrument, total_players 
FROM sub_table 
WHERE total_players = (SELECT MIN(total_players)  
FROM sub_table) ;
--
SELECT DISTINCT m_name, TO_CHAR(born, 'DD/MM/YY') as born, instrument 
FROM performer p  
JOIN musician m ON p.perf_is = m.m_no 
WHERE (died IS NULL) AND (m_name NOT LIKE '%Theo%') AND (instrument IN (SELECT instrument FROM performer p JOIN musician m ON p.perf_is = m.m_no WHERE m_name = 'Theo Mengel')) ;
--
SELECT band_name, num_members 
FROM (SELECT band_name, COUNT(band_name) as num_members 
FROM band bd 
JOIN plays_in pi ON pi.band_id = bd.band_no 
GROUP BY band_name)x 
WHERE num_members > (SELECT AVG(num_members) 
FROM (SELECT band_name, COUNT(band_name) as num_members 
FROM band bd JOIN plays_in pi ON pi.band_id = bd.band_no 
GROUP BY band_name)x) 
;
--Xpoblar

TRUNCATE TABLE plays_in;
TRUNCATE TABLE performer;
TRUNCATE TABLE band;
TRUNCATE TABLE musician;
TRUNCATE TABLE place;

-- XTablas

DROP TABLE plays_in;
DROP TABLE performer;
DROP TABLE band;
DROP TABLE musician;
DROP TABLE place;


--DROP TABLE plays_in;
--DROP TABLE performer;
--DROP TABLE band;
--DROP TABLE musician;
--DROP TABLE place;