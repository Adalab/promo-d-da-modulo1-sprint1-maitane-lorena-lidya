#El día de hoy vamos a realizar ejercicios en los que practicaremos sentencias de SQL sencillas 
#usando los operados SELECT, FROM y WHERE.
#Este tipo de sentencias nos servirán para ir extrayendo información de la base de datos e ir la conociendo.

##1)Conociendo a las empleadas:
	#El objetivo de toda buena jefa (o trabajadora) de una empresa debería ser conocer bien a sus compañeras. Para ello,
	#vamos a diseñar una consulta para obtener una lista con los datos de las empleadas/os de Northwind. Dicha consulta tiene que tener
	#los campos employee_id,_last name y first_name.

##2)Conociendo los productos más baratos:
	#Supongamos que en nuestro primer día en la empresa nos cuentan que la misma se encuentra en
	#un momento de reestructuración de su negocio.Nuestras compañeras nos comentan que en estos momentos Northeind
	#tiene demasiados productos a la venta, algunos de ellos con escaso éxito entre las clientas.
	#Nuestro primer encargo es ver aquellos productos(tabla products) 
	#cuyos precios por unidad se encuentren entre los 0-5 dólares, es ecir, los productos más baratos.

##3)Conociendo los productos de los que queremos maximiazar ventas:
	#Por otra parte, queremos también conocer los datos de los productos que tengan exactamente
	#un precio de 18, 19 o 20 dólares 
	#(unos valores muy concretos de precios del que la empresa quiere maximizar sus ventas en un futuro).

##4)Conociendo los productos que dan más beneficios:
	#El rango de productos que puede dar más beneficios a la empresa podría ser el de aquellos
	#con un precio mayor o igual a 15 dólares.
	#Selecciona los datos de ese rango de productos.

##5)Conociendo los productos que no tienen precio:
	#Para comprobar si los datos en la tabla products están correctos, nos interesa
	#seleccionar aquellos productos que no tengan precio, porque lo hayan dejado vacío al introducir los datos (NULL).

##6)Comparando productos:
#Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero solo aquello que tienen un IDmenor que 10 (
#(para tener una muestra significativa pero no tener que ver todos los productos existentes).

##7)Cambiando de operadores:
	#Ahora vamos a hacer la misma consulta que en el ejercicio anterior pero invirtiendo el uso 
	#de los operadores y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 10.

##8)Conociendo los países a los que vendemos:
	#A Northwind le interesa conocer los datos de los países que hacen peridos(orders)
	#para focalizar el negocio en esas regiones y al mismo tiempo crear 
	#campañas de marketing para conseguir mejorar en las otras regiones.
	#Realiza una consulta para obtener ese dato.