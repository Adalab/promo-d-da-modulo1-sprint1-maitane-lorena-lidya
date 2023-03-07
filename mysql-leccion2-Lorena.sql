 CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;
CREATE TABLE IF NOT EXISTS `zapatillas`(
	id_zapatilla INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL);
CREATE TABLE IF NOT EXISTS `clientes`(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL); 
CREATE TABLE IF NOT EXISTS `empleados`(
	id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL);
CREATE TABLE IF NOT EXISTS `Facturas`(
	id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL);
    
ALTER TABLE `Facturas`(
	ADD CONSTRAINT `fk_Facturas_clientes`
		FOREIGN KEY (id_clientes),
        REFERENCES `clientes`(id_cliente),
	ON DELETE CASCADE ON UPDATE CASCADE);
ALTER TABLE `Facturas`(
	ADD CONSTRAINT `fk_Facturas_empleados`
		FOREIGN KEY (id_empleado),
        REFERENCES `empleados` (id_empleado),
         ON DELETE CASCADE ON UPDATE CASCADE);
 ALTER TABLE `zapatillas`(        
	ADD CONSTRAINT `fk_Facturas_zapatillas`
		FOREIGN KEY(id_zapatilla),
        REFERENCES `zapatillas`(id_zapatilla),
        ON DELETE CASCADE ON UPDATE CASCADE);
