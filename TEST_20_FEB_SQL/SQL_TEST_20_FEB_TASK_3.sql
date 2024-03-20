create database TEST_SQL2;

use TEST_SQL2;

--Q1	FROM CUSTOMER_MONTHLY_SALES TABLE GET
--	Q1+Q2+Q3+Q4 AS TOTAL SALES

select * from CUSTOMER_MONTHLY_SALES;

select CUSTOMER_ID, sum(JAN), sum(feb), sum(mar), sum(apr), sum(may), sum(jun), sum(jul), sum(aug),
sum(sep), sum(oct), sum(nov), sum(dec) as total_sales
from CUSTOMER_MONTHLY_SALES
group by CUSTOMER_ID;
