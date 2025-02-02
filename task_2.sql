-- task_2.sql

-- Use the alx_book_store database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- Example Data Insertion (Optional, but good practice)
INSERT INTO Authors (author_name) VALUES
('J.R.R. Tolkien'),
('George R.R. Martin'),
('Jane Austen');

INSERT INTO Customers (customer_name, email, address) VALUES
('John Doe', 'john.doe@example.com', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', '456 Oak Ave');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('The Hobbit', 1, 19.99, '1937-09-21'),
('A Game of Thrones', 2, 29.99, '1996-08-01'),
('Pride and Prejudice', 3, 14.99, '1813-01-28');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2024-07-26'),
(2, '2024-07-27');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);
