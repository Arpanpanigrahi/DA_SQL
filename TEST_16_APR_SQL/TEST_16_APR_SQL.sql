create database TEST_SQL4

--drop database test_sql_4

use TEST_SQL4

select * from CNTRY

--Q1. CALCULATE PRODUCT WISE AVG SALES, TOTAL SALES AND JOIN WITH THE MAIN TABLE(USING GROUP BY & PARTITION BY CONDITION)

--USING GROUP BY

with SQL as(
--2.
select A.*, B.avg_sales, B.total_sales
from CNTRY as A
left join
(
--1.
select PRODUCT, AVG(SALE) as avg_sales, sum(sale) as total_sales
from CNTRY
group by PRODUCT
) as B
on A.PRODUCT=B.PRODUCT
)
select * from sql


--Q1. CALCULATE PRODUCT WISE AVG SALES, TOTAL SALES AND JOIN WITH THE MAIN TABLE
--USING PARTITION BY

select *, 
AVG(SALE) over (partition by product order by product) as Product_avg_sales,
SUM(SALE) over (partition by product order by product) as Product_total_sales
from CNTRY



--Q2. CALCULATE COUNTRY WISE AVG SALES & FILTER ROWS WHERE SALE GREATER THAN AVG_SALE

Select * from CNTRY

with R AS(
--2.
Select A.*, B.avg_sales
from CNTRY as A
left join
(
--1.
select COUNTRY, AVG(sale) as avg_sales
from CNTRY
group by COUNTRY
) as B
on A.COUNTRY=B.COUNTRY
--3.
), R2 as (
select *, case when sale > avg_sales then 'Y' else 'N'
end as status
from R
)
--select * from R
--4. FILTER

select * from R2
where status='Y'


--Q3. ADD SERIAL NUMBER TO THE TABLE

select *, 1 AS SL_NO from CNTRY

select *, ROW_NUMBER() over(order by (select null)) AS SL_NO from CNTRY


--Q4. FILTER OUT THIRD TOP SELLING PRODUCT ON COUNTRY LEVEL

select * from CNTRY

with ABC as(
select *, DENSE_RANK() over (partition by country order by sale desc) as Rank from CNTRY
)
select * from abc
where rank = 3


---------------------------------------------------------------------------------------------------

select * from HOTEL

--Q1. CALCULATE PREVIOUS SPENT WRT NAME & RESTRAUNT

select *, LAG(spent,1) over(partition by [Name], Restraunt order by dov) as PREVIOUS_SPENT
from HOTEL

--Q2. CALCULATE NAME & RESTRAUNT WISE TOTAL SPENT

--Using Windows Function
select *, 
sum(spent) over(partition by name, restraunt) as TOTAL_SPENT
from HOTEL

--Using Normal Function
select Name, Restraunt, sum(Spent) as TOTAL_SPENT
from HOTEL
group by Name, Restraunt


--Q3. CALCULATE DAYS GAP WRT NAME & RESTRAUNT

--Using WITH Clause and Windows Function 
with abc as (
select *, LAG(dov,1) over(partition by [Name], Restraunt order by dov) as Prev_Day
from HOTEL
)
select *, DATEDIFF(day, Prev_Day, dov) as DAYS_GAP
from abc

--Using Window Function
select *, DATEDIFF(Day, LAG(dov,1) over(partition by [Name], Restraunt order by [Name], Restraunt), dov) as DAYS_GAP
from HOTEL


--Q4. CALCULATE SPENT PER VISIT

select * from HOTEL

--Using Window Function Not Working
select *, SUM(spent)/COUNT(distinct dov) over(partition by Name) as [SPENT PER VISIT]
from HOTEL

--Using Normal Function
select Name , SUM(spent)/COUNT(distinct dov) as [SPENT PER VISIT]
from HOTEL
group by Name

with abc as
(
select *, coalesce(LAG(dov,1) over(partition by name, Restraunt order by dov),dov) as prev_date
from HOTEL
)
, abc2 as 
(
select *, DATEDIFF(day, prev_date, dov) as days_gap
from abc
)
, abc3 as
(
select name, Restraunt, AVG(days_gap) avg_day_gap, SUM(spent) as total_spent
from abc2
group by name, Restraunt
)
select *, total_spent/avg_day_gap as spent_per_visit
from abc3






