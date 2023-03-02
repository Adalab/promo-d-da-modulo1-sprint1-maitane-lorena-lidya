#  PAIR PROGRAMMING CONSULTAS BÁSICAS_1
-- -------------------------------------

#El día de hoy vamos a realizar ejercicios en los que practicaremos sentencias de SQL sencillas 
#usando los operados SELECT, FROM y WHERE.
#Este tipo de sentencias nos servirán para ir extrayendo información de la base de datos e ir la conociendo.

##1)Conociendo a las empleadas:
	#El objetivo de toda buena jefa (o trabajadora) de una empresa debería ser conocer bien a sus compañeras. Para ello,
	#vamos a diseñar una consulta para obtener una lista con los datos de las empleadas/os de Northwind. Dicha consulta tiene que tener
	#los campos employee_id, last_name y first_name.
    
SELECT employee_id, last_name, first_name
	FROM employees;   
    
    
##2)Conociendo los productos más baratos:
	#Supongamos que en nuestro primer día en la empresa nos cuentan que la misma se encuentra en
	#un momento de reestructuración de su negocio.Nuestras compañeras nos comentan que en estos momentos Northeind
	#tiene demasiados productos a la venta, algunos de ellos con escaso éxito entre las clientas.
	#Nuestro primer encargo es ver aquellos productos(tabla products) 
	#cuyos precios por unidad se encuentren entre los 0-5 dólares, es decir, los productos más baratos.
    
SELECT *
	FROM products
	WHERE unit_price >= 0 AND unit_price <= 5; 

##3)Conociendo los productos de los que queremos maximizar ventas:
	#Por otra parte, queremos también conocer los datos de los productos que tengan exactamente
	#un precio de 18, 19 o 20 dólares 
	#(unos valores muy concretos de precios del que la empresa quiere maximizar sus ventas en un futuro).
 
 SELECT *
     FROM products
     WHERE unit_price = 18 OR unit_price = 19 OR unit_price = 20; 

##4)Conociendo los productos que dan más beneficios:
	#El rango de productos que puede dar más beneficios a la empresa podría ser el de aquellos
	#con un precio mayor o igual a 15 dólares, pero menor o igual a 50.
	#Selecciona los datos de ese rango de productos.

SELECT *
	FROM products
	WHERE unit_price >= 15 AND unit_price <= 50; 

##5)Conociendo los productos que no tienen precio:
	#Para comprobar si los datos en la tabla products están correctos, nos interesa
	#seleccionar aquellos productos que no tengan precio, porque lo hayan dejado vacío al introducir los datos (NULL).

SELECT *
	FROM products
	WHERE unit_price IS NULL;

##6)Comparando productos:
#Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero solo aquello que tienen un IDmenor que 10 (
#(para tener una muestra significativa pero no tener que ver todos los productos existentes).

SELECT *
	FROM products
	WHERE unit_price < 15 AND product_id < 10;

##7)Cambiando de operadores:
	#Ahora vamos a hacer la misma consulta que en el ejercicio anterior pero invirtiendo el uso 
	#de los operadores y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 10.

SELECT *
	FROM products
	WHERE unit_price >  15 AND product_id > 10;

##8)Conociendo los países a los que vendemos:
	#A Northwind le interesa conocer los datos de los países que hacen pedidos(orders)
	#para focalizar el negocio en esas regiones y al mismo tiempo crear 
	#campañas de marketing para conseguir mejorar en las otras regiones.
	#Realiza una consulta para obtener ese dato.
    
SELECT ship_country
	FROM orders; 
    

    
    