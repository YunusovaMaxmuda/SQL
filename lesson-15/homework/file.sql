SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);


SELECT *
FROM employees
WHERE department_id = (
    SELECT id FROM departments WHERE department_name = 'Sales'
);



SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id FROM orders
);


SELECT p.*
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);



SELECT *
FROM employees
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);




SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);



SELECT s.name, g.course_id, g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE g.grade = (
    SELECT MAX(g2.grade)
    FROM grades g2
    WHERE g2.course_id = g.course_id
);



SELECT id, product_name, price, category_id
FROM (
    SELECT 
        p.*,
        DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS rnk
    FROM products p
) ranked
WHERE rnk = 3;



SELECT *
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
  AND e.salary < (
      SELECT MAX(salary)
      FROM employees
      WHERE department_id = e.department_id
  );


