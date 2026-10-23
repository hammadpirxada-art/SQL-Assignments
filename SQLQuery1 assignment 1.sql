1.1
---
SELECT 
product_name,
list_price,
list_price/1000 AS price_in_thousand
FROM production.products;
-------------
1.2
---
SELECT 
DISTINCT state,
first_name,
last_name,
email
FROM
sales.customers;
-------------
1.3
---
SELECT 
TOP 5
product_name,
list_price
FROM production.products
ORDER BY list_price ASC;
-------------
1.4
---
SELECT 
product_name,
category_id,
list_price 
FROM production.products
WHERE list_price BETWEEN 200 AND 600 
AND category_id IN (1, 6)
-------------
1.5
---
SELECT
    product_name,
    category_id,
    list_price
FROM production.products
WHERE category_id IN (1, 6)
AND list_price < 1000;
-------------
1.6
---
SELECT 
first_name,
last_name,
customer_id,
email
FROM sales.customers
WHERE last_name LIKE 'M%'
AND email LIKE '%.com'
-------------
1.7
---
SELECT 
product_name,
list_price,
category_id
FROM production.products
ORDER BY list_price DESC
OFFSET 11 ROWS
FETCH NEXT 9 ROWS ONLY;
--------------
1.8
---
SELECT 
product_name,
list_price,
list_price * 0.9 as Discounted_price
FROM production.products

----------------------------------------------------------------------------------------------------------------
When we compare any value with NULL using (<>) these type of symbols, the result is UNKNOWN, not TRUE or FALSE.
                                                                                                                -----ThankYou-----       
The WHERE command only show rows where the condition is TRUE So, the query returns zero rows.
----------------------------------------------------------------------------------------------------------------