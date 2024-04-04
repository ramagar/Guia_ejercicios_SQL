-- Active: 1693360576251@@localhost@3306@world
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