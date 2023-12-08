-- Problem 1
SELECT email
FROM customers
ORDER BY email;

-- Problem 2
SELECT customer_id
FROM orders
WHERE customer_id = 2;

-- Problem 3
SELECT SUM(num_cupcakes)
FROM orders
WHERE processed = 't';

-- Problem 4
SELECT name, SUM(num_cupcakes)
FROM cupcakes AS c
JOIN orders AS o
ON  o.cupcake_id = c.id
GROUP BY name;

-- Problem 5
SELECT email, SUM(num_cupcakes) FROM customers as c
JOIN orders AS orders
ON c.id = o.customer_id
GROUP BY email 
ORDER BY sum DESC;

-- Problem 6
SELECT fname, lname, email
FROM ((customers
INNER JOIN orders ON customers.id = orders.customer_id)
INNER JOIN cupcakes ON orders.cupcake_id = cupcakes.id)
WHERE NAME = 'funfetti'
GROUP BY fname;