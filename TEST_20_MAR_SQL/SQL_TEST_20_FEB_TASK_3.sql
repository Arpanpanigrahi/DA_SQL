create database TEST_SQL2;

use TEST_SQL2;

--Q1	FROM CUSTOMER_MONTHLY_SALES TABLE GET
--	Q1+Q2+Q3+Q4 AS TOTAL SALES

select * from CUSTOMER_MONTHLY_SALES;

select CUSTOMER_ID, sum(JAN), sum(feb), sum(mar), sum(apr), sum(may), sum(jun), sum(jul), sum(aug),
sum(sep), sum(oct), sum(nov), sum(dec) as total_sales
from CUSTOMER_MONTHLY_SALES
group by CUSTOMER_ID;

select *, (jan+feb+mar) as Q1, (apr+may+jun) as Q2, (jul+aug+sep) as Q3, (oct+nov+dec) as Q4 INTO ABC
from 

select * from ABC;

select customer_id, sum(q1+q2+q3+q4) as Quarter
from ABC
group by customer_id;
