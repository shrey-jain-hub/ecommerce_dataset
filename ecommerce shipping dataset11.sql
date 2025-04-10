CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE shipping_data (
    order_id INT PRIMARY KEY,
    customer_id INT,
    shipping_cost DECIMAL(10, 2),
    order_date DATE,
    delivery_date DATE,
    status VARCHAR(50)
);
INSERT INTO shipping_data (order_id, customer_id, shipping_cost, order_date, delivery_date, status) VALUES
(1, 101, 5.99, '2023-01-01', '2023-01-03', 'Delivered'),
(2, 102, 7.99, '2023-01-02', '2023-01-05', 'Delivered'),
(3, 103, 0.00, '2023-01-03', '2023-01-04', 'Cancelled'),
(4, 104, 3.50, '2023-01-04', '2023-01-06', 'Delivered'),
(5, 105, 10.00, '2023-01-05', '2023-01-07', 'In Transit');
SELECT * FROM shipping_data;
SELECT * FROM shipping_data WHERE status = 'Delivered';
SELECT * FROM shipping_data ORDER BY shipping_cost DESC;
SELECT status, SUM(shipping_cost) AS total_shipping_cost
FROM shipping_data
GROUP BY status;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Sample data for customers
INSERT INTO customers (customer_id, customer_name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie'),
(104, 'David'),
(105, 'Eve');

-- Join Query
SELECT s.order_id, c.customer_name, s.shipping_cost
FROM shipping_data s
INNER JOIN customers c ON s.customer_id = c.customer_id;
SELECT * FROM shipping_data
WHERE shipping_cost > (SELECT AVG(shipping_cost) FROM shipping_data);
CREATE VIEW delivered_orders AS
SELECT * FROM shipping_data WHERE status = 'Delivered';
CREATE INDEX idx_customer_id ON shipping_data(customer_id);
SELECT * FROM shipping_data WHERE shipping_cost IS NULL;