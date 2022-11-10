DROP DATABASE IF EXISTS planes;
CREATE DATABASE planes;
USE planes;

DROP TABLE IF EXISTS accidentes;
CREATE TABLE IF NOT EXISTS accidentes (
	fecha						DATE,
    operador					VARCHAR(100),
    todos_abordo				INT,
    pasajeros_abordo			INT,
    tripul_abordo				INT,
    tot_fallecidos				INT,
	pasajeros_fallecidos		INT,
	tripul_fallecidos			INT,
	ground						INT,
	summary						VARCHAR(3000),
	tipo_vuelo					VARCHAR(50),
	tipo_avion					VARCHAR(50),
	intencional					INT,
    pais						VARCHAR(50),
    lat							DECIMAL(25,20),
    lon							DECIMAL(25,20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:/files/PI03/datos_mysql.csv'
INTO TABLE accidentes 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS calendario;
CREATE TABLE IF NOT EXISTS calendario (
	fecha		DATE,
    dia			INT,
    mes			INT,
	año			INT,
    decada		INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:/files/PI03/calendar.csv'
INTO TABLE calendario 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS pasajeros;
CREATE TABLE IF NOT EXISTS pasajeros (
	año				INT,
    cant_mill		DECIMAL(25,20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:/files/PI03/pasajeros.csv'
INTO TABLE pasajeros
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;