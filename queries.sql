USE bookstoredb;

-- Retrieve all books and their authors
SELECT b.title AS book_title, a.name AS author_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

-- Get all orders with their status and shipping method
SELECT o.order_id, c.first_name, c.last_name, os.status_name, sm.method_name, o.order_date
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON o.status_id = os.status_id
JOIN shipping_method sm ON o.method_id = sm.method_id;

-- Total number of books ordered per customer
SELECT c.first_name, c.last_name, SUM(ol.quantity) AS total_books_ordered
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id
JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY c.customer_id;

-- Retrieve all books written in English
SELECT b.title, bl.name AS language
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
WHERE bl.name = 'English';

-- Get the most popular book based on the total quantity ordered
SELECT b.title, SUM(ol.quantity) AS total_quantity
FROM book b
JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.book_id
ORDER BY total_quantity DESC
LIMIT 1;

-- List all publishers and the number of books they have published
SELECT p.name AS publisher_name, COUNT(b.book_id) AS total_books
FROM publisher p
LEFT JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.name
ORDER BY total_books DESC;


-- Retrieve all customers whose orders have been delivered
SELECT DISTINCT c.first_name, c.last_name, os.status_name
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id
JOIN order_status os ON o.status_id = os.status_id
WHERE os.status_name = 'Delivered';

-- Find all books that have been ordered more than 10 times
SELECT b.title, SUM(ol.quantity) AS total_quantity 
FROM book b
JOIN order_line ol 
ON b.book_id = ol.book_id
GROUP BY b.book_id
HAVING total_quantity > 10
ORDER BY total_quantity DESC;

-- Get the history of a specific order
SELECT oh.history_id, oh.change_date, os.status_name
FROM order_history oh
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.order_id = 101;
