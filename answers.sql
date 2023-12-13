-- Problem 1
SELECT email
FROM customers
ORDER BY email;

-- Problem 2
SELECT id
FROM orders
WHERE customer_id = (
    SELECT id
    from customers
    WHERE fname = 'Elizabeth'
    AND lname = 'Crocker'
);
    

-- Problem 3
SELECT SUM(num_cupcakes)
FROM orders
WHERE processed = 'f';

-- Problem 4
SELECT c.name, SUM(o.num_cupcakes) AS sum
FROM cupcakes AS c
LEFT JOIN orders AS o ON c.id = o.cupcake_id
GROUP BY c.name
ORDER BY c.name ASC;

-- Problem 5
SELECT email, SUM(num_cupcakes) FROM customers as c
JOIN orders AS orders
ON c.id = o.customer_id
GROUP BY email 
ORDER BY sum DESC;

-- Problem 6
SELECT customers.fname, customers.lname, customers.email
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN cupcakes ON orders.cupcake_id = cupcakes.id
WHERE cupcake_id = 5
AND orders.processed = true
GROUP BY customers.fname, customers.lname, customers.email;