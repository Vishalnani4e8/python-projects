--- Customer & Orders Analysis Project

-- Create Customers table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Insert data into Customers
INSERT INTO customers VALUES
(1, 'Rahul', 'India'),
(2, 'John', 'USA'),
(3, 'Maria', 'UK'),
(4, 'Wei', 'China');

-- Insert data into Orders
INSERT INTO orders VALUES
(101, 1, '2023-01-10', 2500),
(102, 2, '2023-01-12', 4500),
(103, 1, '2023-02-05', 3000),
(104, 3, '2023-02-10', 2000),
(105, 4, '2023-03-01', 5000);

-- 1. Total sales
SELECT SUM(amount) AS total_sales FROM orders;

-- 2. Sales by customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 3. Top spending customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 4. Country-wise sales
SELECT c.country, SUM(o.amount) AS country_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;

-- 5. Monthly sales
SELECT MONTH(order_date) AS month, SUM(amount) AS monthly_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;
