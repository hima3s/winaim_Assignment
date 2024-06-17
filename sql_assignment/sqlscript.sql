CREATE TABLE customers ( 
    customer_id NUMBER PRIMARY KEY, 
    first_name VARCHAR2(100), 
    last_name VARCHAR2(100), 
    email VARCHAR2(255) 
);

CREATE TABLE orders ( 
    order_id NUMBER PRIMARY KEY, 
    customer_id NUMBER REFERENCES customers(customer_id), 
    order_date DATE 
);

CREATE TABLE products ( 
    product_id NUMBER PRIMARY KEY, 
    product_name VARCHAR2(255), 
    price NUMBER 
);

CREATE TABLE order_items ( 
    order_item_id NUMBER PRIMARY KEY, 
    order_id NUMBER REFERENCES orders(order_id), 
    product_id NUMBER REFERENCES products(product_id), 
    quantity NUMBER, 
    price NUMBER 
);

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES (1, 'John', 'Doe', 'john.doe@example.com');

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES (3, 'Alice', 'Johnson', 'alice.johnson@example.com');

INSERT INTO orders (order_id, customer_id, order_date) VALUES (1, 1, TO_DATE('2024-06-01','YYYY-MM-DD'));

INSERT INTO orders (order_id, customer_id, order_date) VALUES (2, 2, TO_DATE('2024-06-02','YYYY-MM-DD'));

INSERT INTO orders (order_id, customer_id, order_date) VALUES (3, 3, TO_DATE('2024-06-03','YYYY-MM-DD'));

INSERT INTO products (product_id, product_name, price) VALUES (1, 'Laptop', 1200);

INSERT INTO products (product_id, product_name, price) VALUES (2, 'Phone', 800);

INSERT INTO products (product_id, product_name, price) VALUES (3, 'Tablet', 600);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES (1, 1, 1, 1, 1200);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES (2, 2, 2, 2, 800);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES (3, 3, 3, 1, 600);

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from customers;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from customers;

SELECT * from orders;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT * from order_items;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT * from order_items;

INSERT INTO products (product_id, product_name, price) VALUES (4, 'SmartWatch', 450);

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT * from order_items;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT * from order_items;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * from products;

SELECT * from customers;

SELECT * from orders;

SELECT * from order_items;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT p.product_id, p.product_name 
FROM products p 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
WHERE oi.order_item_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.price * oi.quantity) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
WHERE o.order_date BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY total_spent DESC 
FETCH FIRST 1 ROWS ONLY;

