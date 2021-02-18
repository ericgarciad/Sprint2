He creado el modelo pizzeria mediante MySQL Workbench y lo he 
relacionado como especifica en el texto segun mi perspectiva.

Quiero destacat que las fechas data/hora que se piden se registran
automáticamente al insertar un registro porque de este modo al
realizar un pedido se sabe la fecha y hora exactas.

Respecto a los productos he pretendido hacer una especie de 
herencia pero en MySQL Workbench no permite realizar herencia
en el modelo y lo que he hecho ha sido crear una tabla
producto con toda la información necesaria para identificar
a un producto que será la misma para pizza, hamburguesa y 
bebida y mi intenció era que tanti pizza como hamburguesa
y bebida heredaran de producto para tener todos los valores pero
lo que he hecho ha sido una relación hacia cada uno de los tipos
conteniendo los id de cada producto. De esto modo, me ha permitido
poder relacionar la tabla categoria con pizza que se pide.

Respecto a Tienda, para obtener localidad y provincia, he relacionado
las tablas d e localidad y provincia con Tienda al igual que con
Cliente asi tengo acceso a la información de la población a la
que pertenecen.

Respecto a los pedidos de reparto a domicilio, lo que he hecho
ha sido crear una tabla llamada Delivery que se relaciona
con Orders y con Empleado para tener el registro de qué 
repartidor ha sido el que ha entregado un pedido y la fecha
y hora en la que ha sido.