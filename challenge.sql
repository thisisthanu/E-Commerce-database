create database E_commerce;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

create table Categories(
category_id INT PRIMARY KEY,
category_name VARCHAR(100)
);

create table Products(
product_id INT PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2),
category_id INT,
FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

create table Orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
status VARCHAR(50),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

create table Order_Items(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price_per_unit DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (name, email, join_date) VALUES
('Alice Johnson', 'alice@example.com', '2023-01-10'),
('Bob Smith', 'bob@example.com', '2023-01-15'),
('Charlie Brown', 'charlie@example.com', '2023-02-05'),
('Diana Prince', 'diana@example.com', '2023-02-14'),
('Ethan Hunt', 'ethan@example.com', '2023-03-01'),
('Fiona Glenn', 'fiona@example.com', '2023-03-10'),
('George Hill', 'george@example.com', '2023-04-02'),
('Hannah Ray', 'hannah@example.com', '2023-04-05'),
('Ian West', 'ian@example.com', '2023-04-15'),
('Jenna Moon', 'jenna@example.com', '2023-05-01'),
('Kevin Park', 'kevin@example.com', '2023-05-10'),
('Laura King', 'laura@example.com', '2023-05-20'),
('Mike Ford', 'mike@example.com', '2023-06-01'),
('Nina Rose', 'nina@example.com', '2023-06-05'),
('Oscar Lane', 'oscar@example.com', '2023-06-15'),
('Paula Dean', 'paula@example.com', '2023-07-01'),
('Quincy Lee', 'quincy@example.com', '2023-07-10'),
('Rita Cole', 'rita@example.com', '2023-07-15'),
('Steve Nash', 'steve@example.com', '2023-08-01'),
('Tina Wells', 'tina@example.com', '2023-08-04');

INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Home Appliances'),
(3, 'Books'),
(4, 'Fashion'),
(5, 'Sports');

INSERT INTO Products (product_id, name, price, category_id) VALUES
(1, 'Smartphone', 20000, 1),
(2, 'Laptop', 55000, 1),
(3, 'Bluetooth Speaker', 3500, 1),
(4, 'LED TV', 40000, 1),
(5, 'Washing Machine', 18000, 2),
(6, 'Refrigerator', 22000, 2),
(7, 'Microwave Oven', 8500, 2),
(8, 'Pressure Cooker', 2000, 2),
(9, 'Fiction Novel', 500, 3),
(10, 'Data Science Book', 750, 3),
(11, 'Notebook', 100, 3),
(12, 'T-Shirt', 600, 4),
(13, 'Jeans', 1200, 4),
(14, 'Sneakers', 2500, 4),
(15, 'Sports Watch', 1500, 5),
(16, 'Football', 800, 5),
(17, 'Badminton Racket', 1200, 5),
(18, 'Yoga Mat', 700, 5),
(19, 'Wireless Mouse', 900, 1),
(20, 'Tablet', 15000, 1);

INSERT INTO Orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2023-06-01', 'Delivered'),
(2, 2, '2023-06-03', 'Shipped'),
(3, 3, '2023-06-05', 'Delivered'),
(4, 4, '2023-06-06', 'Pending'),
(5, 5, '2023-06-07', 'Cancelled'),
(6, 6, '2023-06-08', 'Delivered'),
(7, 7, '2023-06-09', 'Delivered'),
(8, 8, '2023-06-10', 'Shipped'),
(9, 9, '2023-06-11', 'Delivered'),
(10, 10, '2023-06-12', 'Pending'),
(11, 11, '2023-06-13', 'Delivered'),
(12, 12, '2023-06-14', 'Cancelled'),
(13, 13, '2023-06-15', 'Delivered'),
(14, 14, '2023-06-16', 'Delivered'),
(15, 15, '2023-06-17', 'Shipped'),
(16, 16, '2023-06-18', 'Pending'),
(17, 17, '2023-06-19', 'Delivered'),
(18, 18, '2023-06-20', 'Delivered'),
(19, 19, '2023-06-21', 'Cancelled'),
(20, 20, '2023-06-22', 'Shipped');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 1, 20000),
(2, 1, 3, 2, 3500),
(3, 2, 2, 1, 55000),
(4, 2, 19, 1, 900),
(5, 3, 4, 1, 40000),
(6, 4, 5, 1, 18000),
(7, 5, 6, 1, 22000),
(8, 6, 8, 3, 2000),
(9, 7, 10, 2, 750),
(10, 8, 12, 2, 600),
(11, 9, 13, 1, 1200),
(12, 10, 14, 1, 2500),
(13, 11, 15, 2, 1500),
(14, 12, 16, 1, 800),
(15, 13, 17, 2, 1200),
(16, 14, 18, 1, 700),
(17, 15, 19, 2, 900),
(18, 16, 20, 1, 15000),
(19, 17, 9, 2, 500),
(20, 18, 11, 3, 100),
(21, 19, 7, 1, 8500);

select * from Customers;
select * from Products;
select * from Categories;
select * from Orders;
select * from Order_Items;

SELECT 
    c.customer_id,
    c.name,
    SUM(oi.quantity * oi.price_per_unit) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id           -- Step 1: Join Customers → Orders
JOIN Order_Items oi ON o.order_id = oi.order_id          -- Step 2: Join Orders → Order_Items
GROUP BY c.customer_id, c.name                           -- Step 3: Group by customer
ORDER BY total_spent DESC                                -- Step 4: Sort by spending in descending order
LIMIT 5;                                                 -- Step 5: Only top 5 customers

SELECT 
    p.product_id,
    p.name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


SELECT 
    COUNT(*) * 1.0 / COUNT(DISTINCT customer_id) AS avg_orders_per_customer
FROM Orders;

SELECT o.order_date,
    SUM(oi.quantity * oi.price_per_unit) AS total_revenue
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY o.order_date
ORDER BY total_revenue DESC
LIMIT 1;

SELECT DISTINCT 
    c.customer_id, 
    c.name AS customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.name = 'Wireless Mouse';

SELECT 
    c.category_name,
    SUM(oi.quantity * oi.price_per_unit) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC
LIMIT 1;






