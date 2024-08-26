-- Query 1: Employee Details
SELECT
    employee_number, RPAD(first_name, 15, '') AS fname,
    RPAD(last_name, 15, '') AS l_name,
    DATE_PART('Year', AGE(birth_date)) AS Age,
    salary + commission AS net_salary,
    position
FROM employees
WHERE salary >= 8000
ORDER BY CASE position
    WHEN 'Vice President' THEN 1
    WHEN 'Sales Manager' THEN 2
    WHEN 'Sales Assistant' THEN 3
    WHEN 'Sales Representative' THEN 4
END;

-- Query 2: Product Details
SELECT 
    quantity,
    product_name,
    supplier_number,
    unit_price,
    units_on_order
FROM products
WHERE quantity LIKE '%bottle(s)%'
AND (SUBSTRING(PRODUCT_NAME, 3, 1) = 't' OR SUBSTRING(PRODUCT_NAME, 3, 1) = 'T')
AND supplier_number IN (1,2,3)
AND unit_price BETWEEN 70 AND 200
AND units_on_order IS NOT NULL;

-- Query 3: Customers Matching Suppliers
SELECT *
FROM CUSTOMERS
WHERE (COUNTRY, CITY, SUBSTRING(POSTAL_CODE FROM LENGTH(POSTAL_CODE)-2 FOR 3)) = 
      (SELECT COUNTRY, CITY, SUBSTRING(POSTAL_CODE FROM LENGTH(POSTAL_CODE)-2 FOR 3)
       FROM SUPPLIERS
       WHERE SUPPLIER_NUMBER = 1);

-- Query 4: Suppliers of a Specific Category
SELECT 
    SUPPLIER_NUMBER,
    COMPANY,
    ADDRESS,
    PHONE
FROM 
    SUPPLIERS
WHERE 
    SUPPLIER_NUMBER IN (
        SELECT SUPPLIER_NUMBER
        FROM PRODUCTS
        WHERE CATEGORY_CODE = 1
    );

-- Query 5: Beverages Suppliers
SELECT
    s.SUPPLIER_NUMBER,
    s.COMPANY, s.ADDRESS,
    s.PHONE
FROM
    SUPPLIERS s
JOIN 
    PRODUCTS p ON s.SUPPLIER_NUMBER = p.SUPPLIER_NUMBER 
WHERE 
    p.CATEGORY_CODE = (SELECT CATEGORY_CODE FROM CATEGORIES WHERE CATEGORY_NAME = 'Beverages');

-- Query 6: Customers in Berlin for Category 3
SELECT DISTINCT c.customer_code 
FROM customers c 
JOIN orders o ON o.customer_code = c.customer_code
JOIN order_details od ON od.order_number = o.order_number
JOIN products p ON p.product_ref = od.product_ref
JOIN categories ct ON p.category_code = p.category_code
WHERE c.city = 'Berlin'
AND ct.category_code = 3;

-- Query 7: French Customers with Orders in April 1998
SELECT 
    c.customer_code,
    c.company,
    c.phone,
    c.country,
    COUNT(o.order_number) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_code = o.customer_code
    AND o.order_date BETWEEN '1998-04-01' AND '1998-04-30'
    AND EXTRACT(DOW FROM o.order_date) = 1 -- Retrieves day of the week
WHERE c.country = 'France'
GROUP BY c.customer_code, c.company, c.phone, c.country;

-- Query 8: Customers Who Ordered Every Product
SELECT 
    c.customer_code,
    c.company,
    c.phone
FROM customers c
JOIN orders o ON c.customer_code = o.customer_code
JOIN order_details od ON o.order_number = od.order_number
GROUP BY c.customer_code, c.company, c.phone
HAVING COUNT(DISTINCT od.product_ref) = (SELECT COUNT(DISTINCT product_ref) FROM products);

-- Query 9: Number of Orders by French Customers
SELECT c.customer_code, COUNT(o.order_number) AS number_of_orders
FROM customers c
JOIN orders o ON c.customer_code = o.customer_code
WHERE c.country = 'France'
GROUP BY c.customer_code;
