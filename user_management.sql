User Management for Bookstore Database 
This presents users created for this dtabase, their roles and the permissions granted to themon various tables.
DataBase Admin 

● Role: Database Administrator - Manages database schema, backups, users, and general system configurations. 
● Privileges: Full access to all tables and objects within the bookstore, including the ability to grant/revoke permissions to/from other users. 

Bookstore Manager 

● Role: Inventory Manager - Manage inventory books, details and relationships to authors and publishers. 
● Privileges:SELECT, INSERT, UPDATE, DELETE on:book, author,book_author, publisher, book_language 

Sales Manager

● Role: Sales Clerk-Handles order processing, customer management, and looks up book availability. 
● Privileges:SELECT, INSERT, UPDATE on:customer_address, customer, address,cust_order, order_line, order_history and book (read-only access to check book info for customers) 

Creating and Granting Privileges to The Users For Database Access 

-- Create user bookstore admin user 
CREATE USER IF NOT EXISTS 'bookstore_admin'@'localhost' IDENTIFIED BY 'secure_admin_password'; 

-- Grant admin all privileges 
GRANT ALL PRIVILEGES ON bookstore.* TO'bookstore_admin'@'localhost'; 

-- Create user bookstore_manager 
CREATE USER IF NOT EXISTS 'bookstore_manager'@'localhost' IDENTIFIED BY 'secure_manager_password'; 

--Grant privileges for inventory 
GRANT SELECT, INSERT, UPDATE ON bookstore.book TO 'bookstore_manager'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.author TO 'bookstore_manager'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.book_author TO 'bookstore_manager'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.book_language TO 'bookstore_manager'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.publisher TO 'bookstore_manager'@'localhost'; 

-- Create user sales_clerk 
CREATE USER IF NOT EXISTS 'sales_clerk@'localhost' IDENTIFIED BY 'secure_clerk_password'; 
-- Grant sales_clerk permissions for orders and customer management 
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'sales_clerk'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.address TO 'sales_clerk'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.customer_address TO 'sales_clerk'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'sales_clerk'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'sales_clerk'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'sales_clerk'@'localhost'; 

-- Allow sales_clerk to view book info for customer queries 
GRANT SELECT ON bookstore.book TO 'sales_clerk'@'localhost'; 

-- Apply the changes 
FLUSH PRIVILEGES; 

# NOTE: 
For security reasons,permissions granted on specific tables to a specific user allows fine-grained access control. This helps to: 
● Limit exposure of sensitive data (e.g., don't allow the sales assistant to change inventory details). 
● Reduce risk of accidental or malicious changes by users who don’t need full access. 
● Adhere to Principle of Least Privilege — only give users the minimum access they need. 
