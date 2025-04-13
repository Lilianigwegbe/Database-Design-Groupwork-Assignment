-- CREATING THE TABLES

-- address

-- Creating the address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Describe the table
DESCRIBE address;

-- Inserting data into address table
INSERT INTO address (street, city, country_id) 
VALUES 

-- address_status

-- Creating the address_status table
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Describe the table
DESCRIBE address_status;

-- Inserting data into address_status table
INSERT INTO address_status (status_name)
VALUES

-- author

-- Creating the author table

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
    );

-- Describe the table
DESCRIBE author;

-- Inserting data into the author table
 insert into author (name) VALUES

-- book

-- Creating the book table
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Describe the book table
DESCRIBE book;

-- Inserting data into the book table
INSERT INTO book (title, publisher_id, language_id)VALUES

-- book_author

-- Creating the book_author table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Describe the book_author table
DESCRIBE book_author;

-- Inserting data into the book_author able
 INSERT INTO book_author (book_id, author_id)VALUES

-- book_language

-- Creating the book_language table
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50)
);

-- Describe the book_language table
DESCRIBE the book_language table;

-- Inserting data into the book_language table
INSERT INTO book_language (language_name) VALUES

-- country

-- Creating the country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Describe the country table
DESCRIBE country;

-- Inserting data into the country table
INSERT INTO country (name) VALUES

-- cust_order

-- Creating the cust_order table
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status_id INT,
    shipping_method_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
);

-- Describe the table
DESCRIBE cust_order;

-- Inserting data into the cust_order table
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_total) VALUES

-- customer
-- Creating the customer table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
  );

-- Describe the table
DESCRIBE customer;

-- Insert data into the customer table
INSERT INTO customer (first_name, last_name, email)
-- VALUES

-- customer_address

-- Creating the customer_address table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Describe the table
DESCRIBE customer_address;

-- Inserting data into the customer_address table
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES

-- order_history

-- Creating the order_history table
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

--Describe the table
DESCRIBE order_history;

-- Inserting data into the order_history table
INSERT INTO order_history (order_id, status_id, change_date) VALUES

-- order_line

-- Creating the order_line table

CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,  
    order_id INT,                                  
    book_id INT,                                   
    quantity INT,                                  
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),  
    FOREIGN KEY (book_id) REFERENCES book(book_id)         
);

-- describe the table
DESCRIBE order_line;

-- Inserting data into the order_line table
INSERT INTO (order_id, book_id, quantity) VALUES

-- order_status

-- Creating the order_status table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,  
    status_name VARCHAR(255)                   
);

-- Describe the table
DESCRIBE order_status;

-- Inserting data into the order_status table
INSERT INTO order_status (status_name) VALUES

-- publisher

-- Creating the publisher table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(255),                            
    country_id INT,                               
    FOREIGN KEY (country_id) REFERENCES country(country_id) 
);

-- Describe the table
DESCRIBE publisher;

-- Inserting data into the publisher table
INSERT INTO publisher (name) VALUES

-- shipping_method

-- Creating the shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50)
);

-- Describe the table
DESCRIBE shipping_method;

-- Inserting data into the shipping_method table
insert into shipping_method (method_name) VALUES