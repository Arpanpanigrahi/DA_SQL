use Practise;

select * from sql_join
select * from sql_join2

--city_category,product wise total sales

with abc as
(
select a.product,a.city,a.sales,b.city_category
from sql_join as a
left join sql_join2 as b
on a.product=b.product and a.city=b.city
)
select city_category,product,sum(sales) as total_sales
from abc
group by city_category,product
having sum(sales) >5000
-----------------------------------------------------------

WITH abc AS (
    SELECT a.product, a.city, a.sales, b.city_category
    FROM sql_join AS a
    LEFT JOIN sql_join2 AS b
    ON a.product = b.product AND a.city = b.city
),
abc2 AS (
    SELECT city_category, product, SUM(sales) AS total_sales
    FROM abc
    GROUP BY city_category, product
),
abc3 AS (
    SELECT *, 1 AS SI_NO 
    FROM abc2
),
abc4 AS (
    SELECT AVG(total_sales) AS average_sales
    FROM abc2
)
--SELECT * FROM abc3;

--SELECT * FROM abc4;

--SELECT * 
--FROM abc3 
--cross JOIN abc4 

SELECT abc3.*, abc4.average_sales,
    CASE 
        WHEN abc3.total_sales > abc4.average_sales THEN 'Above Average'
        ELSE 'Below Average'
    END AS sales_status
FROM abc3 
CROSS JOIN abc4;

