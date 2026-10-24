2.1
---
SELECT 
p.product_name,
b.brand_name,
p.list_price
FROM
production.products AS p  
INNER JOIN production.brands AS b
ON p.brand_id = b.brand_id;
----------------
2.2
---
SELECT
s.first_name,
s.last_name,
s.staff_id,
st.store_name
FROM 
sales.stores AS st
LEFT JOIN sales.staffs AS s
ON s.store_id = st.store_id
WHERE staff_id IS NULL;
------------------
2.3
---
SELECT p.product_name, s.quantity
FROM production.products AS p
LEFT JOIN production.stocks AS s
ON p.product_id = s.product_id
WHERE s.quantity < 5
AND s.store_id = 1;

SELECT p.product_name, s.quantity
FROM production.products AS p
LEFT JOIN production.stocks AS s
ON p.product_id = s.product_id
AND s.quantity < 5
AND s.store_id = 1;
--------------------------------------------------------------------------------------------
So basically the WHERE clause is used to filter result after joins and ON Decides that 
which rows of the second table will match the join so in the above query when we used on we 
see all the products and the products having quantity [5] OR greater than [5]  are shown as NUL
whereas when we use WHERE it filter the result and shows only those values which have quantity
less than [5]
--------------------------------------------------------------------------------------------
2.4
---
SELECT
m.staff_id AS Manager_ID,
m.first_name AS Manager_Name,
e.staff_id AS Employee_ID,
e.first_name AS Employee_Name,
1 AS [Count Placeholder]
FROM sales.staffs AS m
INNER JOIN sales.staffs AS e
ON m.staff_id = e.manager_id
ORDER BY m.staff_id ASC;
--------------------
2.5
---
SELECT
o.order_id,
p.product_name,
oi.quantity,
oi.list_price
FROM 
sales.orders AS o
INNER join sales.order_items AS oi
ON o.order_id = oi.order_id
INNER JOIN production.products AS p
ON oi.product_id = p.product_id
WHERE o.order_id = 1;
-------------------
2.6
---
SELECT
COUNT(*) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
ON o.order_id = oi.order_id;
-------------------------------------------------------------------------------------------------------
colleague joins orders and orders_items and then thought that these are total orders or unique orders 
but an order could have muktiple items
-------------------------------------------------------------------------------------------------------
SELECT
COUNT(DISTINCT o.order_id) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
ON o.order_id = oi.order_id
WHERE o.order_date >= '2017-01-01'
AND o.order_date < '2018-01-01';
-------------------------------------------------------------------------------------------------------
Now we use COUNT(DISTINCT order_id) for counting unique orders and for last year we use date filter
-------------------------------------------------------------------------------------------------------
We can also count the total orders directly from the sales.orders table without using a JOIN
Each order has its own row so COUNT(*) gives us the actual number of orders without counting
the same order multiple times
--------------------------------------------------------------------------------------------------------
SELECT 
COUNT(*) AS total_orders
FROM sales.orders
WHERE order_date >= '2017-01-01'
AND order_date < '2018-01-01';
--------------------------
2.7
---
------------------------------------------------------------------------------------------------------------------------
CROSS JOIN combines every row of the first table with every row of the second table
We can use CROSS JOIN when we want to create all possible combinations such as matching
every product with every available color or every store with every brand

To avoid accidental CROSS JOINs we should always check our JOIN conditions
use the correct ON clause with INNER JOIN or LEFT JOIN and check the number 
of rows before running large queries