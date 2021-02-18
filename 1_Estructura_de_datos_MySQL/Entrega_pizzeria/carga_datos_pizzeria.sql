use pizzeria;

INSERT INTO 
province (name)
VALUES 
('Barcelona'),
('Girona'),
('Tarragona');

INSERT INTO 
locality (name, province_id)
VALUES 
('Barcelona', 1),
('Hospitalet de Llobregat', 1),
('Cornella de Llobregat', 1),
('Girona', 2),
('Caldas de Malavella', 2),
('Calafell', 3);

INSERT INTO 
customer (name, surname1, surname2, adress, postal_code, locality_id, province_id, phone)
VALUES 
('Eric', 'Garcia', 'Domingo', 'Calle palacions, 5 1º 2a', 08014, 1, 1, 659669587),
('Jorge', 'Lopez', 'Cuñez', 'Calle san francisco, 45 2º 1a', 08023, 2, 1, 614258746),
('Maria', 'Gomez', 'Cifuentes', 'Calle los santos, 234 3º 2a', 08054, 6, 3, 631247958);

INSERT INTO 
shop (adress, postal_code, locality_id, province_id)
VALUES 
('Plaça espanya, 234 baixos', 08028, 1, 1),
('Avinguda Hospitalet de Llobregat, 43 baixos', 08032, 2, 1),
('Gran via de Calafell, 123 baixos', 43700, 6, 3);


INSERT INTO 
orders (type_order, quantity_pizza, quantity_burger, quantity_drink, total_price, customer_id, shop_id, shop_locality_id, shop_province_id)
VALUES 
('domicilio', 2, 0, 2, 25, 1, 1, 1, 1),
('domicilio', 1, 1, 2, 20, 2, 2, 2, 1),
('recollir', 1, 0, 0, 10, 3, 3, 6, 3);

INSERT INTO 
product (name, description, image, price, order_id)
VALUES 
('pizza', 'margarita', 'margarita.jpg', 10, 1),
('pizza', 'hawaiana', 'hawaiana.jpg', 10, 1),
('pizza', 'barbacoa', 'barbacoa.jpg', 10, 2),
('pizza', 'romana', 'romana.jpg', 10, 3),
('burger', 'cuatro quesos', 'cuatro_quesos.jpg', 5, 2),
('drink', 'agua', 'agua.jpg', 2.5, 1),
('drink', 'coca cola', 'coca_cola.jpg', 2.5, 1),
('drink', 'cerveza', 'cerveza.jpg', 2.5, 2),
('drink', 'fanta', 'fanta.jpg', 2.5, 2);

INSERT INTO 
category (name)
VALUES 
('basica'),
('elaborada');

INSERT INTO 
pizza (pizza_id, category_id)
VALUES 
(1, 1),
(2, 2),
(3, 2),
(4, 2);

INSERT INTO 
burger (burger_id)
VALUES 
(5);

INSERT INTO 
drink (drink_id)
VALUES 
(6),
(7),
(8),
(9);


INSERT INTO 
employee (name, surname1, surname2, nif, phone, type_employee, shop_id, shop_locality_id, shop_province_id)
VALUES 
('Joan', 'Carrasco', 'Lopez', '47845214F', 659557468, 'repartidor', 1, 1, 1),
('Marta', 'Fina', 'Cuque', '45214569R', 632541784, 'cuiner', 1, 1, 1),
('Laia', 'Garcia', 'Pérez', '47845124P', 632587469, 'repartidor', 2, 2, 1),
('Pepe', 'Flient', 'Cupez', '47541268J', 657852412, 'cuiner', 2, 2, 1),
('Florent', 'Liz', 'Camilo', '47852145B', 632587452, 'cuiner', 3, 6, 3),
('July', 'Frit', 'Esteban', '41278945D', 698214652, 'repartidor', 3, 6, 3);

INSERT INTO 
delivery (employee_id, order_id)
VALUES 
(1, 1),
(3, 2);