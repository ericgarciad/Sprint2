use optics;

INSERT INTO 
employee (employee_id, name)
VALUES 
(1, 'Eric'),
(2, 'Jorge'),
(3, 'Maria');

INSERT INTO 
customer (customer_id, name, postal_adress, phone, email, customer_recommended)
VALUES 
(1, 'Jonh', 'calle loreto, 5, 1º 1a', 632632632,'jonh@gmail.com', NULL),
(2, 'Pepe', 'calle santa eulalia, 4, 1º 1a', 654654654, 'pepe@gmail.com', 1),
(3, 'Marta', 'Avenida Madrid, 25, 4º 2a', 636975874, 'Maria@gmail.com', 2);

INSERT INTO 
provider (provider_id, name, street, number, floor, door, city, postal_code, country, phone, fax, nif)
VALUES 
(1, 'Ray Ban', 'Avenida Madrid', '10-15', 'entresuelo', '1a', 'Barcelona', '08032', 'España', 933554179, 933665878, 45846542),
(2, 'Dolce & Gabbana', 'Plaça catalunya', '225', 'planta 4', '3a', 'Barcelona', '08028', 'España', 938745123, 932145876, 47142445),
(3, 'Dior', 'Gran Via de les Corts Catalanes', '465', 'entresuelo', '2a', 'Barcelona', '08014', 'España', 933225478, 932668741, 47945631);

INSERT INTO 
brand (brand_id, name, provider_id)
VALUES 
(1, 'Ray Ban Police', 1),
(2, 'Dolce & Gabbana', 2),
(3, 'Dior', 3);

INSERT INTO 
frame (frame_id, frame_type)
VALUES 
(1, 'pasta'),
(2, 'metalica'),
(3, 'flotant');

INSERT INTO 
color_frame (frame_color_id, color_frame)
VALUES 
(1, 'negro'),
(2, 'blanco'),
(3, 'metal');

INSERT INTO 
color_crystal (crystal_color_id, color_crystal)
VALUES 
(1, 'verde'),
(2, 'oscuro'),
(3, 'transparente');

INSERT INTO 
glasses (glasses_id, brand_id, graduation_left, graduation_right, frame_id, frame_color_id, crystal_color_id, price)
VALUES 
(1, 1, 2.4, 2.1, 1, 1, 1, 99.5),
(2, 2, 0.4, 0.5, 2, 2, 2, 110.5),
(3, 3, 1.4, 1.1, 3, 3, 3, 209.5);


INSERT INTO 
orders (order_id, customer_id, employee_id, total_price)
VALUES 
(1, 1, 1, 99.5),
(2, 2, 2, 210),
(3, 3, 3, 419.5);

INSERT INTO 
product_order (glasses_id, order_id, quantity, price)
VALUES 
(1, 1, 1, 99.5),
(1, 2, 1, 99.5),
(2, 2, 1, 110.5),
(1, 3, 1, 99.5),
(2, 3, 1, 110.5),
(3, 3, 1, 209.5);
