create database ECOM;
use ECOM;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    Email VARCHAR(100),
    password VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, name, description, price, stockQuantity)
VALUES
    (1, 'Laptop', 'High-performance laptop', 800.00, 10),
    (2, 'Smartphone', 'Latest smartphone', 600.00, 15),
    (3, 'Tablet', 'Portable tablet', 300.00, 20),
    (4, 'Headphones', 'Noise-canceling', 150.00, 30),
    (5, 'TV', '4K Smart TV', 900.00, 5),
    (6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
    (7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
    (8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
    (9, 'Blender', 'High-speed blender', 70.00, 20),
    (10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

INSERT INTO customers (customer_id, firstName, lastName, Email, password)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', 'password1'),
    (2, 'Jane', 'Smith', 'janesmith@example.com', 'password2'),
    (3, 'Robert', 'Johnson', 'robert@example.com', 'password3'),
    (4, 'Sarah', 'Brown', 'sarah@example.com', 'password4'),
    (5, 'David', 'Lee', 'david@example.com', 'password5'),
    (6, 'Laura', 'Hall', 'laura@example.com', 'password6'),
    (7, 'Michael', 'Davis', 'michael@example.com', 'password7'),
    (8, 'Emma', 'Wilson', 'emma@example.com', 'password8'),
    (9, 'William', 'Taylor', 'william@example.com', 'password9'),
    (10, 'Olivia', 'Adams', 'olivia@example.com', 'password10');


INSERT INTO orders (order_id, customer_id, order_date, total_price, shipping_address)
VALUES
    (1, 1, '2023-01-05', 1200.00, '123 Main St, City'),
    (2, 2, '2023-02-10', 900.00, '456 Elm St, Town'),
    (3, 3, '2023-03-15', 300.00, '789 Oak St, Village'),
    (4, 4, '2023-04-20', 150.00, '101 Pine St, Suburb'),
    (5, 5, '2023-05-25', 1800.00, '234 Cedar St, District'),
    (6, 6, '2023-06-30', 400.00, '567 Birch St, County'),
    (7, 7, '2023-07-05', 700.00, '890 Maple St, State'),
    (8, 8, '2023-08-10', 160.00, '321 Redwood St, Country'),
    (9, 9, '2023-09-15', 140.00, '432 Spruce St, Province'),
    (10, 10, '2023-10-20', 1400.00, '765 Fir St, Territory');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_amount)
VALUES
    (1, 1, 1, 2, 1600.00),
    (2, 1, 3, 1, 300.00),
    (3, 2, 2, 3, 1800.00),
    (4, 3, 5, 2, 1800.00),
    (5, 4, 4, 4, 600.00),
    (6, 4, 6, 1, 50.00),
    (7, 5, 1, 1, 800.00),
    (8, 5, 2, 2, 1200.00),
    (9, 6, 10, 2, 240.00),
    (10, 6, 9, 3, 210.00);

	  
	  ALTER TABLE order_items
ADD item_amount DECIMAL(10, 2);

INSERT INTO cart (cart_id, customer_id, product_id, quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 3, 1),
    (3, 2, 2, 3),
    (4, 3, 4, 4),
    (5, 3, 5, 2),
    (6, 4, 6, 1),
    (7, 5, 1, 1),
    (8, 6, 10, 2),
    (9, 6, 9, 3),
    (10, 7, 7, 2);

-- QNUM 1

UPDATE products
SET price = 800.00
WHERE product_id = 7;

-- QNUM 2

DELETE FROM cart
WHERE customer_id = 10;

-- QNUM 3

SELECT *
FROM products
WHERE price < 100.00;

-- QNUM 4

SELECT *
FROM products
WHERE stockQuantity > 5;

--QNUM 5

SELECT *
FROM orders
WHERE total_price BETWEEN 500.00 AND 1000.00;

-- QNUM 6

SELECT *
FROM products
WHERE name LIKE '%r';

--QNUM 7

SELECT *
FROM cart
WHERE customer_id = 5;

--QNUM 8

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2023;

--QNUM 9

SELECT product_id, MIN(stockQuantity) AS min_stock_quantity
FROM products
GROUP BY product_id;

--QNUM 10

SELECT customer_id, SUM(total_price) AS total_amount_spent
FROM orders
GROUP BY customer_id;

-- QNUM 11

SELECT customer_id, AVG(total_price) AS average_order_amount
FROM orders
GROUP BY customer_id;

-- QNUM 12

SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;

-- QNUM 13

SELECT customer_id, MAX(total_price) AS max_order_amount
FROM orders
GROUP BY customer_id;

-- QNUM 14

SELECT c.customer_id, c.firstName, c.lastName, c.Email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName, c.Email
HAVING SUM(o.total_price) > 1000;

--QNUM 15

SELECT *
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM cart
);

--QNUM 16

SELECT *
FROM customers
WHERE NOT EXISTS (
    SELECT 1
    FROM orders
    WHERE orders.customer_id = customers.customer_id
);

-- QNUM 17
select *,price *100 / (select SUM(price)from products ) as percentage_of_revenue
from products;


-- QNUM 18

SELECT *
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM products
    WHERE stockQuantity <= 5
);

-- QNUM 19

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE total_price > 1000
);

-- THE END








