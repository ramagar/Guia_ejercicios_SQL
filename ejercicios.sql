-- Active: 1693360576251@@localhost@3306@world
###1###
SELECT code, name, continent, population FROM country;

###2###
SELECT DISTINCT language FROM countrylanguage;

###3###
SELECT name AS Nombre, population AS Poblacion FROM city; 

###4###
SELECT name AS Nombre, GNP AS 'Producto Bruto Nacional', GNPOld AS 'Producto Bruto Nacional Anterior', (GNP - GNPOld) AS Diferencia FROM country;

###5###
SELECT name AS Nombre, Population AS Poblacion, SurfaceArea AS Superficie, (Population/SurfaceArea) AS 'Densidad Poblacional (km²)' FROM country;

###6###
SELECT * FROM country ORDER BY Population ASC;

###7###
SELECT LANGUAGE FROM countrylanguage ORDER BY Language ASC;

###8###
SELECT name, population FROM city ORDER BY Population ASC LIMIT 20;

###9###
SELECT code, name, indepyear FROM country ORDER BY `IndepYear` DESC;

###10###
SELECT name, continent FROM country ORDER BY LifeExpectancy DESC, SurfaceArea ASC LIMIT 100; 

###11###
SELECT * FROM country WHERE Population = 0;

###12###
SELECT * FROM country c WHERE LifeExpectancy > 75 ORDER BY LifeExpectancy ASC;

###13###
SELECT * FROM country c WHERE IndepYear >= 1850 AND GovernmentForm = 'Constitutional Monarchy';

###14###
SELECT * FROM country c 
WHERE Continent = 'Europe' 
ORDER BY GNP 
DESC LIMIT 10;

###15###
SELECT * FROM country c WHERE Name = LocalName;

###16###
SELECT * FROM  country c WHERE IndepYear >= 1950;

###17###
SELECT * FROM country c 
WHERE Continent IN ('Europe', 'Asia', 'South America');

###18###
SELECT * FROM country c 
WHERE Continent != 'Africa';

###19###
SELECT * FROM city c 
WHERE CountryCode = 'ARG' AND District != 'Buenos Aires';

###20###
SELECT * FROM city c 
WHERE Population BETWEEN 125000 AND 130000;

###21###
SELECT * FROM country c 
WHERE IndepYear IS NULL;

###22###
SELECT * FROM country c 
WHERE GNPOld IS NULL AND LifeExpectancy IS NULL;

###23###
SELECT * FROM country c 
WHERE Name LIKE 'A%';

###24###
SELECT * FROM country c 
WHERE Name LIKE '% %';

###25###
SELECT * FROM city c 
WHERE District LIKE '%-%' OR Name LIKE '%-%';

###26###
SELECT country.Name AS 'Pais', city.Name AS 'Capital'
FROM country
INNER JOIN city 
ON country.Capital = city.ID
WHERE country.Continent = 'South America';

###27###
SELECT country.Code, city.Name, city.Population
FROM country
INNER JOIN city
ON country.Code = city.CountryCode 
WHERE country.LifeExpectancy > 80;

###28###
SELECT country.Name, city.Name AS 'Capital'
FROM country
INNER JOIN city
ON country.Capital = city.ID 
WHERE country.GovernmentForm = 'Federal Republic';

###29###
SELECT country.Name, countrylanguage.`Language`  
FROM countrylanguage
INNER JOIN country
ON country.Code = countrylanguage.CountryCode 
WHERE country.Population BETWEEN 1000000 AND 3000000 
AND countrylanguage.IsOfficial = 'T';

###30###
SELECT country.Code, country.LocalName, country.Region 
FROM country
INNER JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.`Language` = 'Spanish';

###31###
SELECT country.Name AS Pais, city.Name AS Capital 
FROM country
INNER JOIN city
ON country.Capital = city.ID  
WHERE city.Population > country.Population / 2;

###32###
SELECT c.Name, c.SurfaceArea 
FROM country c 
INNER JOIN city c2 
ON c.Capital = c2.ID 
WHERE c2.District = c2.Name AND c.Continent = 'Africa';

###33###
SELECT country.Name AS Pais, city.Name AS Capital, country.IndepYear 
FROM country
INNER JOIN city
ON country.Capital = city.ID
WHERE country.IndepYear IS NOT NULL
ORDER BY country.IndepYear 
LIMIT 20;

###34###
SELECT city.Name, countrylanguage.`Language`
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
INNER JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T' 
AND countrylanguage.`Language` NOT IN (
'Spanish', 'English', 'Portuguese', 'Italian', 'French', 'German'
);

###35###
SELECT city.Name AS Ciudad, city.Population AS Poblacion, country.name AS Pais
FROM city
INNER JOIN country
ON city.CountryCode = country.Code 
INNER JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE country.Continent = 'Europe'
AND countrylanguage.`Language` = 'English'
ORDER BY city.Population DESC
LIMIT 10;

###36###
SELECT sum(country.Population), max(country.Population), min(country.Population),
avg(country.Population), count(country.Population)  
FROM country;

###37###
SELECT country.Continent, sum(country.Population), max(country.Population), min(country.Population),
avg(country.Population) 
FROM country
GROUP BY country.Continent
ORDER BY sum(country.Population) DESC;

###38###
SELECT country.Continent , count(country.Name) 
FROM country
GROUP BY country.Continent
ORDER BY count(country.Name) DESC;

###39###
SELECT country.Code, country.Population
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
GROUP BY country.code
ORDER BY country.Population DESC;

###40###
SELECT countrylanguage.`Language`, MIN(countrylanguage.Percentage)
FROM countrylanguage
GROUP BY countrylanguage.`Language`
ORDER BY MIN(countrylanguage.Percentage) DESC;

