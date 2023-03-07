
#  PAIR PROGRAMMING INSERCIÓN DE DATOS
-- -------------------------------------

USE tienda_zapatillas; 

# 1. Lo primero que vamos a hacer es insertar datos en nuestra BBDD con los siguientes datos (EXTRAER DATOS DEL GITBOOK):
INSERT INTO zapatillas (modelo, color, marca, talla)
	VALUES ('XQYUN', 'Negro', 'Nike', 42),
    ('UOPMN','Rosas', 'Nike', 39),
    ('OPNYT', 'Verdes', 'Adidas', 35);

#Para insertar los datos tal cual aparecen en el ejercicio, vamos a modificar la tabla:
ALTER TABLE empleados
	MODIFY COLUMN salario FLOAT; 

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
	VALUES ('Laura', 'Alcobendas', 25987, '2010-09-03'),
    ('Maria','Sevilla', NULL, '2001-04-11'),
    ('Ester', 'Oviedo', 30165.98 , '2000-11-29');
    
INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
	VALUES ('Monica', 1234567289 , 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', 28176),
    ('Lorena',289345678, 'lorena@email.com', 'Calle Alegría', 'Barcelona', 'Barcelona', 12346),
    ('Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);
    
INSERT INTO facturas (numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)
	VALUES (123, '2001-12-11', 1, 2, 1, 54.98),
			(1234, '2005-05-23', 1 , 1, 3, 89.91),
			(12345, '2015-09-18', 2, 3, 3, 76.23); 

# 2. De nuevo nos hemos dado cuenta que hay algunos errores en la inserción de datos. En este ejercicios los actualizaremos para que nuestra BBDD este perfectita.

#Desactivación MODO SEGURO

SET SQL_SAFE_UPDATES = 0;
	# Tabla zapatillas
	# En nuestra tienda no vendemos zapatillas Rosas... ¿Cómo es posible que tengamos zapatillas de color rosa? 🤔 En realidad esas zapatillas son amarillas.

UPDATE zapatillas
	SET color = 'Amarillo'
	WHERE color = 'Rosas';

	# Tabla empleados
	# Laura se ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña.

UPDATE empleados
	SET tienda = 'A Coruña'
	WHERE tienda = 'Alcobendas';

	# Tabla clientes
	# El Numero de telefono de Monica esta mal!!! Metimos un digito de más. En realidad su número es: 123456728
    
UPDATE clientes
	SET numero_telefono = 123456728
	WHERE id_cliente =1;

	# Tabla facturas
	# El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,91.
    
UPDATE facturas
	SET total = 89.91
	WHERE id_zapatilla = 2; 