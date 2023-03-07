
#  PAIR PROGRAMMING ALTERACIÓN DE TABLAS
-- -------------------------------------

/*ENUNCIADO
Seguimos trabajando con la BBDD que creamos en la sesión de pair programming anterior.
Revisando nuestras tablas nos hemos dado cuenta que algunas tienen algunos errores.
En algunas tablas nos faltan columnas, en otras hemos introducido columnas de más o incluso nos hemos equivocado a la hora de especificar el tipo de los datos.*/

-- Nos aseguramos de trabajar en el schema adecuado:
USE tienda_zapatillas;

/*ACTIVIDADES
En este ejercicio vamos a corregir los errores que hemos encontrado en nuestras tablas. */

-- Tabla Zapatillas: Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. Por lo tanto, debemos incluir:
	-- marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
	-- talla: es un entero, no nulo.
    
    ALTER TABLE zapatillas
		ADD COLUMN marca VARCHAR(45) NOT NULL,
		ADD COLUMN talla INT NOT NULL;
-- Tabla Empleados
	-- salario: es un entero, no nulo. Pero puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.

ALTER TABLE empleados
	MODIFY COLUMN salario FLOAT NOT NULL;
    
-- Tabla Clientes
	-- pais: la hemos incluido en la tabla pero nuestro negocio solo distribuye a España, por lo que es una columna que no hará falta. La eliminaremos.
	-- codigo_postal: es un string, pero esto no tiene mucho sentido ya que son números de longitud fija de 5 caracteres. Por lo tanto, cambiaremos el tipo a entero de longitud 5.

ALTER TABLE clientes
	DROP COLUMN pais,
	MODIFY COLUMN codigo_postal INT(5);

-- Tabla Facturas:
	-- total: madre mía!!! Se nos ha olvidado incluir el total de la cada factura generada😨!Creemos esa columna con un tipo de datos decimal.
    
    ALTER TABLE facturas
		ADD COLUMN total FLOAT;