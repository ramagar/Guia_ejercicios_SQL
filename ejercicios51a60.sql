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





