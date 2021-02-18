use optics;

INSERT INTO 
employee (id, name)
VALUES 
(1, 'Eric'),
(2, 'Jorge'),
(3, 'Maria');

INSERT INTO 
customer (phone, name, postal_adress, email, is_recommended, customer_recommended, employee_id)
VALUES 
(632632632, 'Jonh', 'calle loreto, 5, 1º 1a', 'jonh@gmail.com', 1, 654654654, 1 ),
(654654654, 'Pepe', 'calle santa eulalia, 4, 1º 1a', 'pepe@gmail.com', 0, null, 1 ),
(636975874, 'Marta', 'Avenida Madrid, 25, 4º 2a', 'Maria@gmail.com', 0, null, 3 );


INSERT INTO 
provider (nif, name, street, number, floor, door, city, postal_code, country, phone, fax)
VALUES 
(45846542, 'Ray Ban', 'Avenida Madrid', '10-15', 'entresuelo', '1a', 'Barcelona', '08032', 'España', 933554179, 933665878),
(47142445, 'Dolce & Gabbana', 'Plaça catalunya', '225', 'planta 4', '3a', 'Barcelona', '08028', 'España', 938745123, 932145876),
(47945631, 'Dior', 'Gran Via de les Corts Catalanes', '465', 'entresuelo', '2a', 'Barcelona', '08014', 'España', 933225478, 932668741);

INSERT INTO 
glasses (brand, graduation_left, graduation_right, frames_type, color_frame, color_crystal_left, color_crystal_right, price, is_sold, provider_nif)
VALUES 
('Ray Ban Police', 2.4, 2.1, 'pasta', 'negro', 'verde', 'verde', 99.5, 0, 45846542),
('Ray Ban Police', 2.0, 2.1, 'metalica', 'blanco', 'oscuro', 'oscuro', 110.5, 0, 45846542),
('Ray Ban Police', 1.4, 1.1, 'flotant', 'metal', 'verde', 'verde', 149.95, 1, 45846542),
('Dolce & Gabbana', 0.4, 0.5, 'pasta', 'gris', 'negro', 'negro', 165, 0, 47142445),
('Dolce & Gabbana', 2.4, 2.1, 'flotant', 'blanco hueso', 'negro', 'negro', 209.95, 0, 47142445),
('Dolce & Gabbana', 2.4, 2.1, 'pasta', 'negro', 'verde', 'verde', 99.5, 0, 47142445),
('Dior', 1.4, 1.1, 'metalica', 'gris', 'verde', 'verde', 299.5, 1, 47945631),
('Dior', 2.9, 2.7, 'pasta', 'negro', 'verde', 'verde', 199.5, 0, 47945631),
('Dior', 2.4, 2.1, 'flotant', 'negro', 'verde', 'verde', 210.5, 0, 47945631);

INSERT INTO 
employee_has_sold_glasses (employee_id, glasses_id, glasses_provider_nif)
VALUES 
(1, 1, 45846542),
(3, 4, 47142445),
(3, 8, 47945631);