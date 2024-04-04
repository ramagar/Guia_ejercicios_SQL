---1---
SELECT code, name, continent, population FROM country;

---2---
SELECT DISTINCT language FROM countrylanguage;

---3---
SELECT name AS Nombre, population AS Poblacion FROM city; 

---4---
SELECT name AS Nombre, GNP AS 'Producto Bruto Nacional', GNPOld AS 'Producto Bruto Nacional Anterior', (GNP - GNPOld) AS Diferencia FROM country;

---5---
SELECT name AS Nombre, Population AS Poblacion, SurfaceArea AS Superficie, (Population/SurfaceArea) AS 'Densidad Poblacional (km²)' FROM country;

---6---
SELECT * FROM country ORDER BY Population ASC;

---7---
SELECT LANGUAGE FROM countrylanguage ORDER BY Language ASC;

---8---
SELECT name, population FROM city ORDER BY Population ASC LIMIT 20;

---9---
SELECT code, name, indepyear FROM country ORDER BY `IndepYear` DESC;

---10---
SELECT name, continent FROM country ORDER BY LifeExpectancy DESC, SurfaceArea ASC LIMIT 100; 




