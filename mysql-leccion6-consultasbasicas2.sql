#  PAIR PROGRAMMING CONSULTAS BÁSICAS 2
-- -------------------------------------

/* Nota: veréis que os hemos propuesto bastantes ejercicios para cada sesión de pair programming. No hace falta hacerlos todos. 
Estos ejercicios están pensados para que cada día podáis hacer los primeros ejercicios aunque no hayáis terminado los últimos 
del día anterior. Cada día debéis hacer los ejercicios de este día, no los que no terminasteis el día anterior. */

/* ENUNCIADO
En esta lección de pair programming vamos a continuar trabajando sobre la base de datos Northwind.
Hoy vamos a realizar ejercicios en los que practicaremos sentencias SQL algo más avanzadas en las que introduciremos el uso de 
operadores como ORDER BY, DISTINCT, LIMIT, OFFSET, BETWEEN, IN y AS. Gracias al uso de estos operadores seréis capaces de 
seleccionar información mucho más específica de la base de datos, la cual nos va a servir para realizar un análisis más en 
profundidad del negocio de la empresa. */

/* EJERCICIOS 
   1. Conociendo el tipo de productos que vendemos en Northwind:
Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios. */

SELECT product_name, unit_price
	FROM products
    ORDER BY product_id
    LIMIT 10;

/* 2. Ordenando los resultados:
Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.*/

SELECT product_name, unit_price
	FROM products
    ORDER BY product_id DESC
    LIMIT 10;

/* 3. Que pedidos tenemos en nuestra BBDD:
Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. Nos interesa conocer qué pedidos 
distintos hemos tenido (eliminando entradas duplicadas según su ID en la tabla order_details). */

SELECT DISTINCT order_id
	FROM order_details;

/* 4. Los dos primeros pedidos:
Como el número de pedidos es demasiado alto para visualizarlo de manera práctica en la consulta anterior, vamos a limitar los 
resultados sólo a los 2 primeros pedidos para verlos más en detalle. Sin embargo, en la tabla OrderDetails pueden existir varios 
registros para cada pedido, por lo que no nos servirá con un uso normal del comando LIMIT. */

SELECT DISTINCT order_id
	FROM order_details
    LIMIT 2;
    
/* 5. Qué pedidos han gastado más:
Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer los 3 pedidos que 
han supuesto un mayor coste económico total para la empresa. Calcúlalo y dale el alias ImporteTotal. Nota: Utiliza unit_price y 
quantity para calcular el importe total. */

SELECT order_id AS ImporteTotal
	FROM order_details
    ORDER BY (unit_price * quantity) DESC
    LIMIT 3;
       
/* 6. Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking:
Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados entre 
la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal.*/
# Entendemos que el listado que se pide es incluyendo las posiciones 5 y 10.

SELECT order_id
	FROM order_details
    ORDER BY (unit_price * quantity) DESC
    LIMIT 6
    OFFSET 4;

/* 7. Qué categorías tenemos en nuestra BBDD:
De cara a ver cómo de diversificado está el negocio, se nos solicita una lista de las categorías que componen los tipos de pedido 
de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".*/

SELECT category_name AS NombreDeCategoria
	FROM categories;
    

/* 8. Selecciona envios con retraso:
Nos hacen llegar desde la dirección la preocupación acerca del cumplimiento de las fechas de envío. Últimamente se están dando 
retrasos en muchas entregas y por ello se busca realizar la acción preventiva de enviar los paquetes con varios días adicionales 
de antelacion. Para comenzar a planear esos envíos anticipados, nos piden conocer cuál sería la fecha de envío (ShippedDate) de 
los pedidos almacenados en la base de datos, si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva fecha renombrada 
como FechaRetrasada.
💡 Pista 💡 Para realizar lo anterior, busca documentación de la función DATE_ADD para MySQL.*/

SELECT order_id, shipped_date, DATEADD(day,5,shipped_date) AS FechaRetrasada  
	FROM orders;  
    
SELECT SalesOrderID  
	,OrderDate   
	,DATEADD(day,2,OrderDate) AS PromisedShipDate  
FROM Sales.SalesOrderHeader; 
    
SELECT order_id, shipped_date
	FROM orders
	WHERE DATE_ADD(CURDATE(),INTERVAL 5 DAY);

SELECT order_id, shipped_date AS FechaRetrasada
	FROM orders
    DATE_ADD shipped_date INTERVAL 5 DAY;
    
SELECT DATE_ADD("d", 5, @shipped_date) AS FechaRetrasada FROM orders;

SELECT 'day' (day, 5, @shipped_date)FROM orders;

SELECT DateAdd("YYYY",1,[DateofSale]) AS Expr1 FROM ProductSales; 

 SELECT order_id, shipped_date AS FechaRetrasada
	FROM orders
    WHERE DATE_ADD (shipped_date, INTERVAL 5 DAY); 
    

/* 9. Selecciona los productos más rentables:
Gracias a un análisis realizado en los últimos meses en la empresa, se ha comprobado que el rango de productos que puede dar más 
beneficios parece ser el de aquellos con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. Selecciona los 
datos de ese rango de productos usando el operador BETWEEN.*/

SELECT *
	FROM products
    WHERE unit_price BETWEEN 15 AND 50;

/* 10. Selecciona los productos con unos precios dados:
Queremos conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares (un rango muy concreto de 
precios del que la empresa quiere maximizar sus ventas en un futuro). Usa IN para conseguirlo de manera eficiente. */

SELECT *
	FROM products
    WHERE unit_price IN (18, 19, 20);