###41###
SELECT country.GovernmentForm, round(avg(country.Population)) 
FROM country
WHERE country.Continent = 'Europe'
GROUP BY country.GovernmentForm
ORDER BY avg(country.Population) DESC;

###42###
SELECT country.Region, round(avg(country.LifeExpectancy)) AS LifeExpectancy
FROM country
GROUP BY country.Region
ORDER BY LifeExpectancy DESC
LIMIT 10;

###43###
SELECT city.District, count(city.Name) Ciudades, sum(city.Population) Poblacion 
FROM city
WHERE city.Population > 500000
GROUP BY city.district
ORDER BY Ciudades DESC, Poblacion DESC
LIMIT 10;

###44###
SELECT country.Name, count(city.Name) CantidadDeCiudades
FROM country
INNER JOIN city
ON country.Code = city.CountryCode 
WHERE country.Region = 'Caribbean'
GROUP BY country.Name 
ORDER BY CantidadDeCiudades DESC;

###45###
SELECT countrylanguage.`Language`, count(country.Name) CantidadDePaises
FROM countrylanguage
INNER JOIN country
ON countrylanguage.CountryCode = country.Code 
WHERE countrylanguage.IsOfficial  = 'T'
GROUP BY countrylanguage.`Language`
ORDER BY CantidadDePaises DESC;

###46###
SELECT country.IndepYear, count(country.Name) CantidadDePaises
FROM country
WHERE country.IndepYear IS NOT NULL
GROUP BY country.IndepYear
HAVING CantidadDePaises > 1
ORDER BY CantidadDePaises DESC;

###47###
SELECT country.Name, count(countrylanguage.`Language`) AS Idiomas
FROM country
INNER JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode 
GROUP BY country.Name 
HAVING Idiomas BETWEEN 3 AND 5
ORDER BY Idiomas DESC;

###48###
SELECT city.District, country.Name, sum(city.Population) Poblacion
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
WHERE city.District != '–' #El ejercicio NO lo pide pero lo puse para filtrar datos sin distrito
GROUP BY city.District, country.Name 
HAVING Poblacion < 10000
ORDER BY poblacion DESC;

###49###
SELECT country.Region, round(avg(country.Population/country.SurfaceArea)) PromedioDensidadPoblacional
FROM country
GROUP BY country.Region 
HAVING PromedioDensidadPoblacional > max(country.Population/country.SurfaceArea)/2
ORDER BY PromedioDensidadPoblacional DESC; 

###50###
SELECT countrylanguage.`Language`, round(avg(countrylanguage.Percentage), 2) Porcentaje
FROM countrylanguage
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY countrylanguage.`Language`
HAVING Porcentaje <= 9
ORDER BY Porcentaje DESC;

###51###
INSERT INTO clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail,
	movil, domicilio, barrio, nacionalidad)
VALUES ('12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01',
	'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay');
	
###52###
INSERT INTO clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail,
	movil, domicilio, barrio, nacionalidad)
VALUES ('17278290', 'Florencia', 'Santos', 'MUJER', '1963-07-12', 'flor.santos@ma1l.com',
	'1148434346', 'Piran 3015', 'Villa Urquiza', 'Argentina'); #ETC
	
###53###
INSERT INTO clientes (dni, nombre, apellido, genero, fecha_nacimiento, mail,
	movil, domicilio, barrio, nacionalidad)
VALUES ('36427254', 'María Sol', 'González', 'MUJER', '1992-08-15', 'ma.gon54@gma1l.com',
	'1136782013', 'Gurruchaga 243', 'Villa Crespo', 'Argentina');

###54###
UPDATE clientes
SET apellido = 'Chaves'
WHERE id_cliente = '85';

#Corroboramos
SELECT * FROM clientes c 
WHERE id_cliente  = '85';

###55###
UPDATE clientes 
SET dni = concat('0', dni) 
WHERE LENGTH(dni) = 7;

###56###
UPDATE clientes
SET nombre = 'Nicolás'
WHERE nombre = 'Nicolas';

SELECT * FROM clientes
WHERE nombre = 'Nicolás'
	OR nombre = 'Nicolas';

###57###
UPDATE clientes
SET apellido = upper(apellido)
WHERE nacionalidad != 'Argentina';

###58###
DELETE FROM clientes
WHERE id_cliente = 9800;

###59###
DELETE FROM clientes 
WHERE mail LIKE '%z0h0%';

###60###
DELETE FROM clientes
WHERE clientes.barrio = 'Palermo';

CREATE TABLE IF NOT EXISTS nivel(
nivel_id int AUTO_INCREMENT PRIMARY KEY,
nivel VARCHAR (3)
);

CREATE TABLE IF NOT EXISTS genero(
genero_id int AUTO_INCREMENT PRIMARY KEY,
genero varchar (20)
);

CREATE TABLE IF NOT EXISTS instructores(
instructor_id int AUTO_INCREMENT PRIMARY KEY,
apellido varchar (20),
nombre varchar (20),
email varchar (45)
);

CREATE TABLE IF NOT EXISTS alumnos(
legajo int AUTO_INCREMENT PRIMARY KEY,
apellido varchar (50),
nombre varchar (50),
email varchar (50),
genero_id int,
nota_1p decimal (4, 2),
nota_2p decimal (4, 2),
nota_final decimal (4, 2),
nivel_id int,
instructor_id int,
FOREIGN KEY (genero_id) REFERENCES genero (genero_id),
FOREIGN KEY (nivel_id) REFERENCES nivel (nivel_id),
FOREIGN KEY (instructor_id) REFERENCES instructores (instructor_id)
);






