-- ============================================================
-- PROJECT: Retail Store Database
-- FILE: 02_sample_data.sql
-- PURPOSE: Populates all tables with realistic sample data
-- RUN AFTER: 01_schema.sql
-- ============================================================

USE retail_store;

-- ------------------------------------------------------------
-- categories
-- ------------------------------------------------------------
INSERT INTO categories (category_name) VALUES
('Electronics'), ('Clothing'), ('Home & Kitchen'), ('Books'),
('Sports & Fitness'), ('Beauty & Personal Care'), ('Toys'), ('Groceries');

-- ------------------------------------------------------------
-- products
-- ------------------------------------------------------------
INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('Wireless Mouse',        1, 599.00,  120),
('Bluetooth Headphones',  1, 1999.00,  75),
('Smartphone Stand',      1, 299.00,  200),
('USB-C Charging Cable',  1, 199.00,  300),
('Men''s Cotton T-Shirt', 2, 449.00,  150),
('Women''s Denim Jacket', 2, 1799.00,  60),
('Running Shoes',         2, 2499.00,  90),
('Non-Stick Frying Pan',  3, 899.00,  100),
('Electric Kettle',       3, 1299.00,  80),
('LED Table Lamp',        3, 799.00,  110),
('The Alchemist (Book)',  4, 299.00,  200),
('Atomic Habits (Book)',  4, 399.00,  180),
('Yoga Mat',              5, 699.00,  140),
('Dumbbell Set 10kg',     5, 2199.00,  50),
('Face Moisturizer',      6, 549.00,  160),
('Herbal Shampoo',        6, 349.00,  170),
('Building Blocks Set',   7, 999.00,   70),
('Remote Control Car',    7, 1499.00,  55),
('Organic Basmati Rice 5kg', 8, 649.00, 90),
('Assorted Nuts Pack',    8, 449.00,  130);

-- ------------------------------------------------------------
-- customers
-- ------------------------------------------------------------
INSERT INTO customers (first_name, last_name, email, city, signup_date) VALUES
('Aarav',   'Sharma',   'aarav.sharma@example.com',   'Bengaluru', '2024-01-15'),
('Priya',   'Menon',    'priya.menon@example.com',    'Chennai',   '2024-02-02'),
('Rohan',   'Gupta',    'rohan.gupta@example.com',    'Delhi',     '2024-02-20'),
('Ananya',  'Iyer',     'ananya.iyer@example.com',    'Bengaluru', '2024-03-05'),
('Kabir',   'Verma',    'kabir.verma@example.com',    'Mumbai',    '2024-03-18'),
('Sneha',   'Reddy',    'sneha.reddy@example.com',    'Hyderabad', '2024-04-01'),
('Vikram',  'Nair',     'vikram.nair@example.com',    'Kochi',     '2024-04-22'),
('Divya',   'Joshi',    'divya.joshi@example.com',    'Pune',      '2024-05-10'),
('Arjun',   'Kapoor',   'arjun.kapoor@example.com',   'Delhi',     '2024-05-29'),
('Meera',   'Pillai',   'meera.pillai@example.com',   'Chennai',   '2024-06-14'),
('Aditya',  'Rao',      'aditya.rao@example.com',     'Bengaluru', '2024-07-02'),
('Isha',    'Malhotra', 'isha.malhotra@example.com',  'Mumbai',    '2024-07-19'),
('Karan',   'Chopra',   'karan.chopra@example.com',   'Delhi',     '2024-08-03'),
('Neha',    'Desai',    'neha.desai@example.com',     'Ahmedabad', '2024-08-25'),
('Rahul',   'Bose',     'rahul.bose@example.com',     'Kolkata',   '2024-09-10');

-- ------------------------------------------------------------
-- employees
-- ------------------------------------------------------------
INSERT INTO employees (full_name, role, hire_date) VALUES
('Sunita Rao',    'Sales Associate',  '2022-06-01'),
('Manoj Tiwari',  'Sales Associate',  '2022-11-15'),
('Farah Khan',    'Order Manager',    '2023-02-20'),
('Vishal Anand',  'Sales Associate',  '2023-08-10');

-- ------------------------------------------------------------
-- orders
-- ------------------------------------------------------------
INSERT INTO orders (customer_id, employee_id, order_date, status) VALUES
(1,  1, '2024-06-01', 'Delivered'),
(2,  2, '2024-06-03', 'Delivered'),
(3,  1, '2024-06-05', 'Delivered'),
(1,  3, '2024-06-10', 'Delivered'),
(4,  2, '2024-06-12', 'Cancelled'),
(5,  1, '2024-06-15', 'Delivered'),
(6,  3, '2024-06-18', 'Shipped'),
(2,  2, '2024-06-20', 'Delivered'),
(7,  1, '2024-06-22', 'Delivered'),
(8,  4, '2024-06-25', 'Delivered'),
(9,  3, '2024-07-01', 'Delivered'),
(3,  1, '2024-07-03', 'Shipped'),
(10, 2, '2024-07-05', 'Delivered'),
(11, 4, '2024-07-08', 'Delivered'),
(5,  1, '2024-07-10', 'Delivered'),
(12, 3, '2024-07-12', 'Pending'),
(6,  2, '2024-07-15', 'Delivered'),
(13, 1, '2024-07-18', 'Delivered'),
(1,  4, '2024-07-20', 'Delivered'),
(14, 2, '2024-07-22', 'Delivered'),
(7,  3, '2024-07-25', 'Cancelled'),
(15, 1, '2024-07-28', 'Delivered'),
(4,  2, '2024-08-01', 'Delivered'),
(9,  4, '2024-08-03', 'Shipped'),
(2,  1, '2024-08-05', 'Delivered'),
(11, 3, '2024-08-06', 'Delivered'),
(8,  2, '2024-08-07', 'Pending'),
(10, 1, '2024-08-08', 'Delivered'),
(13, 4, '2024-08-08', 'Delivered'),
(3,  2, '2024-08-09', 'Delivered');

-- ------------------------------------------------------------
-- order_items
-- (unit_price copied from products at time of "sale")
-- ------------------------------------------------------------
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 599.00), (1, 4, 1, 199.00),
(2, 5, 3, 449.00),
(3, 7, 1, 2499.00), (3, 13, 1, 699.00),
(4, 2, 1, 1999.00),
(5, 6, 1, 1799.00),
(6, 11, 2, 299.00), (6, 12, 1, 399.00),
(7, 9, 1, 1299.00),
(8, 3, 4, 299.00),
(9, 14, 1, 2199.00),
(10, 8, 1, 899.00), (10, 10, 1, 799.00),
(11, 15, 2, 549.00),
(12, 1, 1, 599.00),
(13, 17, 1, 999.00), (13, 18, 1, 1499.00),
(14, 19, 2, 649.00),
(15, 20, 3, 449.00),
(16, 2, 1, 1999.00),
(17, 5, 2, 449.00), (17, 6, 1, 1799.00),
(18, 7, 1, 2499.00),
(19, 16, 2, 349.00),
(20, 9, 1, 1299.00),
(21, 4, 5, 199.00),
(22, 11, 1, 299.00), (22, 12, 1, 399.00),
(23, 1, 3, 599.00),
(24, 8, 2, 899.00),
(25, 13, 1, 699.00), (25, 14, 1, 2199.00),
(26, 3, 2, 299.00),
(27, 10, 1, 799.00),
(28, 19, 1, 649.00), (28, 20, 2, 449.00),
(29, 6, 1, 1799.00),
(30, 15, 1, 549.00), (30, 16, 1, 349.00);
