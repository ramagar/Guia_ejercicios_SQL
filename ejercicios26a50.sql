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
