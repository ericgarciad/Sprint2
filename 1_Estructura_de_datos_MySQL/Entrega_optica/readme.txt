Explicación acerca del modelo de la Óptica

En la tabla proveedor he decidido usar el NIF del proveedor como identificador único
ya que no existe ningun NIF igual.

He decidido crear una relación de proveedor a gafas de 1 a muchos porque se especifica,
segun mi parecer, que la óptica ha quiere saber quién es el proveedor de cada una
de las gafas. 
Además se habla de que las gafas de una marca se comprarán a un proveedor y que también
se pueden comprar muchas gafas de diferentes marcas a 1 proveedor.

La tabla gafas he añadido un campo enumeration para especificar la montura en función
de (flotant, pasta o metalica)
Los campos de precio, graduiación son FLOAT porque pueden ser valores decimales.
demás he añadido un campo booleano "TINYINT" para especificar si la gafa que consultamos
se ha venido (1) o no (0).


Respecto a los clientes, he usado el teléfono como identificador único ya que no hay
ningun teléfono igual. También he añadido un campo booleano para saber si el cliente
ha sido recomendado por otro cliente (campo is_recommended (0), (1)) y si se ha 
recomendado se añade el teléfono del cliente que le ha recomendado en el campo
(customer_recommended)

Respecto a los empleados he añadido los campos id y nombre para poder identificarlos
y poder crear la relación entre cliente y empleado (1 empleado puede tener muchos
clientes) 

Para saber que empleado ha vendido cada gafa, he creado la relación muchos a muchos
entre empleado y gafas, ya que basandome en la vida real, muchos empleados tienen
a su disposición muchas gafas y muchas gafas tienen muchos empleados que las pueden 
vender.
De este modo, he creado la tabla intermedia en la relación de muchos a muchos
(employee_has_sold_glasses) para especificar que empleado ha venidido una gafa
identificada por su id.

Respecto a los nombres de las variables, me he basado en los documentos proporcionados
por la asignatura en los quales se escriben en minúscula, con guión si es una palabra
compuesta, se añade en todas las tablas la fecha de creación y modificación de fechas
entre otros...)
