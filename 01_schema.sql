-- ============================================================
-- PROJECT: Retail Store Database
-- FILE: 01_schema.sql
-- PURPOSE: Creates all tables, primary keys, foreign keys
-- COMPATIBLE WITH: MySQL 8+ (minor tweaks needed for PostgreSQL,
--                  noted in comments where relevant)
-- ============================================================

DROP DATABASE IF EXISTS retail_store;
CREATE DATABASE retail_store;
USE retail_store;

-- ------------------------------------------------------------
-- Table: categories
-- ------------------------------------------------------------
CREATE TABLE categories (
    category_id     INT AUTO_INCREMENT PRIMARY KEY,
    category_name   VARCHAR(50) NOT NULL UNIQUE
);

-- ------------------------------------------------------------
-- Table: products
-- ------------------------------------------------------------
CREATE TABLE products (
    product_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category_id     INT NOT NULL,
    price           DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity  INT NOT NULL DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- ------------------------------------------------------------
-- Table: customers
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id     INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    city            VARCHAR(50),
    signup_date     DATE NOT NULL
);

-- ------------------------------------------------------------
-- Table: employees  (store staff who process orders)
-- ------------------------------------------------------------
CREATE TABLE employees (
    employee_id     INT AUTO_INCREMENT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    role            VARCHAR(50) NOT NULL,
    hire_date       DATE NOT NULL
);

-- ------------------------------------------------------------
-- Table: orders
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id        INT AUTO_INCREMENT PRIMARY KEY,
    customer_id     INT NOT NULL,
    employee_id     INT,
    order_date      DATE NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'Pending',
        -- allowed values: Pending, Shipped, Delivered, Cancelled
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- ------------------------------------------------------------
-- Table: order_items  (line items inside each order)
-- ------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id   INT AUTO_INCREMENT PRIMARY KEY,
    order_id        INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL CHECK (quantity > 0),
    unit_price      DECIMAL(10,2) NOT NULL,
        -- price captured at time of sale (prices can change later)
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ------------------------------------------------------------
-- Helpful indexes for common lookups
-- ------------------------------------------------------------
CREATE INDEX idx_orders_customer   ON orders(customer_id);
CREATE INDEX idx_orders_date       ON orders(order_date);
CREATE INDEX idx_orderitems_order  ON order_items(order_id);
CREATE INDEX idx_orderitems_product ON order_items(product_id);
CREATE INDEX idx_products_category ON products(category_id);
