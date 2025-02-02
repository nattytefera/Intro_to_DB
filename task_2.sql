-- Switch to the database
USE alx_book_store;

-- Create the AUTHORS table
CREATE TABLE IF NOT EXISTS AUTHORS (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   author_name VARCHAR(215) NOT NULL
);

-- Create the BOOKS table
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id) ON DELETE SET NULL
    );

-- Create the CUSTOMERS table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
    );

-- Create the ORDERS table
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id) ON DELETE CASCADE
    );

-- Create the ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id) ON DELETE CASCADE
    );